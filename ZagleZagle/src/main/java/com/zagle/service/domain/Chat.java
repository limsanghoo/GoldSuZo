package com.zagle.service.domain;

public class Chat {
	
	private String chatAddress;
	private String profile;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Chat [chatAddress=" + chatAddress + ", profile=" + profile + ", nickName=" + nickName + "]";
	}

}
