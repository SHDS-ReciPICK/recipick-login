package kr.co.recipick.dashboard.ingredient;

import lombok.Data;

@Data
public class IngredientUploadVO {
	//ingredient DB
	private String ing_id;
	private int code;
	private String name;
	private int avg_gram;
	private int discount;
	private int unit;
	private String origin;
	private int price;
	private int stock;
	private String season;
	private String image;
	private String detail;
	//ing_category_group DB
	private String ing_main;
	private String ing_sub;
	private String ing_detail;
}
