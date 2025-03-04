package kr.co.recipick.product.recipe;

import java.text.DecimalFormat;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class RecipeVO {

	// 기본 정보
	private int recipe_id;
	private String title;
	private String description;
	private String thema;
	private Integer price;
	private int cooking_time;
	private int serving_count;
	private String main_image;

	// 카테고리 정보
	private String recipe_main;
	private String recipe_sub;
	private String recipe_detail;

	// 가격 산출을 위한 필드들
	private int original_price; // 전체 재료의 원가 합계
	private int discount_price; // 전체 재료의 할인가 합계
	private double avg_discount_rate; // 할인 페이지 용

	// 검색 조건들
	private String searchType;
	private String searchWord;
	private String viewType;

	// 필터 바
	private Integer minPrice;
	private Integer maxPrice;

	private List<Integer> ratings; // 선택된 평점 필터 목록 추가

	// 정렬 조건
	private String sortType = "popular"; // 기본값은 좋아요 순 (popular, newest, rating, review)
	private int likes_count; // 좋아요 수
	private double avg_rating; // 이 레시피의 평균 평점
	private int review_count; // 리뷰 수
	private int totalSales; // 누적 판매수량

	// 페이징 정보
	private int page = 1;
	private int perPage = 12;

	// 다중 선택된 카테고리를 위한 필드
	private List<CategoryFilter> selectedCategories;

	// 할인율 계산 메소드
	public double getDiscountRate() {
		if (original_price == 0)
			return 0;
		return ((original_price - discount_price) / (double) original_price) * 100;
	}

	// 가격 포맷팅 메소드 수정
	public String getFormattedPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		// 할인가가 있을 경우 할인가를, 없을 경우 원가를 반환
		return df.format(discount_price > 0 ? discount_price : original_price);
	}

	// 할인율 표시 메서드 - DB에서 계산된 평균 할인율 기반
	public String getFormattedDiscountRate() {
		return String.format("%d%%", avg_discount_rate);
	}

	// 평점 포맷팅 메서드 추가
	public String getFormattedRating() {
		return String.format("%.1f", avg_rating); // 소수점 첫째자리까지 표시
	}

	// 가격 포맷팅을 위한 메서드 추가
	public String getFormattedDiscountPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(discount_price);
	}

	public String getFormattedOriginalPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(original_price);
	}

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class CategoryFilter {
		private String main;
		private String sub;
		private String detail;
	}

	// 카테고리 필터 조건을 SQL WHERE 절에 적용하기 위한 메소드
	public String getCategoryWhereClause() {
		if (selectedCategories == null || selectedCategories.isEmpty()) {
			return "";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(" AND (");

		for (int i = 0; i < selectedCategories.size(); i++) {
			CategoryFilter filter = selectedCategories.get(i);
			if (i > 0) {
				sb.append(" OR ");
			}
			// 모든 레벨의 카테고리를 AND 조건으로 연결
			sb.append("(recipe_main = '").append(filter.getMain()).append("'");

			if (filter.getSub() != null && !filter.getSub().isEmpty()) {
				sb.append(" AND recipe_sub = '").append(filter.getSub()).append("'");

				if (filter.getDetail() != null && !filter.getDetail().isEmpty()) {
					sb.append(" AND recipe_detail = '").append(filter.getDetail()).append("'");
				}
			}
			sb.append(")");
		}

		sb.append(")");
		return sb.toString();
	}

	public int getStartIdx() {
		return (page - 1) * perPage;
	}

	private int member_id;
	private String email;
	private String nickname;
	private String pwd;
	private String gender;
	private String name;
	private String birth;
	private String phone;
	private String address;
	private String admin;

}