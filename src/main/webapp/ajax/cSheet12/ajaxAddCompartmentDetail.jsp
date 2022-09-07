<%@page import="com.loadsheet.process.ahmForm.CSheet12Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId			= Helper.request2String(request, "bagweightId");
	String		result				= "";
	int 			recordCount			= Helper.request2int(request, "formRecordCount");

	String	compartmentnumber 	="";
	String 	description 			="";
	String 	grossweight 			="";
	String  volume 				="";
	String 	lengtharm 			="";
	String  operations 			="";
	String 	perweightunit 		="";
	int 		comTrimId			=0;
	CSheet12Process prd=new CSheet12Process();
	prd.updateAllComTrimStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			compartmentnumber 	=Helper.request2String(request, "compartmentnumber_"+i);
			description 			=Helper.request2String(request, "description_"+i);
			grossweight 			=Helper.request2String(request, "grossweight_"+i);
			volume 				=Helper.request2String(request, "volume_"+i);
			lengtharm 			=Helper.request2String(request, "lengtharm_"+i);
			operations 			=Helper.request2String(request, "operations_"+i);
			perweightunit 		=Helper.request2String(request, "perweightunit_"+i);
			comTrimId			=Helper.request2int(request, "comTrimId_"+i);
			result=prd.createCompartmentDetail(bagweightId, compartmentnumber, description, grossweight, volume, lengtharm, operations, perweightunit, users.getUserName(),comTrimId);
		}
	out.print(result);
%>