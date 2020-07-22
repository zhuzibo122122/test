package com.dxd.service.product.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxd.dao.ProductCategoryMapper;
import com.dxd.pojo.EasybuyProductCategory;
import com.dxd.service.product.ProductCategoryService;
import com.dxd.utils.Pager;

/**
 * 商品信息数据访问层实现类！
 * @author Administrator
 *
 */
@Service("productCategoryService")
public class ProductCategoryServiceImpl implements ProductCategoryService {
	
	@Autowired
	private ProductCategoryMapper category;
	

	@Override
	/**
	 * 查询分类！
	 * @param typeId
	 * @return
	 */
	public List<EasybuyProductCategory> getProductCategoryList(int typeId) {
		return null;
	}

	@Override
	/**
	 * 获得所有分类信息！
	 * @return
	 */
	public List<EasybuyProductCategory> getEasybuyProductCategoryAll(Pager pager) {
		return category.findEasybuyProductCategoryAll(pager);	
	}

	@Override
	/**
	 * 获取总记录数！
	 * @return
	 */
	public int getTotalCount() {
		return category.getTotalCount();
	}

	@Override
	/**
	 * 根据商品ID删除指定商品信息业务！
	 * @param id
	 * @return
	 */
	public int deleteEasybuyProductCategoryById(int id) {
		return category.delEasybuyProductCategoryById(id);
	}

	@Override
	/**
	 * 一级分类！
	 * @return
	 */
	public List<EasybuyProductCategory> getProductCategoryListOne() {
		return category.findProductCategoryListOne();
	}

	@Override
	/**
	 * 二级分类！
	 * @return
	 */
	public List<EasybuyProductCategory> getProductCategoryListTwo() {
		return category.findProductCategoryListTwo();
	}

	@Override
	/**
	 * 三级分类！
	 * @return
	 */
	public List<EasybuyProductCategory> getProductCategoryListThree() {
		return category.findProductCategoryListThree();
	}

	@Override
	/**
	 * 根据父分类查询商品分类信息
	 * @param typeId
	 * @return
	 */
	public List<EasybuyProductCategory> getProductCategoryListByparentId(int typeId,int parentId) {
		return category.getProductCategoryListByparentId(typeId, parentId);
	}

	@Override
	/**
	 * 修改商品分类
	 * @param easybuyProductCategory
	 * @return
	 */
	public int insertEasybuyProductCategory(EasybuyProductCategory pro) {
		return category.insertEasybuyProductCategory(pro);
	}

	@Override
	/**
	 *  根据id查询商品分类信息
	 * @param id
	 * @return
	 */
	public EasybuyProductCategory getProductCategoryById(int id) {
		return category.getProductCategoryById(id);
	}
	/**
	 * 根据id查询父分类名
	 */
	public String getParentName(int id) {
		return category.getParentName(id);
	}

	/**
	 * 判断是否存在重复分类名
	 */
	public int checkCategoryName(String name) {
		return category.checkCategoryName(name);
	}

	/**
	 * 添加新的分类信息
	 */
	public int addNewCategory(EasybuyProductCategory pro) {
		return category.addNewCategory(pro);
	}

	/**
	 * 判断删除分类下是否存在商品
	 */
	public int checkProductByCategoryId(int id) {
		return category.checkProductByCategoryId(id);
	}

	/**
	 * 判断当前分类下是否有子分类
	 */
	public int checkCategorybyChild(int id) {
		return category.checkCategorybyChild(id);
	}
	
	
}
