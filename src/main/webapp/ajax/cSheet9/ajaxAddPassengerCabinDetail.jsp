<%@page import="com.loadsheet.process.ahmForm.CSheet9Process"%>
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
	
	String		cabinname			= "";
	String		class1				= "";
	String		class2				= "";
	String		class3				= "";
	String		class4				= "";
	String		class5				= "";
	String		totalcabinsection	= "";
	int 			paxCabinId=0;
	CSheet9Process prd=new CSheet9Process();
	prd.updateAllPaxCabinStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			cabinname					= Helper.request2String(request, "cabinname_"+i);
			class1							= Helper.request2String(request, "class1_"+i);
			class2							= Helper.request2String(request, "class2_"+i);
			class3							= Helper.request2String(request, "class3_"+i);
			class4							= Helper.request2String(request, "class4_"+i);
			class5							= Helper.request2String(request, "class5_"+i);
			totalcabinsection		= Helper.request2String(request, "totalcabinsection_"+i);
			paxCabinId					= Helper.request2int(request, "paxCabinId_"+i);
								
			result=prd.createPassengerCabin(bagweightId, cabinname, class1, class2, class3, class4, class5, totalcabinsection, users.getUserName(),paxCabinId);
		}
	out.print(result);
%>