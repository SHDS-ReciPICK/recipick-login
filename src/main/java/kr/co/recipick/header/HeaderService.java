package kr.co.recipick.header;

import java.util.List;

import kr.co.recipick.member.MemberVO;

public interface HeaderService {
	
	// 위시리스트
	int getWishlistCount(int member_id);

	// 장바구니
	int getCartCount(int member_id);

}
