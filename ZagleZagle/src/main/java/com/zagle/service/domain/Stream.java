package com.zagle.service.domain;

import java.util.Date;


public class Stream {

	private String streamNo;
	private User user;
	private String streamTitle;
	private String streamContent;
	private int streamViewCount;
	private int streamLikeCount;
	private Date streamDate;
	private String streamSum;
	
	public String getStreamNo() {
		return streamNo;
	}
	
	public void setStreamNo(String streamNo) {
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
	
	public String getStreamSum() {
		return streamSum;
	}
	
	public void setStreamSum(String streamSum) {
		this.streamSum = streamSum;
	}

	@Override
	public String toString() {
		return "Stream [streamNo=" + streamNo + ", user=" + user + ", streamTitle=" + streamTitle + ", streamContent="
				+ streamContent + ", streamViewCount=" + streamViewCount + ", streamLikeCount=" + streamLikeCount
				+ ", streamDate=" + streamDate + ", streamSum=" + streamSum + "]";
	}
	
	
	
	
	
}
