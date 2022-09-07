<%@page import="com.loadsheet.process.ahmForm.CSheet11Process"%>
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

	String	cabinsection 	="";
	String 	rowno 			="";
	String 	rowletter_a 		="";
	String  rowletter_b 		="";
	String 	rowletter_c 		="";
	String  rowletter_d 		="";
	String 	rowletter_e 		="";
	String 	rowletter_f 		="";
	String 	lengtharm 		="";
	String  operations 		="";
	String  perweightunit	="";
	int 		seatPlanId			=0;
	CSheet11Process prd=new CSheet11Process();
	prd.updateAllSeatPlanStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			cabinsection 	=Helper.request2String(request, "cabinsection_"+i);
		 	rowno 			=Helper.request2String(request, "rowno_"+i);
		 	rowletter_a 		=Helper.request2String(request, "rowletter_a_"+i);
		  	rowletter_b 		=Helper.request2String(request, "rowletter_b_"+i);
		 	rowletter_c 		=Helper.request2String(request, "rowletter_c_"+i);
		  	rowletter_d 		=Helper.request2String(request, "rowletter_d_"+i);
		 	rowletter_e 		=Helper.request2String(request, "rowletter_e_"+i);
		 	rowletter_f 		=Helper.request2String(request, "rowletter_f_"+i);
		 	lengtharm 		=Helper.request2String(request, "lengtharm_"+i);
		  	operations 		=Helper.request2String(request, "operations_"+i);
		  	perweightunit	=Helper.request2String(request, "perweightunit_"+i);
		  	seatPlanId		=Helper.request2int(request, "seatPlnaId_"+i);
			result=prd.createSeatplanLayout(bagweightId, cabinsection, rowno, rowletter_a, rowletter_b, rowletter_c, rowletter_d, rowletter_e, rowletter_f, lengtharm, operations, perweightunit, users.getUserName(),seatPlanId);
		}
	out.print(result);
%>