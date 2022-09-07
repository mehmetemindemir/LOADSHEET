<%@page import="com.loadsheet.bean.data.user.UserInfoData"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	UserProcess 	proc=new UserProcess();
	String 		usersStatus=Helper.request2String(request, "usersStatus");
	int		userCompanyId=0;
	if(users.getUserPosition().equals("6") && users.getCampanyId()==0){
		userCompanyId=Helper.request2int(request, "userCompanyId");
	}else{
	 	userCompanyId=users.getCampanyId();
	}
	List<UserInfoData> userList=proc.getUserDataList(null,null,usersStatus,userCompanyId,2);
	int i=0;
%>
<div style="margin: 10px;">            
	<table  class="display dataTables" id="userListe" >
	<colgroup>
		<col width="4%"/>
		<col width="6%"/>
		<col width="15%"/>
		<col width="13%"/>
		<col width="8%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="8%"/>
		<col width="8%"/>
		<col width="8%"/>
	</colgroup>
	<thead>
		<tr>
			<th >No</th>
			<th >User Id</th>
			<th ><%=Helper.getMessage(session, "Dcs.User.Name") %></th>
			<th ><%=Helper.getMessage(session, "Dcs.User.UserName") %></th>
			<th ><%=Helper.getMessage(session, "Dcs.User.UserLocation") %></th>	
			<th ><%=Helper.getMessage(session, "User Type") %></th>	
			<th>Update </th>
			<th><%=Helper.getMessage(session, "Dcs.User.State") %></th>
		</tr>
	</thead>
	<tbody>
		<%
		i=0;
		for(UserInfoData item : userList){
			i++;	
		%>
		<tr <%-- style="<%=((i%2)==0?"background-color:#e4e4e4;":"background-color:#ffffff;")%>" --%>>
				<td><%=i %></td>
				<td><%=item.USER_ID %></td>
				<td><%=item.LAST_NAME+"  "+item.FIRST_NAME %></td>
				<td 
				<%if(users.getUserName().equals("MUSTAFAA") || users.getUserName().equals("MED") || users.getUserName().equals("BKEBABCI")){ %>
					style="cursor: pointer;color:blue;" onclick="getUserHistorydetail('<%=item.USER_NAME%>')"
				<%} %>
				>
					<%=item.USER_NAME %>
				</td>
				<td><%=item.USER_LOCATION %> </td>
				<td>
					<button  class="btn-xs btn-danger btn-circle" onclick="javascript:getUserAuth('<%=item.USER_ID %>','<%=item.LAST_NAME+"  "+item.FIRST_NAME %>','<%=item.USER_TYPE %>','<%=item.USER_NAME %>');" data-toggle="tooltip" data-original-title="<%=Helper.getMessage(session, "Dcs.User.UserAuth") %>"> 
						<i class="fa fa-user "></i> 
					</button> <%=item.USER_POSITION %>
				</td>
				<td>
					<button class="btn-xs btn-info btn-circle" onclick="javascript:openUpUser('<%=item.USER_NAME%>','<%=item.getCompanyId() %>');" data-toggle="tooltip" data-original-title="Güncelle"> 
						<i class="fa fa-pencil"></i> 
					</button>			
				</td>
				<td>
					<%if(item.STATUS.trim().equals("A")){ %>						
						<button class="btn btn-success btn-circle" data-href="javascript:deleteUser('<%=item.USER_NAME%>','P');" data-toggle="modal" data-target="#confirm-passive" >
					        <i data-toggle="tooltip" data-original-title="Pasif Yap" class="fa fa-check"></i> 
					    </button>
					<%}else{ %>					
						<button class="btn btn-default btn-circle" data-href="javascript:deleteUser('<%=item.USER_NAME%>','A');" data-toggle="modal" data-target="#confirm-active" >
					        <i  data-toggle="tooltip" data-original-title="Aktif Et" class="fa fa-ban text-danger"></i> 
					    </button> 
					<%} %>
				</td>
		</tr>
		<%}%>
		</tbody>
	</table>  
</div>
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>