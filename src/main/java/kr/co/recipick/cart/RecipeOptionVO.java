package kr.co.recipick.cart;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class RecipeOptionVO {

	private int upd_qty;
	private int rou_id;
	private int ri_id;
	private int ing_id;

	private int unit;
	private String name;
	private int price;
	private int discount;
}