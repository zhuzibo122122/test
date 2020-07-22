package com.dxd.service.order;

import java.util.List;

import com.dxd.pojo.EasybuyCollect;

/**
 * 购物车业务逻辑层！！
 * @author Administrator
 *
 */
public interface CartService {
	/**
	 * 清空该用户的购物车
	 * @param userId
	 * @return
	 */
	int delCart(int userId);
    /**
     * 添加收藏记录！
     * @param userId
     * @param productId
     * @param productNum
     * @param type
     * @return
     */
    public int addCollect(int userId, int productId,int productNum,int type);
    /**
     * 根据ID查询购物车！
     * @param userId
     * @param productId
     * @return
     */
    public List<EasybuyCollect> selectId(int userId);
    /**
     * 查询用户的收藏夹！
     * @param userId
     * @return
     */
    public List<EasybuyCollect> selectByUserId(int userId);
	/**
	 * 删除收藏
	 * @param userId
	 * @param productId
	 * @return
	 */
	int delCollect(EasybuyCollect easybuyCollect);
	
	/**
	 * 查看用户是否重复收藏商品
	 * @param userId
	 * @param productId
	 * @return
	 */
	int checkCollect(int userId, int productId);
	
	/**
	 * 购物车商品数量+1
	 * @param userId
	 * @param productId
	 * @return
	 */
	int addNum( int userId,int productId);
	/**
	 * 购物车商品是否重复
	 * @param userId
	 * @param productId
	 * @return
	 */
	int checkCart(int userId,int productId); 
	/**
	 * 购物车商品数量-1
	 * @param userId
	 * @param productId
	 * @return
	 */
	int jianNum(int userId,int productId);
    
}
