package com.zagle.service.domain;

public class Chat {
	
	private String chatAddress;
	private String imageFile;
	private String videoFile;
	private int userCount;
	private String nickName;

	public Chat() {
		// TODO Auto-generated constructor stub
	}

	public String getChatAddress() {
		return chatAddress;
	}

	public void setChatAddress(String chatAddress) {
		this.chatAddress = chatAddress;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public String getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(String videoFile) {
		this.videoFile = videoFile;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Chat [chatAddress=" + chatAddress + ", imageFile=" + imageFile + ", videoFile=" + videoFile
				+ ", userCount=" + userCount + ", nickName=" + nickName + "]";
	}

}
