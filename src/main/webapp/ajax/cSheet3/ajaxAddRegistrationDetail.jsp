<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId			= Helper.request2String(request, "bagweightId");
	String		result				= "";
	int 		recordCount			= Helper.request2int(request, "formRecordCount");
	int			code				=Integer.parseInt( Helper.request2String(request, "registrationCode"));
	String		fleetweight			= Helper.removeForbiddenLetters(Helper.request2String(request, "fleetweight"));
	String		fleetindex			= Helper.removeForbiddenLetters(Helper.request2String(request, "fleetindex"));
	String		fwtailnumber		= "";
	String		fwweightadjustment	= "";
	String		fwindexadjustment	= "";
	String		fitailnumber		= "";
	String		fiweightadjustment	= "";
	String		fiindexadjustment	= "";
	
	AhmLoadProcess prd=new AhmLoadProcess();
	
	for(int i=1;i<=recordCount;i++){
		fwtailnumber		= Helper.removeForbiddenLetters(Helper.request2String(request, "fwtailnumber_"+i));
		fwweightadjustment	= Helper.removeForbiddenLetters(Helper.request2String(request, "fwweightadjustment_"+i));
		fwindexadjustment	= Helper.removeForbiddenLetters(Helper.request2String(request, "fwindexadjustment_"+i));
		fitailnumber		= Helper.removeForbiddenLetters(Helper.request2String(request, "fitailnumber_"+i));
		fiweightadjustment	= Helper.removeForbiddenLetters(Helper.request2String(request, "fiweightadjustment_"+i));
		fiindexadjustment	= Helper.removeForbiddenLetters(Helper.request2String(request, "fiindexadjustment_"+i));
		result=prd.createRegistrationDryOpeWeight(bagweightId, fleetweight, fleetindex, fwtailnumber, fwweightadjustment, fwindexadjustment, fitailnumber, fiweightadjustment, fiindexadjustment, users.getUserName(),code);
	}
	

	out.print(result);
%>