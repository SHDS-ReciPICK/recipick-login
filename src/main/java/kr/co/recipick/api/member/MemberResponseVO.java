package kr.co.recipick.api.member;

import lombok.Data;

@Data
public class MemberResponseVO {
    private int member_id;
    private String email;
    private String name;
    private String nickname;
    private String gender;
    private String birth;
}

/*
용도: 레시픽(Recipick) API에서 회원 정보를 반환하는 객체
특징: 레시픽 서버 → 외부 시스템(솔픽 등)으로 전달되는 데이터 구조
주요 사용처: 레시픽 API의 응답 데이터 구조 정의 
*/
 