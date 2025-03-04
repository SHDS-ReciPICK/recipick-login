package kr.co.recipick.checkout;

public interface CheckoutService {

	OrdererVO getOrdererInfo(int memberId);

	boolean verifyPayment(String impUid, int requestedAmount);

	void createOrder(OrderVO orderHistory, int check);

}
