package kr.co.recipick.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;

	
	@Override
	public List<CartVO> getCartItems(int memberId) {
		
		List<CartVO> cartItems = cartMapper.getCartItems(memberId);
		
		
		for (CartVO cartItem : cartItems) {
	        if (cartItem.getCategory() == 1) { // 레시피 항목인 경우
	            List<RecipeOptionVO> options = cartMapper.findRecipeOption(cartItem.getCart_id());
	            int totalPrice = 0;
	            int totalDiscountedPrice = 0;

	            for (RecipeOptionVO option : options) {
	            	int originalPrice = option.getPrice() * option.getUpd_qty();

	                // 할인된 가격 계산 (할인율 적용)
	                int discountedPrice = originalPrice;
	                if (option.getDiscount() > 0) { // 할인율이 있을 경우
	                    discountedPrice = option.getPrice() * (100 - option.getDiscount()) / 100;
	                    discountedPrice *= option.getUpd_qty();
	                }

	                // 총합에 원래 가격과 할인된 가격 누적
	                totalPrice += originalPrice;
	                totalDiscountedPrice += discountedPrice;	}
	            
	            cartItem.setRcp_original_price(totalPrice);
	            cartItem.setRcp_discount_price(totalDiscountedPrice);
	        }
	        
	        else {
	        	int originalPrice = cartItem.getIng_price() * (cartItem.getIng_avg_gram() / cartItem.getUnit());
	        	int discountPrice = (cartItem.getIng_price()  * (100 - cartItem.getIng_discount()) / 100 ) * (cartItem.getIng_avg_gram() / cartItem.getUnit());
	        	
	        	cartItem.setIng_original_price(originalPrice);
	        	cartItem.setIng_discount_price(discountPrice);
	        }
	        
	    }
		return cartItems;
	}

	@Override
	public List<TotalCartIngVO> getTotalIngredientWeight(int memberId) {
		
		return cartMapper.getTotalIngredientWeight(memberId);
	}

	@Override
	public void deleteCartItem(int id, int type) { 

		if (type == 1) {
			cartMapper.deleteRecipeOptions(id, type);
		}
		cartMapper.deleteCartItem(id, type); 
	}

	@Override
	public void updateCartQty(int cartId, int type, int cartQty) {

		cartMapper.updateCartItemQty(cartId, cartQty);
	}

	@Override
	public List<RecipeOptionVO> getRecipeOptions(int cartId) {
		return cartMapper.findRecipeOption(cartId);
	}

	
	@Override
	public void addIngToCart(int memberId, int id, int qty) { 
		Integer cartId = cartMapper.findItem(memberId, id, 0);
		
		if (cartId != null) {
				cartMapper.updateCartItemQty(cartId, qty);
		} else {
			CartVO cartItem = new CartVO();
			cartItem.setMember_id(memberId);
			cartItem.setIng_id(id);
			cartItem.setCategory(0); 
			cartItem.setQty(qty);
			cartMapper.insertCartItem(cartItem);
		}
	}
	
	@Override
	public void addRecipeToCart(int memberId, int id, int qty, List<Map<String, Object>> ingOptions) { 
		Integer cartId = cartMapper.findItem(memberId, id, 1);

		if (cartId != null) {			
			
			Integer duplicateCartId = cartMapper.findUnmatchedOptions(memberId, id, ingOptions);
			if (duplicateCartId != null) {
				int newQty = cartMapper.findQty(duplicateCartId) + qty;
				cartMapper.updateCartItemQty(duplicateCartId, newQty);
				return ;
			}
		} 
			CartVO cartItem = new CartVO();
			cartItem.setMember_id(memberId);
			cartItem.setRecipe_id(id); 
			cartItem.setCategory(1);
			cartItem.setQty(qty);
			
			cartMapper.insertCartItem(cartItem);
			addRecipeOptions(cartItem, ingOptions);
	}
	
	@Override
	public void addRecipeOptions(CartVO cartItem, List<Map<String, Object>> options) {

		for (Map<String, Object> option : options) {
			RecipeOptionVO optionItem = new RecipeOptionVO();
			optionItem.setIng_id(((Number) option.get("ing_id")).intValue());
			optionItem.setUpd_qty(((Number) option.get("ing_qty")).intValue());
			cartMapper.insertRecipeOption(optionItem, cartItem);
		}
	}

	@Override
	public void updateOptionQty(Map<String, Object> requestBody) {
		
		int cartId = ((Number) requestBody.get("cart_id")).intValue();
		List<Map<String, Object>> options = (List<Map<String, Object>>) requestBody.get("options");
		for (Map<String, Object> option : options) {
		int riId = ((Number) option.get("ri_id")).intValue();
		int qty = ((Number) option.get("qty")).intValue();
		cartMapper.updateOptionQty(cartId, riId, qty);
		}
	}
	
	@Override
	public void clearCart(int memberId) {
	        cartMapper.deleteCartByMemberId(memberId);
	}

}
