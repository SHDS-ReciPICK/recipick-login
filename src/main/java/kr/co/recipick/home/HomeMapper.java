package kr.co.recipick.home;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeMapper {
	 List<HomeVO> selectRecipesWithLikeCount();
}
