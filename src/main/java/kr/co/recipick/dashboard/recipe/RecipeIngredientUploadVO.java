package kr.co.recipick.dashboard.recipe;

import lombok.Data;

@Data
public class RecipeIngredientUploadVO {
	private int ri_id;
	private int recipe_id;
	private int ing_id;
	private int ing_times;
	private String ing_name;
	private String ing_gram;
}
