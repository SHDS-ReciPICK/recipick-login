package kr.co.recipick.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	boolean regist(MemberVO vo);
	int emailCheck(String email);
	MemberVO login(MemberVO vo);
	String getNickname(MemberVO vo);
	MemberVO detail(MemberVO vo);
	MemberVO detail_o(MemberVO vo);
	int update(MemberVO vo);
	boolean delete(MemberVO vo);
	boolean adminCheck(MemberVO vo);
	Map<String, Object> list(MemberVO vo);
	//MemberVO detail(MemberVO vo, boolean isUpdate);
	//String des(MemberVO vo);
	MemberVO detail_o(int ohId);
	String getName(MemberVO vo);
	String getPhone(MemberVO vo);
	int deleteOrder(MemberVO vo);
	
	Map<String, Object> getRecipeList(MemberVO vo);
//	List<MemberVO> getRecentRecipes(MemberVO vo);
//	void insertViewHistory(int member_id, int recipe_id);
//	void deleteViewHistory(int member_id);
//	void saveViewHistory(int member_id, int recipe_id);
	Map<String, Object> getNotWrittenReviews(MemberVO vo);
	Map<String, Object> getWrittenReviews(MemberVO vo);
	MemberVO getReview(MemberVO vo);
	int deleteReview(int review_id);

	int writeReview(MemberVO vo);
	Map<String, Object> getLikeRecipes(MemberVO vo);

}
