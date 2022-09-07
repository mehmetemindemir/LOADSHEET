<%@page import="com.loadsheet.process.ahmForm.CSheet9Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 						= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId				= Helper.request2String(request, "bagweightId");
	String		result							= "";
	int 			recordCount				= Helper.request2int(request, "formRecordCount");
	
	String		cabinsection				= "";
	String		rownumbers				= "";
	String		totalseats					= "";
	String		armoperations			= "";
	String		armstation 					= "";
	String		arm								= "";
	String		influenceoperation		= "";
	String		perweightunit				= "";
	int			cabinSectionId			=0;
	CSheet9Process prd=new CSheet9Process();
		prd.updateAllCabinSectionStatus(bagweightId,  users.getUserName());
		for(int i=1;i<=recordCount;i++){
			cabinsection					= Helper.request2String(request, "cabinsection_"+i);
			rownumbers					= Helper.request2String(request, "rownumbers_"+i);
			totalseats						= Helper.request2String(request, "totalseats_"+i);
			armoperations				= Helper.request2String(request, "armoperations_"+i);
			armstation						= Helper.request2String(request, "armstation_"+i);
			arm									= Helper.request2String(request, "arm_"+i);
			influenceoperation			= Helper.request2String(request, "influenceoperation_"+i);
			perweightunit					= Helper.request2String(request, "perweightunit_"+i);
			cabinSectionId				= Helper.request2int(request, "paxCabinId_"+i);
			result=prd.createCabinSection(bagweightId, cabinsection, rownumbers,totalseats, armoperations, armstation, arm, influenceoperation, perweightunit, users.getUserName(),cabinSectionId);
		}
	out.print(result);
%>