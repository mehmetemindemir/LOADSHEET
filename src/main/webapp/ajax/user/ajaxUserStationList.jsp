<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.UserData"%>
<%@page import="adsdcs.bean.data.airport.AirportData"%>
<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.util.Helper"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 			users 		= (UserData) session.getAttribute(ProjectConstants.SESSION_USER);
	String 				userId		= Helper.request2String(request, "userId");
	UserProcess 		proc		= new UserProcess();
	List<AirportData> 	stationList	= proc.getUserAirportList(userId);
	int i=0;
	if(stationList.size()>0){
%>
<div style="margin: 10px;">            
	<table  class="display dataTables" id="userStationListTable" >
	<colgroup>
		<col width="10%"/>
		<col width="25%"/>
		<col width="35%"/>
		<col width="30%"/>
	</colgroup>
	<thead>
		<tr>
			<th >No</th>
			<th >City Code</th>
			<th >City name</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		<%
		i=0;
		for(AirportData item : stationList){
			i++;	
		%>
		<tr <%-- style="<%=((i%2)==0?"background-color:#e4e4e4;":"background-color:#ffffff;")%>" --%>>
				<td><%=i %></td>
				<td><%=item.CITY_CODE %></td>
				<td><%=item.PORT_NAME %></td>
				<td> 
					<button  class="btn-xs btn-danger btn-circle" onclick="javascript:deleteStationFromUser(<%=userId %>,'<%=item.CITY_CODE %>');" data-toggle="tooltip" data-original-title="<%=Helper.getMessage(session, "Dcs.User.Delete") %>"> 
						<i class="fa fa-trash-o "></i> 
					</button>
				</td>
		</tr>
		<%}%>
		</tbody>
	</table>  
</div>
<%}else{ %>
	Kullanıcıya	ekli herhangi bir istasyon bulunamadı. 
<%} %>
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>