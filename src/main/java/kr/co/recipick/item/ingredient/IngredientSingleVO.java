package kr.co.recipick.item.ingredient;

import lombok.Data;

@Data
public class IngredientSingleVO {
	
	// 기본 정보
	private int ing_id;
	private String name;
	private int price;
	private float avg_gram;
	private int stock;
	private int discount;
	private int code;
	private String origin;
	private String supplier;
	private String keyword;
	private String image;
	private String detail;
	private int unit;
	private String season;

	// 카테고리 정보
	private String ing_main;
	private String ing_sub;
	private String ing_detail;

	// 영양성분 정보 
	private float calories;
	private float carbohydrate;
	private float sugars;
	private float fat;
	private float protein;
	private float moisture;
	private float sol_fiber;
	private float insol_fiber;
	private float fiber;
	private float ash;
	private String caution;
	private String storage;
	
}