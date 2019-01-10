package com.zagle.service.domain;

import java.util.Date;


public class Stream {

	private int streamNo;
	private User user;
	private String streamTitle;
	private String streamContent;
	private int streamViewCount;
	private int streamLikeCount;
	private Date streamDate;
	public int getStreamNo() {
		return streamNo;
	}
	public void setStreamNo(int streamNo) {
		this.streamNo = streamNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getStreamTitle() {
		return streamTitle;
	}
	public void setStreamTitle(String streamTitle) {
		this.streamTitle = streamTitle;
	}
	public String getStreamContent() {
		return streamContent;
	}
	public void setStreamContent(String streamContent) {
		this.streamContent = streamContent;
	}
	public int getStreamViewCount() {
		return streamViewCount;
	}
	public void setStreamViewCount(int streamViewCount) {
		this.streamViewCount = streamViewCount;
	}
	public int getStreamLikeCount() {
		return streamLikeCount;
	}
	public void setStreamLikeCount(int streamLikeCount) {
		this.streamLikeCount = streamLikeCount;
	}
	public Date getStreamDate() {
		return streamDate;
	}
	public void setStreamDate(Date streamDate) {
		this.streamDate = streamDate;
	}
	@Override
	public String toString() {
		return "Stream [streamNo=" + streamNo + ", streamTitle=" + streamTitle + ", streamContent=" + streamContent
				+ ", streamViewCount=" + streamViewCount + ", streamLikeCount=" + streamLikeCount + ", streamDate="
				+ streamDate + "]";
	}
	
	
	
	
}
