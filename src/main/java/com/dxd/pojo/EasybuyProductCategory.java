package com.dxd.pojo;
/**
 * 商品分类表！
 * 
 * @author Administrator
 *
 */
public class EasybuyProductCategory {
	// 编号！
		private int id;
		// 名字！
		private String name;
		// 父分类！
		private int parentId;
		// 类型！
		private int type;
		
		private String parentName;
		
		public String getParentName() {
			return parentName;
		}

		public void setParentName(String parentName) {
			this.parentName = parentName;
		}

		/**
		 * 无参数构造！
		 */
		public EasybuyProductCategory() {
			
		}

		/**
		 * 带参数构造方法！
		 * 
		 * @param id
		 * @param name
		 * @param parentId
		 * @param type
		 */
		public EasybuyProductCategory(int id, String name, int parentId, int type) {
			this.id = id;
			this.name = name;
			this.parentId = parentId;
			this.type = type;
		}
		public EasybuyProductCategory(String name, int parentId, int type) {		
			this.name = name;
			this.parentId = parentId;
			this.type = type;
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

		public int getParentId() {
			return parentId;
		}

		public void setParentId(int parentId) {
			this.parentId = parentId;
		}

		public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

}
