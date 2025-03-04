package kr.co.recipick.product.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/tags")
public class TagController {

	@Autowired
	private RecipeService productService;

	@GetMapping("/search")
	public ResponseEntity<List<String>> searchTags(
			@RequestParam String keyword,
			@RequestParam(defaultValue = "10") int limit) {
		
		List<String> tags = productService.searchTagNames(keyword);
		return ResponseEntity.ok(tags);
	}

}