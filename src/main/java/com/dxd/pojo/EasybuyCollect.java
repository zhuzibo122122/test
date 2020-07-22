package com.dxd.pojo;

import java.util.List;

/**
 * 收藏列表！F
 * @author Administrator
 *
 */
public class EasybuyCollect {
	//id
	private int id;
	//用户id
	private int userId;
	//商品id
	private int productId;
	//数量
	private int productNum;
	//类型（0：收藏，1：购物车）
	private int type;
	
	private List<EasybuyProduct> product;  //购物车中所有商品
	
	public List<EasybuyProduct> getProduct() {
		return product;
	}
	public void setProduct(List<EasybuyProduct> product) {
		this.product = product;
	}
	public int getId() {
		return id;
	}
	public EasybuyCollect() {
		super();
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public EasybuyCollect(int id, int userId, int productId, int productNum, int type) {
		super();
		this.id = id;
		this.userId = userId;
		this.productId = productId;
		this.productNum = productNum;
		this.type = type;
	}
}
