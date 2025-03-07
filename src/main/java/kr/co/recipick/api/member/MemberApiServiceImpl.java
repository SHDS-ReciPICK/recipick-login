package kr.co.recipick.api.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.recipick.member.MemberService;
import kr.co.recipick.member.MemberVO;

@Service 
public class MemberApiServiceImpl implements MemberApiService {
    
//    @Autowired
//    private MemberService memberService;  // 코어 MemberService 주입
    
    @Autowired
    private MemberApiMapper memberApiMapper;

    @Override
    public MemberResponseVO getMemberInfo(String email) {
        
        MemberResponseVO member = memberApiMapper.getMemberInfo(email);
        
        if (member != null) {
            return member;
        }    
        return null;
    }
    
//    @Override
//    public MemberResponseVO getMemberInfoById(int memberId) {
//        MemberVO memberVO = new MemberVO();
//        memberVO.setMember_id(memberId);
//        
//        MemberVO member = memberService.detail(memberVO);
//        
//        if (member != null) {
//            return convertToMemberResponse(member);
//        }
//        
//        return null;
//    }
    
//    @Override
//    public MemberResponseVO convertToMemberResponse(MemberVO memberVO) {
//        MemberResponseVO response = new MemberResponseVO();
//        response.setMember_id(memberVO.getMember_id());
//        response.setEmail(memberVO.getEmail());
//        response.setName(memberVO.getName());
//       
//        response.setNickname(memberVO.getNickname());
//        response.setGender(memberVO.getGender());
//        response.setBirth(memberVO.getBirth());
//        
//        return response;
//    }
}