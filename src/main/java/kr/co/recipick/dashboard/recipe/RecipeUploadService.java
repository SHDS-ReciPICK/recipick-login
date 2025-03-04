package kr.co.recipick.dashboard.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class RecipeUploadService {
	@Autowired
    private RecipeUploadMapper recipeMapper;
	
	  @Transactional
	  public void recipe(RecipeUploadVO recipeVO) {
	    recipeMapper.insertRecipe(recipeVO);
	    recipeMapper.insertRecipeCategoryGroup(recipeVO);
	    
	    Map<String, Object> param = new HashMap<>();
	    param.put("recipe_id", recipeVO.getRecipe_id());
	    for (String tag : recipeVO.getTagNames()) {
	    	param.put("tagName", tag);
	    	recipeMapper.insertTag(param); // tag 정보 저장
	    }
	    
	    for (RecipeIngredientUploadVO ingredient : recipeVO.getIngredients()) {
	        ingredient.setRecipe_id(recipeVO.getRecipe_id()); // recipe_id 설정
	    }

	    
//	    Map<String, Object> param_ingredient = new HashMap<>();
//	    param_ingredient.put("recipe_id", recipeVO.getRecipe_id());
	    for (RecipeIngredientUploadVO ing_id : recipeVO.getIngredients()) {
//	    	param_ingredient.put("ing_id", ing_id);
//	    	param_ingredient.put("ing_time", ing_time);
	    	recipeMapper.recipe_ingredient(ing_id); // tag 정보 저장
	    }
	    
	    for (RecipeStepUploadVO sort : recipeVO.getSteps()) {
	        sort.setRecipe_id(recipeVO.getRecipe_id());
	    }

	    
	    for (RecipeStepUploadVO sort : recipeVO.getSteps()) {
	        recipeMapper.recipe_step(sort);;
	    }
	    
	  }
	  public List<RecipeUploadVO> getAllingredient() {
		    return recipeMapper.getAllingredient();
		}
	
    public List<RecipeUploadVO> getAllRecipes(){
    	return recipeMapper.getAllRecipes();
    }
    
    public List<RecipeUploadVO> searchRecipesByTitle(String keyword) {
        return recipeMapper.searchRecipesByTitle(keyword); // RecipeMapper를 사용하여 제목으로 레시피 검색
      }
    
    public List<RecipeUploadVO> getAllRecipes(int offset, int pageSize) {
    	  return recipeMapper.getAllRecipes(offset, pageSize);
    	}

    	public List<RecipeUploadVO> searchRecipesByTitle(String keyword, int offset, int pageSize) {
    	  return recipeMapper.searchRecipesByTitle(keyword, offset, pageSize);
    	}

    	public int getTotalCount() {
    	  return recipeMapper.getTotalCount();
    	}

    	public int getSearchTotalCount(String keyword) {
    	  return recipeMapper.getSearchTotalCount(keyword);
    	}
    	
        public void deleteRecipeById(int recipeId) {
            recipeMapper.deleteRecipeById(recipeId);
        }
        
        public List<RecipeUploadVO> getAllIngredients(){
            return recipeMapper.getAllingredient(); 
        }
}

