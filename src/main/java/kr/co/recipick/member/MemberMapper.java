package kr.co.recipick.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	// 가입
	int regist(MemberVO vo);
	// 이메일 중복체크
	int emailCheck(String email);
	// 로그인
	int adminCheck(MemberVO vo);
	MemberVO login(MemberVO vo);
	// 회원정보 조회
	MemberVO detail(MemberVO vo);
	MemberVO detail_o(MemberVO vo);
	// 회원정보 수정
	int update(MemberVO vo);
	int delete(MemberVO vo);
	String getNickname(MemberVO vo);
	int getMemberid(MemberVO vo);
	String getName(MemberVO vo);
	String getPhone(MemberVO vo);
	List<MemberVO> list(MemberVO vo);
	List<MemberVO> getNotWrittenReviews(MemberVO vo);
	List<MemberVO> getWrittenReviews(MemberVO vo);
	int count(MemberVO vo);
	int countNotWrittenReviews(MemberVO vo);
	int countWrittenReviews(MemberVO vo);
	MemberVO detail_o(int ohId);
	int deleteOrder(MemberVO vo);
	
	 List<MemberVO> getRecentRecipes(MemberVO vo);
	MemberVO getReview(MemberVO vo);
	int deleteReview(int review_id);
	
	int writeReview(MemberVO vo);
	List<MemberVO> getLikeRecipe(MemberVO vo);

	int countLikeRecipes(MemberVO vo);
	List<MemberVO> getLikeRecipes(MemberVO vo);
 

}
