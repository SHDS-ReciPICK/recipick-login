package kr.co.recipick.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private HomeService homeService; // HomeService 의존성 주입
    
    @Autowired
    private HomeIngredientService homeIngredientService;

//    @GetMapping("/") // 메인 페이지 요청 처리 (기존 코드와 통합)
//    public String home(Model model) {
//        List<HomeVO> recipes = homeService.getRecipesWithLikeCount(); // 레시피 목록 가져오기
//        model.addAttribute("recipes", recipes); // 모델에 레시피 목록 추가
//        return "home/index"; // 메인 페이지 뷰 이름 반환
//    }
//    
//    @GetMapping("/")
//    public String home(Model model) {
//    	List<HomeIngredientVO> ingredients = homeIngredientService.getPopularIngredients();
//    	model.addAttribute("ingredients", ingredients);
//    	return "home/index";
//    }

    @GetMapping("/recipe")
    public String recipeRegist(Model model) {
    	List<HomeVO> recipes = homeService.getRecipesWithLikeCount();
    	model.addAttribute("recipes", recipes);
        model.addAttribute("isRecipePage", true);
        return "home/index-recipe";
    }

    @GetMapping("/ingredient")
    public String ingredientRegist(Model model) {
    	List<HomeIngredientVO> ingredients = homeIngredientService.getPopularIngredients();
    	model.addAttribute("ingredients", ingredients);
        model.addAttribute("isIngredientPage", true);
        return "home/index-ingredient";
    }
}
