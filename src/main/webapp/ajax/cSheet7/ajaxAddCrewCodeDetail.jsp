<%@page import="com.loadsheet.process.ahmForm.CSheet7Process"%>
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
	int 			cdId=0;
	String		crwcode			= "";
	String		cockpitcrew		= "";
	String		cabincrew		= "";
	String		location			= "";
	String		loccrwbaggage 	= "";
	
		CSheet7Process prd=new CSheet7Process();
		prd.updateAllCrewCodeStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			crwcode			= Helper.request2String(request, "crwcode_"+i);
			cockpitcrew		= Helper.request2String(request, "cockpitcrew_"+i);
			cabincrew		= Helper.request2String(request, "cabincrew_"+i);
			location			= Helper.request2String(request, "location_"+i);
			loccrwbaggage	= Helper.request2String(request, "loccrwbaggage_"+i);
			cdId						=Helper.request2int(request, "cdId_"+i);
			result=prd.createCrewCode(bagweightId, crwcode, cockpitcrew, cabincrew, location, loccrwbaggage, users.getUserName(),cdId);
		}
	out.print(result);
%>