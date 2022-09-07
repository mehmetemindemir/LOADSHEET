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

	String	condition 		=Helper.request2String(request, "condition");
	String 	zonename 		="";
	String 	zonefrom 		="";
	String  zoneto 			="";
	String 	maxweight		="";
	String	maxcomulative	="";
	String	operations		="";
	int 		comulativeId	=0;
	CSheet12Process prd=new CSheet12Process();
	prd.updateAllComulativeLoadLimitsStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			zonename 		=Helper.request2String(request, "zonename_"+i);
			zonefrom 		=Helper.request2String(request, "zonefrom_"+i);
			zoneto 			=Helper.request2String(request, "zoneto_"+i);
			maxweight 		=Helper.request2String(request, "maxweight_"+i);
			maxcomulative 	=Helper.request2String(request, "maxcomulative_"+i);
			operations		=Helper.request2String(request,"operations_"+i);
			comulativeId	=Helper.request2int(request, "comulativeId_"+i);
			result=prd.createComulativeLoadLimits(bagweightId, condition, zonename, zonefrom, zoneto, maxweight, maxcomulative, operations, users.getUserName(),comulativeId);
		}
	out.print(result);
%>