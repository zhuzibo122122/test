package com.dxd.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxd.dao.EasybuyUserMapper;
import com.dxd.pojo.EasybuyUser;
import com.dxd.service.user.EasybuyUserService;
import com.dxd.utils.Pager;


/**
 * 用户信息业务逻辑层操作！
 * 
 * @author Administrator
 *
 */
@Service("easybuyUserService")
public class EasybuyUserServiceImpl implements EasybuyUserService {
	@Autowired
	private EasybuyUserMapper usermapper;
	
	@Override
	/**
	 * 根据用户名和密码查询相应信息业务！
	 */
	public EasybuyUser getEasybuyUserInfo(String loginName) {
		return usermapper.findEasybuyUserInfo(loginName);
	}

	/**
	 * 实现用户注册业务操作！
	 */
	@Override
	public int addRegisterInfo(EasybuyUser easybuyUser) {
		return usermapper.addRegisterInfo(easybuyUser);
	}

	@Override
	/**
	 * 获得所有用户信息！
	 * 
	 * @return
	 */
	public List<EasybuyUser> getEasybuyUserAll(Pager pager) {
		return usermapper.findEasybuyUserAll(pager);
	}

	@Override
	/**
	 * 根据用户ID删除信息！
	 * 
	 * @param id
	 * @return
	 */
	public int removeEasybuyUserById(int id) {
		return usermapper.delEasybuyUserById(id);
	}

	@Override
	/**
	 * 获取用户信息总记录数！
	 */
	public int getTotalCount() {
		return usermapper.getTotalCount();
	}

	@Override
	/**
	 * 根据用户Id查询对应信息！
	 * 
	 * @param id
	 * @return
	 */
	public EasybuyUser getEasybuyUserById(int id) {
		return usermapper.findEasybuyUserById(id);
	}

	@Override
	/**
	 * 根据用户ID更新用户信息！
	 * 
	 * @return
	 */
	public int updateEasybuyUserById(EasybuyUser easybuyUser) {
		return usermapper.modifyEasybuyUserById(easybuyUser);
	}

	@Override
	/**
	 * 查询是否存在相同的用户名业务！
	 * 
	 * @param name
	 * @return
	 */
	public int getLoginNameByName(String name) {
		return usermapper.findLoginNameByName(name);
	}

	// ************
	@Override
	/**
	 * 修改密码操作验证业务！
	 * 
	 * @param name
	 * @param emailMobile
	 * @param value
	 * @return
	 */
	public int getUserPasswordBy(String name, String emailMobile, String value) {
		return 0;
	}
	// ************

	@Override
	/**
	 * 根据用户名修改该用户密码！
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	public int modifyUserPasswordBy(String name, String password) {
		return usermapper.updateUserPasswordBy(name, password);
	}

	/**
	 * 查找该用户是否有订单
	 */
	public int checkOrderByid(int userId) {
		return usermapper.checkOrderByid(userId);
	}

	/**
	 * 清空该用户收货地址
	 */
	public int delAddressByid(int userId) {
		return usermapper.delAddressByid(userId);
	}

	/**
	 * 得到该用户所有订单号
	 */
	public List<Integer> getAllOrderIdByuserId(int userId) {
		return usermapper.getAllOrderIdByuserId(userId);
	}
}
