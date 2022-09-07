<%@page import="com.loadsheet.process.ahmForm.CSheet14Process"%>
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

	String	yesno 						="";
	String 	ballastlocation 		="";
	String 	weight		 				="";
	String  ballindex	 				="";
	int 		ballastId					=0;
	
		CSheet14Process prd=new CSheet14Process();
		prd.updateAllBallastStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			ballastlocation 	=Helper.request2String(request, "ballastlocation_"+i);
			weight 				=Helper.request2String(request, "weight_"+i);
			ballindex 				=Helper.request2String(request, "ballindex_"+i);
			ballastId				=Helper.request2int(request, "ballastId_"+i);
			yesno					=Helper.request2String(request, "yesno_"+i);
			result=prd.createBallast(bagweightId, yesno, ballastlocation, weight, ballindex, users.getUserName(),ballastId);
		}
	out.print(result);
%>