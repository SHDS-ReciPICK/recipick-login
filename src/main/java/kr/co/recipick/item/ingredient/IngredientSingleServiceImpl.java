package kr.co.recipick.item.ingredient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IngredientSingleServiceImpl implements IngredientSingleService {

	@Autowired
	private IngredientSingleMapper mapper;
	
	@Override
	public IngredientSingleVO ingCategory(int ing_id) {
		return mapper.ingCategory(ing_id);
	}

	@Override
	public IngredientSingleVO ingDetail(int ing_id) {
		return mapper.ingDetail(ing_id);
	}

	@Override
	public IngredientSingleVO ingNutrient(int ing_id) {
		return mapper.ingNutrient(ing_id);
	}
}