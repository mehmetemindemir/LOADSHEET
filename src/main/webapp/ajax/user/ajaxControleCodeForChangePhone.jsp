<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.UserData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	int controleCode=Helper.request2int(request, "userCode");
	int userId=Helper.request2int(request, "userId");
	String type=Helper.request2String(request, "type");
	String contact=Helper.request2String(request, "contact");
	int state=0;
	UserProcess prd=new UserProcess();
	state=prd.controleCodeEmailPhone (userId, type, controleCode,contact);
	if(state>0){
		UserData users = (UserData) session.getAttribute(ProjectConstants.SESSION_USER);
		users.userPhone=contact;
		session.setAttribute(ProjectConstants.SESSION_USER, users);
		
	}
%>
 <ul class="system_messages">
	<%if(state>0){%>
	<li class="green"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneAlertSuccess") %></strong></li>
	<%}else {%>
	<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneAlertErrorCode") %></strong></li>
	<%}%>
	
</ul>
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>
