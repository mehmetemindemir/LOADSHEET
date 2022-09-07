<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String status=Helper.request2String(request, "status");
	String aircraftcode=Helper.request2String(request, "aircraftcode");
	AirCraftProcess airProc=new AirCraftProcess();
	String result=airProc.upAirCreft(status, aircraftcode);
	out.print(result);
%>