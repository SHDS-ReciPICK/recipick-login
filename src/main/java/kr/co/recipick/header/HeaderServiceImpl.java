package kr.co.recipick.header;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.recipick.member.MemberVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HeaderServiceImpl implements HeaderService {
	
	@Autowired
	private HeaderMapper mapper;

	@Override
	public int getWishlistCount(int member_id) {
		return mapper.getWishlistCount(member_id);
	}

	@Override
	public int getCartCount(int member_id) {
		return mapper.getCartCount(member_id);
	}


}