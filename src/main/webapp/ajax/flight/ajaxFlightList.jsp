<%@page import="com.loadsheet.bean.data.flight.Flight"%>
<%@page import="com.loadsheet.process.flight.FlightProcess"%>
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
	String flightDate=Helper.request2String(request, "flightDate");
	FlightProcess fp=new FlightProcess();
	List<Flight> flightList=fp.getFlight("all", flightDate, users.getUserName(),users.getUserAirline());
	int i=0;
 %>
<br class="cb">
<table cellpadding="0" cellspacing="0" width="100%" style="font-size: 12px;" id="flightListTable" class="display dataTable" >							
	<thead>		
		<tr>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.Date") %></th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.Flight") %></th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.Departure") %></th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.Destination") %> </th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.AirCraftType") %></th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.Gate") %></th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.CheckIn") %></th>
				<th ><%=Helper.getMessage(session, "Dcs.FlightList.Business") %></th>	
				<th ></th>		
			</tr>		
	</thead>
	<tbody>
		<%
			int d=0;
		for(Flight item : flightList){
		d++;
		%>
			<tr >
				<%if(users.getCampanyId()>0){ %>
					<td ><a href="#" class="link" onclick="getFlightUpdateForm('<%=item.VOYAGE_CODE %>')" class="ahref10"><%=item.DEPARTURE_DATE +" "+item.DEPARTURE_TIME %></a></td>
				<%}else{ %>
					<td ><%=item.DEPARTURE_DATE +" "+item.DEPARTURE_TIME %></td>
				<%} %>
				<td ><%=item.FLIGHT_NUMBER %></td>
				<td title="<%=item.ORIGIN_DESC%>"><%=item.ORIGIN_CODE%></td>
				<td title="<%=item.DESTINAION_DESC%>"><%=item.DESTINATION_CODE %></td>
				<td ><%if(item.AIRCRAFT==null){out.print("TANIMSIZ");}else{out.print(item.AIRCRAFT);} %></td>
				<td ><%if(item.GATE_NUMBER==null){out.print("TANIMSIZ");}else{out.print(item.GATE_NUMBER);} %></td>
				<td>

					<select id="flightStatusParam<%=d%>" onchange="changeFlightCheckinStatus('<%=item.VOYAGE_CODE %>','CHECKIN','flightStatusParam<%=d%>')">
						<option <%=Helper.selected(item.CHECKIN_STATUS, "OPEN") %> value="OPEN"><%=Helper.getMessage(session, "Dcs.SeatBlock.FlightStatus.Open") %></option>
						<option <%=Helper.selected(item.CHECKIN_STATUS, "CLOSE") %> value ="CLOSE"><%=Helper.getMessage(session, "Dcs.SeatBlock.FlightStatus.Close") %></option>
						<option <%=Helper.selected(item.CHECKIN_STATUS, "FINALIZE") %> value="FINALIZE"><%=Helper.getMessage(session, "Dcs.SeatBlock.FlightStatus.Finalize") %></option>
					</select>
				</td>
				<td height="25"><% if(item.BUSINESS==0){out.print("YOK");}else{out.print(item.BUSINESS+" SIRA");} %></td>
				
				<td>
					<%if(item.getIsAHMExists().equals("")){ %>
						<%if(item.isLoadSheetExists==1){%>
						<a class="btn btn-success pull-left "  href="<%=Constants.PROJECT_PATH %>/loadSheetMain.jsp?voyageCode=<%=item.VOYAGE_CODE%>" > <i class="fa fa-run"></i>Flight Load Sheet</a>
						<%}else{%>
						<a class="btn btn-default pull-left "  href="<%=Constants.PROJECT_PATH %>/loadSheetMain.jsp?voyageCode=<%=item.VOYAGE_CODE%>" > <i class="fa fa-run"></i>Flight Load Sheet</a>
						<%} %>
					<%}else{ %>
						<label class="text-danger"><%=item.getIsAHMExists() %> </label> 
					<%} %>
				</td>
			</tr>
		<%i++;} %>
	</tbody>
</table>  
