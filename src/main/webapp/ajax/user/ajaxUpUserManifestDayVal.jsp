<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.UserData"%>
<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		= (UserData) request.getSession().getAttribute(ProjectConstants.SESSION_USER);
	response.setCharacterEncoding("UTF-8");
	int 		manifestDayVal 		= Helper.request2int(request, "manifestDayVal");
	String 		userName			= Helper.request2String(request, "userName");
	String		createUser			= users.userName;
	
	UserProcess prd=new UserProcess();
	prd.upUserManifestDayVal(userName, manifestDayVal, createUser);
	%>
	<select name="" id="manifestDayVal_<%=userName %>" class="input-sm form-control "  <%if(manifestDayVal==-1){%>style="color:red;font-weight:bolder;"<%}else if(manifestDayVal>3){%>style="color:#03a9f3;font-weight:bolder;"<%} %> onchange="getUpdateUserManifestDayVal('<%=userName%>')">
		<%if(manifestDayVal==-1){%>
			<option value="-1" selected="selected">Unlimited</option>
		<%}else{ %>
			<option value="-1" >No limit</option>
		<%} %>
		<%for(int k=0;k<=100;k++) {%>
			<option value="<%=k%>" <% if(manifestDayVal==k){%>selected="selected"<%} %> ><%=k%><% if(k>3 && manifestDayVal==k){%>-Days<%}else if(k<4 && manifestDayVal==k){ %>-Day<%} %></option>
		<%} %>
	</select>
	
<%	
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>

