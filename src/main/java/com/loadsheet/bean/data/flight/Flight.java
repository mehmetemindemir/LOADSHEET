package com.loadsheet.bean.data.flight;


public class Flight {
	public String AIRLINE = null;
	public String ORIGIN_CODE = null;
	public String ORIGIN_DESC = null;
	public String DESTINATION_CODE = null;
	public String DESTINAION_DESC = null;
	public String FLIGHT_NUMBER = null;
	public String DEPARTURE_DATE = null;
	public String DEPARTURE_TIME = null;
	public String DEPARTURE_DATE_GMT = null;
	public String ARRIVAL_DATE = null;
	public String ARRIVAL_TIME = null;
	public String ARRIVAL_DATE_GMT = null;
	public String AIRCRAFT = null;
	public String CHECKIN_STATUS = null;
	public String BOARDING_STATUS = null;
	public String FLIGHT_STATUS = null;
	public String GATE_NUMBER = null;
	public String VOYAGE_CODE = null;
	public int BUSINESS = 0;
	public String DEPART_DATE_MMDD = null;
	public int MESSAGE_TYPE = 0;
	public String APIS_TDI_MESSAGE = null;
	public String APIS_TDN_MESSAGE = null;
	public String APIS_TDI_SENDDATE = null;
	public String APIS_TDN_SENDDATE = null;
	public String ISAPIS_REQUIRED = null;
	public String FLIGHT_TYPE = null;
	public String CABIN = null;
	public String TOTALPAX = null;
	public String CHECKEDPAX = null;
	public String NOTBOARDEDPAX = null;
	public int CABIN_COLOR_ECO = 0;
	public int CABIN_COLOR_BUS = 0;
	public int TOTAL_PAX_ECO = 0;
	public int TOTAL_PAX_BUS = 0;
	public String INTDOM = null;
	public String CON_BP_FLAG = null;
	public int isLoadSheetExists = 0;
	private int flightRevisonState;
	private int	csvFileCount;
	private String busBagAllowence;
	private String ecoBagAllowence;
	private String isAHMExists;
	
	public int getFlightRevisonState() {
		return flightRevisonState;
	}
	public void setFlightRevisonState(int flightRevisonState) {
		this.flightRevisonState = flightRevisonState;
	}
	public int getCsvFileCount() {
		return csvFileCount;
	}
	public void setCsvFileCount(int csvFileCount) {
		this.csvFileCount = csvFileCount;
	}
	public String getBusBagAllowence() {
		return busBagAllowence;
	}
	public void setBusBagAllowence(String busBagAllowence) {
		this.busBagAllowence = busBagAllowence;
	}
	public String getEcoBagAllowence() {
		return ecoBagAllowence;
	}
	public void setEcoBagAllowence(String ecoBagAllowence) {
		this.ecoBagAllowence = ecoBagAllowence;
	}
	public String getIsAHMExists() {
		return isAHMExists;
	}
	public void setIsAHMExists(String isAHMExists) {
		this.isAHMExists = isAHMExists;
	}
	
}
