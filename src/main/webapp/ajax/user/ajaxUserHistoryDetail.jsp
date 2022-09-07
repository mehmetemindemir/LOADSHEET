<%@page import="com.loadsheet.bean.data.user.UserHistoryData"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData users = (UserData)session.getAttribute(Constants.SESSION_USER);
	String userName=Helper.request2String(request, "userName");		
	UserProcess  uProcess=new UserProcess();
	List<UserHistoryData> historyList =uProcess.getUserHistory(userName);
	int i=1;
%>
<div style="margin: 10px;  overflow: auto;">            
	 <table cellpadding="0" cellspacing="0" width="100%" style="font-size: 12px;" id="userHistoryDetailTable" class="dataTables display" >
	<thead>
		<tr>
			<th width="2%"><%=Helper.getMessage(session, "Dcs.CheckinHistory.No") %></th>
			<th width="25%"><%=Helper.getMessage(session, "Dcs.CheckinHistory.Date") %></th>	
			<th width="15%"><%=Helper.getMessage(session, "Dcs.CheckinHistory.Code") %></th>	
			<th width="50%"><%=Helper.getMessage(session, "Dcs.CheckinHistory.Desc") %></th>	
			<th width="8%"><%=Helper.getMessage(session, "Dcs.CheckinHistory.User") %></th>				
		</tr>
	</thead>
	<tbody>
		<%
		for(UserHistoryData item:historyList){%>
				<tr style="">
					<td ><%=i %></td>
					<td><%=item.getCreateDate() %></td>
					<td><%=item.getLogType() %></td>
					<td ><%=item.getLogText() %></td>
					<td><%=item.getCreateUser() %></td>
				</tr>
			
		<%i++;} %>
		</tbody>
	</table>  
</div>	
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>