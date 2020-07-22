package com.dxd.service.user;

import java.util.List;

import com.dxd.pojo.EasybuyUser;
import com.dxd.utils.Pager;


/**
 * 用户信息业务逻辑层！
 * 
 * @author Administrator
 *
 */
public interface EasybuyUserService {
	/**
	 * 根据用户名和密码查询相应信息业务！
	 * 
	 * @param easybuyUser
	 * @return
	 */
	EasybuyUser getEasybuyUserInfo(String loginName);

	/**
	 * 根据用户注册添加信息业务！
	 * 
	 * @param user
	 * @return
	 */
	int addRegisterInfo(EasybuyUser easybuyUser);

	/**
	 * 获得所有用户信息业务！
	 * 
	 * @return
	 */
	List<EasybuyUser> getEasybuyUserAll(Pager pager);

	/**
	 * 根据用户ID删除信息业务！
	 * 
	 * @param id
	 * @return
	 */
	int removeEasybuyUserById(int id);

	/**
	 * 查询用户信息总记录数业务！
	 * 
	 * @return
	 */
	int getTotalCount();

	/**
	 * 根据用户Id查询对应信息业务！
	 * 
	 * @param id
	 * @return
	 */
	EasybuyUser getEasybuyUserById(int id);

	/**
	 * 根据用户ID更新用户信息业务！
	 * 
	 * @return
	 */
	int updateEasybuyUserById(EasybuyUser easybuyUser);

	/**
	 * 查询是否存在相同的用户名业务！
	 * 
	 * @param name
	 * @return
	 */
	int getLoginNameByName(String name);

	// ************
	/**
	 * 修改密码操作验证业务！
	 * 
	 * @param name
	 * @param emailMobile
	 * @param value
	 * @return
	 */
	int getUserPasswordBy(String name, String emailMobile, String value);
	
	/**
	 * 根据用户名修改该用户密码！
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	int modifyUserPasswordBy(String name,String password);
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
	 * 得到该用户所有订单号
	 * @param userId
	 * @return
	 */
	List<Integer> getAllOrderIdByuserId(int userId);
	// ************
}