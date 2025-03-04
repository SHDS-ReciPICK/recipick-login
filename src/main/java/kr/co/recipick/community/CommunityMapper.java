package kr.co.recipick.community;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.recipick.member.MemberVO;

@Mapper
public interface CommunityMapper {
	
	// 한 페이지 게시글 목록 (페이징)
	List<CommunityVO> communityList(Map<String, Object> params);
	
	// 게시글 상세
	CommunityVO postDetail(int post_id);
	
	// 게시글 사진 목록
	List<CommunityVO> postImageList(int post_id);
	
	// 게시글 작성 
	int writePost(CommunityVO vo);
	
	// 게시글 사진 첨부
	int attachImage(CommunityVO vo);
	
	// 게시글 조회수 증가
	int increaseView(int post_id);

    // 전체 게시글 수 조회 (페이징용)
    int countPost();

    // 게시글 수정
    int updatePost(CommunityVO vo);

    // 게시글 삭제
    int deletePost(int post_id);

    // 게시글에 첨부된 사진 삭제
    int deletePostImage(int post_id);

    // 게시글에 달린 댓글 삭제
    int deletePostReply(int post_id);
    
	// 댓글 목록 (댓글 내용, 댓글 작성일시, 댓글 작성자 닉네임)
	List<CommunityVO> replyList(int post_id);
	
	// 댓글 상세
	CommunityVO replyDetail(int reply_id);
	
	// 댓글 작성 
	int writeReply(CommunityVO vo);

    // 댓글 수정
    int updateReply(CommunityVO vo);

    // 댓글 삭제
    int deleteReply(int reply_id);
    
    // 특정 이미지 하나 삭제
    int deleteSingleImage(int post_image_id);
    
	// 특정 이미지 상세
    CommunityVO singleImageDetail(int post_image_id);
    
    // img_no 재정렬
    int updateImageNo(CommunityVO vo);    


    List<CommunityVO> myrecipeList(Map<String, Object> params);
    int countPostMyrecipe(int memberId);
    CommunityVO detail(MemberVO vo);

}
