<%@page import="com.loadsheet.process.ahmForm.CSheet13Process"%>
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

	String	baysection 		="";
	String 	grossweight 		="";
	String 	volume 			="";
	String  lengtharm 		="";
	String 	operations 		="";
	String  perweightunit 	="";
	int 		bayTrimId		=0;
	
	CSheet13Process prd=new CSheet13Process();
	prd.updateAllBayTrimStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			baysection 		=Helper.request2String(request, "baysection_"+i);
			grossweight 		=Helper.request2String(request, "grossweight_"+i);
			volume 			=Helper.request2String(request, "volume_"+i);
			lengtharm 		=Helper.request2String(request, "lengtharm_"+i);
			operations 		=Helper.request2String(request, "operations_"+i);
			perweightunit 	=Helper.request2String(request, "perweightunit_"+i);
			bayTrimId		=Helper.request2int(request, "bayTrimId_"+i);
			result=prd.createBayDetailTrim(bagweightId, baysection, grossweight, volume, lengtharm, operations, perweightunit, users.getUserName(),bayTrimId);
		}
	out.print(result);
%>