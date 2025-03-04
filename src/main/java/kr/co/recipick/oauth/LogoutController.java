package kr.co.recipick.oauth;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LogoutController {
    @PostMapping("/oauth/logout")
    public ResponseEntity<String> logout(HttpServletRequest request) {
        // 토큰 무효화 로직
        return ResponseEntity.ok("로그아웃 성공");
    }
}