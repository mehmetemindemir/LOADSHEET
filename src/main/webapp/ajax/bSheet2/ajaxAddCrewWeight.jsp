<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		result			= "";
	int 			recordCount		= 2;
	String		code				= "";
	String		standart			= "";
	String		male				= "";
	String		female			= "";
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	
	AhmLoadProcess prd=new AhmLoadProcess();
	
	for(int i=1;i<=recordCount;i++){
		code				= Helper.request2String(request, "code_"+i);
		standart			= Helper.request2String(request, "standart_"+i);
		male				= Helper.request2String(request, "male_"+i);
		female			= Helper.request2String(request, "female_"+i);
		result=prd.createCrewWeight(bagweightId, code, standart, male, female, users.getUserName());
		
	}
	
	out.print(result);
%>