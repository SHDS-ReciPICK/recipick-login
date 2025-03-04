package kr.co.recipick.product.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.recipick.member.MemberVO;

@Mapper
public interface RecipeMapper {
	int countRecipes(RecipeVO vo);

	List<RecipeVO> getRecipeList(RecipeVO vo);

	List<RecipeIngredientVO> getRecipeIngredients(int recipe_id);

	// 태그 관련 메서드
	List<TagVO> getTagsByRecipeId(int recipe_id);

	List<String> searchTagNames(String keyword);

	List<RecipeVO> getBestRecipes();

	int countDiscountRecipes();

	// 이달의 레시피 조회를 위한 메서드 추가
	List<RecipeVO> getMonthlyRecipes();
	
	List<RecipeVO> getRecentRecipe(MemberVO uv);

}