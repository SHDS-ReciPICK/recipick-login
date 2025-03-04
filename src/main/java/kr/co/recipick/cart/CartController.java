package kr.co.recipick.cart;

import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.recipick.member.MemberVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@GetMapping("/shop-cart")
	public String shopCart(Model model, HttpSession session) {

		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			return "redirect:/signin.do";
		}
		Integer memberId = login.getMember_id();		
		
		List<CartVO> cartItems = cartService.getCartItems(memberId);
		model.addAttribute("cartItems", cartItems);
		
		List<TotalCartIngVO> totalIngs  = cartService.getTotalIngredientWeight(memberId);
		model.addAttribute("totalIngs", totalIngs);

		return "cart/shop-cart";
	}

	@GetMapping("/cart/recipe-ings")
	@ResponseBody
	public Map<String, Object> getRecipeIngs(@RequestParam("cart_id") int cartId) {
		Map<String, Object> response = new HashMap<>();
		try {
			List<RecipeOptionVO> recipeOption = cartService.getRecipeOptions(cartId);

			if (recipeOption.isEmpty()) {
				response.put("success", false);
				response.put("message", "레시피 옵션 데이터가 없습니다.");
			} else {
				response.put("success", true);
				response.put("data", recipeOption);
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "옵션 데이터 조회 중 오류 발생: " + e.getMessage());
		}
		return response;
	}

	@PostMapping("/cart/delete")
	@ResponseBody
	@Transactional
	public Map<String, Object> deleteCartItem(@RequestParam("cart_id") int id, @RequestParam("type") int type) {
		Map<String, Object> response = new HashMap<>();

		try {
			cartService.deleteCartItem(id, type); // 서비스 메서드 호출
			response.put("success", true);
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "삭제 중 오류 발생: " + e.getMessage());
		}
		return response;
	}

	@PostMapping("/cart/updateQty")
	@ResponseBody
	public Map<String, Object> updateCartQty(@RequestParam("cart_id") int cartId, @RequestParam("type") int type,
			@RequestParam("qty") int qty) {
		Map<String, Object> result = new HashMap<>();
		try {
			cartService.updateCartQty(cartId, type, qty);
			result.put("success", true);
		} catch (Exception e) {
			result.put("success", false);
			result.put("message", "수량 업데이트 중 오류 발생: " + e.getMessage());
		}
		return result;
	}

	@PostMapping("/cart/addItem")
	@ResponseBody
	public Map<String, Object> addItemToCart(@RequestBody Map<String, Object> itemData,  HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			response.put("null", true);
			return response;
		}
		Integer memberId = login.getMember_id();
		
		int type = ((Number) itemData.get("type")).intValue();
		int id = ((Number) itemData.get("id")).intValue();
		int qty = ((Number) itemData.get("setCount")).intValue();
		
		try {
			if (type == 1) {
				List<Map<String, Object>> ingOptions = (List<Map<String, Object>>) itemData.get("options");
				cartService.addRecipeToCart(memberId, id, qty, ingOptions);
			} else {
				cartService.addIngToCart(memberId, id, qty);
			}
			
			
			response.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
//			response.put("message", "아이템 추가 중 오류 발생: " + e.getMessage());
		}
		return response;
	}
	
	@PostMapping("/cart/updateRecipeOptions")
	@ResponseBody
	public Map<String, Object> updateRecipeOptions(@RequestBody Map<String, Object> requestBody) {

		Map<String, Object> result = new HashMap<>();
		try {
			cartService.updateOptionQty(requestBody);
			result.put("success", true);
			result.put("message", "옵션이 성공적으로 업데이트되었습니다.");
		} catch (Exception e) {
			result.put("success", false);
			result.put("message", "옵션 업데이트 중 오류 발생: " + e.getMessage());
		}
		return result;
	}

}
