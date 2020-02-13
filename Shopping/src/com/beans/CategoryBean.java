package com.beans;

public class CategoryBean implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String categoryName;
    private int categoryId;

	public CategoryBean() {}
	public CategoryBean(int categoryId,String categoryName) {
		this.categoryId = categoryId;
        this.categoryName = categoryName;
		}
		
	public int getCategoryId() { return categoryId; }
	public String getCategoryName() { return categoryName; }
	
	
	public void setCategoryId(int i) { categoryId = i; }
	public void setCategoryName(String s) { categoryName = s; }
	}
