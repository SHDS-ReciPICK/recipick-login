package kr.co.recipick.cart;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class RecipeIngCartVO {

	private int ri_id;
	private int recipe_id;
	private int ing_id;
	private int ing_times;
	private String ing_name;
	private String ing_gram;

	private int unit; 
}