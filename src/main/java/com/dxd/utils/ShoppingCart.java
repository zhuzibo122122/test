package com.dxd.utils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.dxd.pojo.EasybuyProduct;


public class ShoppingCart implements Serializable{
	public List<ShoppingCartItem> items = new ArrayList<ShoppingCartItem>();
	private Double sum; //总价

	//获取购物车中所有商品
	public List<ShoppingCartItem> getItems() {
		return items;
	}	
	
	/**
	 * 添加一个
	 * @param product  商品
	 * @param quantity 数量
	 * @return
	 */
	public ReturnResult addItem(EasybuyProduct product, Integer quantity) {
		ReturnResult result=new ReturnResult();
		items.add(new ShoppingCartItem(product, quantity));
		this.sum = (double)this.getTotalCost(); //得到总计
		return result.returnSuccess();
	}

	//移除一项
	public void removeItem(int index) {
		items.remove(index);
	}

	//修改数量
	public void modifyQuantity(int index, Integer quantity) {
		items.get(index).setQuantity(quantity);
		this.sum = (double)getTotalCost(); //重新计算价格
	}

	//计算总价格
	public float getTotalCost() {
		float sum = 0;
		for (ShoppingCartItem item : items) {
			sum = sum + item.getCost();
		}
		return sum;
	}

	public void setItems(List<ShoppingCartItem> items) {
		this.items = items;
	}

	public Double getSum() {
		return sum;
	}

	public void setSum(Double sum) {
		BigDecimal b=new BigDecimal(sum);
		this.sum = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
}
