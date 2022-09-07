<%@page import="com.loadsheet.process.flight.FlightProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	FlightProcess charter=new FlightProcess();
	String returnVal=charter.insNewFlight(request);
	out.print(returnVal);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
