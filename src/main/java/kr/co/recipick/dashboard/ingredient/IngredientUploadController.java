package kr.co.recipick.dashboard.ingredient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dashboard")
public class IngredientUploadController {
    @Autowired
    private IngredientUploadMapper ingredientMapper;
    
    @Autowired
    private IngredientUploadService ingredientService;

    @PostMapping("/ingredient")
    public ResponseEntity<String> insertIngredient(@RequestBody IngredientUploadVO ingredientVO) { 
        try {
            ingredientMapper.insertIngredient(ingredientVO);
            ingredientMapper.insertIngredientCategoryGroup(ingredientVO);
            return ResponseEntity.ok("식재료가 성공적으로 저장되었습니다."); 
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("식재료 저장에 실패했습니다: " + e.getMessage()); 
        }
    }
    
    @PostMapping("/updateStock")
    public ResponseEntity<String> updateStock(@RequestBody IngredientUploadVO ingredientVO) {
        try {
            ingredientService.updateStock(ingredientVO);
            return ResponseEntity.ok("재고가 성공적으로 업데이트되었습니다.");
        } catch (IllegalArgumentException e) {  // 잘못된 요청 데이터
            return ResponseEntity.badRequest().body("잘못된 요청 데이터: " + e.getMessage());
        } catch (DataAccessException e) {  // 데이터베이스 오류
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("재고 업데이트에 실패했습니다: " + e.getMessage());
        } catch (Exception e) {  // 기타 예외
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("재고 업데이트에 실패했습니다: " + e.getMessage());
        }
    }
}