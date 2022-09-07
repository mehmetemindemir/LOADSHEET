<%@page import="com.loadsheet.bean.data.AirportData"%>
<%@page import="com.loadsheet.process.flight.FlightProcess"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.loadsheet.bean.data.flight.AirCraft"%>
<%@page import="com.loadsheet.process.flight.AirCraftProcess"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="java.util.List"%>
<%@page import="com.loadsheet.bean.data.carrier.HandlingCarrierData"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	
	AirCraftProcess airProc=new AirCraftProcess();
	List<AirCraft> airList=new ArrayList<AirCraft>();
	airList =(List<AirCraft>)airProc.getAirCraftList("", "",users.getCampanyId());
	
	FlightProcess  airportPro=new FlightProcess();
	List<AirportData> locateList=airportPro.getCharterAirportList();
	
	List<HandlingCarrierData> hcd=null;
	if(users.getCampanyId()>0){
		CarrierProcess cp = new CarrierProcess();
		AjaxResponse ar = cp.getCompanyCarrierList(users.getCampanyId(),"0");
		hcd = (List<HandlingCarrierData>) ar.getData();
	}
	
%>

			<form id="addFlightForm">
                  	<div class="col-md-12">
	                    <div class="col-md-4">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.Departure") %></label>
		                    </div>
		                </div>
		                <div class="col-md-8">
		                    <div class="form-group">
		                      	<select name="origin" data-validation-engine="validate[required]" class="select2 form-control input-sm">
				   					<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
				   					<%for(AirportData item:locateList) { if(!item.PORT_CODE.equals(users.getUserLocation())) continue;%>
	               						<option value="<%=item.PORT_CODE%>"><%=item.PORT_NAME %>( <%=item.PORT_CODE %> )</option>
	               					<%} %>
				   				</select>
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
		                      	<select name="destination" data-validation-engine="validate[required]" class="select2 form-control input-sm">
				   					<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
				   					<%for(AirportData item:locateList) {%>
	               						<option value="<%=item.PORT_CODE%>"><%=item.PORT_NAME %>( <%=item.PORT_CODE %> )</option>
	               					<%} %>
				   				</select>
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
		                      	<select name="airlineCode" data-validation-engine="validate[required]" class="select2 form-control input-sm">
				   					<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
				   					<%for(HandlingCarrierData airLineitem:hcd) {%>
               						<option value="<%=airLineitem.getCarrierCode()%>"><%=airLineitem.getCarrierCode()%></option>
               						<%} %>
				   				</select>
				   				
		                    </div>
	                		</div>
	                		<div class="col-md-4">
		                    <div class="form-group">
		                      <input type="text" name="flightNumber"   data-validation-engine="validate[required]" class="form-control input-sm" onkeyup="this.value=this.value.toUpperCase();"  />
		                    </div>
		                </div>
	                </div>
	                
	                <div class="col-md-12">
	                    <div class="col-md-4">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.DateOfStart") %></label>
		                    </div>
		                </div>
	                		<div class="col-md-8">
		                    <div class="input-group">
		                    	<input type="text" class=" dateFormat form-control input-sm" name="startDepartureDate" id="" value="<%=Helper.getToDate() %>" placeholder="dd/mm/yyyy" onkeyup="convertDate(this);" data-validation-engine="validate[required]">
		                    	<span class="input-group-addon input-sm"><i class="icon-calender"></i></span> 
		                   </div>
		                </div>
	                </div>
	                <div class="col-md-12">
	                		<div class="col-md-4">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.DateOfEnd") %></label>
		                    </div>
		                </div>
	                		<div class="col-md-8">
		                    <div class="input-group">
		                    	<input type="text" class="dateFormat form-control input-sm" name="endDepartureDate" id="" value="<%=Helper.getToDate() %>" placeholder="dd/mm/yyyy" onkeyup="convertDate(this);" data-validation-engine="validate[required]">
		                    	<span class="input-group-addon input-sm"><i class="icon-calender"></i></span> 
		                   </div>
		                </div>
	               </div>
	                <div class="col-md-12"> 
	                		<div class="col-md-4">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.FlightSearchDetails.DayOfWeek") %></label>
		                    </div>
		                </div>
		                <div class="col-md-2">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek2" name="dayofweek" value="2">
			                  <label for="dayofweek2"> <%=Helper.getMessage(session, "Days.02") %> </label>
			                </div> 
		                </div>
		                 <div class="col-md-2">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek3" name="dayofweek" value="3">
			                  <label for="dayofweek3"> <%=Helper.getMessage(session, "Days.03") %> </label>
			                </div> 
		                </div>
		                <div class="col-md-2">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek4" name="dayofweek" value="4">
			                  <label for="dayofweek4"> <%=Helper.getMessage(session, "Days.04") %> </label>
			                </div> 
		                </div>
		                <div class="col-md-2">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek5" name="dayofweek" value="5">
			                  <label for="dayofweek5"> <%=Helper.getMessage(session, "Days.05") %> </label>
			                </div> 
		                </div>
		                <div class="col-md-2">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek6" name="dayofweek" value="6">
			                  <label for="dayofweek6"> <%=Helper.getMessage(session, "Days.06") %> </label>
			                </div> 
		                </div>
		                <div class="col-md-2">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek7" name="dayofweek" value="7">
			                  <label for="dayofweek7"> <%=Helper.getMessage(session, "Days.07") %> </label>
			                </div> 
		                </div>
		                <div class="col-md-2 ">
	                    		<div class="checkbox checkbox-info">
			                  <input type="checkbox" id="dayofweek1" name="dayofweek" value="1">
			                  <label for="dayofweek1"> <%=Helper.getMessage(session, "Days.01") %> </label>
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
		                      <input type="text" name="departureHour"   data-validation-engine="validate[required]" class="form-control input-sm" onkeyup="justNumber(this);" placeholder="Hour" />
		                    </div>
	                		</div>
	                		<div class="col-md-4">
		                    <div class="form-group">
		                      <input type="text" name="departureMinutes"   data-validation-engine="validate[required]" class="form-control input-sm" onkeyup="justNumber(this);" placeholder="Minute" />
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
		                      <input type="text" name="arrivalHour"   data-validation-engine="validate[required]" class="form-control input-sm" onkeyup="justNumber(this);" placeholder="Hour" />
		                    </div>
	                		</div>
	                		<div class="col-md-4">
		                    <div class="form-group">
		                      <input type="text" name="arrivalMinutes"   data-validation-engine="validate[required]" class="form-control input-sm" onkeyup="justNumber(this);" placeholder="Minute" />
		                    </div>
		                </div>
	                </div>
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
		                      <input type="text" name="baggageAllowenceEco"    class="form-control input-sm" onkeyup="justNumber(this);" placeholder="Y/CL" />
		                    </div>
	                		</div>
	                		<div class="col-md-1">
		                    <div class="form-group">
		                      <label>C/CL :</label>
		                    </div>
		                </div>
	                		<div class="col-md-3">
		                    <div class="form-group">
		                      <input type="text" name="baggageAllowenceBuss"    class="form-control input-sm" onkeyup="justNumber(this);" placeholder="C/CL" />
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
		                      	<select name="aircraft" data-validation-engine="validate[required]" class="select2 form-control input-sm">
				   					<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
				   					<%for(AirCraft item : airList){%>
										<option value="<%=item.getAircraftCode()%>" ><%=item.getAircraftCode()%></option>
									<%}%>
				   				</select>
		                    </div>
	                		</div>
	                </div>
	                <br style="clear: both;">
	                 
	                 <div class="col-md-3 m-t-20 f-left" >
		                 	<a class="btn btn-success" onclick="addFlight()" > 
		                 		<i class="fa fa-check"></i> Create Flight
		                 	</a>
		              </div>
		              <br style="clear: both;">
		              <div style="float: left; color:red; font-size: 14px;" id="addFlightAlert" ></div>
                </form>  
    <br style="clear: both;">
    
 <%
 }else{ out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); }
 %>