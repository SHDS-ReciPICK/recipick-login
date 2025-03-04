package kr.co.recipick.header;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.recipick.member.MemberVO;
import lombok.RequiredArgsConstructor;

@ControllerAdvice
@RequiredArgsConstructor
public class HeaderController {
	
	@Autowired
    private HeaderService headerService;
	
	@ModelAttribute
	public void addCommonAttributes(Model model, HttpSession session) {
	    // 세션에서 member_id 가져오기
	    MemberVO login = (MemberVO) session.getAttribute("login");
	    int memberId = (login != null) ? login.getMember_id() : 0;
	    
	    // 로그인 상태에 따라 카운트 조회
	    int wishlistCount = 0;
	    int cartCount = 0;
	    
	    if (memberId > 0) {
	        wishlistCount = headerService.getWishlistCount(memberId);
	        cartCount = headerService.getCartCount(memberId);
	    }
	    
	    model.addAttribute("wishlistCount", wishlistCount);
	    model.addAttribute("cartCount", cartCount);
	}
}
