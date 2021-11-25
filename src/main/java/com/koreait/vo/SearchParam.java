package com.koreait.vo;

public class SearchParam {
	
	int startNO;
	int endNO;
	String tag;
	String search;
	public int getStartNO() {
		return startNO;
	}
	public void setStartNO(int startNO) {
		this.startNO = startNO;
	}
	public int getEndNO() {
		return endNO;
	}
	public void setEndNO(int endNO) {
		this.endNO = endNO;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "SearchParam [startNO=" + startNO + ", endNO=" + endNO + ", tag=" + tag + ", search=" + search + "]";
	}
	
}
