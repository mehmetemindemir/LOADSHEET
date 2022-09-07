<%@page import="com.loadsheet.process.ahmForm.DSheet1Process"%>
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

	String	weight 			="";
	String 	operations 		="";
	String 	cgvalue 			="";
	int		cgLimitId			=0;
	
	DSheet1Process prd=new DSheet1Process();
	prd.updateAllCGLimitStatus(bagweightId,users.getUserName());
		for(int i=1;i<=recordCount;i++){
			weight 			=Helper.request2String(request, "weight_"+i);
			operations 		=Helper.request2String(request, "operations_"+i);
			cgvalue 			=Helper.request2String(request, "cgvalue_"+i);
			cgLimitId			=Helper.request2int(request, "cgLimitId_"+i);
			result=prd.createCgLimits(bagweightId, weight, operations, cgvalue, users.getUserName(),cgLimitId);
		}
	out.print(result);
%>