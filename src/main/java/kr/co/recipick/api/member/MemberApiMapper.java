package kr.co.recipick.api.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
	public interface MemberApiMapper {
	    MemberResponseVO getMemberInfo(String email);
	}


