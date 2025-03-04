package kr.co.recipick.product.recipe;

import java.util.List;
import java.util.Map;

import kr.co.recipick.member.MemberVO;

public interface RecipeService {

	Map<String, Object> getRecipeList(RecipeVO vo);

	void calculateRecipePrices(List<RecipeVO> recipes);

	List<String> searchTagNames(String keyword);

	List<TagVO> getRecipeTags(int recipeId);

	Map<String, Object> getMonthlyRecipes();
	
	Map<String, Object> getRecentRecipe(MemberVO uv);

}
