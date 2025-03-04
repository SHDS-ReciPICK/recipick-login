package kr.co.recipick.dashboard.recipe;

import lombok.Data;

@Data
public class RecipeStepUploadVO {
	private int step_id;
	private int recipe_id;
	private String description;
	private String img_url;
	private int sort;
}
