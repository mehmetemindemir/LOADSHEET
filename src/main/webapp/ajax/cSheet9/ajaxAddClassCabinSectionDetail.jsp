<%@page import="com.loadsheet.process.ahmForm.CSheet9Process"%>
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
	
	String		cabinsection			= "";
	String		lengthoperations		= "";
	String		lengthunit			= "";
	String		indexoperation		= "";
	String		perweightunit 		= "";
	int 			cabinSectionId=0;
	
	CSheet9Process prd=new CSheet9Process();
	prd.updateAllClassCabinSectionStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			cabinsection			= Helper.request2String(request, "cabinsection_"+i);
			lengthoperations		= Helper.request2String(request, "lengthoperations_"+i);
			lengthunit			= Helper.request2String(request, "lengthunit_"+i);
			indexoperation		= Helper.request2String(request, "indexoperation_"+i);
			perweightunit		= Helper.request2String(request, "perweightunit_"+i);
			cabinSectionId	=Helper.request2int(request, "classCabinSecId_"+i);
			result=prd.createClassCabinSection(bagweightId, cabinsection, lengthoperations, lengthunit, indexoperation, perweightunit, users.getUserName(),cabinSectionId);
		}
	out.print(result);
%>