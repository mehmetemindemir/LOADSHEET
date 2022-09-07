<%@page import="com.loadsheet.process.ahmForm.CSheet2Process"%>
<%@page import="com.loadsheet.process.ahmForm.CSheet6Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		result					= "";
	String		refStaAt				= "";
	String		kConstant			= "";
	String		cConstant 			= "";
	String 		lMac						="";
	String 		leMac					="";
	int 			fcId;
	
	CSheet2Process prd=new CSheet2Process();
	refStaAt			= 	Helper.request2String(request, "refStaAt");
	kConstant		= 	Helper.request2String(request, "kConstants");
	cConstant		= 	Helper.request2String(request, "cConstants");
	leMac				=	Helper.request2String(request, "leMac");
	lMac					=	Helper.request2String(request, "lMac");
	fcId					=	Helper.request2int(request, "fcId");
	result=prd.createFormuleConstant(bagweightId, refStaAt, kConstant, cConstant, lMac, leMac, fcId, users.getUserName());
	out.print(result);
%>