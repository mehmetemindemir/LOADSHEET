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

	String	cptorhold1 			="";
	String 	cptorhold2 			="";
	String 	cptorhold3 			="";
	String  maxcombined 			="";
	String 	remarks 				="";
	int 		comLoadLimId	=0;
	
	CSheet12Process prd=new CSheet12Process();
	prd.updateAllComLoadLimStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			cptorhold1 		=Helper.request2String(request, "cptorhold1_"+i);
			cptorhold2 		=Helper.request2String(request, "cptorhold2_"+i);
			cptorhold3 		=Helper.request2String(request, "cptorhold3_"+i);
			maxcombined 		=Helper.request2String(request, "maxcombined_"+i);
			remarks 			=Helper.request2String(request, "remarks_"+i);
			comLoadLimId 	=Helper.request2int(request, "comLoadLimId_"+i);
			result=prd.createCombinedLoadLimits(bagweightId, cptorhold1, cptorhold2, cptorhold3, maxcombined, remarks, users.getUserName(),comLoadLimId);
		}
	out.print(result);
%>