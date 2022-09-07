<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 		users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	int	 			carrierId	= Helper.request2int(request, "carrierId");
	int				companyid	= 0;
	if(users.getUserPosition().trim().equals("6")){
		companyid=Helper.request2int(request, "companyid");
	}else{
		companyid=users.getCampanyId();
	}
	CarrierProcess 	prd=new CarrierProcess();
	prd.delCompanyCarrier(companyid, carrierId, users.getUserName());
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>