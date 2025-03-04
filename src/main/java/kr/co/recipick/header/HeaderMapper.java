package kr.co.recipick.header;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.recipick.member.MemberVO;

@Mapper
public interface HeaderMapper {
	
	// 위시리스트
	int getWishlistCount(int member_id);

	// 장바구니
	int getCartCount(int member_id);
	
}
