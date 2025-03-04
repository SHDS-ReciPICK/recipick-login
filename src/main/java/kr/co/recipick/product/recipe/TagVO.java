package kr.co.recipick.product.recipe;

import lombok.Data;

@Data
public class TagVO {
	private int tag_id; // 태그 고유 식별자
	private int recipe_id; // 연결된 레시피 ID
	private String tag_name; // 태그 이름
}