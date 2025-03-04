package kr.co.recipick.cart;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartMapper {
	List<CartVO> getCartItems(int memberId);

	void deleteCartItem(@Param("id") int id, @Param("type") int type);

	void deleteRecipeOptions(@Param("id") int id, @Param("type") int type);

	void updateCartItemQty(@Param("cartId") int cartId, @Param("qty") int qty);

	void updateRecipeOptionQty(@Param("rou_id") int rou_id, @Param("upd_qty") int upd_qty);

	List<RecipeOptionVO> findRecipeOptionQty(@Param("cartId") int cartId);

	List<RecipeIngCartVO> findRecipeIngs(@Param("cartId") int cartId);

	List<RecipeOptionVO> findRecipeOption(@Param("cartId") int cartId);
	
	List<TotalCartIngVO> getTotalIngredientWeight (int memberId);
	
	Integer findItem(@Param("memberId") int memberId, @Param("itemId") int itemId, @Param("type") int type);
	
	Integer findQty(@Param("cartId") int cartId);
	
	Integer findUnmatchedOptions(@Param("memberId") int memberId, @Param("recipeId") int recipeId,
			@Param("options") List<Map<String, Object>> options);

	void insertCartItem(CartVO cartItem); 

	void insertRecipeOption(@Param("optionItem") RecipeOptionVO optionItem, @Param("cartItem") CartVO cartItem);

	boolean existsCartItem(@Param("memberId") int memberId, @Param("id") int id, @Param("category") int category);

	void updateOptionQty(@Param("cartId") int cartId, @Param("riId") int riId, @Param("qty") int qty);
	
	void deleteCartByMemberId(@Param("memberId") int memberId);

}
