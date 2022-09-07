package com.loadsheet.bean.data.flight;

public class LoadSheetFlightData{
	

	public String voyageCode = null;
	public int companyID = 0;
	public String departureDate = null;
	public String originCode = null;
	public String originDest = null;
	public String destinationCode = null;
	public String destinationDesc = null;
	//public String secondDestinationCode = null;
	//public String secondDestinationDesc = null;
	public String flightNumber = null;
	public String aircraft = null;
	public int zoneA = 0;
	public int zoneB = 0;
	public int zoneC = 0;
	public int zoneD = 0;
	public String firstLegTo = null;
	public int firstLegMale = 0;
	public int firstLegFeMale = 0;
	public int firstLegADT = 0;
	public int firstLegCHD = 0;
	public int firstLegINF = 0;
	public int firstLegPAD = 0;
	public int isSecondLeg = 0;
	public String secondLegTo = null;
	public int secondLegMale = 0;
	public int secondLegFeMale = 0;
	public int secondLegADT = 0;
	public int secondLegCHD = 0;
	public int secondLegINF = 0;
	public int secondLegPAD = 0;
	public int zoneALimit = 0;
	public int zoneBLimit = 0;
	public int zoneCLimit = 0;
	public int zoneDLimit = 0;
	public int totalPaxLggWeight = 0;
	
	public int zoneAMale = 0;
	public int zoneAFemale = 0;
	public int zoneAChild = 0;
	public int zoneAInf = 0;
	public int zoneBMale = 0;
	public int zoneBFemale = 0;
	public int zoneBChild = 0;
	public int zoneBInf = 0;
	public int zoneCMale = 0;
	public int zoneCFemale = 0;
	public int zoneCChild = 0;
	public int zoneCInf = 0;
	public int zoneDMale = 0;
	public int zoneDFemale = 0;
	public int zoneDChild = 0;
	public int zoneDInf = 0;
	
	public int maxHold1 = 0;
	public int maxHold2 = 0;
	public int maxHold3 = 0;
	public int maxHold4 = 0;
	public int maxHold5 = 0;
	
    public String revNo				= null;
    public int actualCockpit		= 0;
    public int actualCabin	    	= 0;
    public String actualPantry		= null;
    public String actualPaxWeight	= null;
    public int actualTakeOffFuel	= 0;
    public int actualTripFuel		= 0;
    public int actualPAD		    = 0;
    public int actualHold1	    	= 0;
    public int actualHold2       	= 0;
    public int actualHold3       	= 0;
    public int actualHold4       	= 0;
    public int actualHold5       	= 0;
    public int actualHold1TR     	= 0;
    public int actualHold1B      	= 0;
    public int actualHold1C      	= 0;
    public int actualHold1M     	= 0;
    public int actualHold2TR	    = 0;
    public int actualHold2B     	= 0;
    public int actualHold2C		    = 0;
    public int actualHold2M	    	= 0;
    public int actualHold3TR     	= 0;
    public int actualHold3B      	= 0;
    public int actualHold3C      	= 0;
    public int actualHold3M      	= 0;
    public int actualHold4TR     	= 0;
    public int actualHold4B      	= 0;
    public int actualHold4C      	= 0;
    public int actualHold4M      	= 0;
    public int actualHold5TR     	= 0;
    public int actualHold5B      	= 0;
    public int actualHold5C      	= 0;
    public int actualHold5M      	= 0;
    public int actualHold1TRScnd  	= 0;
    public int actualHold1BScnd  	= 0;
    public int actualHold1CScnd  	= 0;
    public int actualHold1MScnd 	= 0;
    public int actualHold2TRScnd    = 0;
    public int actualHold2BScnd 	= 0;
    public int actualHold2CScnd	    = 0;
    public int actualHold2MScnd    	= 0;
    public int actualHold3TRScnd   	= 0;
    public int actualHold3BScnd    	= 0;
    public int actualHold3CScnd    	= 0;
    public int actualHold3MScnd    	= 0;
    public int actualHold4TRScnd   	= 0;
    public int actualHold4BScnd    	= 0;
    public int actualHold4CScnd    	= 0;
    public int actualHold4MScnd    	= 0;
    public int actualHold5TRScnd   	= 0;
    public int actualHold5BScnd    	= 0;
    public int actualHold5CScnd    	= 0;
    public int actualHold5MScnd    	= 0;
    public String preparedBy	    = null;
    public String checkedBy	        = null;
    public String approvedBy        = null;
    public double calcDOI           = 0;
    public int calcDOW	       	 	= 0;
    public int calcTOFW          	= 0;
    public int calcOW            	= 0;
    public int calcPW            	= 0;
    public int calcHW            	= 0;
    public int calcZFW           	= 0;
    public int calcTTL           	= 0;
    public int calcATL           	= 0;
    public int calcULBLM	        = 0;
    public int calcLimitZFW      	= 0;
    public int calcLimitZFWMax   	= 0;
    public int calcLimitTO       	= 0;
    public int calcLimitTOMax    	= 0;
    public int calcLimitLW       	= 0;
    public int calcLimitLWMax		= 0;
    public double calcBlncFwdZFW	= 0;
    public double calcBlncActZFW	= 0;
    public double calcBlncAftZFW	= 0;
    public double calcBlncMacZFW	= 0;
    public double calcBlncFwdTOW	= 0;
    public double calcBlncActTOW	= 0;
    public double calcBlncAftTOW	= 0;
    public double calcBlncMacTOW	= 0;
    public double calcBlncFwdLDW	= 0;
    public double calcBlncActLDW	= 0;
    public double calcBlncAftLDW	= 0;
    public double calcBlncMacLDW	= 0;
    public double stabTrim         	= 0;
    public int firstPaxBus			= 0;
    public int firstPaxEco			= 0;
    public int secondPaxBus			= 0;
    public int secondPaxEco			= 0;
    public String captain_note		= null;
    public String secondPaxStr		= null;
    public String firstPaxStr		= null;
    
    
	
	
}