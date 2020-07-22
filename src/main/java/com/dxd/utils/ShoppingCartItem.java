package com.dxd.utils;


import java.io.Serializable;

import com.dxd.pojo.EasybuyProduct;


public class ShoppingCartItem implements Serializable{
	private EasybuyProduct product;//商品
	private Integer quantity;//数量
	private float cost;//价格
	
	
	public ShoppingCartItem(EasybuyProduct product, Integer quantity) {
		this.product = product;
		this.quantity = quantity;
		this.cost = product.getPrice() * quantity;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
		this.cost = product.getPrice() * quantity;
	}

	public EasybuyProduct getProduct() {
		return product;
	}

	public float getCost() {
		return cost;
	}

	public void setProduct(EasybuyProduct product) {
		this.product = product;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}
}
