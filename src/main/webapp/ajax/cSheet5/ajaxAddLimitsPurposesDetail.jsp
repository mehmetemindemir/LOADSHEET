<%@page import="com.loadsheet.process.ahmForm.CSheet5Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 				= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId			= Helper.request2String(request, "bagweightId");
	String		result				= "";
	int 			recordCount	= Helper.request2int(request, "formRecordCount");
	int 			llpId					=0;
	String		code				= Helper.request2String(request, "code");
	String		limitcode			= Helper.request2String(request, "limitcode");
	String		weight;
	String		operations ;
	String		index	;
	
	AhmLoadProcess prd=new AhmLoadProcess();
	CSheet5Process cSheet5=new CSheet5Process();
	if(code.trim().equals("fzfw") || code.trim().equals("azfw") || code.trim().equals("ftow") || code.trim().equals("atow") || code.trim().equals("flw") || code.trim().equals("alw")){
		cSheet5.updateAllStatus(bagweightId, limitcode, users.getUserName());
		for(int i=1;i<=recordCount;i++){
			
			weight				= Helper.request2String(request, "weight_"+i);
			operations 		= Helper.request2String(request, "operations_"+i);
			index				= Helper.request2String(request, "index_"+i);
			llpId					=Helper.request2int(request, "llpId_"+i);
			result=prd.createLimitsPurposes(bagweightId, limitcode, weight, operations, index, users.getUserName(),llpId);
			if(code.trim().equals("ftow")&&i==recordCount){
				cSheet5.updateAllStatus(bagweightId, "FLW", users.getUserName());
				result=prd.calculateLandingLimits(bagweightId, "FLW");
			}
			if(code.trim().equals("atow")&&i==recordCount){
				cSheet5.updateAllStatus(bagweightId, "ALW", users.getUserName());
				result=prd.calculateLandingLimits(bagweightId, "ALW");
			}
		}
	}else{
		result="UNCORRECT LIMIT CODE !! "+code;
	}
	out.print(result);
%>