package kr.co.recipick.home;

import java.util.List;

public interface HomeService {
    List<HomeVO> getRecipesWithLikeCount();
}