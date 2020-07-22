package com.dxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxd.pojo.EasybuyProductCategory;
import com.dxd.utils.Pager;

/**
 * 商品信息数访问数据层！
 * @author Administrator
 *
 */
public interface ProductCategoryMapper {
	
	
	/**
	 *  根据id查询商品信息
	 * @param id
	 * @return
	 */
	public EasybuyProductCategory getProductCategoryById(int id);
	
	/**
	 * 查询所有商品信息！
	 * @return
	 */
	List<EasybuyProductCategory> findEasybuyProductCategoryAll(Pager pager);
	
	/**
	 * 获取总记录数！
	 * @return
	 */
	int getTotalCount();
	
	/**
	 * 根据Id删除商品分类信息！
	 * @param id
	 * @return
	 */
	int delEasybuyProductCategoryById(int id);

	/**
	 * 一级分类！
	 * @return
	 */
	List<EasybuyProductCategory> findProductCategoryListOne();
	
	/**
	 * 二级分类！
	 * @return
	 */
	List<EasybuyProductCategory> findProductCategoryListTwo();
	
	/**
	 * 三级分类！
	 * @return
	 */
	List<EasybuyProductCategory> findProductCategoryListThree();
	/**
	 * 根据父分类查询商品分类信息
	 * @param typeId
	 * @return
	 */
	List<EasybuyProductCategory> getProductCategoryListByparentId(@Param("typeId")int typeId,@Param("parentId")int parentId);
	/**
	 * 修改商品分类
	 * @param easybuyProductCategory
	 * @return
	 */
	int insertEasybuyProductCategory(EasybuyProductCategory pro);
	/**
	 * 判断删除分类下是否存在商品
	 * @param id
	 * @return
	 */
	public int checkProductByCategoryId(int id);
	/**
	 * 判断是否存在重复分类名
	 * @param name
	 * @return
	 */
	public int checkCategoryName(String name);
	/**
	 * 根据id查询父分类名
	 * @param id
	 * @return
	 */
	public String getParentName(int id);
	/**
	 * 添加新的分类
	 * @param pro
	 * @return
	 */
	public int addNewCategory(EasybuyProductCategory pro);
	/**
	 * 判断当前分类下是否有子分类
	 * @param id
	 * @return
	 */
	public int checkCategorybyChild(int id);
}
