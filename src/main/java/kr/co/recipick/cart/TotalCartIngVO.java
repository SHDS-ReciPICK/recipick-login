package kr.co.recipick.cart;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class TotalCartIngVO {

	private String ing_name;
	private int total_weight;
}