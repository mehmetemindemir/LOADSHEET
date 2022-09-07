<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	String aircraftCode=Helper.request2String(request, "aircraftCode");
	AirCraftProcess airProc=new AirCraftProcess();
	String data =airProc.getSeatMap(aircraftCode);
	out.println(data);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
