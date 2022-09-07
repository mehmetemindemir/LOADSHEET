<%@page import="com.loadsheet.process.ahmForm.DowDoiProcess"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId			= Helper.request2String(request, "bagweightId");
	String		result				= "";
	int 			recordCount			= Helper.request2int(request, "formRecordCount");

	String	cockpit 			="";
	String 	cabincrew 		="";
	String 	dowvalue 		="";
	String	doivalue			="";
	String 	pantry			="";
	
	DowDoiProcess prd=new DowDoiProcess();
	result=prd.updateAllDowDoiStatus(bagweightId,users.getUserName());
	if(result.trim().equals("OK")){
		for(int i=1;i<=recordCount;i++){
			cockpit 			=Helper.request2String(request, "cockpit_"+i);
			cabincrew 		=Helper.request2String(request, "cabin_"+i);
			dowvalue 		=Helper.request2String(request, "dow_val_"+i);
			doivalue			=Helper.request2String(request, "doi_val_"+i);
			pantry			=Helper.request2String(request, "pantry_"+i);
			result=prd.createDowDoiLimits(bagweightId, cockpit, cabincrew, dowvalue, doivalue, pantry, users.getUserName());
		}
	}
		
	out.print(result);
%>