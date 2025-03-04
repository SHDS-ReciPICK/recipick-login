package kr.co.recipick.community;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class CommunityVO {
	private int post_id;
	private int poster_id;
	private String title;
	private Timestamp post_datetime;
	private int view;
	private String post_content;
	
	private int reply_id;
	private int commenter_id;
	private String reply_content;
	private Timestamp reply_datetime;
	
	private int post_image_id;
	private int img_no;
	private String img_url;
	
	// 추가
	private String commenterNickname;
	private String posterNickname;
	private String coverImage;
	private int countReply;


	private int member_id;
	private String email;
	private String nickname;
	private String pwd;
	private String gender;
	private String name;
	private String birth;
	private String phone;
	private String address;
	private String admin;
	private int oh_id;
	private String payment_method;
	private int discount; 

	private int price;
	private String order_state;
	private String delivery_status;
	private String category;
	private int qty;
	private Date order_date;
	
	private int recipe_id;
	private int ing_id;
	private String discription;
	private String searchType;
	private String searchWord;
}
