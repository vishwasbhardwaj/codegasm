package com.testengine.bean;

public class Category implements java.io.Serializable{
public int id;
public String categoryname,status;

public String getCategoryname() {
	return categoryname;
}

public void setCategoryname(String categoryname) {
	this.categoryname = categoryname;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}




public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

@Override
public String toString() {
	return "Category [categoryname=" + categoryname + ", status=" + status + "]";
}

}
