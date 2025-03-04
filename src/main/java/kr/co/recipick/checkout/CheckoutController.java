package kr.co.recipick.checkout;

import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.recipick.cart.CartService;
import kr.co.recipick.cart.CartVO;
import kr.co.recipick.member.MemberVO;

@Controller
public class CheckoutController {

	@Autowired
	private CartService cartService;

	@Autowired
	private CheckoutService checkoutService;

	@GetMapping("/shop-checkout")
	public String shopCheckout(Model model, HttpSession session) {

		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login == null) {
			return "redirect:/signin.do";
		}
		Integer memberId = login.getMember_id();

//    	model.addAttribute("isRecipePage", true);  // 레시피 페이지일 때만 true

		List<CartVO> cartItems = cartService.getCartItems(memberId);
		model.addAttribute("cartItems", cartItems);

		@SuppressWarnings("unchecked")
		Map<String, String> checkoutData = (Map<String, String>) session.getAttribute("checkoutData");
		OrdererVO orderer = checkoutService.getOrdererInfo(memberId); // 멤버아이디 주석
		model.addAttribute("orderer", orderer);

		model.addAttribute("totalPrice", checkoutData.get("totalPayablePrice"));
		model.addAttribute("totalDiscountPrice", checkoutData.get("totalDiscountPrice"));
		model.addAttribute("totalOriginalPrice", checkoutData.get("totalOriginalPrice"));

		return "checkout/shop-checkout";
	}

	@PostMapping("/shop-checkout/session-data")
	@ResponseBody
	public Map<String, Object> saveSessionData(@RequestBody Map<String, String> orderData, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		try {
			session.setAttribute("checkoutData", orderData);
			response.put("success", true);
			return response;
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "세션 데이터 저장 실패");
			return response;
		}
	}

	@GetMapping("/checkout/payment-success")
	public String paymentSuccess(@RequestParam String merchantUid, Model model) {
		model.addAttribute("merchantUid", merchantUid);
		return "checkout/payment-success";
	}

	@GetMapping("/checkout/payment-failed")
	public String paymentFailed(@RequestParam String merchantUid, Model model) {
		model.addAttribute("merchantUid", merchantUid);
		return "checkout/payment-failed";
	}

	@PostMapping("/checkout/success")
	@ResponseBody
	public Map<String, Object> handlePaymentSuccess(@RequestBody Map<String, Object> successData, HttpSession session) {

		Map<String, Object> response = new HashMap<>();

        MemberVO login = (MemberVO) session.getAttribute("login");
        Integer memberId = login.getMember_id();

		try {

			int totalPrice = (int) successData.get("totalPrice");
			String deliveryDate = (String) successData.get("deliveryDate");
			String orderDate = (String) successData.get("orderDate");
			String paymentMethod = (String) successData.get("paymentMethod");
			String orderStatus = (String) successData.get("orderStatus");
//            String impUid = (String) successData.get("impUid");
			String address = (String) successData.get("address");

			// 디테일 안씀??
			OrderVO orderHistory = new OrderVO();
			List<CartVO> cartItems = cartService.getCartItems(memberId);
//            
			orderHistory.setMemberId(memberId);
			orderHistory.setOrderState(orderStatus);
			orderHistory.setDeliveryStatus("배송준비");
			orderHistory.setDeliveryDate(deliveryDate);
			orderHistory.setOrderDate(orderDate);
			orderHistory.setPaymentMethod(paymentMethod);
			orderHistory.setAddress(address);

//			System.out.println("Member ID: " + orderHistory.getMemberId());
//			System.out.println("Order State: " + orderHistory.getOrderState());
//			System.out.println("Delivery Status: " + orderHistory.getDeliveryStatus());
//			System.out.println("Payment Method: " + orderHistory.getPaymentMethod());
//			System.out.println("Delivery Date: " + orderHistory.getDeliveryDate());
//			System.out.println("Order Date: " + orderHistory.getOrderDate());
//			System.out.println("Address: " + orderHistory.getAddress());

			checkoutService.createOrder(orderHistory, 1);

			response.put("success", true);
			response.put("message", "결제 성공 데이터가 처리되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "결제 성공 데이터 처리 중 오류가 발생했습니다.");
		}
		return response;
	}

	@PostMapping("/checkout/failure")
	@ResponseBody
	public Map<String, Object> handlePaymentFailure(@RequestBody Map<String, Object> data, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		
		MemberVO login = (MemberVO) session.getAttribute("login");
        Integer memberId = login.getMember_id();
		

		try {
			int totalPrice = (int) data.get("totalPrice");
			String deliveryDate = (String) data.get("deliveryDate");
			String orderDate = (String) data.get("orderDate");
			String paymentMethod = (String) data.get("paymentMethod");
			String orderStatus = (String) data.get("orderStatus");
			String address = (String) data.get("address");

			OrderVO orderHistory = new OrderVO();
			List<CartVO> cartItems = cartService.getCartItems(memberId);

			orderHistory.setMemberId(memberId);
			orderHistory.setOrderState(orderStatus);
			orderHistory.setDeliveryStatus("");
			orderHistory.setPaymentMethod("");
			orderHistory.setDeliveryDate("0000-00-00");
			orderHistory.setOrderDate(orderDate);
			orderHistory.setAddress(address);

			checkoutService.createOrder(orderHistory, 0);

			response.put("success", true);
			response.put("message", "결제 실패 데이터가 처리되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "결제 실패 데이터 처리 중 오류가 발생했습니다.");
		}
		return response;
	}

	@PostMapping("/checkout/verify")
	@ResponseBody
	public Map<String, Object> verifyPayment(@RequestParam("imp_uid") String impUid,
			@RequestParam("merchant_uid") String merchantUid, @RequestParam("amount") int amount) {

		Map<String, Object> result = new HashMap<>();
		try {
			// 결제 금액 검증
			boolean isVerified = checkoutService.verifyPayment(impUid, amount);
			result.put("verified", isVerified);
			result.put("message", isVerified ? "결제가 검증되었습니다." : "결제 금액 불일치. 검증 실패.");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("verified", false);
			result.put("message", "서버 오류: 결제 검증 실패");
		}
		return result;
	}

}