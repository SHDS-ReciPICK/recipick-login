package kr.co.recipick.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.recipick.product.recipe.RecipeVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public boolean regist(MemberVO vo) {

		return mapper.regist(vo) == 0 ? false : true;
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

	@Override
	public boolean adminCheck(MemberVO vo) {
		return mapper.adminCheck(vo) == 1 ? true : false;
	}

	@Override
	public String getNickname(MemberVO vo) {
		return mapper.getNickname(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}

	@Override
	public boolean delete(MemberVO vo) {
		return mapper.delete(vo) == 0 ? false : true;
	}

	@Override
	public int update(MemberVO vo) {
		return mapper.update(vo);
	}

	@Override
	public Map<String, Object> list(MemberVO param) {
		int count = mapper.count(param); // 총개수
		// 총페이지수
		int totalPage = count / 10;
		if (count % 10 > 0)
			totalPage++;
		List<MemberVO> list = mapper.list(param); // 목록

		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("list", list);

		// 하단에 페이징처리
		int endPage = (int) (Math.ceil(param.getPage() / 10.0) * 10);
		int startPage = endPage - 9;
		if (endPage > totalPage)
			endPage = totalPage;
		boolean isPrev = startPage > 1;
		boolean isNext = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}

	@Override
	public MemberVO detail(MemberVO vo) {
		return mapper.detail(vo);
	}

	@Override
	public MemberVO detail_o(int ohId) {

		return mapper.detail_o(ohId);
	}

	@Override
	public String getName(MemberVO vo) {
		return mapper.getName(vo);
	}

	@Override
	public String getPhone(MemberVO vo) {
		return mapper.getPhone(vo);
	}

	@Override
	public int deleteOrder(MemberVO vo) {
		return mapper.deleteOrder(vo);
	}

	@Override
	public int deleteReview(int review_id) {
		return mapper.deleteReview(review_id);
	}

	@Override
	public Map<String, Object> getNotWrittenReviews(MemberVO param) {
		int count = mapper.countNotWrittenReviews(param); // 총개수
		int totalPage = count / 10;
		if (count % 10 > 0)
			totalPage++;
		List<MemberVO> list = mapper.getNotWrittenReviews(param);

		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("list", list);
		// 하단에 페이징처리
		int endPage = (int) (Math.ceil(param.getPage() / 10.0) * 10);
		int startPage = endPage - 9;
		if (endPage > totalPage)
			endPage = totalPage;
		boolean isPrev = startPage > 1;
		boolean isNext = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}

	@Override
	public Map<String, Object> getWrittenReviews(MemberVO param) {
		int count = mapper.countWrittenReviews(param); // 총개수
		int totalPage = count / 10;
		if (count % 10 > 0)
			totalPage++;
		List<MemberVO> list = mapper.getWrittenReviews(param);

		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		map.put("list", list);
		// 하단에 페이징처리
		int endPage = (int) (Math.ceil(param.getPage() / 10.0) * 10);
		int startPage = endPage - 9;
		if (endPage > totalPage)
			endPage = totalPage;
		boolean isPrev = startPage > 1;
		boolean isNext = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;

	}

	@Override
	public MemberVO getReview(MemberVO vo) {
		return mapper.getReview(vo);
	}

	@Override
	public int writeReview(MemberVO vo) {
		return mapper.writeReview(vo);
	}

	@Override
	public MemberVO detail_o(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getRecipeList(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public Map<String, Object> getLikeRecipes(MemberVO vo) {
		Map<String, Object> result = new HashMap<>();
		
		List<MemberVO> recipes;	
		
		int totalCount = mapper.countLikeRecipes(vo);
		recipes = mapper.getLikeRecipes(vo);
		int totalPages = (int) Math.ceil((double) totalCount / vo.getPerPageL());
		result.put("totalPages", totalPages);
		result.put("totalCount", totalCount);
		
		// 각 레시피의 가격 계산
		
		result.put("recipes", recipes);

		return result;
	}

}
