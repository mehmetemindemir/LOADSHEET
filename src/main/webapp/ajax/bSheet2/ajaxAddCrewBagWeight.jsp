<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		result			= "";
	int 			recordCount		= 3;
	String		code				= "";
	String		cockpit			= "";
	String		cabin			= "";
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	
	AhmLoadProcess prd=new AhmLoadProcess();
	
	for(int i=1;i<=recordCount;i++){
		code				= Helper.request2String(request, "code_"+i);
		cockpit			= Helper.request2String(request, "cockpit_"+i);
		cabin			= Helper.request2String(request, "cabin_"+i);
		result=prd.createCrewBagWeight(bagweightId, code, cockpit, cabin, users.getUserName()); 
	}
	out.print(result);
%>