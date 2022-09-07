<%@page import="com.loadsheet.process.flight.FlightProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 			user 				= (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
	String 				voyageCode			=Helper.request2String(request, "voyageCode");
	String 				facilityStatus		=Helper.request2String(request, "facilityStatus");
	String 				facilityType		=Helper.request2String(request, "facilityType");
	FlightProcess 	brdPro				=new FlightProcess();
	String				data				="INVALID PARAMETER VALUE";		
	if(facilityStatus.trim().equals("OPEN")||facilityStatus.trim().equals("CLOSE")||facilityStatus.trim().equals("FINALIZE")){
		data=brdPro.changeFlightCheckinStatus(voyageCode, facilityType, facilityStatus, user.getUserName(),user.getUserId());


	}
	out.write(Helper.getMessage(session, data.trim()));
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
