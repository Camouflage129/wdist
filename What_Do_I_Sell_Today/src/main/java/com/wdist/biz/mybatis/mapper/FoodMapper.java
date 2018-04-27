package com.wdist.biz.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.wdist.biz.food.vo.AreaFoodVO;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.food.vo.SaleAvgVO;

public interface FoodMapper {
	
	/*@Select("SELECT * FROM foodarea WHERE foodareanum = (SELECT last_insert_id() FROM foodarea LIMIT 1)")
	public FoodAreaVO getFoodAreaTitle();*/
	
	/*@Select("SELECT * FROM foodarea WHERE foodtitle = ?")
	public FoodAreaVO getFoodAreaTitle(String foodtitle);*/
	/*
	@Select("SELECT * FROM foodarea WHERE foodtitle = #{foodtitle}")
	public FoodAreaVO getFoodAreaTitle(String foodtitle);
	
	@Select("SELECT * FROM areafood WHERE areatitle = #{areatitle}")
	public AreaFoodVO getAreaFoodTitle(String areatitle);*/
	
	@Select("select sale_species, avg(area_sales) as asale from SALES" + 
			" where area = #{areatitle} and quarters IN (201702, 201703, 201704)" + 
			" group by sale_species")
	public List<SaleAvgVO> fstSaleAvg(String areatitle);

	@Select("select sale_species, avg(area_sales) as asale from SALES" + 
			" where area = #{areatitle} and quarters IN (201705, 201706, 201707)" + 
			" group by sale_species")
	public List<SaleAvgVO> sndSaleAvg(String areatitle);
	

	@Select("select sale_species, avg(area_sales) as asale from SALES" + 
			" where area = #{areatitle} and quarters IN (201708, 201709, 2017010)" +
			" group by sale_species")
	public List<SaleAvgVO> thrdSaleAvg(String areatitle);
	
	@Select("select sale_species, avg(area_sales) as asale from SALES" + 
			" where area = #{areatitle} and quarters IN (2017011, 2017012, 201801)" + 
			" group by sale_species")
	public List<SaleAvgVO> frthSaleAvg(String areatitle);
	
	
}
