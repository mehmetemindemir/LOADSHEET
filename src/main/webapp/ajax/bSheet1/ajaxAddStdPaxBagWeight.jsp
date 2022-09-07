<%@page import="com.loadsheet.process.ahmForm.BSheet1Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		result		= "";
	int 			recordCount	= 5;
	
	String		passangerType	= "";
	String		standart			= "";
	String		allFlights		= "";
	String		holidayCharter	= "";
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int 			spwId				=0;
	
	BSheet1Process prd=new BSheet1Process();
	
	prd.updateAllStdPaxBagWeightStatus(bagweightId, users.getUserName());
	for(int i=1;i<=recordCount;i++){
		passangerType	= Helper.request2String(request, "passangerType_"+i);
		standart			= Helper.request2String(request, "standart_"+i);
		allFlights		= Helper.request2String(request, "allFlights_"+i);
		holidayCharter	= Helper.request2String(request, "holidayCharter_"+i);
		spwId				=Helper.request2int(request, "passangerType_id_"+i);
		result=prd.createStdPaxBagWeight(bagweightId, passangerType, standart, allFlights, holidayCharter, users.getUserName(),spwId);
		
	}
	
	out.print(result);
%>