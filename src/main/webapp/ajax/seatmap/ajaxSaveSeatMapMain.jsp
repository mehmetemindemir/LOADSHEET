<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	user=(UserData)session.getAttribute(Constants.SESSION_USER);
	String seat=Helper.request2String(request, "seat");	
	String sastat=Helper.request2String(request, "sastat");	
	String vaircraftcode=Helper.request2String(request, "vaircraftcode");
	String vcapacity=Helper.request2String(request, "vcapacity");	
	String vregistername=Helper.request2String(request, "vregistername");		
	String vaircrafttype=Helper.request2String(request, "vaircrafttype");	
	String vaircraftbrand=Helper.request2String(request, "vaircraftbrand");	
	String userName=Helper.request2String(request, "userName");	
	String carrier=Helper.request2String(request, "carrierCode");	
	int bussinesCount=Helper.request2int(request, "bussinesCount");	
	String vaircraftversion="";
	int companyId=user.getCampanyId();
	String vstatus="A";
	//vaircraftbrand,vaircrafttype,vaircraftversion,vregistername,vcapacity,vstatus,vaircraftcode
	AirCraftProcess prd=new AirCraftProcess();
	prd.saveSeatMapMain(user.getUserName(), vaircraftbrand, vaircrafttype, vaircraftversion, vregistername, vcapacity, vstatus, vaircraftcode,bussinesCount,carrier);
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>