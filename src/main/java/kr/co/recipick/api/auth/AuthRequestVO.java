package kr.co.recipick.api.auth;

import lombok.Data;

@Data
public class AuthRequestVO {
    private String email;
    private String password;
    private String apiKey;
}