<%@page import="com.loadsheet.process.ahmForm.BSheet1Process"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		result		= "";
	int 			recordCount	= 3;
	
	String		class1			= "";
	String		class2			= "";
	String		class3			= "";
	String		class4			= "";
	String		class5			= "";
	String		class6			= "";
	String		class7			= "";
	String		assumptionCode	= "";
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int			rowId			= 0;
	
	BSheet1Process prd=new BSheet1Process();
	prd.updateAllAssumptiondBagWeight(bagweightId, users.getUserName());
	
	for(int i=1;i<=recordCount;i++){
		class1			= Helper.request2String(request, "class1_"+i);
		class2			= Helper.request2String(request, "class2_"+i);
		class3			= Helper.request2String(request, "class3_"+i);
		class4			= Helper.request2String(request, "class4_"+i);
		class5			= Helper.request2String(request, "class5_"+i);
		class6			= Helper.request2String(request, "class6_"+i);
		class7			= Helper.request2String(request, "class7_"+i);
		assumptionCode	= Helper.request2String(request, "assumptionCode_"+i);
		rowId			= Helper.request2int(request, "rowId_"+i);
		result=prd.createAssumptiondBagWeight(bagweightId, assumptionCode, class1, class2, class3, class4, class5, class6, class7, users.getUserName(),rowId);
	}
	
	out.print(result);
%>