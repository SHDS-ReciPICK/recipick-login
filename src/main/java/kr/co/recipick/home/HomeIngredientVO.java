package kr.co.recipick.home;

import lombok.Data;

@Data
public class HomeIngredientVO {
	private int recipe_id; // 이 식재료가 속한 레시피
	private int ing_id;
    private String ing_name;
    private int price;
    private String image;
    private int ingredient_count;
    
    private int discount;

}
