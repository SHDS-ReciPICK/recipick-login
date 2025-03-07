package kr.co.recipick.api.member;

import lombok.Data;

@Data
public class MemberRequestVO {
    private String email;      // 조회할 회원의 이메일
    private String apiKey;    // API 접근을 위한 키
}