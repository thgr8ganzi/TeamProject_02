package com.koreait.vo;

import java.util.ArrayList;

public class ItemList {

	ArrayList<ItemVO> list=new ArrayList<ItemVO>();
	
	public ArrayList<ItemVO> getList() {
		return list;
	}
	public void setList(ArrayList<ItemVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ItemList [list=" + list + "]";
	}
	
}
