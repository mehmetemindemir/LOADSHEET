package com.loadsheet.bean.data.flight;


public class LoadSheetFlightOutputData{
	
	private int loadSheetID = 0; 
	private int dow_value = 0;
	private double doi_value = 0;
	private int tofw_value = 0;
	private int paxweight_value = 0; 
	private int holdsvalue = 0;
	private int opewei = 0;
	private int zerofuelwei = 0;
	private int totaltrfload = 0;
	private int allowedtrfload = 0;
	private int underloadlmc = 0;
	private String trafficloadparam = null; 
	private int limitzfactual = 0;
	private int limittoactual = 0;
	private int limitlactual = 0;
	private int limitzfmax = 0;
	private int limittomax = 0;
	private int limitlmax = 0;
	private double balancezfforward = 0; 
	private double balancezfactual = 0;
	private double balancezfaft = 0;
	private double balancezfmac = 0;
	private double balancetoforward = 0; 
	private double balancetoactual = 0;
	private double balancetoaft = 0;
	private double balancetomac = 0;
	private double balancelforward = 0;
	private double balancelactual = 0;
	private double balancelaft = 0;
	private double balancelmac = 0;
	private double stabtrim = 0;
	private String loadSheetRevID = null;
	private String loadSheetTime = null;
	private String loadSheetDate = null;
	private String airlineName = null;
	private String originCode = null;
	private String destinationCode = null;
	private String flightNumber = null;
	private String registration = null;
	private int cockpit = 0;
	private int cabin = 0;
	private String holdDistribution = null;
	private int maleTotal = 0;
	private int femaleTotal = 0;
	private int childTotal = 0;
	private int InfTotal = 0;
	private int tripFuel = 0;
	private String preparedBy = null;
	private String checkedBy = null;
	private String approvedBy = null;
	private String pantry = null;
	private String trafficLoadCalcType = null;
	private int zoneAPax = 0;
	private int zoneBPax = 0;
	private int zoneCPax = 0;
	private int zoneDPax = 0;
	private int paxBus = 0;
	private int paxEco = 0;
	private String departureDate = null;
	private String departureTime = null;
	private String captainNote = null;
	private String paxDistrubition = null;
	
	
	public String getPaxDistrubition() {
		return paxDistrubition;
	}
	public void setPaxDistrubition(String paxDistrubition) {
		this.paxDistrubition = paxDistrubition;
	}
	public String getCaptainNote() {
		return captainNote;
	}
	public void setCaptainNote(String captainNote) {
		this.captainNote = captainNote;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public int getPaxBus() {
		return paxBus;
	}
	public void setPaxBus(int paxBus) {
		this.paxBus = paxBus;
	}
	public int getPaxEco() {
		return paxEco;
	}
	public void setPaxEco(int paxEco) {
		this.paxEco = paxEco;
	}
	public int getZoneAPax() {
		return zoneAPax;
	}
	public void setZoneAPax(int zoneAPax) {
		this.zoneAPax = zoneAPax;
	}
	public int getZoneBPax() {
		return zoneBPax;
	}
	public void setZoneBPax(int zoneBPax) {
		this.zoneBPax = zoneBPax;
	}
	public int getZoneCPax() {
		return zoneCPax;
	}
	public void setZoneCPax(int zoneCPax) {
		this.zoneCPax = zoneCPax;
	}
	public int getZoneDPax() {
		return zoneDPax;
	}
	public void setZoneDPax(int zoneDPax) {
		this.zoneDPax = zoneDPax;
	}
	public String getPantry() {
		return pantry;
	}
	public void setPantry(String pantry) {
		this.pantry = pantry;
	}
	public String getTrafficLoadCalcType() {
		return trafficLoadCalcType;
	}
	public void setTrafficLoadCalcType(String trafficLoadCalcType) {
		this.trafficLoadCalcType = trafficLoadCalcType;
	}
	public String getPreparedBy() {
		return preparedBy;
	}
	public void setPreparedBy(String preparedBy) {
		this.preparedBy = preparedBy;
	}
	public String getCheckedBy() {
		return checkedBy;
	}
	public void setCheckedBy(String checkedBy) {
		this.checkedBy = checkedBy;
	}
	public String getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}
	public int getTripFuel() {
		return tripFuel;
	}
	public void setTripFuel(int tripFuel) {
		this.tripFuel = tripFuel;
	}
	public int getMaleTotal() {
		return maleTotal;
	}
	public void setMaleTotal(int maleTotal) {
		this.maleTotal = maleTotal;
	}
	public int getFemaleTotal() {
		return femaleTotal;
	}
	public void setFemaleTotal(int femaleTotal) {
		this.femaleTotal = femaleTotal;
	}
	public int getChildTotal() {
		return childTotal;
	}
	public void setChildTotal(int childTotal) {
		this.childTotal = childTotal;
	}
	public int getInfTotal() {
		return InfTotal;
	}
	public void setInfTotal(int infTotal) {
		InfTotal = infTotal;
	}
	public String getHoldDistribution() {
		return holdDistribution;
	}
	public void setHoldDistribution(String holdDistribution) {
		this.holdDistribution = holdDistribution;
	}
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	public int getCockpit() {
		return cockpit;
	}
	public void setCockpit(int cockpit) {
		this.cockpit = cockpit;
	}
	public int getCabin() {
		return cabin;
	}
	public void setCabin(int cabin) {
		this.cabin = cabin;
	}
	public String getAircraftVersion() {
		return aircraftVersion;
	}
	public void setAircraftVersion(String aircraftVersion) {
		this.aircraftVersion = aircraftVersion;
	}
	private String aircraftVersion = null;
	
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	public String getOriginCode() {
		return originCode;
	}
	public void setOriginCode(String originCode) {
		this.originCode = originCode;
	}
	public String getDestinationCode() {
		return destinationCode;
	}
	public void setDestinationCode(String destinationCode) {
		this.destinationCode = destinationCode;
	}
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getLoadSheetTime() {
		return loadSheetTime;
	}
	public void setLoadSheetTime(String loadSheetTime) {
		this.loadSheetTime = loadSheetTime;
	}
	public String getLoadSheetDate() {
		return loadSheetDate;
	}
	public void setLoadSheetDate(String loadSheetDate) {
		this.loadSheetDate = loadSheetDate;
	}
	public String getLoadSheetRevID() {
		return loadSheetRevID;
	}
	public void setLoadSheetRevID(String loadSheetRevID) {
		this.loadSheetRevID = loadSheetRevID;
	}
	public int getLoadSheetID() {
		return loadSheetID;
	}
	public void setLoadSheetID(int loadSheetID) {
		this.loadSheetID = loadSheetID;
	}
	public int getDow_value() {
		return dow_value;
	}
	public void setDow_value(int dow_value) {
		this.dow_value = dow_value;
	}
	public double getDoi_value() {
		return doi_value;
	}
	public void setDoi_value(double doi_value) {
		this.doi_value = doi_value;
	}
	public int getTofw_value() {
		return tofw_value;
	}
	public void setTofw_value(int tofw_value) {
		this.tofw_value = tofw_value;
	}
	public int getPaxweight_value() {
		return paxweight_value;
	}
	public void setPaxweight_value(int paxweight_value) {
		this.paxweight_value = paxweight_value;
	}
	public int getHoldsvalue() {
		return holdsvalue;
	}
	public void setHoldsvalue(int holdsvalue) {
		this.holdsvalue = holdsvalue;
	}
	public int getOpewei() {
		return opewei;
	}
	public void setOpewei(int opewei) {
		this.opewei = opewei;
	}
	public int getZerofuelwei() {
		return zerofuelwei;
	}
	public void setZerofuelwei(int zerofuelwei) {
		this.zerofuelwei = zerofuelwei;
	}
	public int getTotaltrfload() {
		return totaltrfload;
	}
	public void setTotaltrfload(int totaltrfload) {
		this.totaltrfload = totaltrfload;
	}
	public int getAllowedtrfload() {
		return allowedtrfload;
	}
	public void setAllowedtrfload(int allowedtrfload) {
		this.allowedtrfload = allowedtrfload;
	}
	public int getUnderloadlmc() {
		return underloadlmc;
	}
	public void setUnderloadlmc(int underloadlmc) {
		this.underloadlmc = underloadlmc;
	}
	public String getTrafficloadparam() {
		return trafficloadparam;
	}
	public void setTrafficloadparam(String trafficloadparam) {
		this.trafficloadparam = trafficloadparam;
	}
	public int getLimitzfactual() {
		return limitzfactual;
	}
	public void setLimitzfactual(int limitzfactual) {
		this.limitzfactual = limitzfactual;
	}
	public int getLimittoactual() {
		return limittoactual;
	}
	public void setLimittoactual(int limittoactual) {
		this.limittoactual = limittoactual;
	}
	public int getLimitlactual() {
		return limitlactual;
	}
	public void setLimitlactual(int limitlactual) {
		this.limitlactual = limitlactual;
	}
	public int getLimitzfmax() {
		return limitzfmax;
	}
	public void setLimitzfmax(int limitzfmax) {
		this.limitzfmax = limitzfmax;
	}
	public int getLimittomax() {
		return limittomax;
	}
	public void setLimittomax(int limittomax) {
		this.limittomax = limittomax;
	}
	public int getLimitlmax() {
		return limitlmax;
	}
	public void setLimitlmax(int limitlmax) {
		this.limitlmax = limitlmax;
	}
	public double getBalancezfforward() {
		return balancezfforward;
	}
	public void setBalancezfforward(double balancezfforward) {
		this.balancezfforward = balancezfforward;
	}
	public double getBalancezfactual() {
		return balancezfactual;
	}
	public void setBalancezfactual(double balancezfactual) {
		this.balancezfactual = balancezfactual;
	}
	public double getBalancezfaft() {
		return balancezfaft;
	}
	public void setBalancezfaft(double balancezfaft) {
		this.balancezfaft = balancezfaft;
	}
	public double getBalancezfmac() {
		return balancezfmac;
	}
	public void setBalancezfmac(double balancezfmac) {
		this.balancezfmac = balancezfmac;
	}
	public double getBalancetoforward() {
		return balancetoforward;
	}
	public void setBalancetoforward(double balancetoforward) {
		this.balancetoforward = balancetoforward;
	}
	public double getBalancetoactual() {
		return balancetoactual;
	}
	public void setBalancetoactual(double balancetoactual) {
		this.balancetoactual = balancetoactual;
	}
	public double getBalancetoaft() {
		return balancetoaft;
	}
	public void setBalancetoaft(double balancetoaft) {
		this.balancetoaft = balancetoaft;
	}
	public double getBalancetomac() {
		return balancetomac;
	}
	public void setBalancetomac(double balancetomac) {
		this.balancetomac = balancetomac;
	}
	public double getBalancelforward() {
		return balancelforward;
	}
	public void setBalancelforward(double balancelforward) {
		this.balancelforward = balancelforward;
	}
	public double getBalancelactual() {
		return balancelactual;
	}
	public void setBalancelactual(double balancelactual) {
		this.balancelactual = balancelactual;
	}
	public double getBalancelaft() {
		return balancelaft;
	}
	public void setBalancelaft(double balancelaft) {
		this.balancelaft = balancelaft;
	}
	public double getBalancelmac() {
		return balancelmac;
	}
	public void setBalancelmac(double balancelmac) {
		this.balancelmac = balancelmac;
	}
	public double getStabtrim() {
		return stabtrim;
	}
	public void setStabtrim(double stabtrim) {
		this.stabtrim = stabtrim;
	}

	
	
} 