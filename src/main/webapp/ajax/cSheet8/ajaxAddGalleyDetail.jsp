<%@page import="com.loadsheet.process.ahmForm.CSheet8Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		result					= "";
	int 			recordCount		= Helper.request2int(request, "formRecordCount");
	int 			galleryId				=0;
	String		galleylocation		= "";
	String		maxweight			= "";
	String		armoperations	= "";
	String		unitlength			= "";
	String		harm 					= "";
	String		operations			= "";
	String		perweightunit		= "";
	
	CSheet8Process prd=new CSheet8Process();
		prd.updateAllGalleryStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			galleylocation	= Helper.request2String(request, "galleylocation_"+i);
			maxweight		= Helper.request2String(request, "maxweight_"+i);
			armoperations	= Helper.request2String(request, "armoperations_"+i);
			unitlength		= Helper.request2String(request, "unitlength_"+i);
			operations		= Helper.request2String(request, "operations_"+i);
			perweightunit	= Helper.request2String(request, "perweightunit_"+i);
			galleryId			=Helper.request2int(request, "galleryId_"+i);
			result=prd.createGalley(bagweightId, galleylocation, maxweight, armoperations, unitlength, operations, perweightunit, users.getUserName(),galleryId);
		}
	out.print(result);
%>