<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.UserData"%>
<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData users = (UserData) session.getAttribute(ProjectConstants.SESSION_USER);
	int userId=Helper.request2int(request, "userId");
	String portCode=Helper.request2String(request, "portCode");
	int delUserID=users.userId;
	
	UserProcess prd=new UserProcess();
	prd.delUserAirport(userId, portCode, delUserID);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>