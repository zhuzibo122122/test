package com.dxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxd.pojo.EasybuyProduct;
import com.dxd.utils.Pager;

/**
 * 商品信息数据访问层！
 * @author Administrator
 *
 */
public interface ProductMapper {
	/**
	 * 获取所有商品信息！ (前端显示)
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductList();
	/**
	 * 获得所有商品信息 (后端显示)
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getAllProduct(Pager pager);
	/**
	 * 修改商品
	 * @param pro
	 * @return
	 */
	int updateEasybuyProduct(EasybuyProduct pro);
	/**
	 * 获取一级分类总记录数！
	 * @param categoryId
	 * @return
	 */
	public int getProductRowCount(@Param("categoryId")int categoryId);
	/**
	 * 获取二级分类总记录数！
	 * @param categoryId
	 * @return
	 */
	public int getProductRowCount2(@Param("categoryId")int categoryId);
	/**
	 * 获取三级分类总记录数！
	 * @param categoryId
	 * @return
	 */
	public int getProductRowCount3(@Param("categoryId")int categoryId);
	/**
	 * 获取一级分类所有商品信息！(模糊查询)
	 * @param categoryId
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByCategoryId(@Param("categoryId")int categoryId,@Param("Pager") Pager pager,@Param("productName")String productName);
	/**
	 * 得到模糊查询的信息数
	 * @param proName
	 * @return
	 */
	public int getmohuCount(String proName);
	
	/**
	 * 获取二级分类所有商品信息！
	 * @param categoryId
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByCategoryId2(@Param("categoryId")int categoryId,@Param("Pager") Pager pager);
	/**
	 * 获取三级分类所有商品信息！
	 * @param categoryId
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByCategoryId3(@Param("categoryId")int categoryId,@Param("Pager") Pager pager);
	/**
	 * 根据商品编号查询商品信息！
	 * @param id
	 * @return
	 */
	public EasybuyProduct getById(int id);
	/**
	 * 修改商品库存信息！
	 * @param id
	 * @param quantity
	 */
	public void updateStock(Integer id, Integer quantity);
	/**
	 * 获取总记录数！
	 * @return
	 */
	public int findTotalCount();
	
	/**
	 * 根据ID删除指定商品信息！
	 * @param id
	 * @return
	 */
	int deleteEasybuyProductById(int id);
	
	/**
	 * 商品上架！
	 * @param easybuyProduct
	 * @return
	 */
	int insertEasybuyProduct(EasybuyProduct easybuyProduct);
	
	/**
	 * 根据Id查询对应的商品信息！
	 * @param id
	 * @return
	 */
	EasybuyProduct findEasybuyProductById(int id);

	
}
