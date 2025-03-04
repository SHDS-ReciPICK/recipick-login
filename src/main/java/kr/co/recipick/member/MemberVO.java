package kr.co.recipick.member;

import java.sql.Date;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;

import kr.co.recipick.product.recipe.RecipeIngredientVO;
import kr.co.recipick.product.recipe.RecipeVO;
import kr.co.recipick.product.recipe.RecipeVO.CategoryFilter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class MemberVO {
	

	
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
	private int oh_id;
	private String payment_method;
	private int discount; 
	private String title;
	private int price;
	private String order_state;
	private String delivery_status;
	private String category;
	private int qty;
	private Date order_date;
	private String image;
	private int recipe_id;
	private int ing_id;
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	private String year;
	public MemberVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
	
	private String description;
	private String detail;
	
	//RecipeVO
    private String thema;
     
    private int cooking_time;
    private int serving_count;
    private String main_image;
    
    // 카테고리 정보
    private String recipe_main;    
    private String recipe_sub;     
    private String recipe_detail;   
    
    // 가격 산출을 위한 필드들
    private int original_price;  // 원가 (재료들의 정가 합계)
    private int discount_price; // 항인 후 가격 (재료들의 할인 후 가격 한계)
    private List<RecipeIngredientVO> ingredients; // 레시피 재료 목록
    
 	// 검색/필터링 조건
    
    private String viewType;       
    private Integer minPrice;    
    private Integer maxPrice;    
    private List<Integer> tagIds;  
    private List<Integer> ratings; // 선택된 평점 필터 목록 추가 (예: [4, 5]는 4점 이상 리뷰만 표시)
    
    

    private int likes_count;    // 좋아요 수
    private double avg_rating;  // 이 레시피의 평균 평점
    private int review_count;   // 리뷰 수

    private int perPage = 12;
    
    //view_history
	private int vh_id;
	private LocalDateTime viewed_time;
	
	
	//recipe_review
	private String content;
	private LocalDateTime review_dt;
	private int star_rating;	
	private int review_id;
	

		private double avg_discount_rate; // 할인 페이지 용
				// 정렬 조건
		private String sortType = "popular"; // 기본값은 좋아요 순 (popular, newest, rating, review)		
		private int totalSales; // 누적 판매수량

		// 다중 선택된 카테고리를 위한 필드 추가
		private List<CategoryFilter> selectedCategories;

		// 할인율 계산 메서드
		public double getDiscountRate() {
			if (original_price == 0)
				return 0;
			return (int) ((original_price - discount_price) / (double) original_price * 100);
		}

		// 할인율 표시 메서드 - DB에서 계산된 평균 할인율 기반
		public String getFormattedDiscountRate() {
			return String.format("%d%%", avg_discount_rate);
		}

		// 원화 포맷팅 메서드
		public String getFormattedPrice() {
			DecimalFormat df = new DecimalFormat("#,###");
			return df.format(discount_price > 0 ? discount_price : original_price);
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
				sb.append("(c.recipe_main = '").append(filter.getMain()).append("'");
				if (filter.getSub() != null) {
					sb.append(" AND c.recipe_sub = '").append(filter.getSub()).append("'");
				}
				if (filter.getDetail() != null) {
					sb.append(" AND c.recipe_detail = '").append(filter.getDetail()).append("'");
				}
				sb.append(")");
			}

			sb.append(")");
			return sb.toString();
		}

		private int pageL = 1;
		private int perPageL = 12;

	
	

}
