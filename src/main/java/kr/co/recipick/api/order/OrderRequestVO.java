package kr.co.recipick.api.order;

public class OrderRequestVO {

}


/* 이름, 수량, 날짜, 오더 상태, 프라이스... (결제 내역) 포인트는 결제 시 적립, 사용시 차감
 *  <select id="list" parameterType="kr.co.recipick.member.MemberVO" resultType="kr.co.recipick.member.MemberVO">
			SELECT 
		    oh.title, 
		    oh.oh_id, 
		    oh.order_date, 
		    oh.qty, 
		    oh.order_state, 
		    oh.price, 
		    oh.recipe_id, 
		    oh.category, 
		    oh.ing_id, 
		    r.description, 
		    r.main_image, 
		    i.image,
		    i.detail,
		    i.name,
		    i.price
		   
		FROM 
		    order_history oh
		LEFT JOIN 
		    recipe r
		ON 
		    oh.recipe_id = r.recipe_id
		LEFT JOIN 
		    ingredient i
		ON 
		    oh.ing_id = i.ing_id
		WHERE 
		    member_id = #{member_id}
		<if test="searchWord != null and searchWord != ''">
            AND oh.title LIKE '%${searchWord}%'
        </if>
        <if test="year != 'all' and year != null">
        	AND LEFT(oh.order_date, 4) = #{year}
        </if>        	
		ORDER BY oh.order_date DESC, oh.oh_id DESC
		LIMIT #{startIdx}, 10
	 </select> 
 * */
 