package kr.co.recipick.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    private HomeMapper homeMapper;

    @Override
    public List<HomeVO> getRecipesWithLikeCount() {
        return homeMapper.selectRecipesWithLikeCount();
    }
}