package kr.co.recipick.item.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.recipick.cart.RecipeIngCartVO;

@Mapper
public interface RecipeItemMapper {
    RecipeItemVO getRecipeItem(@Param("recipeId") int recipeId);
    
    RecipeItemVO getRecipeCategories(@Param("recipeId") int recipeId);
    
    List<RecipeStepVO> getSteps(@Param("recipeId") int recipeId);
    
    List<RecipeItemVO> getRecipetags(@Param("recipeId") int recipeId);
    
    List<RecipeReviewVO> getRecipeReview(@Param("recipeId") int recipeId);
    
    List<RecipeIngCartVO> getRecipeIngs(int recipeId);
}
