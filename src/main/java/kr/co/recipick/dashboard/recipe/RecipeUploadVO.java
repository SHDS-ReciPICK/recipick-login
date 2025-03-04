package kr.co.recipick.dashboard.recipe;

import java.util.List;

import lombok.Data;

@Data
public class RecipeUploadVO {
	private int recipe_id;
	private String title;
	private String description;
	private int cooking_time;
	private int serving_count;
	private int price;
	private String main_image;
	
	
	//recipe_category_group DB
	private String recipe_main;
	private String recipe_sub;
	private String recipe_detail;
	
	//Ingredient DB
	private int ing_id;
	private String name;
	private int unit;
	
    //Ingredient DB
    private List<RecipeIngredientUploadVO> ingredients; 

    // Step DB
    private List<RecipeStepUploadVO> steps;
	
	
	//tag DB
	private List<String> tagNames;
	
	
	
}
