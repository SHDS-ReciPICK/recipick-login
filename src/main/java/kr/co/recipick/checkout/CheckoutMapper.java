package kr.co.recipick.checkout;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CheckoutMapper {
	
	OrdererVO getOrdererInfo(int memberId);
	
	
	void insertOrderHistory(OrderVO orderHistory);
	
	
}
