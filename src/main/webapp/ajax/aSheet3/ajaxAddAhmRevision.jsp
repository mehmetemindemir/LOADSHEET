<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	int			result		= 0;
	String		aircraftCode	= Helper.request2String(request, "aircraftCode");
	String		revSheet		= Helper.request2String(request, "revSheet");
	String		multiPageInd	= Helper.request2String(request, "multiPageInd");
	String		seetIssueNo	= Helper.removeForbiddenLetters(Helper.request2String(request, "seetIssueNo"));
	String		section		= Helper.request2String(request, "section");
	String		revDate		= Helper.request2String(request, "revDate");
	
	System.out.println(revDate);
	AhmLoadProcess prd=new AhmLoadProcess();
	result=prd.insertAhmRevision(aircraftCode,revSheet,multiPageInd,seetIssueNo, users.getUserName(),section,revDate);
	String data=String.valueOf(result);
	out.print(data.trim());
%>