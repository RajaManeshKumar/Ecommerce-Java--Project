package com.cart.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int categoryId;
	private String categoryTitle;
	private String CategoryDescription;
	
	@OneToMany(mappedBy="category")// these all things all maped by category
    private List<Product> product=new ArrayList<Product>();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", CategoryDescription="
				+ CategoryDescription + "]";
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	public String getCategoryDescription() {
		return CategoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		CategoryDescription = categoryDescription;
	}

	
	
	
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
		public Category(int categoryId, String categoryTitle, String categoryDescription) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		CategoryDescription = categoryDescription;
	}
		
		

		public Category(String categoryTitle, String categoryDescription,List<Product> product) {
			super();
			this.categoryTitle = categoryTitle;
			this.CategoryDescription = categoryDescription;
			this.product=product;
			
		}
		public List<Product> getProduct() {
			return product;
		}
		public void setProduct(List<Product> product) {
			this.product = product;
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
 