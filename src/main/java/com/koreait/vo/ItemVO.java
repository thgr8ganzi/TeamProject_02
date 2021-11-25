package com.koreait.vo;

public class ItemVO {
	
	private String img;
	private String id;
	private String furnitureName;
	private String grade;
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFurnitureName() {
		return furnitureName;
	}
	public void setFurnitureName(String furnitureName) {
		this.furnitureName = furnitureName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "ItemVO [img=" + img + ", id=" + id + ", furnitureName=" + furnitureName + ", grade=" + grade + "]";
	}
}
