package kr.co.recipick.cart;

import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

@Data
public class CartVO {
    private int cart_id;           
    private int member_id;         

    private int ing_id;     		
    private int recipe_id;         
    private int qty;              
    private int category;       
    private Timestamp update_dt; 
    
    private String ing_name;
    private Integer ing_avg_gram; 
    private Integer ing_price; 
    private Integer ing_discount_price;
    private Integer ing_original_price;
    private Integer ing_discount;
    private Integer unit;  
    
    private String rcp_title; 
    private Integer rcp_price;
    private int rcp_original_price;
    private int rcp_discount_price;
    private int ing_times;
    
    private String rcp_img;
    private String ing_img;
}