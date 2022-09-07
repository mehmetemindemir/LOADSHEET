<%@page import="com.loadsheet.process.ahmForm.CSheet13Process"%>
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

	String	referanceweightcode 	="";
	String 	lateralimbalance 			="";
	String 	referanceweight 			="";
	String  mac 								="";
	int 		asymLimitId					=0;
	
	CSheet13Process  prd=new CSheet13Process();
	prd.updateAllAsymLimitStatus(bagweightId, users.getUserName());
	for(int i=1;i<=recordCount;i++){
		lateralimbalance 			=Helper.request2String(request, "lateralimbalance_"+i);
		referanceweight 			=Helper.request2String(request, "referanceweight_"+i);
		mac 								=Helper.request2String(request, "mac_"+i);
		referanceweightcode 	=Helper.request2String(request, "referanceweightcode_"+i);
		asymLimitId			    	=Helper.request2int(request, "asymLimitId_"+i);
		result=prd.createAsymmetricalLimitations(bagweightId, referanceweightcode, lateralimbalance, referanceweight, mac, users.getUserName(),asymLimitId);
	}
	out.print(result);
%>