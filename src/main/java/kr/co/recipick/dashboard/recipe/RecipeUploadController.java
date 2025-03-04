package kr.co.recipick.dashboard.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import kr.co.recipick.dashboard.ingredient.IngredientUploadService;

@Controller
@RequestMapping("/dashboard")
public class RecipeUploadController {
    @Autowired
    private RecipeUploadService service;
    
    @PostMapping("/recipe")
    public ResponseEntity<String> Recipe(@RequestBody RecipeUploadVO RecipeVO) { 
        try {
        	service.recipe(RecipeVO);
            return ResponseEntity.ok("레시피가 성공적으로 저장되었습니다."); 
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("레시피 저장에 실패했습니다: " + e.getMessage()); 
        }
    }
}