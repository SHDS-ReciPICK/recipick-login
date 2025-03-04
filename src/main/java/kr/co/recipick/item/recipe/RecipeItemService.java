package kr.co.recipick.item.recipe;

import java.util.List;

import kr.co.recipick.cart.RecipeIngCartVO;

public interface RecipeItemService {
    RecipeItemVO getRecipeItem(int recipeId);
    
    RecipeItemVO getRecipeCategories(int recipeId);
    
    List<RecipeItemVO> getRecipetags(int recipeId);
    
    List<RecipeStepVO> getSteps(int recipeId);
    
    List<RecipeReviewVO> getRecipeReview(int recipeId);
    
    List<RecipeIngCartVO> getRecipeIngs(int recipeId);
}

