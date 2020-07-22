package com.dxd.pojo;
/**
 * 商品详情！
 * @author Administrator
 *  @Data  :产生get,set方法
    @NoArgsConstructor：产生无参构造方法
    @AllArgsConstructor ：产生有参构造方法
    @Accessors//产生链式结构
 */
public class DetailProduct {
	// 订单ID！
	private int orderId;
	// 数量！
	private int quantity;
	// 金额！
	private float cost;
	// 商品编号（主键）
	private int id;
	// 商品名字
	private String name;
	// 上传的文件名
	private String fileName;
	
	
	
	public DetailProduct() {
		super();
	}
	public DetailProduct(int orderId, int quantity, float cost, int id, String name, String fileName) {
		super();
		this.orderId = orderId;
		this.quantity = quantity;
		this.cost = cost;
		this.id = id;
		this.name = name;
		this.fileName = fileName;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	
	
}
