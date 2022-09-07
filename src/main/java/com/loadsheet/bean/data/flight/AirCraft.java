package com.loadsheet.bean.data.flight;

public class AirCraft {
	private String 	aircraftBrand;
	private String 	aircraftType;
	private String 	aircraftVersion;
	private String 	registerName;
	private String 	capacity;
	private String 	status;
	private String 	aircraftCode;
	private int 	wingsStart;
	private int		wingsEnd;
	private int 	businessLine;
	private String carrierCode;
	private String isAHMExists;
	
	
	public String getIsAHMExists() {
		return isAHMExists;
	}
	public void setIsAHMExists(String isAHMExists) {
		this.isAHMExists = isAHMExists;
	}
	public int getBusinessLine() {
		return businessLine;
	}
	public void setBusinessLine(int businessLine) {
		this.businessLine = businessLine;
	}
	public String getCarrierCode() {
		return carrierCode;
	}
	public void setCarrierCode(String carrierCode) {
		this.carrierCode = carrierCode;
	}
	public String getAircraftBrand() {
		return aircraftBrand;
	}
	public void setAircraftBrand(String aircraftBrand) {
		this.aircraftBrand = aircraftBrand;
	}
	public String getAircraftType() {
		return aircraftType;
	}
	public void setAircraftType(String aircraftType) {
		this.aircraftType = aircraftType;
	}
	public String getAircraftVersion() {
		return aircraftVersion==null?"":aircraftVersion;
	}
	public void setAircraftVersion(String aircraftVersion) {
		this.aircraftVersion = aircraftVersion;
	}
	public String getRegisterName() {
		return  registerName==null?"":registerName;
	}
	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAircraftCode() {
		return aircraftCode;
	}
	public void setAircraftCode(String aircraftCode) {
		this.aircraftCode = aircraftCode;
	}
	public int getWingsStart() {
		return wingsStart;
	}
	public void setWingsStart(int wingsStart) {
		this.wingsStart = wingsStart;
	}
	public int getWingsEnd() {
		return wingsEnd;
	}
	public void setWingsEnd(int wingsEnd) {
		this.wingsEnd = wingsEnd;
	}
}
