package kr.co.recipick.oauth;

import kr.co.recipick.member.MemberService;
import kr.co.recipick.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class OAuthController {

    @Autowired
    private MemberService memberService;
    
    @GetMapping("/api/userinfo")
    public Map<String, Object> getUserInfo() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        
        // 사용자 정보를 가져오는 로직 (기존 MemberService 활용)
        // 예시: MemberVO member = memberService.findByEmail(username);
        
        Map<String, Object> userInfo = new HashMap<>();
        // userInfo.put("id", member.getMember_id());
        // userInfo.put("email", member.getEmail());
        // userInfo.put("name", member.getName());
        // userInfo.put("nickname", member.getNickname());
        
        // 실제 구현 시 적절한 사용자 정보 매핑 필요
        
        return userInfo;
    }
}