package kr.co.recipick.item.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.recipick.cart.RecipeIngCartVO;

@Service
public class RecipeItemServiceImpl implements RecipeItemService {

    @Autowired
    private RecipeItemMapper recipeMapper;

    @Override
    public RecipeItemVO getRecipeItem(int recipeId) {
        return recipeMapper.getRecipeItem(recipeId);
    }
    
    @Override
    public RecipeItemVO getRecipeCategories(int recipeId) {
        return recipeMapper.getRecipeCategories(recipeId);
    }
    
    public List<RecipeItemVO> getRecipetags(int recipeId) {
        return recipeMapper.getRecipetags(recipeId);
    }
    
    @Override
    public List<RecipeStepVO> getSteps(int recipeId) {
        return recipeMapper.getSteps(recipeId);
    }
    
    
    @Override
    public List<RecipeReviewVO> getRecipeReview(int recipeId) { 
        return recipeMapper.getRecipeReview(recipeId);
    }
    
    @Override
    public List<RecipeIngCartVO> getRecipeIngs(int recipeId) {
    	return recipeMapper.getRecipeIngs(recipeId);
    }
}
