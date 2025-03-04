package kr.co.recipick.product.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.recipick.member.MemberVO;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeMapper mapper;

	// 상품 목록 출력
	@Override
	public Map<String, Object> getRecipeList(RecipeVO vo) {
		Map<String, Object> result = new HashMap<>();

		List<RecipeVO> recipes;

		if ("best".equals(vo.getViewType())) {
			// 베스트 상품은 항상 12개만 조회
			recipes = mapper.getBestRecipes();
			// 페이징 관련 정보 불필요
			result.put("totalPages", 1); // 항상 1페이지
		} else if ("discount".equals(vo.getViewType())) {
			int totalCount = mapper.countDiscountRecipes();
			recipes = mapper.getRecipeList(vo);
			int totalPages = (int) Math.ceil((double) totalCount / vo.getPerPage());
			result.put("totalPages", totalPages);
			result.put("totalCount", totalCount);
		} else {
			// 기존 일반 상품 목록 조회 로직
			int totalCount = mapper.countRecipes(vo);
			recipes = mapper.getRecipeList(vo);
			int totalPages = (int) Math.ceil((double) totalCount / vo.getPerPage());
			result.put("totalPages", totalPages);
			result.put("totalCount", totalCount);
		}

		// 각 레시피의 가격 계산
		calculateRecipePrices(recipes);
		result.put("recipes", recipes);

		return result;
	}

	// 레시피 가격 합산
	@Override
	public void calculateRecipePrices(List<RecipeVO> recipes) {
		for (RecipeVO recipe : recipes) {
			// 레시피의 모든 재료 정보 조회
			List<RecipeIngredientVO> ingredients = mapper.getRecipeIngredients(recipe.getRecipe_id());

			int originalPrice = 0;
			int discountPrice = 0;
			double totalDiscountRate = 0;

			// 각 재료별 가격 계산
			for (RecipeIngredientVO ingredient : ingredients) {
				// 재료당 원가 계산: 재료가격 * 필요수량
				int ingredientOriginal = ingredient.getPrice() * ingredient.getIng_times();
				originalPrice += ingredientOriginal;

				// 재료당 할인가 계산: 할인된 가격 * 필요수량
				int ingredientDiscount = ingredient.getDiscountedPrice() * ingredient.getIng_times();
				discountPrice += ingredientDiscount;

				// 재료별 할인율 누적
				totalDiscountRate += ingredient.getDiscount();
			}

			// 평균 할인율 계산 (재료 개수로 나눔)
			double avgDiscountRate = ingredients.isEmpty() ? 0 : totalDiscountRate / ingredients.size();

			// 계산된 가격 설정
			recipe.setOriginal_price(originalPrice);
			recipe.setDiscount_price(discountPrice);
			recipe.setAvg_discount_rate(avgDiscountRate);
		}
	}

	// 이달의 레시피
	@Override
	public Map<String, Object> getMonthlyRecipes() {
		Map<String, Object> result = new HashMap<>();
		List<RecipeVO> recipes = mapper.getMonthlyRecipes();

		// 각 레시피의 가격 계산
		calculateRecipePrices(recipes);
		result.put("recipes", recipes);

		return result;
	}

	@Override
	public List<String> searchTagNames(String keyword) {
		return mapper.searchTagNames(keyword);
	}

	// 검색 - 태그
	@Override
	public List<TagVO> getRecipeTags(int recipeId) {
		return mapper.getTagsByRecipeId(recipeId);
	}

	@Override
	public Map<String, Object> getRecentRecipe(MemberVO uv) {
		Map<String, Object> result = new HashMap<>();

		List<RecipeVO> recipes = mapper.getRecentRecipe(uv);

		result.put("recipes", recipes);

		return result;
	}

}