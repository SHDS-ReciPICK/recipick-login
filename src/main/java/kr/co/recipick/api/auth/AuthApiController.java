package kr.co.recipick.api.auth;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/api/auth")
public class AuthApiController {
    
    private static final Logger logger = LoggerFactory.getLogger(AuthApiController.class);
    
    @Autowired
    private AuthService authService;
    
    @PostMapping("/authenticate") // 인증만 수행
    @ResponseBody
    public ResponseEntity<Boolean> authenticate(@RequestBody AuthRequestVO requestVO) {
        logger.info("사용자 인증 요청(인증만): " + requestVO.getEmail());
        try {
            // API 키 검증
            if (!authService.validateApiKey(requestVO.getApiKey())) {
                return new ResponseEntity<>(false, HttpStatus.FORBIDDEN); //403
            }
            // 이메일/비밀번호 인증만 수행
            boolean isAuthenticated = authService.validateCredentials(requestVO.getEmail(), requestVO.getPassword());
            
            if (isAuthenticated) {
                logger.info("사용자 인증 성공: " + requestVO.getEmail());
                return new ResponseEntity<>(true, HttpStatus.OK); //200
            } else {
                logger.warn("사용자 인증 실패: " + requestVO.getEmail());
                return new ResponseEntity<>(false, HttpStatus.OK); //200
            }
        } catch (Exception e) {
            logger.error("사용자 인증 처리 중 오류 발생", e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); //500
        }
    }
}