package kr.co.recipick.product.recipe;

import lombok.Data;

@Data
public class RecipeIngredientVO {
    // 기본 정보
    private int ri_id;
    private int recipe_id;
    private int ing_id;
    private int ing_times;  // 레시피에서 필요한 재료의 단위 배수
    
    // 재료 정보
    private String ing_name;
    private int price;      // 재료 원가
    private int discount;   // 할인율 (%)
    private int ing_gram;   // 기본 단위 용량
    
    // 할인가 계산 메소드
    public int getDiscountedPrice() {
        double discountRate = 1.0 - (discount / 100.0);
        return (int)(price * discountRate);
    }
}