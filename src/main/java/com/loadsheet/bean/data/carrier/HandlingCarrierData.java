package com.loadsheet.bean.data.carrier;

public class HandlingCarrierData {
	//compcarrierid as carrier_id,company_id,airline_code,billing_addr1,billing_addr2,zip_code,city_name,country_code,status 
	
	private String carrierId;
	private String companyId;
	private String carrierCode;
	private String billingCode;
	private String billingCode2;
	private String zipCode;
	private String cityName;
	private String countryCode;
	private String satus;
	private String companyName;
	private String airlineName;
	
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	public String getCarrierId() {
		return carrierId;
	}
	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCarrierCode() {
		return carrierCode;
	}
	public void setCarrierCode(String carrierCode) {
		this.carrierCode = carrierCode;
	}
	public String getBillingCode() {
		return billingCode;
	}
	public void setBillingCode(String billingCode) {
		this.billingCode = billingCode;
	}
	public String getBillingCode2() {
		return billingCode2;
	}
	public void setBillingCode2(String billingCode2) {
		this.billingCode2 = billingCode2;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getSatus() {
		return satus;
	}
	public void setSatus(String satus) {
		this.satus = satus;
	}
	
	
}
