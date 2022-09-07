package com.loadsheet.bean.data.user;

public class PageData {
	private String pageID;
	private String pageSubId;
	private String pageTitle;
	private String pageUrl;
	private String pageDesc;
	private String pageStatus;
	private String pageType;
	private String orderBy;
	private int isSelect;
	private int isSelectForUserType;
	private String pageName;
	
	public String getPageID() {
		return pageID;
	}
	public void setPageID(String pageID) {
		this.pageID = pageID;
	}
	public String getPageSubId() {
		return pageSubId;
	}
	public void setPageSubId(String pageSubId) {
		this.pageSubId = pageSubId;
	}
	public String getPageTitle() {
		return pageTitle;
	}
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	public String getPageUrl() {
		return pageUrl;
	}
	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}
	public String getPageDesc() {
		return pageDesc;
	}
	public void setPageDesc(String pageDesc) {
		this.pageDesc = pageDesc;
	}
	public String getPageStatus() {
		return pageStatus;
	}
	public void setPageStatus(String pageStatus) {
		this.pageStatus = pageStatus;
	}
	public String getPageType() {
		return pageType;
	}
	public void setPageType(String pageType) {
		this.pageType = pageType;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public int getIsSelect() {
		return isSelect;
	}
	public void setIsSelect(int isSelect) {
		this.isSelect = isSelect;
	}
	public int getIsSelectForUserType() {
		return isSelectForUserType;
	}
	public void setIsSelectForUserType(int isSelectForUserType) {
		this.isSelectForUserType = isSelectForUserType;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	@Override
	public String toString() {
		return "PageData [pageID=" + pageID + ", pageSubId=" + pageSubId
				+ ", pageTitle=" + pageTitle + ", pageUrl=" + pageUrl
				+ ", pageDesc=" + pageDesc + ", pageStatus=" + pageStatus
				+ ", pageType=" + pageType + ", orderBy=" + orderBy
				+ ", isSelect=" + isSelect + ", isSelectForUserType="
				+ isSelectForUserType + ", pageName=" + pageName + "]";
	}
	
	
}
