package kr.co.recipick.dashboard.ingredient;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IngredientUploadService {
    @Autowired
    private IngredientUploadMapper ingredientMapper;

    @Transactional
    public void insertIngredient(IngredientUploadVO ingredientVO) {
        ingredientMapper.insertIngredient(ingredientVO);
        ingredientMapper.insertIngredientCategoryGroup(ingredientVO);
    }
    
    public List<IngredientUploadVO> getAllIngredients() {
        return ingredientMapper.getAllIngredients();
    }
    
    public void updateStock(IngredientUploadVO ingredientVO) {
        ingredientMapper.updateStock(ingredientVO.getIng_id(), ingredientVO.getStock());
    }

    public List<IngredientUploadVO> searchIngredientsByTitle(String keyword) {
          return ingredientMapper.searchIngredientsByTitle(keyword); // IngredientMapper를 사용하여 제목으로 레시피 검색
        }
      
      public List<IngredientUploadVO> getAllIngredients(int offset, int pageSize) {
      	  return ingredientMapper.getAllIngredients(offset, pageSize);
      	}

      	public List<IngredientUploadVO> searchIngredientsByTitle(String keyword, int offset, int pageSize) {
      	  return ingredientMapper.searchIngredientsByTitle(keyword, offset, pageSize);
      	}

      	public int getTotalCount() {
      	  return ingredientMapper.getTotalCount();
      	}

      	public int getSearchTotalCount(String keyword) {
      	  return ingredientMapper.getSearchTotalCount(keyword);
      	}
      	
    
}