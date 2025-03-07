package kr.co.recipick.api.auth;

public interface AuthService {
    boolean validateApiKey(String apiKey);
	boolean validateCredentials(String email, String password);
}