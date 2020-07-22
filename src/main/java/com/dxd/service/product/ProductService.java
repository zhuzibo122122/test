package com.dxd.service.product;

import java.util.List;

import com.dxd.pojo.EasybuyCollect;
import com.dxd.pojo.EasybuyOrderDetail;
import com.dxd.pojo.EasybuyProduct;
import com.dxd.utils.Pager;

/**
 * 商品信息业务逻辑层！
 * @author Administrator
 *
 */
public interface ProductService {
	/**
	 * 获取所有商品信息！(前端显示)
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
	public int getProductRowCount(int categoryId);
	/**
	 * 获取二级分类总记录数！
	 * @param categoryId
	 * @return
	 */
	public int getProductRowCount2(int categoryId);
	/**
	 * 获取三级分类总记录数！
	 * @param categoryId
	 * @return
	 */
	public int getProductRowCount3(int categoryId);
	/**
	 * 获得商品一级分类下所有商品！(支持模糊查询)
	 * @param categoryId
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByCategoryId(int categoryId, Pager pager,String productName);
	/**
	 * 得到模糊查询的信息数
	 * @param proName
	 * @return
	 */
	public int getmohuCount(String proName);
	/**
	 * 获得商品二级分类！
	 * @param categoryId
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByCategoryId2(int categoryId, Pager pager);
	/**
	 * 获取商品三级分类！
	 * @param categoryId
	 * @param pager
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByCategoryId3(int categoryId, Pager pager);
	/**
	 * 根据ID获取信息！
	 * @param tid
	 * @return
	 */
	public EasybuyProduct findById(int tid);
	/**
	 * 查询用户收藏夹！
	 * @param list
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByUser(List<EasybuyCollect> list);
	/**
	 * 订单表！
	 * @param list
	 * @return
	 */
	public List<EasybuyProduct> getEasybuyProductListByOrder(List<EasybuyOrderDetail> list);
	
	/**
	 * 商品管理！
	 * @param pager
	 * @return
	 */
	List<EasybuyProduct> getEasybuyProductAll(Pager pager);
	
	/**
	 * 获取总记录数！
	 * @return
	 */
	public int getTotalCount();
	
	/**
	 * 根据ID删除指定商品信息！
	 * @param id
	 * @return
	 */
	int delEasybuyProductById(int id);
	
	/**
	 * 商品上架
	 * @param easybuyProduct
	 * @return
	 */
	public int addEasybuyProduct(EasybuyProduct easybuyProduct);
	
	/**
	 * 根据Id查询对应的商品信息！
	 * @param id
	 * @return
	 */
	EasybuyProduct getEasybuyProductById(int id);
	
}
