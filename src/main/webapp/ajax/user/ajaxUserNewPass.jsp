<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	int controleCode=Helper.request2int(request, "userCode");
	int userId=0;
	if(session!=null &&session.getAttribute(ProjectConstants.USER_ID)!=null ){
		userId=Integer.valueOf(session.getAttribute(ProjectConstants.USER_ID).toString());
	}
	String type=Helper.request2String(request, "type");
	int state=0;
	UserProcess prd=new UserProcess();
	state=prd.controleCode(userId, type, controleCode);
	if(state>0){
		session.setAttribute(ProjectConstants.USER_AUTORIZED_CODE, controleCode);
%>
<form id="changePasswordFrm"> 	
	<div class="divLabe" style="float:left;margin-top:25px;width: 80px;"><%=Helper.getMessage(session, "Dcs.User.LabelUserPass") %> </div> 
	<div class="divInput" style="width: 200px;height: 30px; margin-top: 20px;  float: left;" >
		<input type="password" name="userPass" maxlength="16"   
				autocomplete="off" placeholder="<%=Helper.getMessage(session, "Dcs.User.LabelUserPass")%>" 
				data-validation-engine="validate[required]"  id="userPass" value="" >
	</div>
	<br class="cb">
	<div class="divLabe" style="float:left;margin-top:25px;width: 80px;"><%=Helper.getMessage(session, "Dcs.User.LabelUserPassRe") %> </div> 
	<div class="divInput" style="width: 200px;height: 30px; margin-top: 20px;  float: left;" >
		<input type="password" name="userPassRe" maxlength="16"   
				autocomplete="off" placeholder="<%=Helper.getMessage(session, "Dcs.User.LabelUserPassRe")%>" 
				data-validation-engine="validate[required]"  id="userPassRe" value="" >
	</div>
	<br class="cb">
	 <div style="float: left;margin-top:20px; " >          	
		<input type="button" onclick="ChangePassword()"  style="width: 100px;  height: 30px; float: left;"  class="button1" value="<%=Helper.getMessage(session, "Dcs.Global.BtnChangePass") %> " />
	</div>	 
	
</form>  
<%}else {%>
	<ul class="system_messages">
			<li class="red"><span class="ico"></span><strong class="system_title"><%=Helper.getMessage(session,"Dcs.User.ChangePhoneAlertErrorCode") %></strong></li>
	</ul>
<%}
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>