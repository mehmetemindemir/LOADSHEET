<%@page import="com.loadsheet.process.ahmForm.CSheet6Process"%>
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
	String		proceduretype		= Helper.request2String(request, "proceduretype");
	String		fueldensity			= Helper.request2String(request, "fueldensity");
	String		weight				= "";
	String		operations			= "";
	String		fuelindex 			= "";
	int 			efId;
	
		CSheet6Process prd=new CSheet6Process();
		prd.updateAllStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			weight			= Helper.request2String(request, "weight_"+i);
			operations		= Helper.request2String(request, "operations_"+i);
			fuelindex		= Helper.request2String(request, "fuelindex_"+i);
			efId				=Helper.request2int(request, "efId_"+i);
			result=prd.createEffectFuel(bagweightId, proceduretype, fueldensity, weight, operations, fuelindex,users.getUserName(),efId);
		}
	out.print(result);
%>