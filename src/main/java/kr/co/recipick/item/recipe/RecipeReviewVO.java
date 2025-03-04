package kr.co.recipick.item.recipe;
import java.util.Date;

import lombok.Data;

@Data
public class RecipeReviewVO {
    private String review_writer; // 리뷰 작성자
    private int star_rating; // 별점
    private Date review_dt; // 리뷰 작성일
    private String content; // 리뷰 내용
}