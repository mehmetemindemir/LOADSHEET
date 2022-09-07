<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId			= Helper.request2String(request, "bagweightId");
	String		result				= "";
	int 			recordCount			= Helper.request2int(request, "formRecordCount");
	String		tailnumber			= "";
	String		rampTaxi				= "";
	String		takeOff 				= "";
	String		zeroFuel				= "";
	String		landing				= "";
	
	AhmLoadProcess prd=new AhmLoadProcess();		
	tailnumber			= Helper.request2String(request, "tailnumber");
	rampTaxi				= Helper.request2String(request, "rampTaxi");
	takeOff				= Helper.request2String(request, "takeOff");
	zeroFuel				= Helper.request2String(request, "zeroFuel");
	landing				= Helper.request2String(request, "landing");
	result=prd.createAircraftWeightLimitations(bagweightId, tailnumber, rampTaxi, takeOff, zeroFuel, landing, users.getUserName());
		
	out.print(result);
%>