<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.bean.data.flight.AirCraft"%>
<%@page language="java"	 pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
	UserData 	users 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	String capacity=""; 
	String registerName="";
	int	companyId=users.getCampanyId();
	AirCraftProcess airProc=new AirCraftProcess();
	List<AirCraft> airList=new ArrayList<AirCraft>();
	airList =(List<AirCraft>)airProc.getAirCraftList(capacity, registerName,companyId);
 %>
<br class="cb">
<table cellpadding="0" cellspacing="0" width="100%" style="font-size: 12px;" id="seatmapListTable" class="display dataTable" >							
	<thead>
		<tr>
			<th width="10%" ><%=Helper.getMessage(session, "Dcs.AirCraft.RegisterName") %></th>
			<th width="10%" ><%=Helper.getMessage(session, "Dcs.AirCraft.Brand") %></th>
			<th width="25%"><%=Helper.getMessage(session, "Dcs.AirCraft.Code") %></th>
			<th width="10%"><%=Helper.getMessage(session, "Dcs.AirCraft.Type") %></th>
			<th width="10%" ><%=Helper.getMessage(session, "Dcs.AirCraft.Capacity") %></th>			
			<th width="15%" ><%=Helper.getMessage(session, "Dcs.AirCraft.Status") %></th>
			<th width="10%" ><%=Helper.getMessage(session, "Carrier") %></th>
			<th width="10%" >AHM Load</th>
		</tr>
	</thead>
	<tbody>
	<%
		int i=0;
		for(AirCraft item : airList){%>
			<tr <%-- style="<%=(i%2==0?"background-color:#E0DFDF;":"#FFFFFF")%>" --%>>
				<td ><%=item.getRegisterName() %></td>
				<td ><%=item.getAircraftBrand() %></td>
				<td ><%=item.getAircraftCode() %></td>
				<td ><%=item.getAircraftType() %></td>
				<td ><%=item.getCapacity() %></td>
				<td >
					<%-- <a class="link" style="<%if(item.getStatus().trim().equals("A")){%>color:green;<%}else{ %>color:red;<%} %>" href="#" onclick="return upDateStatus('<%=item.getAircraftCode() %>','<%=item.getStatus().trim().equals("A")?"P":"A" %>')" ><%=item.getStatus().trim().equals("A")?"DO PASSIVE":"DO ACTIVE" %></a> --%>
					<%if(item.getStatus().trim().equals("A")){ %>						
						<button class="btn btn-success btn-circle" onclick="upDateStatus('<%=item.getAircraftCode() %>','P');" data-toggle="modal"  >
					        <i data-toggle="tooltip" data-original-title="Pasif Yap" class="fa fa-check"></i> 
					    </button>
					<%}else{ %>					
						<button class="btn btn-default btn-circle" onclick="upDateStatus('<%=item.getAircraftCode() %>','A');" data-toggle="modal"  >
					        <i  data-toggle="tooltip" data-original-title="Aktif Et" class="fa fa-ban text-danger"></i> 
					    </button> 
					<%} %>
				</td>
				<td ><%=item.getCarrierCode() %></td>
				<td >
					<%-- <a class="link"  href="<%=Constants.PROJECT_PATH%>/ahmLoadForm.jsp?aircraftCode=<%=item.getAircraftCode() %>&registerName=<%=item.getRegisterName() %>&aircraftType=<%=item.getAircraftType() %>&capacity=<%=item.getCapacity() %>&carrierCode=<%=item.getCarrierCode() %> " >AHM Load</a> --%>
					<%if(item.getIsAHMExists().equals("")){ %>
						<a class="btn btn-success pull-left " style="width: 200px;"  href="<%=Constants.PROJECT_PATH%>/ahmLoadForm.jsp?aircraftCode=<%=item.getAircraftCode() %>&registerName=<%=item.getRegisterName() %>&aircraftType=<%=item.getAircraftType() %>&capacity=<%=item.getCapacity() %>&carrierCode=<%=item.getCarrierCode() %> " > <i class="fa fa-run"></i>Update AHM</a>
					<%}else{ %>
						<a class="btn btn-default pull-left " style="width: 200px;" href="<%=Constants.PROJECT_PATH%>/ahmLoadForm.jsp?aircraftCode=<%=item.getAircraftCode() %>&registerName=<%=item.getRegisterName() %>&aircraftType=<%=item.getAircraftType() %>&capacity=<%=item.getCapacity() %>&carrierCode=<%=item.getCarrierCode() %> " > <i class="fa fa-run"></i><%=item.getIsAHMExists() %> </a>
					<%} %>
				</td>
			</tr>
		<%i++;} %>
	</tbody>
</table>  
