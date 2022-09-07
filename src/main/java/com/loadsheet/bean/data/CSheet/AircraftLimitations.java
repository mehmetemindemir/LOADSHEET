package com.loadsheet.bean.data.CSheet;

public class AircraftLimitations {
	private String status;
	private String aircraftReg;
	private int rampTaxi;
	private int takeOff;
	private int zeroFuel;
	private int landing;
	private int  ahmRevId;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAircraftReg() {
		return aircraftReg;
	}
	public void setAircraftReg(String aircraftReg) {
		this.aircraftReg = aircraftReg;
	}
	public int getRampTaxi() {
		return rampTaxi;
	}
	public void setRampTaxi(int rampTaxi) {
		this.rampTaxi = rampTaxi;
	}
	public int getTakeOff() {
		return takeOff;
	}
	public void setTakeOff(int takeOff) {
		this.takeOff = takeOff;
	}
	public int getZeroFuel() {
		return zeroFuel;
	}
	public void setZeroFuel(int zeroFuel) {
		this.zeroFuel = zeroFuel;
	}
	public int getLanding() {
		return landing;
	}
	public void setLanding(int landing) {
		this.landing = landing;
	}
	public int getAhmRevId() {
		return ahmRevId;
	}
	public void setAhmRevId(int ahmRevId) {
		this.ahmRevId = ahmRevId;
	}
	

}
