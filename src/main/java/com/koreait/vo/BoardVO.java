package com.koreait.vo;

import java.util.Date;

public class BoardVO {
	int idx;
	String id;
	String title;
	String content;
	int gup;
	int lev;
	int seq;
	int hit;
	Date writeDate;
	int replyCount;
	
	
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", id=" + id + ", title=" + title + ", content=" + content + ", gup=" + gup
				+ ", lev=" + lev + ", seq=" + seq + ", hit=" + hit + ", writeDate=" + writeDate + ", replyCount="
				+ replyCount + "]";
	}
	
	
	
}
