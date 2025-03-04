package kr.co.recipick.dashboard.ingredient;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface IngredientUploadMapper {
	
	List<IngredientUploadVO> getAllIngredients();
    public void insertIngredient(IngredientUploadVO ingredientVO);

    public void insertIngredientCategoryGroup(IngredientUploadVO ingredientVO);
    
    List<IngredientUploadVO> searchIngredientsByTitle(String keyword);
    
    List<IngredientUploadVO> getAllIngredients(@Param("offset") int offset, @Param("pageSize") int pageSize);
    List<IngredientUploadVO> searchIngredientsByTitle(@Param("keyword") String keyword, @Param("offset") int offset, @Param("pageSize") int pageSize);
    int getTotalCount();
    int getSearchTotalCount(String keyword);
    
    
    void updateStock(@Param("ing_id") String ing_id, @Param("stock") int stock);
    

}