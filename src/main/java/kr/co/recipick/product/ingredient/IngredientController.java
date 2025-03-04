package kr.co.recipick.product.ingredient;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.recipick.product.ingredient.IngredientVO.CategoryFilter;
import lombok.AllArgsConstructor;
import lombok.Data;

@Controller
@RequestMapping("/ingredient")
public class IngredientController {

   @Autowired
   private IngredientService ingredientService;

   // 공통 상수 정의
   private static final int DEFAULT_PAGE_SIZE = 12;
   private static final String DEFAULT_SORT = "newest";
   private static final String DEFAULT_SEARCH_TYPE = "all";
   private static final String VIEW_TEMPLATE = "product/ingredient/shop-grid-ing";

   // 카테고리별 조회 
   @GetMapping("/products/category")
   public String getIngredientsByCategory(
           @RequestParam(required = false) String main,
           @RequestParam(required = false) String sub,
           @RequestParam(required = false) String detail,
           @RequestParam(required = false) List<String> selectedCategories,
           @RequestParam(required = false) Integer minPrice,
           @RequestParam(required = false) Integer maxPrice, 
           @RequestParam(defaultValue = "1") int page,
           @RequestParam(required = false, defaultValue = DEFAULT_SORT) String sortType,
           HttpServletRequest request,
           Model model) {

       CategoryRequest categoryRequest = new CategoryRequest(main, sub, detail, selectedCategories);
       FilterRequest filterRequest = new FilterRequest(minPrice, maxPrice, sortType);
       
       IngredientVO vo = createIngredientVO(categoryRequest, filterRequest, page);
       addRequestAttributes(request, model, filterRequest); 
       
       return getIngredientList(vo, model);
   }

   // 검색
   @GetMapping("/products/search") 
   public String searchIngredients(
           @RequestParam String keyword,
           @RequestParam(defaultValue = DEFAULT_SEARCH_TYPE) String searchType,
           @RequestParam(defaultValue = "1") int page,
           @RequestParam(required = false) String sortType,
           @RequestParam(required = false) Integer minPrice,
           @RequestParam(required = false) Integer maxPrice,
           @RequestParam(required = false) List<String> selectedCategories,
           HttpServletRequest request,
           Model model) {

       SearchRequest searchRequest = new SearchRequest(keyword, searchType);
       FilterRequest filterRequest = new FilterRequest(minPrice, maxPrice, sortType);
       
       IngredientVO vo = createSearchVO(searchRequest, filterRequest, page);
       addRequestAttributes(request, model, filterRequest);
       
       return getIngredientList(vo, model);
   }

   // 제철 상품
   @GetMapping("/products/seasonly")
   public String getSeasonlyIngredients(
           @RequestParam(defaultValue = "1") int page,
           Model model) {
       IngredientVO vo = createSeasonalVO(page);
       return getIngredientList(vo, model);
   }

   // 베스트 상품 
   @GetMapping("/products/best")
   public String getBestIngredients(Model model) {
       IngredientVO vo = createBestVO();
       return getIngredientList(vo, model);
   }

   // 할인 상품
   @GetMapping("/products/discount") 
   public String getDiscountIngredients(
           @RequestParam(defaultValue = "1") int page,
           Model model) {
       IngredientVO vo = createDiscountVO(page);
       return getIngredientList(vo, model);
   }

   // VO 생성 메서드들
   private IngredientVO createIngredientVO(
           CategoryRequest categoryRequest,
           FilterRequest filterRequest,
           int page) {
       
       IngredientVO vo = new IngredientVO();
       vo.setViewType("category");
       vo.setPage(page);
       vo.setPerPage(DEFAULT_PAGE_SIZE);

       // 카테고리 정보 설정
       if (categoryRequest != null) {
           vo.setIng_main(categoryRequest.getMain());
           vo.setIng_sub(categoryRequest.getSub());
           vo.setIng_detail(categoryRequest.getDetail());

           if (categoryRequest.getSelectedCategories() != null && !categoryRequest.getSelectedCategories().isEmpty()) {
               vo.setSelectedCategories(parseCategoryFilters(categoryRequest.getSelectedCategories()));
           }
       }

       // 필터 정보 설정
       if (filterRequest != null) {
           applyPriceFilter(vo, filterRequest); 
           vo.setSortType(filterRequest.getSortType());
       }

       return vo;
   }

   private IngredientVO createSearchVO(
           SearchRequest searchRequest,
           FilterRequest filterRequest,
           int page) {
       
       IngredientVO vo = new IngredientVO();
       vo.setViewType("search");
       vo.setPage(page);
       vo.setPerPage(DEFAULT_PAGE_SIZE);

       // 검색 정보 설정
       if (searchRequest != null) {
           vo.setSearchWord(searchRequest.getKeyword());
           vo.setSearchType(searchRequest.getSearchType());
       }

       // 필터 정보 설정  
       if (filterRequest != null) {
           applyPriceFilter(vo, filterRequest);
           vo.setSortType(filterRequest.getSortType());
       }

       return vo;
   }

   private IngredientVO createSeasonalVO(int page) {
       IngredientVO vo = new IngredientVO();
       vo.setViewType("seasonly");
       vo.setPage(page);
       vo.setPerPage(DEFAULT_PAGE_SIZE);
       vo.setSeason(getCurrentSeason());
       return vo;
   }

   private IngredientVO createBestVO() {
       IngredientVO vo = new IngredientVO();
       vo.setViewType("best");
       return vo;
   }

   private IngredientVO createDiscountVO(int page) {
       IngredientVO vo = new IngredientVO();
       vo.setViewType("discount");
       vo.setPage(page);
       vo.setPerPage(DEFAULT_PAGE_SIZE);
       return vo;
   }

   // 유틸리티 메서드들 
   private void applyPriceFilter(IngredientVO vo, FilterRequest filterRequest) {
       if (filterRequest.getMinPrice() != null && filterRequest.getMaxPrice() != null 
           && filterRequest.getMinPrice() > filterRequest.getMaxPrice()) {
           // 최소가격이 최대가격보다 큰 경우 교환
           int temp = filterRequest.getMinPrice();
           filterRequest.setMinPrice(filterRequest.getMaxPrice());
           filterRequest.setMaxPrice(temp);
       }
       
       vo.setMinPrice(filterRequest.getMinPrice());
       vo.setMaxPrice(filterRequest.getMaxPrice());
   }

   private void addRequestAttributes(HttpServletRequest request, Model model, FilterRequest filterRequest) {
       // 쿼리스트링 처리
       String queryString = request.getQueryString();
       if (queryString != null) {
           model.addAttribute("currentQueryString", 
               queryString.replaceAll("&?page=[^&]*", ""));
       }

       // 필터 상태 저장
       model.addAttribute("currentSort", filterRequest.getSortType());
       model.addAttribute("currentMinPrice", filterRequest.getMinPrice());
       model.addAttribute("currentMaxPrice", filterRequest.getMaxPrice());
   }

   private List<CategoryFilter> parseCategoryFilters(List<String> categories) {
       return categories.stream()
           .map(category -> {
               String[] parts = category.split(",");
               if (parts.length >= 3) {
                   return new CategoryFilter(
                       parts[0].trim(),
                       parts[1].trim(), 
                       parts[2].trim()
                   );
               }
               return null;
           })
           .filter(Objects::nonNull)
           .collect(Collectors.toList());
   }

   private String getCurrentSeason() {
       Calendar cal = Calendar.getInstance();
       int month = cal.get(Calendar.MONTH) + 1;
       
       if (month >= 3 && month <= 5) return "봄";
       if (month >= 6 && month <= 8) return "여름"; 
       if (month >= 9 && month <= 11) return "가을";
       return "겨울";
   }

   // 공통 처리 메서드
   private String getIngredientList(IngredientVO vo, Model model) {
       Map<String, Object> result = ingredientService.getIngredientList(vo);

       model.addAttribute("ingredients", result.get("ingredients"));
       model.addAttribute("totalCount", result.get("totalCount"));
       model.addAttribute("currentPage", vo.getPage());
       model.addAttribute("totalPages", result.get("totalPages"));
       model.addAttribute("viewType", vo.getViewType());
       model.addAttribute("currentMain", vo.getIng_main());
       model.addAttribute("currentSub", vo.getIng_sub());
       model.addAttribute("currentDetail", vo.getIng_detail());
       model.addAttribute("isIngredientPage", true);

       return VIEW_TEMPLATE;
   }

   // 데이터 클래스들
   @Data
   @AllArgsConstructor
   public static class CategoryRequest {
       private String main;
       private String sub;
       private String detail;
       private List<String> selectedCategories;
   }

   @Data
   @AllArgsConstructor 
   public static class FilterRequest {
       private Integer minPrice;
       private Integer maxPrice;
       private String sortType = DEFAULT_SORT;
   }

   @Data
   @AllArgsConstructor
   public static class SearchRequest {
       private String keyword;
       private String searchType = DEFAULT_SEARCH_TYPE;
   }
}