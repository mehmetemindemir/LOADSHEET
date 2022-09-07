package com.loadsheet.bean.data.user;

public class UserInfoData{
	
	public String USER_NAME = null;
	public String USER_PASSWORD = null;
	public String FIRST_NAME = null;
	public String LAST_NAME = null;
	public String USER_POSITION = null;
	public String STATUS = null;
	public String USER_LOCATION = null;
	public String INT_DOM = null;
	public int USER_ID = 0;
	public int USER_TYPE=0;
	private String userPhone;
	private String userEmail;
	private int airportCount;
	private String  comment;
	private String  createBy;
	private int 		manifestUnlimitTime;	
	private int 		companyId;
	private int userProjectCode;
	
	

	
	public int getUserProjectCode() {
		return userProjectCode;
	}
	public void setUserProjectCode(int userProjectCode) {
		this.userProjectCode = userProjectCode;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getManifestUnlimitTime() {
		return manifestUnlimitTime;
	}
	public void setManifestUnlimitTime(int manifestUnlimitTime) {
		this.manifestUnlimitTime = manifestUnlimitTime;
	}
	
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public int getAirportCount() {
		return airportCount;
	}
	public void setAirportCount(int airportCount) {
		this.airportCount = airportCount;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}