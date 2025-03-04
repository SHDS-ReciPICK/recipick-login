package kr.co.recipick.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/signin.do")
	public String signin() {
		return "member/signin";
	}
	
	
	
	@GetMapping("/signup.do")
    public String signup() {
    	
    	return "member/signup";
    }
	@GetMapping("/forgot-password")
    public String forgotPassword() {
    	
    	return "member/forgot-password";
    }
	
	@PostMapping("/signin.do")
	public String signin(Model model, MemberVO vo, HttpSession sess) {
		sess.removeAttribute("login");
		MemberVO login = service.login(vo);
		String nickname = service.getNickname(vo);
		
		if (login == null) {
			model.addAttribute("msg", "이메일 비밀번호를 확인하세요.");
			model.addAttribute("url", "/recipick/signin.do");
			return "components/alert";
		} else {
			if(service.adminCheck(vo)) {
			sess.setAttribute("login", login);
			sess.setAttribute("nickname", nickname);
			return "redirect:/dashboard-home";
			//관리자페이지로 이동
			} else {
				sess.setAttribute("login", login);
				sess.setAttribute("nickname", nickname);
				return "redirect:/recipe";
				
			}
		}
	}
	 
	
	@ResponseBody
	@GetMapping("/emailCheck.do")
	public int emailCheck(String email) {
		return service.emailCheck(email);
	}
	

	@GetMapping("/logout.do")
	public String logout(HttpSession sess, Model model) {
		sess.invalidate();
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/recipick/signin.do");
		return "components/alert";
	}
	
	
	
	@GetMapping("/regist.do")
	public String join() {
		return "member/signup";
	}
	
	@GetMapping("/main")
	public String main() {
		return "components/main";
	}
	@PostMapping("/insert.do")
	public String insert(MemberVO vo, Model model) {
		if (service.regist(vo)) {
			
			model.addAttribute("msg", "정상적으로 가입되었습니다.");
			model.addAttribute("url", "/recipick/signin.do");
		} else {
			model.addAttribute("msg", "가입 오류");
			model.addAttribute("url", "/recipickregist.do");
		}
		return "components/alert";
	}

	
	@PostMapping("/update.do")
	public String update(MemberVO vo, Model model) {
		int r = service.update(vo);
		String msg = "";
		String url = "/recipick/mypage-settings";
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "components/alert";
	}
	@PostMapping("/deleteOrder.do")
	public String deletOrder(MemberVO vo, Model model) {
		int r = service.deleteOrder(vo);
		String msg = "";
		String url = "/recipick/mypage-orders";
		if (r > 0) {
			msg = "정상적으로 취소되었습니다.";
		} else {
			msg = "취소 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "components/alert";
	}
	@PostMapping("/delete.do")
	public String delete(HttpSession sess, MemberVO vo, Model model) {
		boolean isDeleted = service.delete(vo);
		String msg = "";
		String url = "/recipick/signin.do";
		if (isDeleted) {
			msg = "정상적으로 삭제되었습니다.";
		}	else {
			msg = "삭제 오류";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "components/alert";
	}
	@GetMapping("/mypage-orders")	
	public String mypageOrders(@RequestParam(required = false) String year, HttpSession sess, Model model, MemberVO vo) {
		MemberVO uv = (MemberVO)sess.getAttribute("login");	  
		if (uv != null) vo.setMember_id(uv.getMember_id());			   
		vo.setYear(year);
        model.addAttribute("map", service.list(vo));
		//model.addAttribute("vo", service.detail(uv));
		model.addAttribute("year", year);
								
		return "mypage/mypage-orders";
	}
	
	@GetMapping("/mypage-settings")
	public String mypageSetting( HttpSession sess, Model model, MemberVO vo) {
		MemberVO uv = (MemberVO)sess.getAttribute("login");	      
        model.addAttribute("map", service.list(vo));
		model.addAttribute("vo", service.detail(uv));
		
		return "mypage/mypage-settings";
	}
	

	

	@GetMapping("/mypage-review")
    public String mypageReview(HttpSession sess, Model model,MemberVO vo) {
		MemberVO uv = (MemberVO)sess.getAttribute("login");
		//model.addAttribute("vo", service.detail(uv));
		if (uv != null) vo.setMember_id(uv.getMember_id());
		
		model.addAttribute("notWritten", service.getNotWrittenReviews(vo));
		model.addAttribute("written", service.getWrittenReviews(vo));
    	return "mypage/mypage-review";
    }
	
	
	@GetMapping("/mypage-orders-detail")
    public String mypageOrdersdetail(@RequestParam("oh_id") int ohId, HttpSession sess, Model model, MemberVO vo) {	
		
		MemberVO uv = (MemberVO)sess.getAttribute("login");
		model.addAttribute("vo",service.detail_o(ohId));		
		
    	return "mypage/mypage-orders-detail";
    }
	
	@PostMapping("/deleteReview")
	public String deleteReview(@RequestParam("review_id") int review_id, Model model) {
		int r = service.deleteReview(review_id);
		String msg = "";
		String url = "/recipick/mypage-review";
		if (r > 0) {
			msg = "정상적으로 취소되었습니다.";
		} else {
			msg = "취소 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "components/alert";
	}

	@PostMapping("writeReview")
	public String writeReview(MemberVO vo, Model model,HttpSession sess) {
		MemberVO uv = (MemberVO)sess.getAttribute("login");
		model.addAttribute("vo", service.detail(uv));
		if (uv != null) vo.setMember_id(uv.getMember_id());
		int r = service.writeReview(vo);
		String msg = "";
		String url = "/recipick/mypage-review";
		if (r > 0) {
			msg = "리뷰가 정상적으로 작성되었습니다.";
		} else {
			msg = "수정 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "components/alert";
		
	}

	@GetMapping("/mypage-like")
	public String myrecipeLike(MemberVO vo, Model model,HttpSession sess) {
		MemberVO uv = (MemberVO)sess.getAttribute("login");
		if (uv != null) vo.setMember_id(uv.getMember_id());
		Map<String, Object> result = service.getLikeRecipes(vo);
		model.addAttribute("recipes", result.get("recipes"));
		model.addAttribute("totalCount", result.get("totalCount"));
		model.addAttribute("currentPage", vo.getPage());
		model.addAttribute("totalPages", result.get("totalPages"));
		return "mypage/mypage-like";
	
	}
	
}
