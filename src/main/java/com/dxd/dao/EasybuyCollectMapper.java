package com.dxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxd.pojo.EasybuyCollect;


/**
 * 收藏列表数据访问层！！
 * 
 * @author Administrator
 *
 */
public interface EasybuyCollectMapper {
	/**
	 * 清空该用户的购物车
	 * @param userId
	 * @return
	 */
	int delCart(int userId);
	/**
	 * 收藏商品！
	 * @param userId
	 * @param productId
	 * @param productNum
	 * @param type
	 * @return
	 */
	int addCollect(@Param("userId")int userId,@Param("productId") int productId,@Param("productNum") int productNum, @Param("type")int type);
	/**
	 * 查询用户购物车信息！
	 * @param userId
	 * @param productId
	 * @return
	 */
	List<EasybuyCollect> selectId(int userId);
	/**
	 * 查询指定用户收藏夹
	 * @param userId
	 * @return
	 */
	List<EasybuyCollect> selectByUserId(int userId);
	/**
	 * 删除收藏
	 * @param userId
	 * @param productId
	 * @return
	 */
	int delCollect(EasybuyCollect easybuyCollect);
	
	/**
	 * 判断用户是否重复收藏商品
	 */
	int checkCollect(@Param("userId")int userId,@Param("productId")int productId);
	/**
	 * 购物车商品数量+1
	 * @param userId
	 * @param productId
	 * @return
	 */
	int addNum(@Param("userId") int userId,@Param("productId")int productId);
	/**
	 * 购物车商品数量-1
	 * @param userId
	 * @param productId
	 * @return
	 */
	int jianNum(@Param("userId")int userId,@Param("productId")int productId);
	/**
	 * 购物车商品是否重复
	 * @param userId
	 * @param productId
	 * @return
	 */
	int checkCart(@Param("userId")int userId,@Param("productId")int productId); 
}
