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
	String		name				= "";
	int 			recordCount			= Helper.request2int(request, "formRecordCount");
	String		max			= "";
	String		min 			= "";
	int 			stabTrimId=0;
	
	CSheet2Process prd=new CSheet2Process();
	prd.updateAllStatus(bagweightId, users.getUserName());
	for(int i=1;i<=recordCount;i++){
		name				= 	Helper.request2String(request, "name_"+i);
		max					= 	Helper.request2String(request, "max_"+i);
		min					= 	Helper.request2String(request, "min_"+i);
		stabTrimId		=	Helper.request2int(request, "stabId_"+i);
		result=prd.createStabTrim(bagweightId, max, min, name, stabTrimId, users.getUserName());
	}
	out.print(result);
%>