package com.dxd.dao;

import java.util.List;

import com.dxd.pojo.EasybuyUserAddress;


/**
 * 用户地址表信息数据访问层！
 * @author Administrator
 *
 */
public interface EasybuyUserAddressMapper {
	
	/**
	 * 根据用户ID查询对应的收货地址！
	 * @return
	 */
	List<EasybuyUserAddress> findEasybuyUserAddressAll(int userId);
	
	/**
	 * 根据登陆用户ID新增数据！
	 * @param userId
	 * @return
	 */
	int updateEasybuyUserAddressById(EasybuyUserAddress easybuyUserAddress);
	/**
	 * 根据id查询收货地址
	 * @param id
	 * @return
	 */
	EasybuyUserAddress getUserAddressById(int id);
	
	//********
	//********
}
