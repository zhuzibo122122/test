package com.dxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxd.pojo.EasybuyOrder;
import com.dxd.pojo.EasybuyOrderDetail;
import com.dxd.utils.Pager;

/**
 * 订单信息数据访问层！
 * @author Administrator
 *
 */
public interface OrderMapper {
	/**
	 * 确认订单
	 * @param orderId
	 * @return
	 */
	public int confrimOrder(int orderId);
	/**
	 * 保存订单信息
	 * @param order
	 */
	public void saveOrder(EasybuyOrder order);
	/**
	 * 得到所有订单信息
	 * @param pager
	 * @return
	 */
	public List<EasybuyOrder> getAllOrder(Pager pager);
	/**
	 * 根据用户信息查询对应订单信息！
	 * @param id
	 * @return
	 */
	List<EasybuyOrder> findEasybuyOrderList(@Param("userId")int userId,@Param("Pager")Pager pager);
	/**
	 * 得到该用户所有订单条数
	 * @param userId
	 * @return
	 */
	public int getOrderCount(int userId);
	/**
	 * 获得总订单信息！
	 * @return
	 */
	public int getTotalCount();
	/**
	 * 得到指定订单的详情
	 * @param orderId
	 * @return
	 */
	public List<EasybuyOrderDetail> getOrderDetail(int orderId);
	/**
	 * 根据订单号 查询订单id
	 * @param serialNumber
	 * @return
	 */
	public int getorderByserialNumber(String serialNumber);
	/**
	 * 删除该用户所有订单
	 * @param userId
	 * @return
	 */
	public int delOrderByUserId(int userId); 
	/**
	 * 删除指定订单中的所有商品
	 * @param orderId
	 * @return
	 */
	public int delOrderProductByOrderId(int orderId);
	
}
