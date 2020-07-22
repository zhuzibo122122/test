package com.dxd.pojo;
/**
 * 订单详情表！
 * @author Administrator
 *
 */
public class EasybuyOrderDetail {
	// 编号！
	private int id;
	// 订单ID！
	private int orderId;
	// 商品ID！
	private int productId;
	// 数量！
	private int quantity;
	// 金额！
	private float cost;
	
	private String name; //商品名称
	private String fileName; //图片路径
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * 无参数构造！
	 */
	public EasybuyOrderDetail() {}
	
	/**
	 * 带参数构造方法！
	 * @param id
	 * @param orderId
	 * @param productId
	 * @param quantity
	 * @param cost
	 */
	public EasybuyOrderDetail(int id, int orderId, int productId, int quantity, float cost) {
		this.id = id;
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
		this.cost = cost;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	
}
