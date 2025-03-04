package kr.co.recipick.product.ingredient;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.recipick.product.recipe.RecipeVO;

@Mapper
public interface IngredientMapper {

	// 전체 식재료 개수 조회
	int countIngredients(IngredientVO vo);

	// 식재료 목록 조회
	List<IngredientVO> getIngredientList(IngredientVO vo);

	// 검색 결과 목록 조회
	List<IngredientVO> searchIngredients(IngredientVO vo);
	
	List<IngredientVO> getBestIngredients();
	
	int countDiscountIngredients();
	
	// 제철 식재료 조회
    List<IngredientVO> getSeasonlyIngredients(IngredientVO vo);
    
    // 제철 식재료 개수 조회
    int countSeasonlyIngredients(String currentSeason);

}