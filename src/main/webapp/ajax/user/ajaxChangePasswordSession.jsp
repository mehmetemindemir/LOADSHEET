<%@page import="adsdcs.bean.data.UserData"%>
<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		= (UserData) request.getSession().getAttribute(ProjectConstants.SESSION_USER);
	String userName="";
	
	String userPassword= Helper.request2String(request, "userPass");
	int userId=0;
	int auth_code=0;
	if(session!=null &&session.getAttribute(ProjectConstants.USER_ID)!=null ){
		userId=Integer.valueOf(session.getAttribute(ProjectConstants.USER_ID).toString());
	}
	if(session!=null &&session.getAttribute(ProjectConstants.USER_AUTORIZED_CODE)!=null ){
		auth_code=Integer.valueOf(session.getAttribute(ProjectConstants.USER_AUTORIZED_CODE).toString());
	}
	UserProcess usrP=new UserProcess();
	int state=usrP.changePassword(Helper.generateMD5(userPassword.toUpperCase()), userId, auth_code,users.userName);
	Helper.clearAllSession(session);
	if(state>0){
%>
		<ul class="system_messages">
			<li class="green"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePass.ChangeSuccess") %></strong></li>		
		</ul>
	
	<%}else{ %>
		<ul class="system_messages">
			<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePass.ChangeError") %></strong></li>		
		</ul>
		<div style="float: left;margin-top:20px; " >          	
			<input type="button" onclick="forgetPass();"  style="width: 100px;  height: 30px; float: left;"  class="button1" value="<%=Helper.getMessage(session, "Dcs.User.ChangePass.TryAgainBtn=Tekrar Dene") %> " />
		</div>	
	<%}
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>