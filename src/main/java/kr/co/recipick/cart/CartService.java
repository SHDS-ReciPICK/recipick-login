package kr.co.recipick.cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.recipick.cart.CartVO;
import kr.co.recipick.cart.RecipeOptionVO;
import kr.co.recipick.cart.TotalCartIngVO;

public interface CartService {

	List<CartVO> getCartItems(int memberId);

	void deleteCartItem(int id, int type);

	void updateCartQty(int id, int type, int qty);

	List<RecipeOptionVO> getRecipeOptions(int cartId);
	
	List<TotalCartIngVO> getTotalIngredientWeight(int memberId);

	void addIngToCart(int memberId, int id, int qty);
	
	void addRecipeToCart(int memberId, int id, int qty, List<Map<String, Object>> ingOptions);
	
	void addRecipeOptions(CartVO CartItem, List<Map<String, Object>> options); // 레시피 옵션 추가

	void updateOptionQty(Map<String, Object> requestBody);
	
	void clearCart(int memberId); 

}
