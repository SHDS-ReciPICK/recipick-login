package kr.co.recipick.checkout;

import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

//타입 수정 필요
@Data
public class OrdererVO {

	private int memberId; // Primary Key
	private String email; // 이메일
	private String nickname; // 닉네임
//	private String pwd; // 비밀번호
//	private String gender; // 성별
	private String name; // 이름
//	private String birth; // 생년월일 (문자열로 처리)
	private String phone; // 전화번호
	private String address; // 주소
//	private boolean admin; // 관리자 여부
}