<%@page import="com.loadsheet.bean.data.flight.AirCraft"%>
<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	String capacity=""; 
	String registerName="";
	UserData user=(UserData)session.getAttribute(Constants.SESSION_USER);
	AirCraftProcess airProc=new AirCraftProcess();
	List<AirCraft> airList=new ArrayList<AirCraft>();
	airList =airProc.getAirCraftList(capacity, registerName,user.getCampanyId());
 %>
<div style=" width: 100px; float: right; margin:5px 40px 5px 5px;" >
	<input tabindex="1004" type="button" onclick="openPopup('newSeatmap');" style="width: 120px; height: 30px; float: left; margin-right: 5px;"  class="button1" value="Yeni Seat Map" />
</div> 
<br class="cb">
<table cellpadding="0" cellspacing="0" width="100%" style="font-size: 12px;" id="airCraftSeatmapListTable" class="dataTables display" >							
	<thead>
		<tr>
			<th width="5%" ><%=Helper.getMessage(session, "Dcs.AirCraft.RegisterName") %></th>
			<th width="5%" ><%=Helper.getMessage(session, "Dcs.AirCraft.Brand") %></th>
			<th width="55%"><%=Helper.getMessage(session, "Dcs.AirCraft.Code") %></th>
			<th width="5%"><%=Helper.getMessage(session, "Dcs.AirCraft.Type") %></th>
			<th width="5%" ><%=Helper.getMessage(session, "Dcs.AirCraft.Capacity") %></th>			
			<th width="5%" ><%=Helper.getMessage(session, "Carrier") %></th>
			<th width="20%" ><%=Helper.getMessage(session, "Dcs.AirCraft.Status") %></th>
			<th width="10%" >SeatMap</th>
		</tr>
	</thead>
	<tbody>
	<%
		int i=0;
		for(AirCraft item : airList){%>
		<%if(user.getCampanyId()>0){ %>
			<%if(item.getStatus().equals("A") ){ %>
				<tr >
					<td ><%=item.getRegisterName() %></td>
					<td ><%=item.getAircraftBrand() %></td>
					<td ><%=item.getAircraftCode() %></td>
					<td ><%=item.getAircraftType() %></td>
					<td ><%=item.getCapacity() %></td>
					<td ><%=item.getCarrierCode() %></td>
					<td ><a class="link"  href="#" onclick="return upDateStatus('<%=item.getAircraftCode() %>','<%=item.getStatus().trim().equals("A")?"P":"A" %>')" ><%=item.getStatus().trim().equals("A")?"DO PASSIVE":"DO ACTIVE" %></a></td>
					<td ><a class="link"  href="#" onclick="return getSeatMap('<%=item.getAircraftCode() %>','<%=item.getAircraftBrand() %>','<%=item.getRegisterName() %>','<%=item.getAircraftType() %>','<%=item.getCapacity() %>','<%=item.getWingsStart() %>','<%=item.getWingsEnd() %>','<%=item.getBusinessLine() %>','<%=item.getCarrierCode() %>')" >SeatMap</a></td>
				</tr>
			<%} %>
		<%}else{ %>
			<tr >
				<td ><%=item.getRegisterName() %></td>
				<td ><%=item.getAircraftBrand() %></td>
				<td ><%=item.getAircraftCode() %></td>
				<td ><%=item.getAircraftType() %></td>
				<td ><%=item.getCapacity() %></td>
				<td ><%=item.getCarrierCode() %></td>
				<td ><a class="link"  href="#" onclick="return upDateStatus('<%=item.getAircraftCode() %>','<%=item.getStatus().trim().equals("A")?"P":"A" %>')" ><%=item.getStatus().trim().equals("A")?"DO PASSIVE":"DO ACTIVE" %></a></td>
				<td ><a class="link"  href="#" onclick="return getSeatMap('<%=item.getAircraftCode() %>','<%=item.getAircraftBrand() %>','<%=item.getRegisterName() %>','<%=item.getAircraftType() %>','<%=item.getCapacity() %>','<%=item.getWingsStart() %>','<%=item.getWingsEnd() %>','<%=item.getBusinessLine() %>','<%=item.getCarrierCode() %>')" >SeatMap</a></td>
			</tr>
		<%} %>
		<%i++;} %>
	</tbody>
</table>  
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>