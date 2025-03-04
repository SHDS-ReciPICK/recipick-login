package kr.co.recipick.community;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.recipick.member.MemberVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommunityController {
	
	@Autowired
    private CommunityService communityService;
	
	@Autowired
	private ImageService imageService;
	
	private static final int PAGE_SIZE = 9;
    
	// 페이징
	@GetMapping("/community-list")
	public String communityList(
	        @RequestParam(defaultValue = "1") int page,
	        @RequestParam(defaultValue = "datetime") String sort,
	        Model model) {

	    int totalPosts = communityService.countPost();
	    int totalPages = (int) Math.ceil((double) totalPosts / PAGE_SIZE);

	    if (page < 1) page = 1;
	    if (page > totalPages) page = totalPages;

	    int startIndex = (page - 1) * PAGE_SIZE;

	    // 정렬 기준에 따라 페이징된 목록 가져오기
	    List<CommunityVO> posts = communityService.communityList(startIndex, PAGE_SIZE, sort);

	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("posts", posts);
	    model.addAttribute("currentSort", sort);
	    
	    model.addAttribute("isRecipePage", true);

	    return "community/community-list";
	}
    
    // 게시글 상세 페이지
    @GetMapping("/post-detail/{post_id}")
    public String postDetail(@PathVariable int post_id, Model model) {
    	
        // 조회수 증가
        communityService.increaseView(post_id);
        
        // 게시글 상세 정보
        CommunityVO post = communityService.postDetail(post_id);
        post.setPost_content(post.getPost_content().replace("\n", "<br>"));
        
        // 게시글 이미지 목록
        List<CommunityVO> images = communityService.postImageList(post_id);
        
        // 댓글 목록
        List<CommunityVO> replies = communityService.replyList(post_id);
        replies.forEach(reply -> {
            if (reply.getReply_content() != null) {
                reply.setReply_content(reply.getReply_content().replace("\n", "<br>"));
            }
        });
        
        model.addAttribute("post", post);
        model.addAttribute("images", images);
        model.addAttribute("replies", replies);
        
        model.addAttribute("isRecipePage", true);
        
        return "community/post-detail";
    }

    // 게시글 작성 페이지
    @GetMapping("/post-write")
    public String writeForm(HttpSession session, Model model, HttpServletResponse response) throws IOException {
    	// 세션에서 login 객체 가져오기
    	MemberVO login = (MemberVO) session.getAttribute("login");
        if (login == null) {
            model.addAttribute("msg", "로그인이 필요합니다.");
            model.addAttribute("url", "/recipick/signin.do");
            return "components/alert";
        }
        
        model.addAttribute("isRecipePage", true);
        
        return "community/post-write";
    }

    // 게시글 작성 처리
    @PostMapping("/post-write")
    @ResponseBody
    public Map<String, Object> writePost(
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam(value = "files", required = false) List<MultipartFile> files,
            HttpSession session,
            HttpServletRequest request) {

        Map<String, Object> response = new HashMap<>();

        try {
            // 세션에서 login 객체를 가져와서 그 안의 member_id 로 로그인 상태 판별 
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            Integer memberId = login.getMember_id();

            // 1. 게시글 정보 설정
            CommunityVO vo = new CommunityVO();
            vo.setTitle(title);
            vo.setPost_content(content);
            vo.setPoster_id(memberId); // 로그인한 사용자의 ID
            vo.setPost_datetime(Timestamp.valueOf(LocalDateTime.now(ZoneId.of("Asia/Seoul"))));

            // 2. 게시글 저장
            boolean postSuccess = communityService.writePost(vo);
            System.out.println("게시글 저장 성공: " + postSuccess);

            if (postSuccess && files != null && !files.isEmpty()) {
            	// 3. 각 이미지 파일을 Base64로 변환하여 저장
                for (int i = 0; i < files.size(); i++) {
                    MultipartFile file = files.get(i);
                    if (!file.isEmpty()) {
                        // 파일을 리사이징한 Base64로 변환
                        String base64DataString = imageService.createDetailImage(file);
                        
                        // 이미지 정보 저장
                        CommunityVO imageVo = new CommunityVO();
                        imageVo.setPost_id(vo.getPost_id());
                        imageVo.setPoster_id(memberId);
                        imageVo.setImg_no(i + 1);
                        imageVo.setImg_url(base64DataString);  // Base64 문자열 저장
                        
                        communityService.attachImage(imageVo);
                    }
                }
            }

            response.put("success", true);
            response.put("post_id", vo.getPost_id());

        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "게시글 작성에 실패했습니다: " + e.getMessage());
        }

        return response;
    }

    // 파일 저장 유틸리티 메소드
    private String saveFile(MultipartFile file, String path) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String savedFileName = UUID.randomUUID().toString() + extension;
        
        File dir = new File(path);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        
        File savedFile = new File(path + savedFileName);
        file.transferTo(savedFile);
        
        return savedFileName;
    }
    
    // 댓글 작성
    @PostMapping("/reply")
    @ResponseBody
    public Map<String, Object> writeReply(@RequestBody CommunityVO vo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 세션에서 login 객체를 가져와서 그 안의 member_id 로 로그인 상태 판별 
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            Integer memberId = login.getMember_id();
            
            // 줄바꿈을 <br>로 변환
            String content = vo.getReply_content().replace("\n", "<br>");
            vo.setReply_content(content);
            
            vo.setCommenter_id(memberId);
            
            // DB 저장용
            LocalDateTime koreanTime = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
            vo.setReply_datetime(Timestamp.valueOf(koreanTime));

            boolean success = communityService.writeReply(vo);

            // 응답용 포맷팅된 시간
            String formattedDateTime = koreanTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));

            response.put("success", success);
            response.put("reply_id", vo.getReply_id());
            response.put("formattedDateTime", formattedDateTime);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "댓글 작성에 실패했습니다.");
        }
        
        return response;
    }
    
    // 게시글 삭제
    @DeleteMapping("/post/{post_id}")
    @ResponseBody
    public Map<String, Object> deletePost(@PathVariable int post_id, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 세션에서 login 객체를 가져와서 그 안의 member_id 로 로그인 상태 판별 
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            Integer memberId = login.getMember_id();

            // 게시글 존재 여부와 작성자 확인
            CommunityVO post = communityService.postDetail(post_id);
            if (post == null) {
                response.put("success", false);
                response.put("message", "존재하지 않는 게시글입니다.");
                return response;
            }

            // 작성자 본인 확인
            if (!memberId.equals(post.getPoster_id())) {
                response.put("success", false);
                response.put("message", "게시글 삭제 권한이 없습니다.");
                return response;
            }

            // DB에서 게시글과 관련 데이터 삭제
            boolean success = communityService.deletePost(post_id);
            response.put("success", success);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "게시글 삭제 중 오류가 발생했습니다.");
        }
        
        return response;
    }
    
    // 댓글 삭제
    @DeleteMapping("/reply/{reply_id}")
    @ResponseBody
    public Map<String, Object> deleteReply(@PathVariable int reply_id, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 세션에서 login 객체를 가져와서 그 안의 member_id 로 로그인 상태 판별 
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            Integer memberId = login.getMember_id();

            // 댓글 존재 여부와 작성자 정보 확인
            CommunityVO reply = communityService.replyDetail(reply_id);
            if (reply == null) {
                response.put("success", false);
                response.put("message", "존재하지 않는 댓글입니다.");
                return response;
            }

            // 댓글 작성자 본인 확인
            if (!memberId.equals(reply.getCommenter_id())) {
                response.put("success", false);
                response.put("message", "댓글 삭제 권한이 없습니다.");
                return response;
            }

            // 댓글 삭제 수행
            boolean success = communityService.deleteReply(reply_id);
            
            // 삭제 결과에 따른 응답 설정
            if (success) {
                response.put("success", true);
                response.put("message", "댓글이 삭제되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "댓글 삭제에 실패했습니다.");
            }
            
        } catch (Exception e) {
            // 예외 발생 시 로깅 및 사용자에게 피드백
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "댓글 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return response;
    }
    
    // 게시글 수정 페이지
    @GetMapping("/post-edit/{post_id}")
    public String editForm(@PathVariable int post_id, Model model) {
    	CommunityVO post = communityService.postDetail(post_id);
	    List<CommunityVO> images = communityService.postImageList(post_id); 
	    
	    model.addAttribute("post", post);
	    model.addAttribute("images", images);
	    
	    model.addAttribute("isRecipePage", true);
	    
	    return "community/post-edit";
    }
    
    // 게시글 수정 처리
    @PostMapping("/post-edit/{post_id}")
    @ResponseBody
    public Map<String, Object> updatePost(
            @PathVariable int post_id,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam(value = "deletedImageIds", required = false) String deletedImageIdsJson,
            @RequestParam(value = "files", required = false) List<MultipartFile> files,
            HttpSession session) {

        Map<String, Object> response = new HashMap<>();

        try {
            // 1. 로그인 확인
            // 세션에서 login 객체를 가져와서 그 안의 member_id 로 로그인 상태 판별 
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            Integer memberId = login.getMember_id();

            // 2. 게시글 존재 및 작성자 확인
            CommunityVO existingPost = communityService.postDetail(post_id);
            if (existingPost == null || !memberId.equals(existingPost.getPoster_id())) {
                response.put("success", false);
                response.put("message", "게시글이 존재하지 않거나 수정 권한이 없습니다.");
                return response;
            }

            // 3. 게시글 정보 업데이트
            CommunityVO vo = new CommunityVO();
            vo.setPost_id(post_id);
            vo.setTitle(title);
            vo.setPost_content(content);
            vo.setPoster_id(memberId);

            boolean postUpdateSuccess = communityService.updatePost(vo);

            // 4. 삭제할 이미지 처리
            if (deletedImageIdsJson != null && !deletedImageIdsJson.isEmpty()) {
                ObjectMapper mapper = new ObjectMapper();
                List<Integer> deletedImageIds = mapper.readValue(deletedImageIdsJson, 
                    new TypeReference<List<Integer>>() {});
                
                // DB에서 이미지 정보 삭제
                for (Integer imageId : deletedImageIds) {
                    communityService.deleteSingleImage(imageId);
                }
            }

            // 5. 새 이미지 추가
            if (postUpdateSuccess && files != null && !files.isEmpty()) {
            	// 먼저 기존 이미지들의 img_no 재정렬
                List<CommunityVO> currentImages = communityService.postImageList(post_id);
                for (int i = 0; i < currentImages.size(); i++) {
                    CommunityVO image = currentImages.get(i);
                    image.setImg_no(i + 1);
                    communityService.updateImageNo(image);  // img_no 재정렬
                }

                // 새 이미지는 그 다음 번호부터 시작
                int startingImgNo = currentImages.size() + 1;
                
                for (int i = 0; i < files.size(); i++) {
                    MultipartFile file = files.get(i);
                    if (!file.isEmpty()) {
                    	// 파일을 리사이징한 Base64로 변환
                        String base64DataString = imageService.createDetailImage(file);

                        CommunityVO imageVo = new CommunityVO();
                        imageVo.setPost_id(post_id);
                        imageVo.setPoster_id(memberId);
                        imageVo.setImg_no(startingImgNo + i);
                        imageVo.setImg_url(base64DataString);

                        communityService.attachImage(imageVo);
                    }
                }
            }

            response.put("success", true);
            response.put("message", "게시글이 성공적으로 수정되었습니다.");

        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "게시글 수정 중 오류가 발생했습니다: " + e.getMessage());
        }

        return response;
    }
    
    // 댓글 수정 
    @PostMapping("/reply/{reply_id}/update")  // 명시적 엔드포인트
    @ResponseBody
    public Map<String, Object> updateReply(
        @PathVariable int reply_id, 
        @RequestBody Map<String, Object> payload,
        HttpSession session
    ) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 세션에서 login 객체를 가져와서 그 안의 member_id 로 로그인 상태 판별 
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            Integer memberId = login.getMember_id();
            
            // 페이로드에서 댓글 내용 추출
            String replyContent = (String) payload.get("reply_content");
            
            // 유효성 검사
            if (replyContent == null || replyContent.trim().isEmpty()) {
                response.put("success", false);
                response.put("message", "댓글 내용을 입력해주세요.");
                return response;
            }
            
            // 기존 댓글 확인
            CommunityVO existReply = communityService.replyDetail(reply_id);
            if (existReply == null) {
                response.put("success", false);
                response.put("message", "존재하지 않는 댓글입니다.");
                return response;
            }
            
            // 작성자 본인 확인
            if (!memberId.equals(existReply.getCommenter_id())) {
                response.put("success", false);
                response.put("message", "댓글 수정 권한이 없습니다.");
                return response;
            }
            
            // 댓글 수정 VO 생성
            CommunityVO updateVO = new CommunityVO();
            updateVO.setReply_id(reply_id);
            updateVO.setReply_content(replyContent);
            updateVO.setCommenter_id(memberId);
            
            // 댓글 수정 서비스 호출
            boolean success = communityService.updateReply(updateVO);
            
            if (success) {
                response.put("success", true);
                response.put("message", "댓글이 성공적으로 수정되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "댓글 수정에 실패했습니다.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "시스템 오류가 발생했습니다.");
        }
        
        return response;
    }
    

    @GetMapping("/mypage-myrecipe")
		public String mypageMyrecipe(
		        @RequestParam(defaultValue = "1") int page,
		        @RequestParam(defaultValue = "datetime") String sort,
		        Model model,HttpSession sess, CommunityVO vo) {
			
			MemberVO uv = (MemberVO)sess.getAttribute("login");
			if (uv != null) vo.setMember_id(uv.getMember_id());	
			model.addAttribute("vo", communityService.detail(uv));
		    int totalPosts = communityService.countPostMyrecipe(vo.getMember_id());
		    int totalPages = (int) Math.ceil((double) totalPosts / PAGE_SIZE);

		    System.out.println("Member ID in Controller: " + vo.getMember_id());
		    
		    if (page < 1) page = 1;
		    if (page > totalPages) page = totalPages;

		    int startIndex = (page - 1) * PAGE_SIZE;
		    if (startIndex < 0) startIndex = 0;
		    // 정렬 기준에 따라 페이징된 목록 가져오기
		    List<CommunityVO> posts = communityService.myrecipeList(startIndex, PAGE_SIZE, sort, vo.getMember_id());

		    model.addAttribute("currentPage", page);
		    model.addAttribute("totalPages", totalPages);
		    model.addAttribute("posts", posts);
		    model.addAttribute("currentSort", sort);

		    return "mypage/mypage-myrecipe";
		}

}
