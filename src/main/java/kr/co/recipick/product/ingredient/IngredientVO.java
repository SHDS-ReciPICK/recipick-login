package kr.co.recipick.product.ingredient;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class IngredientVO {

	// ingredient 테이블의 기본 정보
	private int ing_id; // 식재료 고유 ID
	private String name; // 식재료명
	private int price; // 가격
	private int avg_gram; // 평균 용량(규격)
	private int stock; // 재고수량
	private int discount; // 할인율
	private String code; // 상품 코드
	private String origin; // 원산지
	private String supplier; // 공급업체
	private String keyword; // 검색 키워드
	private String image; // 상품 이미지
	private String detail; // 상세 설명
	private String unit; // 단위(g)
	private String season; // 제철 시기

	// ing_category_group 테이블의 카테고리 정보
	private int group_id; // 카테고리 그룹 ID (PK)
	private String ing_main; // 대분류(신선식품류, 가공식품류 등)
	private String ing_sub; // 중분류(채소•과일•견과류 등)
	private String ing_detail; // 소분류(채소류, 과일류 등)

	// 페이징 처리를 위한 필드
	private int page = 1; // 현재 페이지 번호(기본값 1)
	private int perPage = 12; // 페이지당 표시할 상품 수
	private int startIdx; // 시작 인덱스

	// 시작 인덱스 계산 메서드
	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	// 시작 인덱스 조회 메서드
	public int getStartIdx() {
		return this.startIdx;
	}

	// 검색 조건
	private String searchType; // 검색 유형(name, category 등)
	private String searchWord; // 검색어
	private String viewType;

	// 가격 필터링
	private Integer minPrice; // 원가 기준 최소 가격
	private Integer maxPrice; // 원가 기준 최대 가격
	private Integer minDiscountPrice; // 할인가 기준 최소 가격
	private Integer maxDiscountPrice; // 할인가 기준 최대 가격
	// 정렬 조건
	private String sortType = "newest"; // 정렬 기준(newest:최신순, sales:판매량순)

	// 다중 선택된 카테고리를 위한 필드 추가
	private List<CategoryFilter> selectedCategories;

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class CategoryFilter {
		private String main;
		private String sub;
		private String detail;

		// 각 카테고리 레벨의 유효성을 검사하는 메소드 추가
		public boolean hasValidMain() {
			return main != null && !main.trim().isEmpty();
		}

		public boolean hasValidSub() {
			return sub != null && !sub.trim().isEmpty();
		}

		public boolean hasValidDetail() {
			return detail != null && !detail.trim().isEmpty();
		}
	}

	// getCategoryWhereClause 메소드 개선
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

			sb.append("(");
			if (filter.hasValidMain()) {
				sb.append("c.ing_main = '").append(filter.getMain()).append("'");

				if (filter.hasValidSub()) {
					sb.append(" AND c.ing_sub = '").append(filter.getSub()).append("'");
				}

				if (filter.hasValidDetail()) {
					sb.append(" AND c.ing_detail = '").append(filter.getDetail()).append("'");
				}
			}
			sb.append(")");
		}

		sb.append(")");
		return sb.toString();
	}

	// 상품의 실제 원가를 계산하는 메서드
	public int getActualPrice() {
		// 문자열로 된 unit을 정수로 변환
		int unitValue = Integer.parseInt(unit);

		// avg_gram이 unit보다 크거나 같은 경우
		// 예: avg_gram이 300g이고 unit이 100g인 경우, 3배의 가격
		if (avg_gram >= unitValue) {
			return (avg_gram / unitValue) * price;
		}
		// avg_gram이 unit보다 작은 경우
		// 예: avg_gram이 50g이고 unit이 100g인 경우, unit 기준 가격 적용
		else {
			return price;
		}
	}

	// 할인된 가격을 계산하는 메서드
	public int getDiscountedPrice() {
		// 실제 원가를 구한 후 할인율 적용
		int actualPrice = getActualPrice();
		return actualPrice - (actualPrice * discount / 100);
	}

	// 천단위 구분기호를 포함한 가격 포맷팅
	public String getFormattedPrice() {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(getActualPrice());
	}
	
}