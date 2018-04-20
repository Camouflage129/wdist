package com.wdist.biz.mybatis.mapper;

import org.apache.ibatis.annotations.Select;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;

public interface FoodMapper {
	
	/*@Select("SELECT * FROM foodarea WHERE foodareanum = (SELECT last_insert_id() FROM foodarea LIMIT 1)")
	public FoodAreaVO getFoodAreaTitle();*/
	
	/*@Select("SELECT * FROM foodarea WHERE foodtitle = ?")
	public FoodAreaVO getFoodAreaTitle(String foodtitle);*/
	
	@Select("SELECT * FROM foodarea WHERE foodtitle = #{foodtitle}")
	public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	@Select("SELECT * FROM areafood WHERE areatitle = #{areatitle}")
	public AreaFoodVO getAreaFoodTitle(String areatitle);
	
	
}
