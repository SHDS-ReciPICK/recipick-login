package kr.co.recipick.api.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.recipick.member.MemberService;
import kr.co.recipick.member.MemberVO;

@Service
public class AuthServiceImpl implements AuthService {
    
    @Autowired
    private MemberService memberService;
    
    @Value("${api.key}")
    private String API_KEY;
    
    @Override
    public boolean validateApiKey(String apiKey) {
        return API_KEY.equals(apiKey);
    }
    
    @Override
    public boolean validateCredentials(String email, String password) {
        MemberVO memberVO = new MemberVO();
        memberVO.setEmail(email);
        memberVO.setPwd(password);
        
        MemberVO loginResult = memberService.login(memberVO);
        return loginResult != null;
    }
    
//    @Override
//    public MemberResponseVO authenticateUser(AuthRequestVO requestVO) {
//        // MemberService를 이용한 로그인
//        MemberVO memberVO = new MemberVO();
//        memberVO.setEmail(requestVO.getEmail());
//        memberVO.setPwd(requestVO.getPassword());
//        
//        MemberVO loginResult = memberService.login(memberVO);
//        
//        if (loginResult != null) {
//            return memberApiService.convertToMemberResponse(loginResult);
//        }
//        return null;
//    }
        

}