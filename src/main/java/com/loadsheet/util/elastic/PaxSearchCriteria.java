package com.loadsheet.util.elastic;

import java.util.Date;

public class PaxSearchCriteria {
	 	private String  paxDeparture;
	    private String  paxName;
	    private Date    paxDepartureDate;
	    private String  paxSearchText;
	    private String  keyword;
		public String getPaxDeparture() {
			return paxDeparture;
		}
		public void setPaxDeparture(String paxDeparture) {
			this.paxDeparture = paxDeparture;
		}
		public String getPaxName() {
			return paxName;
		}
		public void setPaxName(String paxName) {
			this.paxName = paxName;
		}
		public Date getPaxDepartureDate() {
			return paxDepartureDate;
		}
		public void setPaxDepartureDate(Date paxDepartureDate) {
			this.paxDepartureDate = paxDepartureDate;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getPaxSearchText() {
			return paxSearchText;
		}
		public void setPaxSearchText(String paxSearchText) {
			this.paxSearchText = paxSearchText;
		}
}
