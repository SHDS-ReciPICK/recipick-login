package kr.co.recipick.product.ingredient;

import java.util.List;
import java.util.Map;

public interface IngredientService {
	
	Map<String, Object> getIngredientList(IngredientVO vo);
	
}
