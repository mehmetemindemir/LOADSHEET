<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		result			= "";
	int 		recordCount		= 3;
	String		code			= "";
	int			enabled			= 0;
	String		remarks			= "";
	
	AhmLoadProcess prd=new AhmLoadProcess();
	
	for(int i=1;i<=recordCount;i++){
		code				= Helper.request2String(request, "code_"+i);
		enabled			= Helper.request2int(request, "trim_"+i);
		remarks			= Helper.removeForbiddenLetters(Helper.request2String(request, "remarks_"+i));
		
		result=prd.createPaxTrimOutput(bagweightId, code, enabled, remarks, users.getUserName());
	}
	out.print(result);
%>