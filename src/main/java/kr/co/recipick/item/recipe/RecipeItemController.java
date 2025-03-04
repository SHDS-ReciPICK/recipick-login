package kr.co.recipick.item.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

//import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.recipick.cart.RecipeIngCartVO;
import kr.co.recipick.product.recipe.RecipeService;
import kr.co.recipick.product.recipe.TagVO;


@Controller
public class RecipeItemController {
	
	@Autowired
	private RecipeItemService recipeItemService;
	@Autowired
	private RecipeService recipeService;

	
	@GetMapping("/recipe/product/recipe-single/{recipeId}")
	public String getRecipeDetails(@PathVariable int recipeId,
	@RequestParam int discount_price,
	@RequestParam int original_price,
	@RequestParam double avg_discount_rate,Model model) {			
			
		RecipeItemVO recipe =  recipeItemService.getRecipeItem(recipeId);
		RecipeItemVO category =  recipeItemService.getRecipeCategories(recipeId);
		List<RecipeItemVO> tags = recipeItemService.getRecipetags(recipeId);
		
		List<RecipeReviewVO> reviews = recipeItemService.getRecipeReview(recipeId);
		
		List<RecipeStepVO> steps = recipeItemService.getSteps(recipeId);
		
		recipe.setDiscount_price(discount_price);
		recipe.setOriginal_price(original_price);
		recipe.setAvg_discount_rate(avg_discount_rate);
		model.addAttribute("reviews", reviews);
		model.addAttribute("steps", steps);
		model.addAttribute("recipe", recipe);
		model.addAttribute("category", category);
		model.addAttribute("tags", tags);

		return "product/recipe-single"; 
	}
	
	@ResponseBody
	@GetMapping("/product/recipe/{recipeId}")
	public Map<String, Object> getRecipeIngs(@PathVariable int recipeId) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        List<RecipeIngCartVO> recipeIngs = recipeItemService.getRecipeIngs(recipeId);
	        if (recipeIngs.isEmpty()) {
	            response.put("success", false);
	            response.put("message", "레시피 옵션 데이터가 없습니다.");
	        } else {
	            response.put("success", true);
	            response.put("data", recipeIngs);
	        }
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "옵션 데이터 조회 중 오류 발생: " + e.getMessage());
	    }
	    return response;
	}

}






