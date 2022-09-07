<%@page import="java.util.ArrayList"%>
<%@page import="com.loadsheet.bean.data.flight.AirCraft"%>
<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.process.flight.FlightProcess"%>
<%@page import="com.loadsheet.bean.data.flight.Flight"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserData users = (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
Flight flightMain = FlightProcess.getFlightData(request);

AirCraftProcess airProc=new AirCraftProcess();
List<AirCraft> airList=new ArrayList<AirCraft>();
airList =(List<AirCraft>)airProc.getAirCraftList("", "",users.getCampanyId());
%>
<form name="flightUpdateForm" id="flightUpdateForm">
	
				<div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.Departure") %></label>
	                    </div>
	                </div>
	                <div class="col-md-8">
	                    <div class="form-group">
	                      	<input type="text" name="origin" class="form-control input-sm"  value="<%=flightMain.ORIGIN_DESC%>" readonly="readonly"/>
	                    </div>
                		</div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.Destination") %></label>
	                    </div>
	                </div>
	                <div class="col-md-8">
	                    <div class="form-group">
	                      	<input type="text" name="destination" class="form-control input-sm"  value="<%=flightMain.DESTINAION_DESC%>" readonly="readonly"/>
	                    </div>
                		</div>
                </div>
                
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.FlightNumber") %></label>
	                    </div>
	                </div>
	                <div class="col-md-4">
	                    <div class="form-group">
	                      	<input type="text" name="airlineCode" class="form-control input-sm"  maxlength="2" value="<%=flightMain.AIRLINE%>" readonly="readonly" data-validation-engine="validate[required]"/>
	                    </div>
                		</div>
                		<div class="col-md-4">
	                    <div class="form-group">
	                      <input type="text" class="form-control input-sm" name="flightNumber" onkeyup="this.value=this.value.toUpperCase();" maxlength="5" value="<%=flightMain.FLIGHT_NUMBER.substring(2) %>" readonly="readonly" data-validation-engine="validate[required]" />
	                    </div>
	                </div>
                </div>
                
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.DateOfDeparture") %></label>
	                    </div>
	                </div>
                		<div class="col-md-8">
	                    <div class="input-group">
	                    	<input type="text" class=" dateFormat form-control input-sm" name="departureDate"  id="departureDate" placeholder="dd/mm/yyyy"  onkeyup="convertDate(this);" maxlength="10"  value="<%=flightMain.DEPARTURE_DATE %>" data-validation-engine="validate[required]"  />
	                    	<span class="input-group-addon input-sm"><i class="icon-calender"></i></span> 
	                   </div>
	                </div>
                </div>
	             
	             <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.DepartureTime") %></label>
	                    </div>
	                </div>
	                <div class="col-md-4">
	                    <div class="form-group">
	                      <input type="text" name="departureHour" class="form-control input-sm" onkeyup="justNumber(this)" placeholder="Hour" maxlength="2" value="<%=flightMain.DEPARTURE_TIME.substring(0,2)%>" data-validation-engine="validate[required]"/>
	                    </div>
                		</div>
                		<div class="col-md-4">
	                    <div class="form-group">
	                      <input type="text" class="form-control input-sm" name="departureMinutes" onkeyup="justNumber(this)" placeholder="Minute" maxlength="2" value="<%=flightMain.DEPARTURE_TIME.substring(3)%>" data-validation-engine="validate[required]" />
	                    </div>
	                </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.DestinationTime") %></label>
	                    </div>
	                </div>
	                <div class="col-md-4">
	                    <div class="form-group">
	                      <input type="text" name="arrivalHour"  class="form-control input-sm" maxlength="2" value="<%=flightMain.ARRIVAL_TIME.substring(0,2)%>"  onkeyup="justNumber(this);" placeholder="Hour" data-validation-engine="validate[required]" />
	                    </div>
                		</div>
                		<div class="col-md-4">
	                    <div class="form-group">
	                      <input type="text" name="arrivalMinutes" class="form-control input-sm" maxlength="2" value="<%=flightMain.ARRIVAL_TIME.substring(3)%>"  onkeyup="justNumber(this);" placeholder="Minute" data-validation-engine="validate[required]"/>
	                    </div>
	                </div>
                </div>
                
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.AirCraftType") %></label>
	                    </div>
	                </div>
	                <div class="col-md-8">
	                    <div class="form-group">
			   				<select class="select2 form-control input-sm" name="aircraft" data-validation-engine="validate[required]" >
								<option value="CHOOSE"><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.SelectBox.Undefined") %></option>
			   					<%for(AirCraft item : airList){%>
									<option value="<%=item.getAircraftCode()%>"  <%=Helper.selected(flightMain.AIRCRAFT, item.getAircraftCode()) %>><%=item.getAircraftCode()%></option>
								<%}%>
							</select>
	                    </div>
                		</div>
                </div>
                
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.RouteType") %></label>
	                    </div>
	                </div>
	                <div class="col-md-8">
	                    <div class="form-group">
							<select class="select2 form-control input-sm" name="route" data-validation-engine="validate[required]" >
								<option <%if(flightMain.INTDOM.equals("DOM")){out.println("selected");} %> value="DOM"><%=Helper.getMessage(session, "Dcs.FlightList.Domestic") %></option>	
								<option <%if(flightMain.INTDOM.equals("INT")){out.println("selected");} %> value="INT"><%=Helper.getMessage(session, "Dcs.FlightList.International") %></option>					
							</select>
	                    </div>
                		</div>
                </div>
                
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.GateNumber") %></label>
	                    </div>
	                </div>
	                <div class="col-md-8">
	                    <div class="form-group">
	                      	<input type="text" class="form-control input-sm" name="gateNumber" id="gateNumber" maxlength="4" value="<%if(flightMain.GATE_NUMBER!=null){out.print(flightMain.GATE_NUMBER);}%>"/>
	                    </div>
                		</div>
                </div>
                <div class="col-md-12"> 
                		<div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.BoardingCardType") %></label>
	                    </div>
	                </div>
	                <div class="col-md-4">
                    		<div class="checkbox checkbox-info">
		                  <input type="checkbox" value="1" name="printType" <%if(flightMain.CON_BP_FLAG!=null && flightMain.CON_BP_FLAG.equals("A")){%>checked="checked"<%} %>>
		                  <label></label>
		                </div> 
	                </div>
                </div>
                
               <%if(users.getCampanyId()>0){ %>
                <div class="col-md-12">
                    <div class="col-md-4">
	                    <div class="form-group">
	                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.BaggageAllowence") %></label>
	                    </div>
	                </div>
	                <div class="col-md-1">
	                    <div class="form-group">
	                      <label>Y/CL :</label>
	                    </div>
	                </div>
	                <div class="col-md-3">
	                    <div class="form-group">
	                      <input type="text" name="baggageAllowenceEco" class="form-control input-sm" placeholder="Y/CL"   onkeyup="justNumber(this)" maxlength="3" value="<%=flightMain.getEcoBagAllowence() %>"/>
	                    </div>
                		</div>
                		<div class="col-md-1">
	                    <div class="form-group">
	                      <label>C/CL :</label>
	                    </div>
	                </div>
                		<div class="col-md-3">
	                    <div class="form-group">
	                      <input type="text" name="baggageAllowenceBuss"   class="form-control input-sm" onkeyup="justNumber(this);" placeholder="C/CL"  maxlength="3"  value="<%=flightMain.getBusBagAllowence()%>"/>
	                    </div>
	                </div>
                </div>
			<%} %>
                
                <br style="clear: both;">
                 
                 <div class="col-md-3 m-t-20 f-left" >
	                 	<a class="btn btn-success" onclick="updateFlight()" > 
	                 		<i class="fa fa-check"></i> Update Flight
	                 	</a>
	              </div>
	              <br style="clear: both;">
	              <div style="float: left; color:red; font-size: 14px;" id="addFlightAlert" ></div>
	<input type="hidden" name="voyageCode"  id="voyageCode" value="<%=flightMain.VOYAGE_CODE %>"/>
</form>

 
