package kr.co.recipick.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeIngredientServiceImpl implements HomeIngredientService {

    @Autowired
    private HomeIngredientMapper homeIngredientMapper;

    @Override
    public List<HomeIngredientVO> getPopularIngredients() {
        return homeIngredientMapper.getPopularIngredients();
    }
    
}