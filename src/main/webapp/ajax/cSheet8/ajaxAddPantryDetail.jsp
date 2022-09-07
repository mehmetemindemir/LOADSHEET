<%@page import="com.loadsheet.process.ahmForm.CSheet8Process"%>
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
	
	String		galley		= "";
	String		maxweight	= "";
	String		lengtharm	= "";
	String		arm			= "";
	String		operations	= "";
	String		perweight	= "";
	String		intway1		= "";
	String		intway2		= "";
	String		domway1		= "";
	String		domway2		= "";
	String		ferryflight	= "";
	int 			pantryId		=0;
	
	CSheet8Process prd=new CSheet8Process();
	prd.updateAllPantryStatus(bagweightId,  users.getUserName());
	for(int i=1;i<=recordCount;i++){
		galley		= Helper.request2String(request, "galley_"+i);
		maxweight	= Helper.request2String(request, "maxweight_"+i);
		operations	= Helper.request2String(request, "operations_"+i);
		perweight	= Helper.request2String(request, "perweight_"+i);
		ferryflight	= Helper.request2String(request, "ferryflight_"+i);
		pantryId		=Helper.request2int(request, "pantryId_"+i);
		result=prd.createPantry(bagweightId, galley, maxweight, operations, perweight, ferryflight, users.getUserName(),pantryId);
	}
	out.print(result);
%>