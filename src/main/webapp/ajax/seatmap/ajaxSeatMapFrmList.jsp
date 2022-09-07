<%@page import="com.loadsheet.bean.data.carrier.CarrierData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.bean.data.carrier.HandlingCarrierData"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserData 			users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	CarrierProcess		carrierPrc	=new CarrierProcess();
	AjaxResponse 		rs			=new AjaxResponse();
	int					companyId	= users.getCampanyId();
	String				carrierId	="0";
	List<CarrierData> 	adminCarierList=null;
	List<HandlingCarrierData> carierList=null;
	if(companyId==0){
		rs=carrierPrc.getCarrierList();
		adminCarierList=(List<CarrierData>)rs.getData();
	}else{
		rs=carrierPrc.getCompanyCarrierList(companyId, carrierId);
		carierList=(List<HandlingCarrierData>)rs.getData();
	}
	

if(Helper.checkAjaxRequest(request)){

%>
	<form name="flightSeatMap" id="flightSeatMap" >
	 	<div class="row">
                   <div class="col-md-6 " id="listSeatmapBody"></div>
                   <div class="col-md-1 "></div>
                   <div class="col-md-5 ">    
                   	<div class="row hide" id="aircraftFormContent" >
                   		<div class="row">	                     			
                   			<div class="col-md-9">
                   				<div class="form-group">			                
                   					<label><%=Helper.getMessage(session, "Dcs.AirCraft.Code") %></label>
                   					<input type="text"  class="form-control"  data-validation-engine="validate[required]"  placeholder="Example : ATD/A320-164" id="aircraftCode" value="" name="vaircraftcode" readonly="readonly" onkeyup="justENChar(this);" onchange="justENChar(this);" />
                   				</div>
                   			</div>	
                   			<div class="col-md-3">
                   				<div class="form-group">			                
                   					<label  ><%=Helper.getMessage(session, "Dcs.AirCraft.Brand") %></label>
                   					<input type="text"  class="form-control"  data-validation-engine="validate[required]" placeholder="Example : AIRBUS" onkeyup="this.value = this.value.toUpperCase();" id="brand" value="" name="vaircraftbrand" />
                   				</div>
                   			</div>	
                   		</div>
                   		<div class="row">
                   			<div class="col-md-3">
                   				<div class="form-group">			                
                   					<label  ><%=Helper.getMessage(session, "Dcs.AirCraft.RegisterName") %></label>
                   					<input type="text"  class="form-control"  data-validation-engine="validate[required]" placeholder="Example : ATD" onkeyup="this.value = this.value.toUpperCase();changeAircraftCode();justENChar(this);"  id="registerName" value="" name="vregistername" maxlength="6"/>
                   				</div>
                   			</div>
                   			
                   			<div class="col-md-3">
                   				<div class="form-group">			                
                   					<label ><%=Helper.getMessage(session, "Dcs.AirCraft.Type") %></label>
                   					<input type="text"  class="form-control"  data-validation-engine="validate[required]" placeholder="Example : A320" onkeyup="this.value = this.value.toUpperCase();changeAircraftCode();" id="airCraftType" value="" name="vaircrafttype" />
                   				</div>
                   			</div>
	                   		<div class="col-md-3">
	                				<div class="form-group">			                
	                					<label ><%=Helper.getMessage(session, "Dcs.AirCraft.Capacity") %></label>
	                					<input type="text"  class="form-control"  data-validation-engine="validate[required]"  id="capacity" value="" name="vcapacity" onkeyup="justNumber(this);changeAircraftCode();" maxlength="3"/>
	                				</div>
	                			</div>	
                   			<div class="col-md-3">
                   				<div class="form-group">			                
                   					<label ><%=Helper.getMessage(session, "BusinessLine") %></label>         
				                      <select id="bussinesCount"  name="bussinesCount" class="form-control"  >
							   				<option selected="selected" value="0">0</option>
							   				<%for (int i=1;i<51 ;i++){ %>
							   					<option value="<%=i%>"><%=i %></option>
							   				<%} %>
							   		</select>               						            					
                   					
                   				</div>
                   			</div>
                   		</div>
                   		<div class="row">
                   			
                   			<div class="col-md-6">
                   				<div class="form-group">			                
                   					<label ><%=Helper.getMessage(session, "Airline") %></label>
                 					<select name="carrierCode" class=" form-control"  onchange="changeAircraftCode()" data-validation-engine="validate[required]"  id="carrierCode" >
				      					<option value=""><%=Helper.getMessage(session, "Select") %></option>
				      					<%if(companyId==0){ %>
				      						<%for(CarrierData item:adminCarierList) {%>
					      						<option value="<%=item.getIataDes()%>" ><%=item.getAirlineName() %></option>
					      					<%} %>
				      					<%}else{ %>
					      					<%for(HandlingCarrierData item:carierList) {%>
					      						<option value="<%=item.getCarrierCode()%>" ><%=item.getAirlineName() %>( <%=item.getCarrierCode() %> )</option>
					      					<%} %>
				      					<%} %>
				      					
				      					
				      				</select>
                   				</div>
                   			</div>
                   			<div class="col-md-6">
                   				<div class="form-group">			                
                   					<label class="col-md-6"><%=Helper.getMessage(session, "Wings Start") %></label>
                   					<label class="col-md-6"><%=Helper.getMessage(session, "Wings End") %></label>
                   					<div class="row">
                   						<div class="col-md-6"><input type="text"  class="form-control"  data-validation-engine="validate[required]"  id="airf01" value="" name="vairf01" onkeyup="justNumber(this);" maxlength="2"/></div>
                   						<div class="col-md-6"><input type="text"  class="form-control"  data-validation-engine="validate[required]"  id="airf02" value="" name="vairf02" onkeyup="justNumber(this);" maxlength="2"/></div>
                   					</div>                     					
                   					
                   				</div>
                   			</div>
                   		</div>
                   
                   		<div class="row">
	                     <div class="col-md-6 ">
	                     	<a class="btn btn-success" onclick="saveSeatMap();"><i class="fa fa-check"></i> <%=Helper.getMessage(session, "Dcs.Global.BtnSave") %> </a></div>
	                     <div class="col-md-1 "></div>
	                     <div class="col-md-5 "></div>
	            	</div>  
                   	</div>   
                   	 
                   	<div class="row">          
                    	<div class="modal-body" id="seatmapEditBody">
                    		<div tyle=" width: 400px;"> 
	                    		<div class="tooltipSeat" style=" margin: 5px; display: none;  "  id="selectedSeatBody">
						    		<div id="seatFree" 		onclick="selectConfig('freeH',this)" 	  		style="margin-left: 10px; margin-top:5px;  "class=" seat  freeH"   	title="FREE SEAT"></div>
						    		<div id="seatDisabled"  	onclick="selectConfig('disabledH',this)"  		style="margin-left: 2px; margin-top: 5px;  " class=" seat  disabledH" 	title="BLOCK SEAT"></div>
						    		<div id="seatElite" 		onclick="selectConfig('eliteH',this)" 			style="margin-left: 2px; margin-top: 5px; " class=" seat  eliteH" 		title="ELITE SEAT"></div>
						    		<div id="seatInf" 		onclick="selectConfig('infFreeH',this)" 			style="margin-left: 2px; margin-top: 5px; " class=" seat  infFreeH" 	title="FREE INF SEAT"></div>
						    		<div id="seatBlockInf" 	onclick="selectConfig('infBlockH',this)" 		style="margin-left: 2px; margin-top: 5px; " class=" seat  infBlockH" 	title="BLOCK INF SEAT"></div>		    		
						    		<div id="seatFreeUM" 	onclick="selectConfig('freeUMH',this)" 			style="margin-left: 2px; margin-top: 5px; " class=" seat  freeUMH" 	title="FREE UMH SEAT"></div>
						    		<div id="seatBlockUM" 	onclick="selectConfig('disabledUMH',this)" 		style="margin-left: 2px; margin-top: 5px; " class="seat disabledUMH" 	title="BLOCK UMH SEAT"></div>
						    		<div id="seatFreeWCHR" 	onclick="selectConfig('freeWCHRH',this)" 		style="margin-left: 2px; margin-top: 5px; " class=" seat  freeWCHRH "  title="FREE WCHRH SEAT"></div>	
						    		<div id="seatBlockWCHR" 	onclick="selectConfig('disabledWCHRH',this)" 	style="margin-left: 2px; margin-top: 5px; " class=" seat  disabledWCHRH" title="BLOCK WCHRH SEAT" ></div>				    		
						    		<div id="seatEmpty"  	onclick="selectConfig('emptyH',this)" 			style="margin-left: 2px; margin-top: 5px; " class=" seat  empty " 		title="EMPTY SEAT">E</div>
						    		
						    </div>
		                 <div id="seatmapContent" class="hide" style=" width: 400px;">					        
					        <div id="seatContent"  style="height: auto;  background-color: white;  width: 400px; overflow: auto; border: 1px solid black;">
					            <div id="seats" style="width: 150px; margin:auto;"></div>
					            <div id="seats1" style="width: 160px; display: none; margin-top: 20px;"></div>
					        </div>			        					       
					    	</div>
					     
	                </div>  
	             </div>   
                   </div>
                     
                  </div>     
</form>
	
<% }else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>
