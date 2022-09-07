<%@page import="com.loadsheet.process.ahmForm.CSheet7Process"%>
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
	int 			ccsId						= 0;
	String		code						= Helper.request2String(request, "code");
	String		crewcode				= Helper.request2String(request, "crewcode");
	String		crewdesc				= Helper.request2String(request, "crewdesc");
	String		crwseatloc				="";
	String		maxseat					="";
	String		weight				="";
	String		lengthoperations		="";
	String		unitlength			="";
	String		arm					="";
	String		operations			="";
	String		perweightunit		="";
	
	
	CSheet7Process prd=new CSheet7Process();
	
	if(code.trim().equals("cabin") || code.trim().equals("cockpit")){
		prd.updateAllStatus(bagweightId, users.getUserName(),code.toUpperCase());
		for(int i=1;i<=recordCount;i++){
			crwseatloc			=Helper.request2String(request, "crwseatloc_"+i);
			maxseat				=Helper.request2String(request, "maxseat_"+i);
			weight				=Helper.request2String(request, "weight_"+i);
			lengthoperations		=Helper.request2String(request, "lengthoperations_"+i);
			unitlength			=Helper.request2String(request, "unitlength_"+i);
			arm					=Helper.request2String(request, "arm_"+i);
			operations			=Helper.request2String(request, "operations_"+i);
			perweightunit		=Helper.request2String(request, "perweightunit_"+i);
			ccsId					=Helper.request2int(request, "ccsId_"+i);
			result=prd.createCrewSeats(bagweightId, crewcode, crewdesc, crwseatloc, maxseat, weight, lengthoperations, unitlength, arm, operations, perweightunit, users.getUserName(),ccsId);
		}
	}else{
		result="UNCORRECT CREW CODE !! "+code;
	}
	out.print(result);
%>