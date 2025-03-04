package kr.co.recipick.dashboard.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.recipick.dashboard.ingredient.IngredientUploadVO;

@Mapper
public interface RecipeUploadMapper {
	List<RecipeUploadVO> getAllRecipes();
    public void insertRecipe(RecipeUploadVO RecipeVO);
    
    public void insertRecipeCategoryGroup(RecipeUploadVO recipeVO);
    
    public void insertTag(Map map);
    
    public void recipe_ingredient(RecipeIngredientUploadVO map);
    
    public void recipe_step(RecipeStepUploadVO map);
    
    
    List<RecipeUploadVO> getAllingredient();
    
    List<RecipeUploadVO> searchRecipesByTitle(String keyword);
    
    List<RecipeUploadVO> getAllRecipes(@Param("offset") int offset, @Param("pageSize") int pageSize);
    List<RecipeUploadVO> searchRecipesByTitle(@Param("keyword") String keyword, @Param("offset") int offset, @Param("pageSize") int pageSize);
    int getTotalCount();
    int getSearchTotalCount(String keyword);
    
    void deleteRecipeById(int recipeId);
}