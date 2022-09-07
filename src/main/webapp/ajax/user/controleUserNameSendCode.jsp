<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	response.setContentType("application/text; charset=utf-8");	
    response.setHeader("Cache-Control", "no-cache");  
    
	String userName=Helper.request2String(request, "userName");
	String requestType=Helper.request2String(request, "requestType");
	String messageMail=Helper.getMessage(session, "Dcs.User.SmsMessage.ChangeEmail");
	String messagePhone=Helper.getMessage(session, "Dcs.User.SmsMessage.ChangePassword");    
    String result = "";
    String c = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
            
    request.setCharacterEncoding("UTF-8");
    String answer = request.getParameter("answer");

    if(c != null && answer != null){
        if (c.equals(answer)){
            result="OK";
        } else {
           result="NOK";
        }
    }
	
	UserProcess user=new UserProcess();
	UserInfoData data=new UserInfoData();
	data= user.getUser(userName);
	int state=user.addUserCreateCodePassChange(messagePhone, messageMail,requestType, data);
	if(!result.equals("NOK")){
		if( state>0 && state<5){
			session.setAttribute(ProjectConstants.USER_ID,data.USER_ID);
		%>	
		<ul class="system_messages">
			<%if(state==2){ %>
				<li class="green"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneSendEmailAlertSuccess") %></strong></li>	
			<%} else if(state==1){%>
				<li class="green"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneSendSmsAlertSuccess") %></strong></li>	
			<%} %>
		</ul>	
		<form id="controleCodeFrm"> 
		<p><%=Helper.getMessage(session, "Dcs.User.LabelUserAlert01") %></p>
			<div class="divLabe" style="float:left;margin-top:25px;width: 80px;"><%=Helper.getMessage(session, "Dcs.User.LabelUserCode") %> </div>
			<div class="divInput" style="width: 100px;height: 30px; margin-top: 20px;  float: left;" >
				<input type="text" name="userCode" maxlength="6" data-validation-engine="validate[required]"  id="userCode" value="" placeholder="<%=Helper.getMessage(session, "Dcs.User.LabelUserCode") %>">
			</div>
			 <div style="float: left;margin-top:20px; " >          	
				<input type="button" onclick="controleCode()"  style="width: 100px;  height: 30px; float: left;"  class="button1" value="<%=Helper.getMessage(session, "Dcs.Global.BtnSave") %> " />
			</div>	
			<input type="hidden" name="type" value="<%=requestType%>">  
			<input type="hidden" name="userId" value="<%=data.USER_ID%>">  
		</form>  
		<br class="cb">
	
	<%}
	
	else { %>
		<ul class="system_messages">
			 <% if(state==0){ %>	
				<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneAlertErrorUser") %></strong></li>
			<%}else if(state>4){ %>
				<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneAlertErrorSmsLimit") %></strong></li>
			<%} else {%>
				<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.Global.ErrorAlert") %></strong></li>
			<%} %>
		
		</ul>
	  	<div style="float: left;margin-top:20px; " >          	
			<input type="button" onclick="forgetPass();"  style="width: 100px;  height: 30px; float: left;"  class="button1" value="<%=Helper.getMessage(session, "Dcs.User.ChangePass.TryAgainBtn") %> " />
		</div>	
		
	<%} %>
<%}else{ %>
		<ul class="system_messages">
			<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePass.VerificationCodeError") %></strong></li>		
		</ul>
		<div style="float: left;margin-top:20px; " >          	
			<input type="button" onclick="forgetPass();"  style="width: 100px;  height: 30px; float: left;"  class="button1" value="<%=Helper.getMessage(session, "Dcs.User.ChangePass.TryAgainBtn") %> " />
		</div>	
<%}
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
