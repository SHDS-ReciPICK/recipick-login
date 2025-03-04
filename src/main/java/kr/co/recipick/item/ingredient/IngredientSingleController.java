package kr.co.recipick.item.ingredient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IngredientSingleController {

	@Autowired
	private IngredientSingleService ingredientService;

	// 식재료 상세 페이지
//	@GetMapping("/ingredient-single/{ing_id}")
	@GetMapping("/ingredient/product/ingredient-single/{ing_id}")
	public String ingredientSingle(@PathVariable int ing_id, Model model) {
	    // 식재료의 카테고리 정보
	    IngredientSingleVO ing_category_group = ingredientService.ingCategory(ing_id);
	    model.addAttribute("ing_category_group", ing_category_group);
	    
	    // 식재료의 상세 정보
	    IngredientSingleVO ingredient = ingredientService.ingDetail(ing_id);
	    model.addAttribute("ingredient", ingredient);
	    
	    // 식재료의 영양성분
	    IngredientSingleVO ing_nutrient = ingredientService.ingNutrient(ing_id);
	    model.addAttribute("ing_nutrient", ing_nutrient);
	    
	    model.addAttribute("isIngredientPage", true);
	    
	    return "product/ingredient-single";
	}
}