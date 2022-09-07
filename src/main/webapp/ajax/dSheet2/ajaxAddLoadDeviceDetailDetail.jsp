<%@page import="com.loadsheet.process.ahmForm.DSheet2Process"%>
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

	String 	typecode				="";
	String 	tareweight			="";
	String 	grossweight			="";
	String 	volume				="";
	String 	positionrestriction	="";
	String	heightrestriction	="";
	String	deviceremarks		="";
	int 		loadDeviceId			=0;
	
	DSheet2Process  prd=new DSheet2Process();
	prd.updateAllLoadDeviceStatus(bagweightId, users.getUserName());
		for(int i=1;i<=recordCount;i++){
		 	typecode				=Helper.request2String(request, "typecode_"+i);
		 	tareweight			=Helper.request2String(request, "tareweight_"+i);
		 	grossweight			=Helper.request2String(request, "grossweight_"+i);
		 	volume				=Helper.request2String(request, "volume_"+i);
		 	positionrestriction	=Helper.request2String(request, "positionrestriction_"+i);
			heightrestriction	=Helper.request2String(request, "heightrestriction_"+i);
			deviceremarks		=Helper.request2String(request, "deviceremarks_"+i);
			loadDeviceId			=Helper.request2int(request, "loadDeviceId_"+i);
			result=prd.createLoadDeviceDetail(bagweightId, typecode, tareweight, grossweight, volume, positionrestriction, heightrestriction, deviceremarks, users.getUserName(),loadDeviceId);
		}
	out.print(result);
%>