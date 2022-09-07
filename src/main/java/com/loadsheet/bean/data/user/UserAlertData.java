package com.loadsheet.bean.data.user;

public class UserAlertData {
	private int  		alertID;
	private String 		alertTitle;
	private String 		alertMessage;
	private String 		createDate;
	private String 		createUser;
	private String 		lang;
	private int 		status;
	private int			readStatus;
	private String 		readDate;
	private String		userMsgStatus;
	private int			totalMsgCount;
	private int			readedMsgCount;
	
	
	public int getTotalMsgCount() {
		return totalMsgCount;
	}
	public void setTotalMsgCount(int totalMsgCount) {
		this.totalMsgCount = totalMsgCount;
	}
	public int getReadedMsgCount() {
		return readedMsgCount;
	}
	public void setReadedMsgCount(int readedMsgCount) {
		this.readedMsgCount = readedMsgCount;
	}
	public String getUserMsgStatus() {
		return userMsgStatus;
	}
	public void setUserMsgStatus(String userMsgStatus) {
		this.userMsgStatus = userMsgStatus;
	}
	public int getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}
	public String getReadDate() {
		return readDate;
	}
	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}
	public int getAlertID() {
		return alertID;
	}
	public void setAlertID(int alertID) {
		this.alertID = alertID;
	}
	public String getAlertTitle() {
		return alertTitle;
	}
	public void setAlertTitle(String alertTitle) {
		this.alertTitle = alertTitle;
	}
	public String getAlertMessage() {
		return alertMessage;
	}
	public void setAlertMessage(String alertMessage) {
		this.alertMessage = alertMessage;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
		
}
