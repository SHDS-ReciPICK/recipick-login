package kr.co.recipick.oauth;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.provider.AuthorizationRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.recipick.member.MemberService;
import kr.co.recipick.member.MemberVO;

@Controller
@SessionAttributes("authorizationRequest")
public class OAuthController {

    @Autowired
    private MemberService memberService;
    
    // 권한 동의 화면
    @RequestMapping("/oauth/confirm_access")
    public String getAccessConfirmation(Model model, HttpServletRequest request) {
        AuthorizationRequest authorizationRequest = (AuthorizationRequest) model.getAttribute("authorizationRequest");
        model.addAttribute("client", authorizationRequest.getClientId());
        model.addAttribute("scopes", authorizationRequest.getScope());
        return "oauth/confirm_access";
    }
    
    // 사용자 정보 API
    @GetMapping("/api/userinfo")
    @ResponseBody
    public Map<String, Object> getUserInfo(Principal principal) {
        Map<String, Object> userInfo = new HashMap<>();
        
        if (principal != null) {
            MemberVO vo = new MemberVO();
            vo.setEmail(principal.getName());
            MemberVO user = memberService.login(vo);
            
            if (user != null) {
                userInfo.put("id", user.getMember_id());
                userInfo.put("email", user.getEmail());
                userInfo.put("name", user.getName());
                userInfo.put("nickname", user.getNickname());
            }
        }
        
        return userInfo;
    }
}