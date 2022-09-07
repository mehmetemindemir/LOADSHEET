<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	int				companyId	= 0;
	if(users.getUserPosition().trim().equals("6")){
		companyId=Helper.request2int(request, "companyId");
	}else{
		companyId=users.getCampanyId();
	}
	String 		airlinecode		= Helper.request2String(request, "carrierCode");
	String		billingaddr1		= Helper.request2String(request, "billingaddr1");
	String		billingaddr2		= Helper.request2String(request, "billingaddr2");
	String		zipcode			= Helper.request2String(request, "zipcode");
	String		cityname			= Helper.request2String(request, "cityname");
	String		countrycode		= Helper.request2String(request, "countrycode");
	
	
	CarrierProcess prd=new CarrierProcess();
	AjaxResponse rs=new AjaxResponse();
	rs=prd.insCompanyCarrier(companyId, airlinecode, billingaddr1, billingaddr2, zipcode, cityname, countrycode, users.getUserName());
	out.write(rs.getStatus());
	
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>