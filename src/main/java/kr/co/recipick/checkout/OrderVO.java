package kr.co.recipick.checkout;

import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

@Data
public class OrderVO {

	private int oh_id;
	private int memberId;
	private double price;
	private String orderState;
	private String deliveryStatus;
	private String category;
	private int qty;
	private String orderDate;
	private String address;
	private int recipeId;
	private int ingId;
	private String title;
	private String deliveryDate;
	private String paymentMethod;
	private double discount;

}