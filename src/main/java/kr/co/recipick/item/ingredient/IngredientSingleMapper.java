package kr.co.recipick.item.ingredient;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IngredientSingleMapper {
	// 식재료 1개에 대한 분류
	IngredientSingleVO ingCategory(int ing_id); 
	
	// 식재료 상세
	IngredientSingleVO ingDetail(int ing_id);
	
	// 식재료 영양성분
	IngredientSingleVO ingNutrient(int ing_id);
}