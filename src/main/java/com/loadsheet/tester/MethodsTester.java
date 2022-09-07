package com.loadsheet.tester;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Assert;

import com.loadsheet.bean.data.CSheet.LimitationOfLoadSheet;
import com.loadsheet.bean.data.ahmForm.ASheet3RevisyonData;
import com.loadsheet.bean.data.dowDoi.DowDoiData;
import com.loadsheet.bean.data.flight.AirCraft;
import com.loadsheet.bean.data.flight.Flight;
import com.loadsheet.bean.data.flight.LoadSheetFlightData;
import com.loadsheet.bean.data.flight.LoadSheetFlightOutputData;
import com.loadsheet.bean.data.user.UserHistoryData;
import com.loadsheet.process.ahmForm.AhmLoadProcess;
import com.loadsheet.process.ahmForm.DowDoiProcess;
import com.loadsheet.process.flight.AirCraftProcess;
import com.loadsheet.process.flight.FlightProcess;
import com.loadsheet.process.flight.GetLoadSheetFlightDetail;



public class MethodsTester {
		
	public String getFlightTester(){	
    	String retval="";
    	try {
    		String userLocation="all";
    		String departureDate="06/09/2019";
    		String userName="MUSTAFAA";
    		String userAirline="";
    	  	System.out.println("Start getFlightTester method...");
    		
        
    		FlightProcess prc=new FlightProcess();
    		List<Flight> flightList = new ArrayList<Flight>();
    		flightList=prc.getFlight(userLocation, departureDate, userName,userAirline);
        
        Assert.assertNotNull(flightList);	
        System.out.println("flightList.size="+flightList.size());
    		System.out.println("End getFlightTester method succesfull...");
    		
    		retval="getFlightTester succesfull flightList.size="+flightList.size()+" <br/>";
	} catch (Exception e) {
		retval="getFlightTester had some problems <br/>"+e.getMessage();
	}
  
    		return retval;
    }
	
	public String getAirCraftListTester(){	
    	String retval="";
    	try {
    		String capacity="0";
    		String registerName="";
    		int companyId=0;
    	  	System.out.println("Start getAirCraftListTester method...");
    		
    		AirCraftProcess airProc=new AirCraftProcess();
    		List<AirCraft> aircraftList=new ArrayList<AirCraft>();
    		aircraftList =(List<AirCraft>)airProc.getAirCraftList(capacity, registerName,companyId);
        
        Assert.assertNotNull(aircraftList);	
        System.out.println("aircraftList.size="+aircraftList.size());
    		System.out.println("End getAirCraftListTester method succesfull...");
    		
    		retval="getAirCraftListTester succesfull flightList.size="+aircraftList.size()+" <br/>";
	} catch (Exception e) {
		retval="getAirCraftListTester had some problems <br/>"+e.getMessage();
	}
  
    		return retval;
    }
	
	
	    public String getDowDoiValuesTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getDowDoiValuesTester method ...");
	    		String 		aircraft		="ATT/A320-164-ATLJET";
	    		int 			cockpit		=2;
	    		int	 		cabinCrew	=5;
	    		String 		pantry		="ONEWAYINT";
	    		String [] 	dowDoiVal 	=null;
	    		String [] 	dowDoivalExp	={  "43140","51.03" };
	        
	    		GetLoadSheetFlightDetail prc=new GetLoadSheetFlightDetail();
	        dowDoiVal=prc.getDowDoiValues(aircraft, cockpit, cabinCrew, pantry);
	        
	        Assert.assertArrayEquals(dowDoivalExp, dowDoiVal);	
	        System.out.println("dowDoiVal={"+dowDoiVal[0]+","+dowDoiVal[1]+"}");
	    		System.out.println("End getDowDoiValuesTester method succesfull...");
	    		
	    		retval="getDowDoiValuesTester succesfull dowDoiVal={"+dowDoiVal[0]+","+dowDoiVal[1]+"} <br/>";
		} catch (Exception e) {
			retval="getDowDoiValuesTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getAircraftRevisyonDataTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getAircraftRevisyonDataTester method ...");
	    		String 		aircraftCode		="ATT/A320-164-ATLJET";
	    		int 			revisionId		=0;
	        
	    		AhmLoadProcess prc=new AhmLoadProcess();
	    		ASheet3RevisyonData data=new ASheet3RevisyonData();
	        data=prc.getAircraftRevisyonData(aircraftCode, revisionId);
	        
	        Assert.assertNotNull(data);
	        System.out.println("ASheet3RevisyonData="+data);
	    		System.out.println("End getAircraftRevisyonDataTester method succesfull...");
	    		
	    		retval="getAircraftRevisyonDataTester succesfull data.getAircraftCode()="+data.getAircraftCode()+"  data.getRevisionId()="+data.getRevisionId()+ "<br/>";
		} catch (Exception e) {
			retval="getAircraftRevisyonDataTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getAircraftAllRevisyonListTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getAircraftAllRevisyonListTester method ...");
	    		String 		aircraftCode		="ATT/A320-164-ATLJET";
	    		int 			revisionId		=0;
	        
	    		AhmLoadProcess prc=new AhmLoadProcess();
	    		List<ASheet3RevisyonData>  rList=new ArrayList();
	    		rList=prc.getAircraftAllRevisyonList(aircraftCode, revisionId);
	        
	        Assert.assertNotNull(rList);
	        System.out.println("List<ASheet3RevisyonData>="+rList);
	    		System.out.println("End getAircraftAllRevisyonListTester method succesfull...");
	    		
	    		retval="getAircraftAllRevisyonListTester succesfull List size ="+rList.size();
		} catch (Exception e) {
			retval="getAircraftAllRevisyonListTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getAhmHistoryTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getAhmHistoryTester method ...");
	    		int 			revisionId		=1325;
	        
	    		AhmLoadProcess  prc=new AhmLoadProcess();
	    		List<UserHistoryData> historyList =prc.getAhmHistory(revisionId);
	        
	        Assert.assertNotNull(historyList);
	        System.out.println("List<UserHistoryData> size="+historyList.size());
	    		System.out.println("End getAhmHistoryTester method succesfull...");
	    		
	    		retval="getAhmHistoryTester succesfull historyList.size ="+historyList.size();
		} catch (Exception e) {
			retval="getAhmHistoryTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getEnvelopeLimitsTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getEnvelopeLimitsTester method ...");
	    		String 			loadSheetID		="2363";
	        
	    		GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
	    		LimitationOfLoadSheet[] envelopeLimits = glsfd.getEnvelopeLimits(loadSheetID);
	        
	        Assert.assertNotNull(envelopeLimits);
	        System.out.println("List<UserHistoryData>="+envelopeLimits);
	    		System.out.println("End getEnvelopeLimitsTester method succesfull...");
	    		
	    		retval="getEnvelopeLimitsTester succesfull envelopeLimits.size ="+envelopeLimits.length;
		} catch (Exception e) {
			retval="getEnvelopeLimitsTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getDowDoiLimitsTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getDowDoiLimitsTester method ...");
	    		int 			revisionId		=1325;
	        
	    		DowDoiProcess prc=new DowDoiProcess();
	    		List<DowDoiData> dowdoilimitlist=new ArrayList();
	    		dowdoilimitlist=prc.getDowDoiLimits(revisionId);
	        
	        Assert.assertNotNull(dowdoilimitlist);
	        System.out.println("List<DowDoiData>="+dowdoilimitlist);
	    		System.out.println("End getDowDoiLimitsTester method succesfull...");
	    		
	    		retval="getDowDoiLimitsTester succesfull dowdoilimitlist.size ="+dowdoilimitlist.size();
		} catch (Exception e) {
			retval="getDowDoiLimitsTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getFlightDetailTester(){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getFlightDetailTester method ...");
	    		String 			voyageCode		="20190909AYTKIVKK6729";
	    		int				companyId=0;
	    		
	        
	    		LoadSheetFlightData lfd = new LoadSheetFlightData();
	    		GetLoadSheetFlightDetail  glsfd = new GetLoadSheetFlightDetail();
	    		lfd = glsfd.getFlightDetail(voyageCode,companyId);
	        
	        Assert.assertNotNull(lfd);
	        System.out.println("LoadSheetFlightData="+lfd);
	    		System.out.println("End getFlightDetailTester method succesfull...");
	    		
	    		retval="getFlightDetailTester succesfull LoadSheetFlightData  flightNumber="+lfd.flightNumber +" ,departureDate="+lfd.departureDate;
		} catch (Exception e) {
			retval="getFlightDetailTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String getLoadSheetTester(HttpServletRequest request){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start getLoadSheetTester method ...");
	    	  	request.setAttribute("loadSheetID", "2363");
	        
	    		LoadSheetFlightOutputData lfd = new LoadSheetFlightOutputData();
	    		GetLoadSheetFlightDetail  glsfd = new GetLoadSheetFlightDetail();
	    		lfd = glsfd.getLoadSheet(request);
	        
	        Assert.assertNotNull(lfd);
	        System.out.println("LoadSheetFlightOutputData="+lfd);
	    		System.out.println("End getLoadSheetTester method succesfull...");
	    		
	    		retval="getLoadSheetTester succesfull LoadSheetFlightOutputData  AircraftVersion="+lfd.getAircraftVersion() +" ,Balancezfma="+lfd.getBalancezfmac();
		} catch (Exception e) {
			retval="getLoadSheetTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String calculateLoadSheetTester(HttpServletRequest request){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start calculateLoadSheetTester method ...");
	    	  	request.setAttribute("voyageCode", "20190909AYTKIVKK6729");
	    	  	request.setAttribute("flightNumber", "KK6729");
	    	  	request.setAttribute("from", "AYT");
	    	  	request.setAttribute("to", "KIV");
	    	  	request.setAttribute("date", "09/09/2019 00:35");
	    	  	request.setAttribute("aircraft", "ATR/A321-216-ATLJET");
	    	  	request.setAttribute("cockpit", "2");
	    	  	request.setAttribute("cabinCrew", "5");
	    	  	request.setAttribute("pantry", "ONEWAYINT");
	    	  	request.setAttribute("paxWeight", "standartFlight");
	    	  	request.setAttribute("takeOffFuel", "10000");
	    	  	request.setAttribute("tripFuel", "3500");
	    	  	request.setAttribute("dryOperatingIndex", "46.65");
	    	  	request.setAttribute("dryOperatingWeight", "49685");
	    	  	request.setAttribute("Pax0A", "57");
	    	  	request.setAttribute("Pax0B", "80");
	    	  	request.setAttribute("Pax0C", "78");
	    	  	request.setAttribute("hold1", "500");
	    	  	request.setAttribute("hold2", "500");
	    	  	request.setAttribute("hold3", "500");
	    	  	request.setAttribute("hold4", "500");
	    	  	request.setAttribute("hold5", "449");
	    	  	request.setAttribute("firstHoldTo", "KIV");
	    	  	request.setAttribute("firstHoldMale", "83");
	    	  	request.setAttribute("firstHoldFemale", "97");
	    	  	request.setAttribute("firstHoldAdt", "180");
	    	  	request.setAttribute("firstHoldChd", "35");
	    	  	request.setAttribute("firstHoldInf", "7");
	    	  	request.setAttribute("firstPaxBUS", "0");
	    	  	request.setAttribute("firstPaxECO", "215");
	    	  	request.setAttribute("firstPaxPAX", "215+7");
	    	  	request.setAttribute("firstHoldPad", "0");
	    	  	request.setAttribute("firstLegHoldTR1", "0");
	    	  	request.setAttribute("firstLegHoldB1", "500");
	    	  	request.setAttribute("firstLegHoldC1", "0");
	    	  	request.setAttribute("firstLegHoldM1", "0");
	    	  	request.setAttribute("firstLegHoldTotal1", "500");
	    	  	request.setAttribute("firstLegHoldTR2", "0");
	    	  	request.setAttribute("firstLegHoldB2", "500");
	    	  	request.setAttribute("firstLegHoldC2", "0");
	    	  	request.setAttribute("firstLegHoldM2", "0");
	    	  	request.setAttribute("firstLegHoldTotal2", "500");
	    	  	request.setAttribute("firstLegHoldTR3", "0");
	    	  	request.setAttribute("firstLegHoldB3", "500");
	    	  	request.setAttribute("firstLegHoldC3", "0");
	    	  	request.setAttribute("firstLegHoldM3", "0");
	    	  	request.setAttribute("firstLegHoldTotal3", "500");
	    	  	request.setAttribute("firstLegHoldTR4", "0");
	    	  	request.setAttribute("firstLegHoldB4", "500");
	    	  	request.setAttribute("firstLegHoldC4", "0");
	    	  	request.setAttribute("firstLegHoldM4", "0");
	    	  	request.setAttribute("firstLegHoldTotal4", "500");
	    	  	request.setAttribute("firstLegHoldTR5", "0");
	    	  	request.setAttribute("firstLegHoldB5", "449");
	    	  	request.setAttribute("firstLegHoldC5", "0");
	    	  	request.setAttribute("firstLegHoldM5", "0");
	    	  	request.setAttribute("firstLegHoldTotal5", "440");
	    	  	request.setAttribute("firstLegHoldTRTotal", "0");
	    	  	request.setAttribute("firstLegHoldBTotal", "2449");
	    	  	request.setAttribute("firstLegHoldCTotal", "0");
	    	  	request.setAttribute("firstLegHoldMTotal", "0");
	    	  	request.setAttribute("firstLegHoldTotalTotal", "2449");
	    	  	request.setAttribute("secondHoldTo", "");
	    	  	request.setAttribute("secondHoldMale", "0");
    	  		request.setAttribute("secondHoldFemale", "0");
            request.setAttribute("secondHoldAdt", "0");
            request.setAttribute("secondHoldChd", "0");
            request.setAttribute("secondHoldInf", "0");
            request.setAttribute("secondPaxBUS", "0");
            request.setAttribute("secondPaxECO", "0");
            request.setAttribute("secondPaxPAX", "0+0");
            request.setAttribute("secondHoldPad", "0");
            request.setAttribute("secondLegHoldTR1", "0");
            request.setAttribute("secondLegHoldB1", "0");
            request.setAttribute("secondLegHoldC1", "0");
            request.setAttribute("secondLegHoldM1", "0");
            request.setAttribute("secondLegHoldTotal1", "0");
            request.setAttribute("secondLegHoldTR2", "0");
            request.setAttribute("secondLegHoldB2", "0");
            request.setAttribute("secondLegHoldC2", "0");
            request.setAttribute("secondLegHoldM2", "0");
            request.setAttribute("secondLegHoldTotal2", "0");
            request.setAttribute("secondLegHoldTR3", "0");
            request.setAttribute("secondLegHoldB3", "0");
            request.setAttribute("secondLegHoldC3", "0");
            request.setAttribute("secondLegHoldM3", "0");
            request.setAttribute("secondLegHoldTotal3", "0");
            request.setAttribute("secondLegHoldTR4", "0");
            request.setAttribute("secondLegHoldB4", "0");
            request.setAttribute("secondLegHoldC4", "0");
            request.setAttribute("secondLegHoldM4", "0");
            request.setAttribute("secondLegHoldTotal4", "0");
            request.setAttribute("secondLegHoldTR5", "0");
            request.setAttribute("secondLegHoldB5", "0");
            request.setAttribute("secondLegHoldC5", "0");
            request.setAttribute("secondLegHoldM5", "0");
            request.setAttribute("secondLegHoldTotal5", "0");
            request.setAttribute("secondLegHoldTRTotal", "0");
            request.setAttribute("secondLegHoldBTotal", "0");
            request.setAttribute("secondLegHoldCTotal", "0");
            request.setAttribute("secondLegHoldMTotal", "0");
            request.setAttribute("secondLegHoldTotalTotal", "0");
            request.setAttribute("preparedByParam", "AKTAS MUSTAFA");
            request.setAttribute("checkedByParam", "test");
            request.setAttribute("approvedByParam", "test");
            request.setAttribute("captainNoteParam", "");
	        
	    	  	LoadSheetFlightOutputData lfd = new LoadSheetFlightOutputData();
	    		GetLoadSheetFlightDetail  glsfd = new GetLoadSheetFlightDetail();
	    		lfd = glsfd.calculateLoadSheet(request);
	        
	        Assert.assertNotNull(lfd);
	        System.out.println("calculateLoadSheetTester="+lfd);
	    		System.out.println("End calculateLoadSheetTester method succesfull...");
	    		
	    		retval="calculateLoadSheetTester succesfull LoadSheetFlightOutputData  AircraftVersion="+lfd.getAircraftVersion() +" ,Balancezfma="+lfd.getBalancezfmac();
		} catch (Exception e) {
			retval="calculateLoadSheetTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    public String holdDistributionTester(HttpServletRequest request){	
	    	String retval="";
	    	try {
	    	  	System.out.println("Start holdDistributionTester method ...");

	    	  	request.setAttribute("voyageCode", "20190909AYTKIVKK6729");
	    	  	request.setAttribute("flightNumber", "KK6729");
	    	  	request.setAttribute("from", "AYT");
	    	  	request.setAttribute("to", "KIV");
	    	  	request.setAttribute("date", "09/09/2019 00:35");
	    	  	request.setAttribute("aircraft", "ATR/A321-216-ATLJET");
	    	  	request.setAttribute("cockpit", "2");
	    	  	request.setAttribute("cabinCrew", "5");
	    	  	request.setAttribute("pantry", "ONEWAYINT");
	    	  	request.setAttribute("paxWeight", "standartFlight");
	    	  	request.setAttribute("takeOffFuel", "10000");
	    	  	request.setAttribute("tripFuel", "3500");
	    	  	request.setAttribute("dryOperatingIndex", "46.65");
	    	  	request.setAttribute("dryOperatingWeight", "49685");
	    	  	request.setAttribute("Pax0A", "57");
	    	  	request.setAttribute("Pax0B", "80");
	    	  	request.setAttribute("Pax0C", "78");
	    	  	request.setAttribute("hold1", "500");
	    	  	request.setAttribute("hold2", "500");
	    	  	request.setAttribute("hold3", "500");
	    	  	request.setAttribute("hold4", "500");
	    	  	request.setAttribute("hold5", "449");
	    	  	request.setAttribute("firstHoldTo", "KIV");
	    	  	request.setAttribute("firstHoldMale", "83");
	    	  	request.setAttribute("firstHoldFemale", "97");
	    	  	request.setAttribute("firstHoldAdt", "180");
	    	  	request.setAttribute("firstHoldChd", "35");
	    	  	request.setAttribute("firstHoldInf", "7");
	    	  	request.setAttribute("firstPaxBUS", "0");
	    	  	request.setAttribute("firstPaxECO", "215");
	    	  	request.setAttribute("firstPaxPAX", "215+7");
	    	  	request.setAttribute("firstHoldPad", "0");
	    	  	request.setAttribute("firstLegHoldTR1", "0");
	    	  	request.setAttribute("firstLegHoldB1", "500");
	    	  	request.setAttribute("firstLegHoldC1", "0");
	    	  	request.setAttribute("firstLegHoldM1", "0");
	    	  	request.setAttribute("firstLegHoldTotal1", "500");
	    	  	request.setAttribute("firstLegHoldTR2", "0");
	    	  	request.setAttribute("firstLegHoldB2", "500");
	    	  	request.setAttribute("firstLegHoldC2", "0");
	    	  	request.setAttribute("firstLegHoldM2", "0");
	    	  	request.setAttribute("firstLegHoldTotal2", "500");
	    	  	request.setAttribute("firstLegHoldTR3", "0");
	    	  	request.setAttribute("firstLegHoldB3", "500");
	    	  	request.setAttribute("firstLegHoldC3", "0");
	    	  	request.setAttribute("firstLegHoldM3", "0");
	    	  	request.setAttribute("firstLegHoldTotal3", "500");
	    	  	request.setAttribute("firstLegHoldTR4", "0");
	    	  	request.setAttribute("firstLegHoldB4", "500");
	    	  	request.setAttribute("firstLegHoldC4", "0");
	    	  	request.setAttribute("firstLegHoldM4", "0");
	    	  	request.setAttribute("firstLegHoldTotal4", "500");
	    	  	request.setAttribute("firstLegHoldTR5", "0");
	    	  	request.setAttribute("firstLegHoldB5", "449");
	    	  	request.setAttribute("firstLegHoldC5", "0");
	    	  	request.setAttribute("firstLegHoldM5", "0");
	    	  	request.setAttribute("firstLegHoldTotal5", "440");
	    	  	request.setAttribute("firstLegHoldTRTotal", "0");
	    	  	request.setAttribute("firstLegHoldBTotal", "2449");
	    	  	request.setAttribute("firstLegHoldCTotal", "0");
	    	  	request.setAttribute("firstLegHoldMTotal", "0");
	    	  	request.setAttribute("firstLegHoldTotalTotal", "2449");
	    	  	request.setAttribute("secondHoldTo", "");
	    	  	request.setAttribute("secondHoldMale", "0");
    	  		request.setAttribute("secondHoldFemale", "0");
            request.setAttribute("secondHoldAdt", "0");
            request.setAttribute("secondHoldChd", "0");
            request.setAttribute("secondHoldInf", "0");
            request.setAttribute("secondPaxBUS", "0");
            request.setAttribute("secondPaxECO", "0");
            request.setAttribute("secondPaxPAX", "0+0");
            request.setAttribute("secondHoldPad", "0");
            request.setAttribute("secondLegHoldTR1", "0");
            request.setAttribute("secondLegHoldB1", "0");
            request.setAttribute("secondLegHoldC1", "0");
            request.setAttribute("secondLegHoldM1", "0");
            request.setAttribute("secondLegHoldTotal1", "0");
            request.setAttribute("secondLegHoldTR2", "0");
            request.setAttribute("secondLegHoldB2", "0");
            request.setAttribute("secondLegHoldC2", "0");
            request.setAttribute("secondLegHoldM2", "0");
            request.setAttribute("secondLegHoldTotal2", "0");
            request.setAttribute("secondLegHoldTR3", "0");
            request.setAttribute("secondLegHoldB3", "0");
            request.setAttribute("secondLegHoldC3", "0");
            request.setAttribute("secondLegHoldM3", "0");
            request.setAttribute("secondLegHoldTotal3", "0");
            request.setAttribute("secondLegHoldTR4", "0");
            request.setAttribute("secondLegHoldB4", "0");
            request.setAttribute("secondLegHoldC4", "0");
            request.setAttribute("secondLegHoldM4", "0");
            request.setAttribute("secondLegHoldTotal4", "0");
            request.setAttribute("secondLegHoldTR5", "0");
            request.setAttribute("secondLegHoldB5", "0");
            request.setAttribute("secondLegHoldC5", "0");
            request.setAttribute("secondLegHoldM5", "0");
            request.setAttribute("secondLegHoldTotal5", "0");
            request.setAttribute("secondLegHoldTRTotal", "0");
            request.setAttribute("secondLegHoldBTotal", "0");
            request.setAttribute("secondLegHoldCTotal", "0");
            request.setAttribute("secondLegHoldMTotal", "0");
            request.setAttribute("secondLegHoldTotalTotal", "0");
            request.setAttribute("preparedByParam", "AKTAS MUSTAFA");
            request.setAttribute("checkedByParam", "test");
            request.setAttribute("approvedByParam", "test");
            request.setAttribute("captainNoteParam", "");
	    	  	
	    	  	
	    		
	    		String holdArray[] = null;
	    		GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
	    		holdArray = glsfd.holdDistribution(request);
	        
	        Assert.assertNotNull(holdArray);
	        System.out.println("holdArray="+holdArray);
	    		System.out.println("End holdDistributionTester method succesfull...");
	    		
	    		retval="holdDistributionTester succesfull holdArray.length="+holdArray.length ;
		} catch (Exception e) {
			retval="holdDistributionTester had some problems"+e.getMessage();
		}
	  
	    		return retval;
	    }
	    
	    
}
