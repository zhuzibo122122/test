package com.dxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxd.pojo.EasybuyUser;
import com.dxd.utils.Pager;

/**
 * 用户信息数据访问层！
 * @author Administrator
 *
 */
public interface EasybuyUserMapper {
	/**
	 * 根据用户名和密码查询对应信息！
	 * @param easybuyUser
	 * @return
	 */
	EasybuyUser findEasybuyUserInfo(String loginName);
	
	/**
	 * 根据用户信息注册
	 * @return
	 */
	int addRegisterInfo(EasybuyUser easybuyUser);
	
	/**
	 * 查询所有用户信息！
	 * @return
	 */
	List<EasybuyUser> findEasybuyUserAll(Pager pager);
	
	/**
	 * 根据用户ID删除信息！
	 * @param id
	 * @return
	 */
	int delEasybuyUserById(int id);
	/**
	 * 查询该用户是否有订单
	 * @param userId
	 * @return
	 */
	public int checkOrderByid(int userId);
	/**
	 * 删除该用户的收获地址
	 * @param userId
	 * @return
	 */
	public int delAddressByid(int userId);
	/**
	 * 查询用户信息总记录数！
	 * @return
	 */
	int getTotalCount();
	
	/**
	 * 根据用户Id查询对应信息！
	 * @param id
	 * @return
	 */
	EasybuyUser findEasybuyUserById(int id);
	
	/**
	 * 根据用户ID更新用户信息！
	 * @return
	 */
	int modifyEasybuyUserById(EasybuyUser easybuyUser);
	
	/**
	 * 查询是否存在相同的用户名！
	 * @param name
	 * @return
	 */
	int findLoginNameByName(String name);
	
	//************
	/**
	 * 根据用户名修改该用户密码！
	 * @param name
	 * @param password
	 * @return
	 */
	int updateUserPasswordBy(@Param("loginName")String name,@Param("password")String password);
	/**
	 * 得到该用户所有订单号
	 * @param userId
	 * @return
	 */
	List<Integer> getAllOrderIdByuserId(int userId);
	//************
}
