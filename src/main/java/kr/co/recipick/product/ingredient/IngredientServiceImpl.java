package kr.co.recipick.product.ingredient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IngredientServiceImpl implements IngredientService {

	@Autowired
	private IngredientMapper mapper;

	@Override
	public Map<String, Object> getIngredientList(IngredientVO vo) {
		// 결과를 담을 Map 객체 생성
		Map<String, Object> result = new HashMap<>();

		// 페이지 설정 검증 및 초기화
		validateAndInitializePaging(vo);

		// 뷰 타입에 따른 상품 목록 조회
		switch (vo.getViewType()) {
		case "best":
			handleBestProducts(result);
			break;
		case "discount":
			handleDiscountProducts(vo, result);
			break;
		case "seasonly":
			handleSeasonlyProducts(vo, result);
			break;
		default:
			handleDefaultProducts(vo, result);
		}

		return result;
	}

	// 제철 상품 처리 메서드 추가
	private void handleSeasonlyProducts(IngredientVO vo, Map<String, Object> result) {
	    // 페이징 처리를 위한 시작 인덱스 계산
	    int startIdx = (vo.getPage() - 1) * vo.getPerPage();
	    vo.setStartIdx(startIdx);
	    
	    // 현재 계절에 해당하는 총 상품 수 조회
	    int totalCount = mapper.countSeasonlyIngredients(vo.getSeason());
	    
	    // 페이징된 상품 목록 조회
	    List<IngredientVO> ingredients = mapper.getSeasonlyIngredients(vo);
	    
	    // 총 페이지 수 계산
	    int totalPages = calculateTotalPages(totalCount, vo.getPerPage());
	    
	    // 결과 맵에 데이터 저장
	    result.put("ingredients", ingredients);
	    result.put("totalCount", totalCount);
	    result.put("totalPages", totalPages);
	    result.put("currentPage", vo.getPage());
	}

	// 페이징 설정 검증 및 초기화
	private void validateAndInitializePaging(IngredientVO vo) {
		if (vo.getPerPage() <= 0) {
			vo.setPerPage(12); // 기본 페이지 크기 설정
		}

		// 시작 인덱스 계산
		int startIdx = (vo.getPage() - 1) * vo.getPerPage();
		vo.setStartIdx(startIdx);
	}

	// 베스트 상품 처리
	private void handleBestProducts(Map<String, Object> result) {
		List<IngredientVO> ingredients = mapper.getBestIngredients();
		result.put("ingredients", ingredients);
		result.put("totalPages", 1); // 베스트 상품은 항상 1페이지
	}

	// 할인 상품 처리
	private void handleDiscountProducts(IngredientVO vo, Map<String, Object> result) {
		int totalCount = mapper.countDiscountIngredients();
		List<IngredientVO> ingredients = mapper.getIngredientList(vo);
		int totalPages = calculateTotalPages(totalCount, vo.getPerPage());

		result.put("ingredients", ingredients);
		result.put("totalCount", totalCount);
		result.put("totalPages", totalPages);
	}

	// 일반 상품 처리
	private void handleDefaultProducts(IngredientVO vo, Map<String, Object> result) {
		int totalCount = mapper.countIngredients(vo);
		List<IngredientVO> ingredients = mapper.getIngredientList(vo);
		int totalPages = calculateTotalPages(totalCount, vo.getPerPage());

		result.put("ingredients", ingredients);
		result.put("totalCount", totalCount);
		result.put("totalPages", totalPages);
	}

	// 총 페이지 수 계산
	private int calculateTotalPages(int totalCount, int perPage) {
		return (int) Math.ceil((double) totalCount / perPage);
	}
}