package kr.co.recipick.api.member;


public interface MemberApiService {
    MemberResponseVO getMemberInfo(String email);
//    MemberResponseVO convertToMemberResponse(MemberVO memberVO);
}