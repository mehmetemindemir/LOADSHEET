<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	String userPhone=Helper.request2String(request, "userPhone").replace(")", "").replace(")", "").replace("-", "");	
	int userId=Helper.request2int(request, "userId");
	String message=Helper.getMessage(session, "Dcs.User.SmsMessage.ChangePhone");
	UserProcess user=new UserProcess();
	int state=user.addUserCreateCodePhone(userId,message,userPhone);
	if(state>-1){
	if(state==5){
%>
	<ul class="system_messages">
		<li class="green"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneAlertErrorSmsLimit") %></strong></li>	
	</ul>
	<%}else{ %>
	<ul class="system_messages">
		<li class="green"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneSendSmsAlertSuccess") %></strong></li>	
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
		<input type="hidden" id="type" name="type" value="PHONE">	 
		<input type="hidden" id="userId" name="userId" value="<%=userId%>">	 
		<input type="hidden" id="contact" name="contact" value="<%=userPhone%>">	
	</form>  
	<br class="cb">
	<div id="changePasswordContent" style="display: none;"></div>

<%}

}else { %>
	<ul class="system_messages">
		<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.Global.ErrorAlert") %></strong></li>
	
	</ul>
<%} 
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>
