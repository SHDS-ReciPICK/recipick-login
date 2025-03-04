package kr.co.recipick.home;

import lombok.Data;

@Data
public class HomeVO {
	private int recipeId;
    private String title;
    private String description; 
    private int likeCount;
    private String thema;
    private int price;
    private int cookingTime;
    private int servingCount;
    private String mainImage;
    
    private double avgRating;
    private double avgDiscountRate;
    private int reviewCount;
    private int discountPrice; 

}
