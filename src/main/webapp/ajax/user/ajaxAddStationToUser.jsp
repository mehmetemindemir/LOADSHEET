<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData users = (UserData) session.getAttribute(Constants.SESSION_USER);
	int userId=Helper.request2int(request, "userId");
	String portCode=Helper.request2String(request, "userStation");
	int createUserId=users.getUserId();
	
	UserProcess prd=new UserProcess();
	prd.setUserAirport(userId, portCode, createUserId);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>