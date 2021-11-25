package com.koreait.vo;

public class ReplyVO {
	String reply="";
	String id="";
	int gup=0;
	int lev=0;
	int seq=0;
	public int getGup() {
		return gup;
	}
	public void setGup(int gup) {
		this.gup = gup;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	int idx=0;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply=" + reply + ", id=" + id + ", gup=" + gup + ", lev=" + lev + ", seq=" + seq + ", idx="
				+ idx + "]";
	}
	
	
}
