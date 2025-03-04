package kr.co.recipick.dashboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.recipick.dashboard.ingredient.IngredientUploadService;
import kr.co.recipick.dashboard.ingredient.IngredientUploadVO;
import kr.co.recipick.dashboard.recipe.RecipeUploadService;
import kr.co.recipick.dashboard.recipe.RecipeUploadVO;

@Controller
public class DashboardController {
   
	@Autowired
    private IngredientUploadService ingredientService;
	
    @Autowired
    private RecipeUploadService recipeService;
	
    @GetMapping("/dashboard-home")
    public String DashboardHome() {  
        return "dashboard/dashboard-home"; // dashboard-home.jsp로 이동
    }
    @GetMapping("/dashboard-ingredient")
    public String DashboardIngredient() {  
        return "dashboard/dashboard-ingredient"; // dashboard-ingredient.jsp로 이동
    }
    
    @GetMapping("/dashboard-recipe")
    public String DashboardRecipe(Model model) {  

        List<RecipeUploadVO> recipes = recipeService.getAllIngredients();
        model.addAttribute("recipes", recipes);

        return "dashboard/dashboard-recipe";// dashboard-recipe.jsp로 이동
    }
    
    @GetMapping("/dashboard-delete")
    public String dashboardDelete(Model model, 
                                @RequestParam(value = "search", required = false) String search,
                                @RequestParam(value = "page", defaultValue = "1") int page) { // 페이지 번호는 1부터 시작

      int pageSize = 5; // 페이지당 레시피 수
      int offset = (page - 1) * pageSize; // 시작 레코드 인덱스 계산

      List<RecipeUploadVO> recipes;
      int totalCount; // 전체 레시피 수

      if (search != null && !search.isEmpty()) {
        recipes = recipeService.searchRecipesByTitle(search, offset, pageSize); // 검색어가 있으면 제목으로 검색
        totalCount = recipeService.getSearchTotalCount(search); // 검색 결과의 전체 레시피 수
      } else {
        recipes = recipeService.getAllRecipes(offset, pageSize); // 검색어가 없으면 모든 레시피 가져오기
        totalCount = recipeService.getTotalCount(); // 전체 레시피 수
      }

      int totalPages = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수 계산

      model.addAttribute("recipes", recipes);
      model.addAttribute("currentPage", page);
      model.addAttribute("totalPages", totalPages);

      return "dashboard/dashboard-delete";
    }
    
    @DeleteMapping("/deleteRecipe")
    public ResponseEntity<Void> deleteRecipe(@RequestParam("recipe_id") int recipeId) { 
        try {
            recipeService.deleteRecipeById(recipeId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    
    @GetMapping("/dashboard-inventory")
    public String DashboardInventory(Model model,
        @RequestParam(value = "search", required = false) String search,
        @RequestParam(value = "page", defaultValue = "1") int page) { // 페이지 번호는 1부터 시작

		int pageSize = 5; // 페이지당 레시피 수
		int offset = (page - 1) * pageSize; // 시작 레코드 인덱스 계산
		
		List<IngredientUploadVO> ingredients;
		int totalCount; // 전체 레시피 수
		
		if (search != null && !search.isEmpty()) {
		ingredients = ingredientService.searchIngredientsByTitle(search, offset, pageSize); // 검색어가 있으면 제목으로 검색
		totalCount = ingredientService.getSearchTotalCount(search); // 검색 결과의 전체 레시피 수
		} else {
		ingredients = ingredientService.getAllIngredients(offset, pageSize); // 검색어가 없으면 모든 레시피 가져오기
		totalCount = ingredientService.getTotalCount(); // 전체 레시피 수
		}
		
		int totalPages = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수 계산
		
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		        return "dashboard/dashboard-inventory";
		    }
}
