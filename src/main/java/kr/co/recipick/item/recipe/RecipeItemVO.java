package kr.co.recipick.item.recipe;

import java.security.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class RecipeItemVO {
	 private int recipe_id;
	    private String title;
	    private String description;
	    private String thema;
	    private int price;
	    private int cooking_time;
	    private int serving_count;
	    private String main_image;
	    
	    private String recipe_main;
	    private String recipe_detail;
	    
	    private List<String> tag_name;
	    
	    private String img_url;
	    private List<RecipeStepVO> steps;
	    private List<RecipeReviewVO> reviews;
	    private int review_writer;
	    private int star_rating;
	    private Timestamp review_dt;
	    private String content;

		// 가격 산출을 위한 필드들
		private int original_price; // 전체 재료의 원가 합계
		private int discount_price; // 전체 재료의 할인가 합계
		private double avg_discount_rate; // 할인 페이지 용
}