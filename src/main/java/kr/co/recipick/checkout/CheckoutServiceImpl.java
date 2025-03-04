package kr.co.recipick.checkout;

import kr.co.recipick.cart.CartVO;
import kr.co.recipick.cart.CartMapper;
import kr.co.recipick.cart.CartService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;

@Service
public class CheckoutServiceImpl implements CheckoutService {

	private static final String IMP_KEY = "1580273438428377";
	private static final String IMP_SECRET = "vBQGwvuO8CRn94GaV4l0lguj8lYoXyZhK3W262se77SNWC1C58PwfyOwhIiHy6s1Thty8ea9rHBEFpKk";
	// 나중에숨김처리

	@Autowired
	private CheckoutMapper checkoutMapper;

	@Autowired
	private CartMapper cartMapper;

	@Autowired
	private CartService cartService;

	@Override
	public void createOrder(OrderVO orderHistory, int check) {
		// 장바구니 데이터를 가져오는 로직 (필요 시 활용)
		List<CartVO> cartItems = cartService.getCartItems(orderHistory.getMemberId());

		if (cartItems == null || cartItems.isEmpty()) {
			throw new IllegalArgumentException("장바구니가 비어 있습니다.");
		}

		for (CartVO cartItem : cartItems) {

			if (cartItem.getCategory() == 1) {
				orderHistory.setCategory("r");
				orderHistory.setTitle(cartItem.getRcp_title());

			} else {
				orderHistory.setCategory("i");
				orderHistory.setTitle(cartItem.getIng_name());
			}
			orderHistory.setQty(cartItem.getQty());
			orderHistory.setRecipeId(cartItem.getRecipe_id());
			orderHistory.setIngId(cartItem.getIng_id());
			// 프라이
			orderHistory.setAddress(orderHistory.getAddress()); // 서버에서 가져온 주소

			checkoutMapper.insertOrderHistory(orderHistory);
			

			System.out.println();
			System.out.println(orderHistory);
			System.out.println();

		}

	if (check == 1) {
		cartMapper.deleteCartByMemberId(orderHistory.getMemberId());
	}
	}

	@Override
	public OrdererVO getOrdererInfo(int memberId) {
		return checkoutMapper.getOrdererInfo(memberId);
	}

	@Override
	public boolean verifyPayment(String impUid, int requestedAmount) {
		try {

			String accessToken = getAccessToken();

			// 아임포트 API 호출
			RestTemplate restTemplate = new RestTemplate();
			String url = "https://api.iamport.kr/payments/" + impUid;

			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", accessToken);
			HttpEntity<String> entity = new HttpEntity<>(headers);

			ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
			Map<String, Object> body = (Map<String, Object>) response.getBody().get("response");

			int paidAmount = (int) body.get("amount");
			return paidAmount == requestedAmount;

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("결제 검증 중 오류 발생");
		}
	}

	private String getAccessToken() {

		try {
			RestTemplate restTemplate = new RestTemplate();

			// 헤더 설정
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);

			// JSON 요청 데이터
			Map<String, String> request = new HashMap<>();
			request.put("imp_key", IMP_KEY); // API Key
			request.put("imp_secret", IMP_SECRET); // API Secret

			HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);

			// 아임포트 API 호출
			ResponseEntity<Map> response = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", entity,
					Map.class);

			// 응답 처리
			Map<String, Object> responseBody = (Map<String, Object>) response.getBody().get("response");
			return (String) responseBody.get("access_token");
		} catch (Exception e) {
			System.out.println("발급실패");
			System.out.println();
			e.printStackTrace();
			throw new RuntimeException("Access Token 발급 실패: " + e.getMessage());
		}
	}
}
