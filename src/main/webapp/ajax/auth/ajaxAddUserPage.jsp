<%@page import="com.loadsheet.process.user.AuthProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	AuthProcess authP=new AuthProcess();
	authP.addUserPages(request);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
 
