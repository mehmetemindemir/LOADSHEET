<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		= (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String userName		= Helper.removeForbiddenChar(Helper.request2String(request, "userName"));
	String status		= Helper.request2String(request, "status");
	String createUser	= users.getUserName();
	UserProcess prd=new UserProcess();
	prd.deleteUser(userName,status,createUser);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>