<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.process.ahmForm.AhmLoadProcess"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		result			= "";
	int 			recordCount		= 9;
	String		code				= "";
	int			dowinclude		= 0;
	int			dowexclude		= 0;
	int			doiinclude		= 0;
	int	 		doiexclude		= 0;
	String		remarks			= "";
	
	AhmLoadProcess prd=new AhmLoadProcess();
	
	for(int i=1;i<=recordCount;i++){
		code				= Helper.request2String(request, "code_"+i);
		dowinclude		= Helper.request2int(request, "dowdoi_"+i);
		dowexclude		= 0;
		doiinclude		= 0;
		doiexclude		= 0;
		remarks			= Helper.removeForbiddenLetters(Helper.request2String(request, "remarks_"+i));
		
		result=prd.createDryOpeIndx(bagweightId,code,dowinclude,dowexclude,doiinclude,doiexclude,remarks,users.getUserName());
	}
	out.print(result);
%>