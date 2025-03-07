package kr.co.recipick.api.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import kr.co.recipick.api.auth.AuthService;

@Controller
@RequestMapping("/api/members")
public class MemberApiController {
    
    private static final Logger logger = LoggerFactory.getLogger(MemberApiController.class);
    
    @Autowired
    private MemberApiService memberApiService;
    
    @Autowired
    private AuthService authService;
    
    // 이메일로 회원 정보 조회 // 이메일 노출 우려로 겟방식 사용 안함 근데 auth의 경우 다시 생각 해보자
    @PostMapping("/info")
    @ResponseBody
    public ResponseEntity<MemberResponseVO> getMemberInfo(@RequestBody MemberRequestVO requestVO) {
        logger.info("이메일로 회원 정보 조회 요청: " + requestVO.getEmail());
        
        if (!authService.validateApiKey(requestVO.getApiKey())) {
//            logger.warn("잘못된 API 키");
            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
        }
       
        // 회원 정보 조회
        MemberResponseVO memberVO = memberApiService.getMemberInfo(requestVO.getEmail());
        
        if (memberVO != null) {
            logger.info("회원 정보 조회 성공: " + requestVO.getEmail());
            return new ResponseEntity<>(memberVO, HttpStatus.OK);
        } else {
            logger.warn("회원 정보 조회 실패 (회원 없음): " + requestVO.getEmail());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
//    // ID로 조회
//    @GetMapping("/{memberId}")
//    @ResponseBody
//    public ResponseEntity<MemberResponseVO> getMemberById(
//            @PathVariable int memberId,
//            @RequestHeader("API-Key") String apiKey) {
//        
//        logger.info("ID로 회원 정보 조회 요청: " + memberId);
//        
//        // API 키 검증
//        if (!authService.validateApiKey(apiKey)) {
//            logger.warn("잘못된 API 키");
//            return new ResponseEntity<>(HttpStatus.FORBIDDEN);
//        }
//        
//        // 회원 정보 조회 - 이를 위해 MemberApiService에 메서드 추가 필요
//        MemberResponseVO memberVO = memberApiService.getMemberInfoById(memberId);
//        
//        if (memberVO != null) {
//            logger.info("회원 정보 조회 성공: " + memberId);
//            return new ResponseEntity<>(memberVO, HttpStatus.OK);
//        } else {
//            logger.warn("회원 정보 조회 실패 (회원 없음): " + memberId);
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
}