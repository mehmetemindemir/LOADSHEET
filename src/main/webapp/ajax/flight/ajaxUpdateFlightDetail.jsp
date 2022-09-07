<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.process.flight.FlightProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData user = (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
	FlightProcess charter=new FlightProcess();
	String returnVal=charter.updateFlightDetail(request, user.getUserName());
	out.print(returnVal);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
