<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	user=(UserData)session.getAttribute(Constants.SESSION_USER);
	String seat=Helper.request2String(request, "seat");	
	int sastat=Helper.request2int(request, "sastat");	
	int seatmapbackup=Helper.request2int(request, "seatmapbackup");	
	String airType=Helper.request2String(request, "airType");	
	String zone=Helper.request2String(request, "zone");	
	String userName=user.getUserName();
	String ex=Helper.request2String(request, "ex");
	String wings=Helper.request2String(request, "wings");
	String saln=seat.substring(1,seat.length());
	String sasch=seat.substring(0,1);
	String sa4=Helper.request2String(request, "sa4");	
	String satype=null;
	if(sastat==4 ){
		satype="BLK";
	}

	AirCraftProcess prd=new AirCraftProcess();
	if(seatmapbackup==0){
		prd.backupSeatMap(airType,userName);
	}
	
	prd.saveSeatMap(airType, saln, sasch, zone, satype, sastat,userName,ex,wings,sa4);
	
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>