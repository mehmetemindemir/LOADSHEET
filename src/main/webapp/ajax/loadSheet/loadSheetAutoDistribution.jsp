
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String holdArray[] = null;
	GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
	if(request!=null && request.getParameter("voyageCode")!=null){
		holdArray = glsfd.holdDistribution(request);
	}
	
	
	if(holdArray==null){
		out.println("NO LOAD SHEET OUTPUT");
	}else{%>
		<%=holdArray[1]%>@<%=holdArray[2]%>@<%=holdArray[3]%>@<%=holdArray[4]%>@<%=holdArray[5]%>
		<%
	}
%>