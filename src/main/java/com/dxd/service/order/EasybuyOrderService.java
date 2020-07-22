package com.dxd.service.order;

import java.util.List;

import com.dxd.pojo.EasybuyOrder;
import com.dxd.pojo.EasybuyOrderDetail;
import com.dxd.utils.Pager;


/**
 * 订单信息业务逻辑层！
 * 
 * @author Administrator
 *
 */
public interface EasybuyOrderService {
	
	/**
	 * 确认订单
	 * @param orderId
	 * @return
	 */
	public int confrimOrder(int orderId);
	/**
	 * 得到该用户所有订单条数
	 * @param userId
	 * @return
	 */
	public int getOrderCount(int userId);
	/**
	 * 获得总计数！
	 * 
	 * @return
	 */
	public int getTotalCount();
	/**
	 * 根据用户信息查询对应订单信息！
	 * @param id
	 * @return
	 */
	public List<EasybuyOrder> findEasybuyOrderList(int userId,Pager pager);

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
	int getorderByserialNumber(String serialNumber);
	/**
	 * 保存订单
	 * @param eo
	 */
	void saveOrder(EasybuyOrder eo);

	// *********
	/**
	 * 保存订单详情
	 * @param detail
	 * @param orderId
	 */
	void saveOrderDetail(EasybuyOrderDetail detail, int orderId);
	/**
	 * 得到所有订单
	 * @param pager
	 * @return
	 */
	public List<EasybuyOrder> getAllOrder(Pager pager);
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
	// *********
}
