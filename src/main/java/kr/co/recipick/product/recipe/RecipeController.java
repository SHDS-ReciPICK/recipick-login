package kr.co.recipick.product.recipe;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.recipick.member.MemberVO;
import kr.co.recipick.product.recipe.RecipeVO.CategoryFilter;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;

	// 카테고리별 레시피 조회
	@GetMapping("/products/category")
	public String getRecipesByCategory(
			@RequestParam(required = false) Integer minPrice,
			@RequestParam(required = false) Integer maxPrice, 
			@RequestParam(required = false) String main,
			@RequestParam(required = false) String sub, 
			@RequestParam(required = false) String detail,
			@RequestParam(required = false) List<String> selectedCategories, // 다중 선택을 위한 새로운 매개변수
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "popular") String sortType,
			@RequestParam(required = false) List<Integer> ratings, 
			@RequestParam(required = false) String tags,
			HttpServletRequest request, 
			Model model) {

		RecipeVO vo = new RecipeVO();

		// 가격 범위 유효성 검사 추가
		if (minPrice != null && maxPrice != null && minPrice > maxPrice) {
			int temp = minPrice;
			minPrice = maxPrice;
			maxPrice = temp;
		}
		// 가격 필터 설정
		vo.setMinPrice(minPrice);
		vo.setMaxPrice(maxPrice);

		// 선택된 카테고리 처리
		if (selectedCategories != null && !selectedCategories.isEmpty()) {
			List<CategoryFilter> filters = parseCategoryFilters(selectedCategories);
			vo.setSelectedCategories(filters);
		}
		vo.setRecipe_main(main);
		vo.setRecipe_sub(sub);
		vo.setRecipe_detail(detail);

		// 페이징 정보 설정
		vo.setViewType("category");
		vo.setPage(page);
		vo.setPerPage(12); // 페이지당 표시할 항목 수
		vo.setSortType(sortType);

		// 현재 요청의 쿼리스트링을 모델에 추가
		String queryString = request.getQueryString();
		if (queryString != null) {
			model.addAttribute("currentQueryString", queryString.replaceAll("&?page=[^&]*", ""));
		}
		model.addAttribute("currentSort", sortType);

		// 평점 필터 설정
		if (ratings != null && !ratings.isEmpty()) {
			vo.setRatings(ratings);
		}

		// 현재 필터 상태를 모델에 추가
		model.addAttribute("currentMinPrice", minPrice);
		model.addAttribute("currentMaxPrice", maxPrice);

		return getRecipeList(vo, model);
	}

	private List<RecipeVO.CategoryFilter> parseCategoryFilters(List<String> categories) {
		return categories.stream().map(category -> {
			String[] parts = category.split(",");
			String main = parts.length > 0 ? parts[0].trim() : null;
			String sub = parts.length > 1 ? parts[1].trim() : null;
			String detail = parts.length > 2 ? parts[2].trim() : null;

			return new RecipeVO.CategoryFilter(main, sub, detail);
		}).filter(filter -> filter.getMain() != null && !filter.getMain().isEmpty()).collect(Collectors.toList());
	}

	@GetMapping("/products/monthly")
	public String getMonthlyRecipes(Model model) {
		// 이달의 레시피 데이터 조회
		Map<String, Object> result = recipeService.getMonthlyRecipes();

		// LocalDate를 원하는 형식의 문자열로 변환
		String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		model.addAttribute("recipes", result.get("recipes"));
		model.addAttribute("viewType", "monthly");
		model.addAttribute("currentDate", currentDate);
		model.addAttribute("isRecipePage", true);

		return "product/recipe/recipe-of-this-month";
	}

	// 베스트 레시피
	@GetMapping("/products/best")
	public String getBestRecipes(Model model) {
		RecipeVO vo = new RecipeVO();
		vo.setViewType("best");

		Map<String, Object> result = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", result.get("recipes"));
		model.addAttribute("viewType", "best");
		model.addAttribute("isRecipePage", true);

		return "product/recipe/shop-grid";
	}

	@GetMapping("/products/discount")
	public String getDiscountRecipes(
			@RequestParam(defaultValue = "1") int page, 
			Model model) {
		
		RecipeVO vo = new RecipeVO();
		vo.setViewType("discount");
		vo.setPage(page);
		vo.setPerPage(12);

		Map<String, Object> result = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", result.get("recipes"));
		model.addAttribute("totalCount", result.get("totalCount"));
		model.addAttribute("currentPage", vo.getPage());
		model.addAttribute("totalPages", result.get("totalPages"));
		model.addAttribute("viewType", "discount");
		model.addAttribute("isRecipePage", true);

		return "product/recipe/shop-grid";
	}

	// 검색 결과
	@GetMapping("/products/search")
	public String searchRecipes(
			@RequestParam String keyword, 
			@RequestParam(defaultValue = "all") String searchType,
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(required = false) String sortType,
			@RequestParam(required = false) Integer minPrice, 
			@RequestParam(required = false) Integer maxPrice,
			@RequestParam(required = false) List<String> selectedCategories,
			@RequestParam(required = false) List<Integer> ratings, 
			HttpServletRequest request, 
			Model model) {

		RecipeVO vo = new RecipeVO();

		// 검색 기본 정보 설정
		vo.setViewType("search");
		vo.setSearchWord(keyword);
		vo.setSearchType(searchType);
		vo.setPage(page);

		// 정렬 설정
		vo.setSortType(sortType != null ? sortType : "popular");

		// 가격 필터 설정
		vo.setMinPrice(minPrice);
		vo.setMaxPrice(maxPrice);

		// 카테고리 필터 설정
		if (selectedCategories != null && !selectedCategories.isEmpty()) {
			List<CategoryFilter> filters = parseCategoryFilters(selectedCategories);
			vo.setSelectedCategories(filters);
		}

		// 평점 필터 설정
		if (ratings != null && !ratings.isEmpty()) {
			vo.setRatings(ratings);
		}

		// 현재 URL 쿼리스트링 저장
		String queryString = request.getQueryString();
		if (queryString != null) {
			model.addAttribute("currentQueryString", queryString.replaceAll("&?page=[^&]*", ""));
		}

		return getRecipeList(vo, model);
	}

	@GetMapping("/mypage-recent")
	public String mypageRecent(RecipeVO vo, Model model, HttpSession sess) {
		MemberVO uv = (MemberVO)sess.getAttribute("login");
		if (uv != null) vo.setMember_id(uv.getMember_id());
		 Map<String, Object> result = recipeService.getRecentRecipe(uv);
	     model.addAttribute("recipes",result.get("recipes"));
	     
	     return "mypage/mypage-recent";
	}

	// 공통 처리 메서드
	private String getRecipeList(RecipeVO vo, Model model) {
		Map<String, Object> result = recipeService.getRecipeList(vo);

		model.addAttribute("recipes", result.get("recipes"));
		model.addAttribute("totalCount", result.get("totalCount"));
		model.addAttribute("currentPage", vo.getPage());
		model.addAttribute("totalPages", result.get("totalPages"));
		model.addAttribute("viewType", vo.getViewType());
		model.addAttribute("isRecipePage", true);
		model.addAttribute("currentMain", vo.getRecipe_main());
		model.addAttribute("currentSub", vo.getRecipe_sub());
		model.addAttribute("currentDetail", vo.getRecipe_detail());

		return "product/recipe/shop-grid";
	}

}