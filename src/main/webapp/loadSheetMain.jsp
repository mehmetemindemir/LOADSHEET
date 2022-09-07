<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightData"%>
<%@page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	UserData sessionUsers = (UserData) session.getAttribute(Constants.SESSION_USER);
	String lang = Helper.getLanguage(request);
	String voyageCode = Helper.request2String(request, "voyageCode");
	
	LoadSheetFlightData lfd = new LoadSheetFlightData();
	GetLoadSheetFlightDetail  glsfd = new GetLoadSheetFlightDetail();
	lfd = glsfd.getFlightDetail(voyageCode,sessionUsers.getCampanyId());
	
%>
<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">
		@media screen and (min-width: 300px) {
			#loadsheet-modal .modal-dialog {
				width: 1300px;
			}
			#seatmap-modal .modal-dialog {
				width: 1300px;
			}
			
		}
		.form-control{
			border: 2px solid #7ab2fa !important;
		}
		.form-error{
			border: 2px solid red !important;
		}
		
		.jq-icon-error {
		    background-color: red !important;
		    color: #ffffff;
		}
</style>
<link rel="icon" type="image/png" sizes="16x16" href="../images/fav.ico">
<title>VOR LOAD SHEET</title>
<jsp:include page="inc/incCss.jsp"></jsp:include>
</head> 
<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top m-b-0">
			<div class="navbar-header">
				<a class="navbar-toggle hidden-sm hidden-md hidden-lg "
					href="<%=Constants.PROJECT_PATH%>/loadPanel.jsp"
					data-toggle="collapse" data-target=".navbar-collapse"><i
					class="ti-menu"></i></a>
				<div class="logo-kk hidden-sm hidden-md hidden-lg"></div>
				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse slimscrollsidebar">
						<div class="logo-kk-lg"></div>
						<jsp:include page="inc/incMenu.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</nav>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="col-sm-4 pull-left m-t-10">
							<a href="#" style="font-weight: bold; color: #4cc1f6; text-decoration: underline;"><%=sessionUsers.getUserFirstName() + " " + sessionUsers.getUserLastName()%></a>
							<span id="airPortName" style="color: #ce0021; font-weight: bold;"><%=" (Airport: " + sessionUsers.getUserLocation()%>)
							</span> <span style="margin-right: 5px; font-weight: bold;"><%=Helper.getToDate()%></span>
							<span style="margin-right: 5px; font-weight: bold;" id="txtClock"></span>
						</div>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"></div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="white-box col-xs-12 ">
					<div class="row">
						<!-------------------- Trip Info Start --------------->
						<div class="col-sm-12">
							<div class="white-box">
								<div class="row" >
									<div class="col-lg-12 p-10"  style="border: 1px solid #4393FB;border-radius: 10px;"">
										<!-- ROW Start -->
										<div class="row" >
											<form name="flightInfoForm" id="flightInfoForm">
												<div class="col-lg-8  p-t-10"  >
													<%if(lfd.revNo!=null){%>
														<div class="row" id="revNoID">
															<div class="col-lg-12">
																<div class="col-sm-3"><label for="" class="col-sm-12 control-label " >Rev No : <font color="Red"><%=lfd.revNo %></font></label></div>
															</div>
														</div>
														<br style="clear: both;">
													<%} %>
													<div class="row">
														<div class="col-lg-12">
															<div class="col-sm-3">
																<label for="" class="col-sm-12 control-label " >FLIGHT NO</label>
																<div class="col-sm-11">
																	<input type="text" class="form-control input-sm" id="flightNumber" name="flightNumber" value="<%=lfd.flightNumber %>"    placeholder="" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter(this)"/>
																</div>
															</div>
										              		<div class="col-sm-2 " >
										              			<label for="" class="col-sm-12 control-label ">From</label>
										              			<input type="text" class="form-control input-sm m-b-5" id="from" name="from" value="<%=lfd.originCode %>"  placeholder="" onkeyup="this.value=this.value.toUpperCase();justLatter2(this)"/>
										              		</div>
										              		<div class="col-sm-2" >
										              			<label for="" class="col-sm-12 control-label ">To</label>
										              			<input type="text" class="form-control input-sm m-b-5" name="to" id="to" value="<%=lfd.destinationCode %>"   placeholder="" onkeyup="this.value=this.value.toUpperCase();justLatter2(this)"/>
										              		</div>
										              		<div class="col-sm-2 " >
										              			<label for="" class="col-sm-12 control-label ">Date</label>
										              			<input type="text" class="form-control input-sm m-b-5" name="date" id="date" value="<%=lfd.departureDate %>"  placeholder="" />
										              		</div>
										              		<div class="col-sm-3 " >
										              			<label for="" class="col-sm-12 control-label ">Registration</label>
										              			<div class="col-sm-10">
												                  <input type="text" class="form-control input-sm" name="aircraft" id="aircraft" value="<%=lfd.aircraft %>"  placeholder="" data-validation-engine="validate[required]" readonly="readonly" />
												                </div>																				           
										              		</div>	
							          					</div>
							          				</div>
							          				<br style="clear: both;">
					                 				<br style="clear: both;">
							          				<div class="row">
									          			<div class="col-lg-6" >
							             					<div class="row m-t-5"  >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Cockpit </label>
											              			</div>
											              			<div class="col-sm-8">
													                  	<select class="inputRedBorder" name="cockpit" tabindex="5" id="cockpit" onchange="getDowDoiValues();">
																			<%for(int i=0;i<5;i++){%>
																				<option value="<%=i%>" <%if(lfd.actualCockpit==i){out.print("selected");} %>><%=i%></option>
																			<%} %>
																		</select>
													                </div>	
					             								</div>
							             					</div>		
							             					<div class="row m-t-5" >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Cabin </label>
											              			</div>
											              			<div class="col-sm-8">
													                 	<select class="inputRedBorder" name="cabinCrew" tabindex="6" id="cabinCrew" onchange="getDowDoiValues();">
																			<%for(int i=0;i<10;i++){%>
																				<option value="<%=i%>" <%if(lfd.actualCabin==i){out.print("selected");} %>><%=i%></option>
																			<%} %>
																		</select>
													                </div>	
						             							</div>
							             					</div>			
							             					<div class="row m-t-5" >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Pantry </label>
											              			</div>
											              			<div class="col-sm-8">
											              				<select class="inputRedBorder" name="pantry" tabindex="7" data-validation-engine="validate[required]" onchange="getDowDoiValues();">
											              						<option value="">Select</option>
																				<option value="ONEWAYINT" <%if(lfd.actualPantry!=null && lfd.actualPantry.equals("ONEWAYINT")){out.print("selected");} %>>ONE WAY INT</option>
																				<option value="TWOWAYINT" <%if(lfd.actualPantry!=null && lfd.actualPantry.equals("TWOWAYINT")){out.print("selected");} %>>TWO WAY INT</option>
																				<option value="ONEWAYDOM" <%if(lfd.actualPantry!=null && lfd.actualPantry.equals("ONEWAYDOM")){out.print("selected");} %>>ONE WAY DOM</option>
																				<option value="TWOWAYDOM" <%if(lfd.actualPantry!=null && lfd.actualPantry.equals("TWOWAYDOM")){out.print("selected");} %>>TWO WAY DOM</option>
																				<option value="FERRY" <%if(lfd.actualPantry!=null && lfd.actualPantry.equals("FERRY")){out.print("selected");} %>>FERRY</option>
																		</select>
													                </div>	
						             							</div>
							             					</div>			
							             					<div class="row m-t-5" >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Pax Weight </label>
											              			</div>
											              			<div class="col-sm-8">
													                  	<select class="inputRedBorder" name="paxWeight" id="paxWeight" tabindex="8" data-validation-engine="validate[required]">
													                  		<option value="">Select</option>
																			<option value="holidayCharter" <%if(lfd.actualPaxWeight!=null && lfd.actualPaxWeight.equals("holidayCharter")){out.print("selected");} %>>Holiday Charter</option>
																			<option value="standartFlight" <%if(lfd.actualPaxWeight!=null && lfd.actualPaxWeight.equals("standartFlight")){out.print("selected");} %>>Standart M:88 Kg,F:70 Kg</option>
																		</select>
													                </div>	
						             							</div>
							             					</div>			
							             					<div class="row m-t-5"   >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Take Off Fuel </label>
											              			</div>
											              			<div class="col-sm-8">
													                  <input type="text" class="form-control input-sm" name="takeOffFuel" id="takeOffFuel" value="<%=lfd.actualTakeOffFuel %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" />
													                </div>	
						             							</div>
							             					</div>			
							             					<div class="row m-t-5" >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Trip Fuel </label>
											              			</div>
											              			<div class="col-sm-8">
													                  <input type="text" class="form-control input-sm"  name="tripFuel" id="tripFuel" value="<%=lfd.actualTripFuel %>"  placeholder=""   data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
													                </div>	
						             							</div>
							             					</div>													             					
							             					<div class="row m-t-5"   >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >DOI </label>
											              			</div>
											              			<div class="col-sm-8">
													                  <input type="text" class="form-control input-sm" name="dryOperatingIndex" id="dryOperatingIndex" value="<%=lfd.calcDOI %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" />
													                </div>	
						             							</div>
							             					</div>
							             					<div class="row m-t-5"   >
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              				<label >DOW </label>
											              			</div>
											              			<div class="col-sm-8">
													                  <input type="text" class="form-control input-sm" name="dryOperatingWeight" id="dryOperatingWeight" value="<%=lfd.calcDOW %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" />
													                </div>	
						             							</div>
							             					</div>			

									             		</div>
									             		<!--  Figure Area -->
									             		<div class="col-lg-6">
									             			<!--  Figure Pax Area -->
								             				<div class="row">
								             					<div class="col-lg-12">
								             						<div class="row" >
								             							<div class="col-sm-12">
								             								<div class="col-sm-3" > 
													              			</div>
													              			<div class="col-sm-9">
															                  		<label for="" class="col-sm-3 control-label " >Pax</label>
															                </div>
								             							</div>
								             						</div>																             						
								             						<div class="row m-t-5" >
								             							<div class="col-sm-12">
								             								<div class="col-sm-3" > 
								             									<label  >OA : </label>
													              			</div>
													              			<div class="col-sm-9">																							                  
																               <div class="col-sm-3">
																                  <input type="text" class="form-control input-sm"  name="Pax0A" id="Pax0A" value="<%=lfd.zoneA %>"   data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
																                </div>	
																                <div class="col-sm-4" style="text-align: left;"> 
														              				<label >Max <%=lfd.zoneALimit%> Pax</label>
														              			</div>
								             								</div>
								             							</div>	
								             						</div>
								             						<div class="row m-t-5" >
								             							<div class="col-sm-12">
								             								<div class="col-sm-3" > 
								             									<label>OB : </label>
													              			</div>
													              			<div class="col-sm-9">
															                  	<div class="col-sm-3">
																                  <input type="text" class="form-control input-sm"  name="Pax0B" id="Pax0B" value="<%=lfd.zoneB %>"   data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
																                </div>	
																                <div class="col-sm-4" style="text-align: left;"> 
														              				<label >Max <%=lfd.zoneBLimit%> Pax</label>
														              			</div>
															                </div>
								             							</div>
								             						</div>	
								             						<div class="row m-t-5" >
								             							<div class="col-sm-12">
								             								<div class="col-sm-3" > 
								             									<label  >OC :</label>
													              			</div>
													              			<div class="col-sm-9">
															                  	<div class="col-sm-3">
																                  <input type="text" class="form-control input-sm"  name="Pax0C" id="Pax0C"  value="<%=lfd.zoneC %>"   data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
																                </div>	
																                <div class="col-sm-4" style="text-align: left;"> 
														              				<label >Max <%=lfd.zoneCLimit%> Pax</label>
														              			</div>
															                </div>
								             							</div>
								             						</div>	
								             					</div>
								             				</div>
								             				<!--  Figure Pax Area -->
							             					<div class="row m-t-10">
						             							<div class="col-lg-12">
					             									<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Hold 1 </label>
											              			</div>
											              			<div class="col-sm-4">
													                  <input type="text" class="form-control input-sm" name="hold1" id=hold1 value="<%=lfd.actualHold1 %>"  data-validation-engine="validate[required]"  onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
													                </div>	
													                <div class="col-sm-4" style="text-align: left;"> 
											              				<label >Max <%=lfd.maxHold1%>  kg </label>
											              			</div>
						             							</div>
							             					</div>
							             					<div class="row m-t-10">
						             							<div class="col-lg-12">
					             									<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Hold 2 </label>
											              			</div>
											              			<div class="col-sm-4">
													                  <input type="text" class="form-control input-sm" name="hold2" id="hold2" value="<%=lfd.actualHold2 %>"  data-validation-engine="validate[required]"   onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %> />
													                </div>	
													                <div class="col-sm-4" style="text-align: left;"> 
											              				<label >Max <%=lfd.maxHold2%>  kg </label>
											              			</div>
						             							</div>
							             					</div>
							             					<div class="row m-t-10">
						             							<div class="col-lg-12">
					             									<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Hold 3 </label>
											              			</div>
											              			<div class="col-sm-4">
													                  <input type="text" class="form-control input-sm" name="hold3" id="hold3" value="<%=lfd.actualHold3 %>"  data-validation-engine="validate[required]"  onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
													                </div>	
													                <div class="col-sm-4" style="text-align: left;"> 
											              				<label >Max <%=lfd.maxHold3%>  kg </label>
											              			</div>
						             							</div>
							             					</div>
							             					<div class="row m-t-10">
						             							<div class="col-lg-12">
					             									<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Hold 4 </label>
											              			</div>
											              			<div class="col-sm-4">
													                  <input type="text" class="form-control input-sm" name="hold4" id="hold4" value="<%=lfd.actualHold4 %>" data-validation-engine="validate[required]"  onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %> />
													                </div>	
													                <div class="col-sm-4" style="text-align: left;"> 
											              				<label >Max <%=lfd.maxHold4%>  kg </label>
											              			</div>
						             							</div>
							             					</div>
							             					<div class="row m-t-10">
						             							<div class="col-lg-12">
					             									<div class="col-sm-4" style="text-align: left;"> 
											              				<label >Hold 5 </label>
											              			</div>
											              			<div class="col-sm-4">
													                  <input type="text" class="form-control input-sm" name="hold5" id="hold5" value="<%=lfd.actualHold5 %>"  data-validation-engine="validate[required]"  onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
													                </div>	
													                <div class="col-sm-4" style="text-align: left;"> 
											              				<label >Max <%=lfd.maxHold5%>  kg </label>
											              			</div>
						             							</div>
							             					</div>
								             			</div>
													    <!--  Figure Area -->      				
							          				</div>
								              		<br style="clear: both;">
					                 				<br style="clear: both;">
					                 				<hr style="border:1px solid #4393FB;">
					                 				<!-- First Leg Start -->
								              		<div class="col-sm-4" style="text-align: left;"> 
					        	      					<label style="font-size:20px; text-decoration:underline;">First Leg</label>
						              				</div>
								              		<br style="clear: both;">
								              		<br style="clear: both;">
					                 				<div class="row">
				                 						<div class="col-lg-3" >											                 						
			                 								<div class="row m-t-5">
						             							<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >To </label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldTo" id="firstHoldTo" value="<%=lfd.destinationCode %>"  data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter2(this)" maxlength="3"/>
													                	</div>	
						             								</div>
						             							</div>		
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >Male</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldMale" id="firstHoldMale" value="<%=lfd.firstLegMale %>"  data-validation-engine="validate[required]" onkeyup="justNumber(this);calculateADTFirstLeg();" onclick="clearValue(this)" />
													                	</div>	
						             								</div>
						             							</div>		
						             							
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >Female</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldFemale" id="firstHoldFemale" value="<%=lfd.firstLegFeMale %>"  data-validation-engine="validate[required]"  onkeyup="justNumber(this);calculateADTFirstLeg();" onclick="clearValue(this)" />
													                	</div>	
						             								</div>
						             							</div>		
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >ADT</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldAdt" id="firstHoldAdt"  value="<%=lfd.firstLegADT %>"  data-validation-engine="validate[required]"  onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >CHD</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldChd" id="firstHoldChd" value="<%=lfd.firstLegCHD %>"  data-validation-engine="validate[required]"  onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >INF</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldInf" id="firstHoldInf"  value="<%=lfd.firstLegINF %>"   data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)" />
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >BUS</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstPaxBUS" id="firstPaxBUS"  value="<%=lfd.firstPaxBus%>"    data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >ECO</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstPaxECO" id="firstPaxECO"  value="<%=lfd.firstPaxEco%>"    data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >PAX</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstPaxPAX" id="firstPaxPAX"  value="<%=(lfd.firstLegADT + lfd.firstLegCHD)+"+"+lfd.firstLegINF%>"    data-validation-engine="validate[required]" />
													                	</div>	
						             								</div>
						             							</div>
								             							
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >DHC</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="firstHoldPad" id="firstHoldPad"  value="<%=lfd.firstLegPAD %>"  data-validation-engine="validate[required]" />
													                	</div>	
						             								</div>
						             							</div>
					             							<br style="clear: both;">
		                 								</div>
				                 						<div class="col-lg-9" >
				                 							<div class="row m-t-5"   >
				             									<div class="col-sm-12">
				             										<div class="col-sm-2"></div>
											              			<div class="col-sm-2"><label for="" class="col-sm-2 control-label " style="text-align: center;"  >TR</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label "  style="text-align: center;">B</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label "  style="text-align: center;">C</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label "  style="text-align: center;">M</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label text-info"  style="text-align: center;">Total</label></div>
												                </div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 1</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTR1" id="firstLegHoldTR1" value="<%=lfd.actualHold1TR %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldB1" id="firstLegHoldB1" value="<%=lfd.actualHold1B %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldC1" id="firstLegHoldC1" value="<%=lfd.actualHold1C %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldM1" id="firstLegHoldM1" value="<%=lfd.actualHold1M %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTotal1" id="firstLegHoldTotal1" value="<%=lfd.actualHold1TR+lfd.actualHold1B+lfd.actualHold1C+lfd.actualHold1M%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
			             									<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 2</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTR2" id="firstLegHoldTR2" value="<%=lfd.actualHold2TR %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldB2" id="firstLegHoldB2" value="<%=lfd.actualHold2B %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldC2" id="firstLegHoldC2" value="<%=lfd.actualHold2C %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldM2" id="firstLegHoldM2" value="<%=lfd.actualHold2M %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTotal2" id="firstLegHoldTotal2" value="<%=lfd.actualHold2TR+lfd.actualHold2B+lfd.actualHold2C+lfd.actualHold2M%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 3</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTR3" id="firstLegHoldTR3" value="<%=lfd.actualHold3TR %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldB3" id="firstLegHoldB3" value="<%=lfd.actualHold3B %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldC3" id="firstLegHoldC3" value="<%=lfd.actualHold3C %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldM3" id="firstLegHoldM3" value="<%=lfd.actualHold3M %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTotal3" id="firstLegHoldTotal3" value="<%=lfd.actualHold3TR+lfd.actualHold3B+lfd.actualHold3C+lfd.actualHold3M%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 4</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTR4" id="firstLegHoldTR4" value="<%=lfd.actualHold4TR %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldB4" id="firstLegHoldB4" value="<%=lfd.actualHold4B %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldC4" id="firstLegHoldC4" value="<%=lfd.actualHold4C %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldM4" id="firstLegHoldM4" value="<%=lfd.actualHold4M %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTotal4" id="firstLegHoldTotal4" value="<%=lfd.actualHold4TR+lfd.actualHold4B+lfd.actualHold4C+lfd.actualHold4M%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 5</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTR5" id="firstLegHoldTR5" value="<%=lfd.actualHold5TR %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldB5" id="firstLegHoldB5" value="<%=lfd.actualHold5B %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldC5" id="firstLegHoldC5" value="<%=lfd.actualHold5C %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldM5" id="firstLegHoldM5" value="<%=lfd.actualHold5M %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTotal5" id="firstLegHoldTotal5" value="<%=lfd.actualHold5TR+lfd.actualHold5B+lfd.actualHold5C+lfd.actualHold5M%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
				                 							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2 text-info" style="text-align: right;"> 
										              					<label >Total</label>
										              				</div>
										              				<div class="col-sm-2 ">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTRTotal" id="firstLegHoldTRTotal" value="<%=lfd.actualHold1TR+lfd.actualHold2TR+lfd.actualHold3TR+lfd.actualHold4TR+lfd.actualHold5TR %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldBTotal" id="firstLegHoldBTotal" value="<%=lfd.totalPaxLggWeight %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)"/>
												                  		<input type="text" class="form-control input-sm m-t-10"  id="bagWeightControl" value=""  placeholder=""  readonly="readonly"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldCTotal" id="firstLegHoldCTotal" value="<%=lfd.actualHold1C+lfd.actualHold2C+lfd.actualHold3C+lfd.actualHold4C+lfd.actualHold5C %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldMTotal" id="firstLegHoldMTotal" value="<%=lfd.actualHold1M+lfd.actualHold2M+lfd.actualHold3M+lfd.actualHold4M+lfd.actualHold5M %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="firstLegHoldTotalTotal" id="firstLegHoldTotalTotal" value="<%=lfd.actualHold1+lfd.actualHold2+lfd.actualHold3+lfd.actualHold4+lfd.actualHold5 %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                  		<a class="btn btn-success pull-left p-l-20 p-r-20 m-t-15" onclick="startCalculation('DISTRIBUTE');">Distribute</a>
												                	</div>	
					             								</div>
					             							</div>
				                 							
				                 							<br style="clear: both;">
				                 						</div>
					                 				</div>
					                 				<!-- First Leg End -->
					                 				<hr style="border:1px solid #4393FB;display:none;" id="secondLegHR">

												    <div class="col-sm-1" onclick="openCloseSecondLeg('close');">
												        <div class="form-group">
													      	<a class="btn btn-danger pull-right"><i class="fa fa-minus"></i></a>
													    </div>
													</div> 
													<div class="col-sm-1" onclick="openCloseSecondLeg('open');">
												       	<div class="form-group">
													     	<a class="btn btn-info pull-left"><i class="fa fa-plus"></i></a>
													     </div>
												 	</div> 
																														                 				
					                 				<!-- Second Leg Start -->
					                 				
								              		<div class="col-sm-4" style="text-align: left;display:none;" id="secondLegLabel"> 
					        	      					<label style="font-size:20px; text-decoration:underline;">Second Leg</label>
						              				</div>
								              		<br style="clear: both;">
								              		<br style="clear: both;">

					                 				<div class="row" style="display:none" id="secondLegRow">
				                 						<div class="col-lg-3" >											                 						
			                 								<div class="row m-t-5">
						             							<div class="col-sm-12">
						             								<div class="col-sm-4" style="text-align: left;"> 
											              					<label >To </label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldTo" id="secondHoldTo" value="<%if(lfd.secondLegTo!=null)out.print(lfd.secondLegTo); %>"  data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter2(this)" maxlength="3" />
													                	</div>	
						             								</div>
						             							</div>		
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >Male</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldMale" id="secondHoldMale" value="<%=lfd.secondLegMale %>"  data-validation-engine="validate[required]" onkeyup="justNumber(this);calculateADTSecondLeg();" onclick="clearValue(this)" />
													                	</div>	
						             								</div>
						             							</div>		
						             							
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >Female</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldFemale" id="secondHoldFemale" value="<%=lfd.secondLegFeMale %>"  data-validation-engine="validate[required]"  onkeyup="justNumber(this);calculateADTSecondLeg();" onclick="clearValue(this)" />
													                	</div>	
						             								</div>
						             							</div>		
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >ADT</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldAdt" id="secondHoldAdt"  value="<%=lfd.secondLegADT %>"  data-validation-engine="validate[required]"  onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >CHD</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldChd" id="secondHoldChd" value="<%=lfd.secondLegCHD %>"  data-validation-engine="validate[required]"  onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >INF</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldInf" id="secondHoldInf"  value="<%=lfd.secondLegINF %>"   data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)" />
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >BUS</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondPaxBUS" id="secondPaxBUS"  value="<%=lfd.secondPaxBus%>"    data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >ECO</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondPaxECO" id="secondPaxECO"  value="<%=lfd.secondPaxEco%>"    data-validation-engine="validate[required]" onkeyup="justNumber(this)" onclick="clearValue(this)"/>
													                	</div>	
						             								</div>
						             							</div>
						             							
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >PAX</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondPaxPAX" id="secondPaxPAX"  value="<%=(lfd.secondLegADT + lfd.secondLegCHD)+"+"+lfd.secondLegINF%>"    data-validation-engine="validate[required]" />
													                	</div>	
						             								</div>
						             							</div>
								             							
						             							<div class="row m-t-5"   >
						             								<div class="col-sm-12">
						             									<div class="col-sm-4" style="text-align: left;"> 
											              					<label >DHC</label>
											              				</div>
											              				<div class="col-sm-8">
													                  		<input type="text" class="form-control input-sm" name="secondHoldPad" id="secondHoldPad"  value="<%=lfd.secondLegPAD %>"  data-validation-engine="validate[required]" />
													                	</div>	
						             								</div>
						             							</div>
					             							<br style="clear: both;">
		                 								</div>
				                 						<div class="col-lg-9" >
				                 							<div class="row m-t-5"   >
				             									<div class="col-sm-12">
				             										<div class="col-sm-2"></div>
											              			<div class="col-sm-2"><label for="" class="col-sm-2 control-label " style="text-align: center;"  >TR</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label "  style="text-align: center;">B</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label "  style="text-align: center;">C</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label "  style="text-align: center;">M</label></div>
												                  	<div class="col-sm-2"><label for="" class="col-sm-2 control-label text-info"  style="text-align: center;">Total</label></div>
												                </div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 1</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTR1" id="secondLegHoldTR1" value="<%=lfd.actualHold1TRScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldB1" id="secondLegHoldB1" value="<%=lfd.actualHold1BScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldC1" id="secondLegHoldC1" value="<%=lfd.actualHold1CScnd%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldM1" id="secondLegHoldM1" value="<%=lfd.actualHold1MScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTotal1" id="secondLegHoldTotal1" value="<%=lfd.actualHold1TRScnd+lfd.actualHold1BScnd+lfd.actualHold1CScnd+lfd.actualHold1MScnd%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold1==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
			             									<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 2</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTR2" id="secondLegHoldTR2" value="<%=lfd.actualHold2TRScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldB2" id="secondLegHoldB2" value="<%=lfd.actualHold2BScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldC2" id="secondLegHoldC2" value="<%=lfd.actualHold2CScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldM2" id="secondLegHoldM2" value="<%=lfd.actualHold2MScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTotal2" id="secondLegHoldTotal2" value="<%=lfd.actualHold2TRScnd+lfd.actualHold2BScnd+lfd.actualHold2CScnd+lfd.actualHold2MScnd%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold2==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 3</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTR3" id="secondLegHoldTR3" value="<%=lfd.actualHold3TRScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldB3" id="secondLegHoldB3" value="<%=lfd.actualHold3BScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldC3" id="secondLegHoldC3" value="<%=lfd.actualHold3CScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldM3" id="secondLegHoldM3" value="<%=lfd.actualHold3MScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTotal3" id="secondLegHoldTotal3" value="<%=lfd.actualHold3TRScnd+lfd.actualHold3BScnd+lfd.actualHold3CScnd+lfd.actualHold3MScnd%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold3==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 4</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTR4" id="secondLegHoldTR4" value="<%=lfd.actualHold4TRScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldB4" id="secondLegHoldB4" value="<%=lfd.actualHold4BScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldC4" id="secondLegHoldC4" value="<%=lfd.actualHold4CScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldM4" id="secondLegHoldM4" value="<%=lfd.actualHold4MScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTotal4" id="secondLegHoldTotal4" value="<%=lfd.actualHold4TRScnd+lfd.actualHold4BScnd+lfd.actualHold4CScnd+lfd.actualHold4MScnd%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold4==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
					             							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2" style="text-align: right;"> 
										              					<label >Hold 5</label>
										              				</div>
										              				<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTR5" id="secondLegHoldTR5" value="<%=lfd.actualHold5TRScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldB5" id="secondLegHoldB5" value="<%=lfd.actualHold5BScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldC5" id="secondLegHoldC5" value="<%=lfd.actualHold5CScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldM5" id="secondLegHoldM5" value="<%=lfd.actualHold5MScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTotal5" id="secondLegHoldTotal5" value="<%=lfd.actualHold5TRScnd+lfd.actualHold5BScnd+lfd.actualHold5CScnd+lfd.actualHold5MScnd%>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)" <%if(lfd.maxHold5==0){%>disabled="disabled"<%} %>/>
												                	</div>	
					             								</div>
					             							</div>
				                 							<div class="row m-t-5"   >
					             								<div class="col-sm-12">
					             									<div class="col-sm-2 text-info" style="text-align: right;"> 
										              					<label >Total</label>
										              				</div>
										              				<div class="col-sm-2 ">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTRTotal" id="secondLegHoldTRTotal" value="<%=lfd.actualHold1TRScnd+lfd.actualHold2TRScnd+lfd.actualHold3TRScnd+lfd.actualHold4TRScnd+lfd.actualHold5TRScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldBTotal" id="secondLegHoldBTotal" value="<%=lfd.actualHold1BScnd+lfd.actualHold2BScnd+lfd.actualHold3BScnd+lfd.actualHold4BScnd+lfd.actualHold5BScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="checkMatchBagWeight();justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldCTotal" id="secondLegHoldCTotal" value="<%=lfd.actualHold1CScnd+lfd.actualHold2CScnd+lfd.actualHold3CScnd+lfd.actualHold4CScnd+lfd.actualHold5CScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldMTotal" id="secondLegHoldMTotal" value="<%=lfd.actualHold1MScnd+lfd.actualHold2MScnd+lfd.actualHold3MScnd+lfd.actualHold4MScnd+lfd.actualHold5MScnd %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
												                	<div class="col-sm-2">
												                  		<input type="text" class="form-control input-sm" name="secondLegHoldTotalTotal" id="secondLegHoldTotalTotal" value="<%=lfd.actualHold1+lfd.actualHold2+lfd.actualHold3+lfd.actualHold4+lfd.actualHold5 %>"  placeholder=""  data-validation-engine="validate[required]" onkeyup="justDouble(this)" onclick="clearValue(this)"/>
												                	</div>	
					             								</div>
					             							</div>
				                 							<br style="clear: both;">
				                 						</div>
					                 				</div>
					                 				<!-- Second Leg End -->
					                 				
					                 			</div>
									            <input type="hidden" name="voyageCode" value="<%=voyageCode%>"/>
									            <input type="hidden" name="preparedByParam" id="preparedByParamID" value=""/>
									            <input type="hidden" name="checkedByParam" id="checkedByParamID" value=""/>
									            <input type="hidden" name="approvedByParam" id="approvedByParamID" value=""/>
									            <input type="hidden" name="captainNoteParam" id="captainNoteParamID" value=""/>
								            </form>
								            <!-- LOAD SHEET RESULT START -->
								            <div class="col-lg-4  p-t-10 m-l-3" style="border-left: 1px solid #4393FB;" id="loadSheetResult">
								            	<div class="row">
							            			<div class="col-lg-12"  >
							            				<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label class="p-t-10" data-toggle="tooltip" title="Dry Operating Index"  data-placement="left"  data-original-title="Dry Operating Index" > Dry Operating Index</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcDOI %></button>
													        	</div>
									             			</div>
									             		</div>	
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Dry Operating Weight"  data-placement="left"  data-original-title="Dry Operating Weight">Dry Operating Weight</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcDOW %></button>
													        	</div>	
									             			</div>
									             		</div>	
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
									             				<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Take Off Fuel Weight"  data-placement="left"  data-original-title="Take Off Fuel Weight" >Take Off Fuel Weight</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcTOFW %></button>
													        	</div>
									             			</div>
									             		</div>
									             		
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
													        	<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Operating Weight"  data-placement="left"  data-original-title="Operating Weight" >Operating Weight</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcOW %></button>
													        	</div>
									             			</div>
									             		</div>
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
													        	<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Passenger Weight"  data-placement="left"  data-original-title="Passenger Weight" >Passenger Weight</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcPW %></button>
													        	</div>
									             			</div>
									             		</div>	
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
													        	<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Hold Weight"  data-placement="left"  data-original-title="Hold Weight">Hold Weight</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcHW %></button>
													        	</div>
									             			</div>
									             		</div>		
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Zero Fuel Weight"  data-placement="left"  data-original-title="Zero Fuel Weight">Zero Fuel Weight</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcZFW %></button>
													        	</div>
									             			</div>
									             		</div>
									             	</div>
								            	</div>
								             	<hr style="border:1px solid #4393FB;" />
								             	<div class="row">
								             		<div class="col-lg-12" >
								             			<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-8" style="text-align: right; cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Total Traffic Load"  data-placement="left"  data-original-title="Total Traffic Load">Total Traffic Load</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcTTL %></button>
													        	</div>
									             			</div>
									             		</div>
								             		</div>
								             		<div class="col-lg-12" >
								             			<div class="row m-t-5 " >
									             			<div class="col-lg-12" >																             			
													        	<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Allowed Traffic Load"  data-placement="left"  data-original-title="Allowed Traffic Load">Allowed Traffic Load</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcATL %></button>
													        	</div>																					        	
									             			</div>
									             		</div>	
								             		</div>
								             		<div class="col-lg-12" >
								             			<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
													        	<div class="col-sm-8" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10" data-toggle="tooltip" title="Under Load Before LMC"  data-placement="left"  data-original-title="Underload Before LMC"> Under Load Before LMC</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcULBLM %></button>
													        	</div>
									             			</div>
									             		</div>	
								             		</div>
								             	</div>
								             	<hr style="border:1px solid #4393FB;" />
							             		<div class="row">
								             		<div class="col-lg-12" >
								             			<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-4" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10">Zero Fuel</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcLimitZFW %></button>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcLimitZFWMax %></button>
													        	</div>
									             			</div>
									             		</div>	
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-4" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10">Take Off</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcLimitTO %></button>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcLimitTOMax %></button>
													        	</div>
									             			</div>
									             		</div>	
									             		<div class="row m-t-5 " >
									             			<div class="col-lg-12" >
								             					<div class="col-sm-4" style="text-align: right;cursor: pointer;"> 
									              					<label  class="p-t-10">Landing</label>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcLimitLW %></button>
													        	</div>
													        	<div class="col-sm-4" style="text-align: left;"> 
									              					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcLimitLWMax %></button>
													        	</div>
									             			</div>
									             		</div>	
								             		</div>
								             	</div>
								             	<hr style="border:1px solid #4393FB;" />
								             	<div class="row">
													<div class="col-lg-12">
														<div class="col-sm-4" style="text-align: right;"></div>
														<div class="col-sm-2" style="text-align: left;">
															<label class="p-t-10">forwards</label>
														</div>
														<div class="col-sm-2" style="text-align: left;">
															<label class="p-t-10">actual</label>
														</div>
														<div class="col-sm-2" style="text-align: left;">
															<label class="p-t-10">Aft</label>
														</div>
														<div class="col-sm-2" style="text-align: left;">
															<label class="p-t-10">Mac</label>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="row m-t-5 ">
															<div class="col-lg-12">
																<div class="col-sm-4" style="text-align: right;">
																	<label class="p-t-10">Zero Fuel Weight</label>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" > <%=lfd.calcBlncFwdZFW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncActZFW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncAftZFW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncMacZFW %></button>
																</div>
															</div>
														</div>
														<div class="row m-t-5 ">
															<div class="col-lg-12">
																<div class="col-sm-4" style="text-align: right;">
																	<label class="p-t-10">Take Off</label>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncFwdTOW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncActTOW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;"><%=lfd.calcBlncAftTOW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncMacTOW %></button>
																</div>
															</div>
														</div>
														<div class="row m-t-5 ">
															<div class="col-lg-12">
																<div class="col-sm-4" style="text-align: right;">
																	<label class="p-t-10">Landing Weight</label>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncFwdLDW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncActLDW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncAftLDW %></button>
																</div>
																<div class="col-sm-2" style="text-align: left;">
																	<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=lfd.calcBlncMacLDW %></button>
																</div>
															</div>
														</div>
													</div>
												</div>														             	
								             	<br style="clear: both;">
								            </div>
											<!-- LOAD SHEET RESULT END -->
										</div>
										<!-- ROW End -->
										<hr style="border:1px solid #4393FB;" />
										<!-- ROW Start -->
						              	<div class="row" >
							              	<div class="col-lg-4" >
								              	<div class="col-lg-4" >
								              		<a class="btn btn-success pull-left p-l-20 p-r-20 m-t-15" onclick="startCalculation('CALCULATE');"> <i class="fa fa-run"></i> Run  >>	</a>
								              	</div>
								              	<div class="col-lg-4" >
								              		<a class="btn btn-success pull-left p-l-20 p-r-20 m-t-15" style="display: none;" id="btnEnvelope"  onclick="Envelope();"> <i class="fa fa-run"></i> Envelope  >>	</a>
								              	</div>
								              		<div class="col-lg-4" >
								              		<a class="btn btn-success pull-left p-l-20 p-r-20 m-t-15" style="display: none;" id="btnLoadSheetOutput"  onclick="LoadSheetOutput();"> <i class="fa fa-run"></i> Output  >> 	</a>
								              	</div>
							              	</div>
							              	<div class="col-lg-8" >
							              		<div class="row" >
									              	<div  class="col-lg-4">
									              		<label for="" class="col-sm-12 control-label " >Captain Note</label>
								              			<div class="col-sm-11">
										                  <input type="text" class="form-control input-sm" id="captainNote" name="captainNote"  value="<%if(lfd.captain_note!=null){out.print(lfd.captain_note);} %>" placeholder="" data-validation-engine="validate[required]">
										                </div>
									              	</div>
								              	</div>
								              	<div class="row" >
									              	<div  class="col-lg-4">
									              		<label for="" class="col-sm-12 control-label " >Prepared By</label>
								              			<div class="col-sm-11">
										                  <input type="text" class="form-control input-sm" id="preparedBy" name="preparedBy"  value="<%if(lfd.preparedBy!=null){out.print(lfd.preparedBy);}else{out.print(sessionUsers.getUserFirstName()+" "+sessionUsers.getUserLastName());} %>" placeholder="" data-validation-engine="validate[required]">
										                </div>
									              	</div>
									              	<div  class="col-lg-4">
									              		<label for="" class="col-sm-12 control-label " >Checked By </label>
								              			<div class="col-sm-11">
										                  <input type="text" class="form-control input-sm"  id="checkedBy" name="checkedBy"  value="<%if(lfd.checkedBy!=null) out.print(lfd.checkedBy); %>" placeholder="" data-validation-engine="validate[required]">
										                </div>
									              	</div>
									              	<div  class="col-lg-4">
									              		<label for="" class="col-sm-12 control-label " >Approved By </label>
								              			<div class="col-sm-11">
										                  <input type="text" class="form-control input-sm" id="approvedBy" name="approvedBy" value="<%if(lfd.approvedBy!=null) out.print(lfd.approvedBy); %>" data-validation-engine="validate[required]">
										                </div>
									              	</div>
												</div>
							              	</div>
							             </div>
							              <!-- ROW End-->
									</div>
								</div>
							</div>
						</div>
						<!-------------------- Trip Info end --------------->		
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2016 &copy; </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>

	<!-- Popup -->


    <div id="chart-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title text-info" id="myLargeModalLabel"></h4>
                </div>
                <div class="modal-body" id="chartContent">
	               	<div class="demo-container" >
						<div id="placeholder" class="demo-placeholder"></div>
					</div>
		
                </div>               
               <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div> 
	<div id="loading-modal" class="modal fade in" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="height: 100px; width: 100px;">
					<div class="overlay" style="background: transparent;">
						<i class="fa fa-cog  fa-spin fa-5x icon-white"></i>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div id="ajax_loading"
		style="display: none; z-index: 999999999; background-color: transparent; width: 150px; height: 150px;">
		<img style="width: 150px; height: 150px;"
			src="<%=Constants.PROJECT_PATH%>/images/loader.gif" />
	</div>

	<jsp:include page="inc/incJs.jsp"></jsp:include>
	
	<script type="text/javascript">
			$(function(){
				$('[data-toggle="tooltip"]').tooltip();
				checkMatchBagWeight();
			});
			
			
			
			
			function startCalculation(calculationType){
				var errorMsg = null;
				var maxTakeOffFuel = 20000;
				var maxHold1 = <%=lfd.maxHold1%>;
				var maxHold2 = <%=lfd.maxHold2%>;
				var maxHold3 = <%=lfd.maxHold3%>;
				var maxHold4 = <%=lfd.maxHold4%>;
				var maxHold5 = <%=lfd.maxHold5%>;
				
				
				var zoneALimit = <%=lfd.zoneALimit%>;
				var zoneBLimit = <%=lfd.zoneBLimit%>;
				var zoneCLimit = <%=lfd.zoneCLimit%>;
				var zoneDLimit = <%=lfd.zoneDLimit%>;
				
				var zoneTotal = parseInt(document.flightInfoForm.Pax0A.value)+parseInt(document.flightInfoForm.Pax0B.value)+parseInt(document.flightInfoForm.Pax0C.value);
				var genderTotal = parseInt(document.flightInfoForm.firstHoldMale.value) + parseInt(document.flightInfoForm.firstHoldFemale.value) + parseInt(document.flightInfoForm.firstHoldChd.value) + parseInt(document.flightInfoForm.secondHoldMale.value) + parseInt(document.flightInfoForm.secondHoldFemale.value) + parseInt(document.flightInfoForm.secondHoldChd.value); 
				var paxTypeTotal = parseInt(document.flightInfoForm.firstHoldAdt.value) + parseInt(document.flightInfoForm.firstHoldChd.value) + parseInt(document.flightInfoForm.secondHoldAdt.value) + parseInt(document.flightInfoForm.secondHoldChd.value); 
				
				var isError = 0;
				$( ".form-error" ).each(function() {
					  $( this ).removeClass( "form-error" );
				});
				$("#errorMessages").html("");
		

				if(parseInt(document.flightInfoForm.Pax0A.value)>zoneALimit){
					$("#Pax0A").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li> Pax number limit exceeded in Zone A </li>"; else errorMsg += "<li> Pax number limit exceeded in Zone A </li>"; 
					isError = 1;
				}else if(parseInt(document.flightInfoForm.Pax0B.value)>zoneBLimit){
					$("#Pax0B").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>Pax number limit exceeded in Zone B</li>"; else errorMsg += "<li>Pax number limit exceeded in Zone B</li>";
					isError = 1; 
				}else if(document.flightInfoForm.Pax0C.value>zoneCLimit){
					$("#Pax0C").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>Pax number limit exceeded in Zone C </li>"; else errorMsg += "<li>Pax number limit exceeded in Zone C </li>";
					isError = 1; 
				}else if(zoneTotal != genderTotal || zoneTotal!=paxTypeTotal || genderTotal != paxTypeTotal){
					//alert("zoneTotal : "+zoneTotal + " - genderTotal : "+genderTotal+" paxTypeTotal : "+paxTypeTotal);
					$("#Pax0A").addClass(" form-error ");	
					$("#Pax0B").addClass(" form-error ");	
					$("#Pax0C").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>Pax number mismatch</li>"; else errorMsg += "<li>Pax number mismatch</li>";
					isError = 1;
				}
				
				var firstHold1Total = parseInt(document.getElementById("firstLegHoldTR1").value) + parseInt(document.getElementById("firstLegHoldB1").value) + parseInt(document.getElementById("firstLegHoldC1").value) + parseInt(document.getElementById("firstLegHoldM1").value);
				var secondHold1Total = parseInt(document.getElementById("secondLegHoldTR1").value) + parseInt(document.getElementById("secondLegHoldB1").value) + parseInt(document.getElementById("secondLegHoldC1").value) + parseInt(document.getElementById("secondLegHoldM1").value);
				document.getElementById("firstLegHoldTotal1").value = firstHold1Total;
				document.getElementById("secondLegHoldTotal1").value = secondHold1Total;
				document.getElementById("hold1").value = firstHold1Total + secondHold1Total;
				
				
				if((firstHold1Total+secondHold1Total)>maxHold1){
					$("#hold1").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>HOLD1 Overloaded</li>"; else errorMsg += "<li>HOLD1 Overloaded</li>";
					isError = 1;
				}
				

				firstHold1Total = 0;
				secondHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldTR2").value) + parseInt(document.getElementById("firstLegHoldB2").value) + parseInt(document.getElementById("firstLegHoldC2").value) + parseInt(document.getElementById("firstLegHoldM2").value);
				secondHold1Total = parseInt(document.getElementById("secondLegHoldTR2").value) + parseInt(document.getElementById("secondLegHoldB2").value) + parseInt(document.getElementById("secondLegHoldC2").value) + parseInt(document.getElementById("secondLegHoldM2").value);

				document.getElementById("firstLegHoldTotal2").value = firstHold1Total;
				document.getElementById("secondLegHoldTotal2").value = secondHold1Total;
				document.getElementById("hold2").value = firstHold1Total + secondHold1Total;
				
				if((firstHold1Total+secondHold1Total)>maxHold2){
					$("#hold2").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>HOLD2 Overloaded</li>"; else errorMsg += "<li>HOLD2 Overloaded</li>";
					isError = 1;
				}

				firstHold1Total = 0;
				secondHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldTR3").value) + parseInt(document.getElementById("firstLegHoldB3").value) + parseInt(document.getElementById("firstLegHoldC3").value) + parseInt(document.getElementById("firstLegHoldM3").value);
				secondHold1Total = parseInt(document.getElementById("secondLegHoldTR3").value) + parseInt(document.getElementById("secondLegHoldB3").value) + parseInt(document.getElementById("secondLegHoldC3").value) + parseInt(document.getElementById("secondLegHoldM3").value);
				document.getElementById("firstLegHoldTotal3").value = firstHold1Total;
				document.getElementById("secondLegHoldTotal3").value = secondHold1Total;
				document.getElementById("hold3").value = firstHold1Total + secondHold1Total;
				
				if((firstHold1Total+secondHold1Total)>maxHold3){
					$("#hold3").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>HOLD3 Overloaded</li>"; else errorMsg += "<li>HOLD3 Overloaded</li>";
					isError = 1; 
				}

				firstHold1Total = 0;
				secondHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldTR4").value) + parseInt(document.getElementById("firstLegHoldB4").value) + parseInt(document.getElementById("firstLegHoldC4").value) + parseInt(document.getElementById("firstLegHoldM4").value);
				secondHold1Total = parseInt(document.getElementById("secondLegHoldTR4").value) + parseInt(document.getElementById("secondLegHoldB4").value) + parseInt(document.getElementById("secondLegHoldC4").value) + parseInt(document.getElementById("secondLegHoldM4").value);
				document.getElementById("firstLegHoldTotal4").value = firstHold1Total;
				document.getElementById("secondLegHoldTotal4").value = secondHold1Total;
				document.getElementById("hold4").value = firstHold1Total + secondHold1Total;
				
				if((firstHold1Total+secondHold1Total)>maxHold4){
					$("#hold4").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>HOLD4 Overloaded</li>"; else errorMsg += "<li>HOLD4 Overloaded</li>";
					isError = 1; 
				}

				firstHold1Total = 0;
				secondHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldTR5").value) + parseInt(document.getElementById("firstLegHoldB5").value) + parseInt(document.getElementById("firstLegHoldC5").value) + parseInt(document.getElementById("firstLegHoldM5").value);
				secondHold1Total = parseInt(document.getElementById("secondLegHoldTR5").value) + parseInt(document.getElementById("secondLegHoldB5").value) + parseInt(document.getElementById("secondLegHoldC5").value) + parseInt(document.getElementById("secondLegHoldM5").value);
				document.getElementById("firstLegHoldTotal5").value = firstHold1Total;
				document.getElementById("secondLegHoldTotal5").value = secondHold1Total;
				document.getElementById("hold5").value = firstHold1Total + secondHold1Total;
				
				if((firstHold1Total+secondHold1Total)>maxHold5){					
					$("#hold5").addClass(" form-error ");	
					if(errorMsg==null) errorMsg = "<li>HOLD5 Overloaded</li>"; else errorMsg += "<li>HOLD5 Overloaded</li>";
					isError = 1; 
				}
				
				firstHold1Total = 0;
				secondHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldTR1").value) + parseInt(document.getElementById("firstLegHoldTR2").value) + parseInt(document.getElementById("firstLegHoldTR3").value) + parseInt(document.getElementById("firstLegHoldTR4").value) + parseInt(document.getElementById("firstLegHoldTR5").value);
				secondHold1Total = parseInt(document.getElementById("secondLegHoldTR1").value) + parseInt(document.getElementById("secondLegHoldTR2").value) + parseInt(document.getElementById("secondLegHoldTR3").value) + parseInt(document.getElementById("secondLegHoldTR4").value) + parseInt(document.getElementById("secondLegHoldTR5").value);
				document.getElementById("firstLegHoldTRTotal").value = firstHold1Total;
				document.getElementById("secondLegHoldTRTotal").value = secondHold1Total;
				
				firstHold1Total = 0;
				secondHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldB1").value) + parseInt(document.getElementById("firstLegHoldB2").value) + parseInt(document.getElementById("firstLegHoldB3").value) + parseInt(document.getElementById("firstLegHoldB4").value) + parseInt(document.getElementById("firstLegHoldB5").value);
				secondHold1Total = parseInt(document.getElementById("secondLegHoldB1").value) + parseInt(document.getElementById("secondLegHoldB2").value) + parseInt(document.getElementById("secondLegHoldB3").value) + parseInt(document.getElementById("secondLegHoldB4").value) + parseInt(document.getElementById("secondLegHoldB5").value);
				document.getElementById("secondLegHoldBTotal").value =secondHold1Total; 
				
				if(parseInt(document.getElementById("firstLegHoldBTotal").value) !=firstHold1Total + secondHold1Total && calculationType != "DISTRIBUTE"){
					$("#firstLegHoldB1").addClass(" form-error ");	
					$("#firstLegHoldB2").addClass(" form-error ");	
					$("#firstLegHoldB3").addClass(" form-error ");	
					$("#firstLegHoldB4").addClass(" form-error ");	
					$("#firstLegHoldB5").addClass(" form-error ");	

					$("#secondLegHoldB1").addClass(" form-error ");	
					$("#secondLegHoldB2").addClass(" form-error ");	
					$("#secondLegHoldB3").addClass(" form-error ");	
					$("#secondLegHoldB4").addClass(" form-error ");	
					$("#secondLegHoldB5").addClass(" form-error ");	

					if(errorMsg==null) errorMsg = "<li>Pax Baggage Total Mismatch</li>"; else errorMsg += "<li>Pax Baggage Total Mismatch</li>";
					isError = 1; 
				}
				
				firstHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldC1").value) + parseInt(document.getElementById("firstLegHoldC2").value) + parseInt(document.getElementById("firstLegHoldC3").value) + parseInt(document.getElementById("firstLegHoldC4").value) + parseInt(document.getElementById("firstLegHoldC5").value);
				document.getElementById("firstLegHoldCTotal").value = firstHold1Total;
				
				firstHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldM1").value) + parseInt(document.getElementById("firstLegHoldM2").value) + parseInt(document.getElementById("firstLegHoldM3").value) + parseInt(document.getElementById("firstLegHoldM4").value) + parseInt(document.getElementById("firstLegHoldM5").value);
				document.getElementById("firstLegHoldMTotal").value = firstHold1Total;
				
				firstHold1Total = 0;
				firstHold1Total = parseInt(document.getElementById("firstLegHoldTRTotal").value) + parseInt(document.getElementById("firstLegHoldBTotal").value) + parseInt(document.getElementById("firstLegHoldCTotal").value) + parseInt(document.getElementById("firstLegHoldMTotal").value);
				document.getElementById("firstLegHoldTotalTotal").value = firstHold1Total;
				
				secondHold1Total = 0;
				secondHold1Total = parseInt(document.getElementById("secondLegHoldC1").value) + parseInt(document.getElementById("secondLegHoldC2").value) + parseInt(document.getElementById("secondLegHoldC3").value) + parseInt(document.getElementById("secondLegHoldC4").value) + parseInt(document.getElementById("secondLegHoldC5").value);
				document.getElementById("secondLegHoldCTotal").value = secondHold1Total;
				
				secondHold1Total = 0;
				secondHold1Total = parseInt(document.getElementById("secondLegHoldM1").value) + parseInt(document.getElementById("secondLegHoldM2").value) + parseInt(document.getElementById("secondLegHoldM3").value) + parseInt(document.getElementById("secondLegHoldM4").value) + parseInt(document.getElementById("secondLegHoldM5").value);
				document.getElementById("secondLegHoldMTotal").value = secondHold1Total;
				
				secondHold1Total = 0;
				secondHold1Total = parseInt(document.getElementById("secondLegHoldTRTotal").value) + parseInt(document.getElementById("secondLegHoldBTotal").value) + parseInt(document.getElementById("secondLegHoldCTotal").value) + parseInt(document.getElementById("secondLegHoldMTotal").value);
				document.getElementById("secondLegHoldTotalTotal").value = secondHold1Total;


				if(isNaN(document.getElementById("cockpit").value) ||parseInt(document.getElementById("cockpit").value)<=0){
					$("#cockpit").addClass(" form-error ");	
					//$("#errorMessages").append("<li>Cockpit could not be zero </li>");
					if(errorMsg==null) errorMsg = "<li>Cockpit could not be zero</li>"; else errorMsg += "<li>Cockpit could not be zero</li>";
					isError = 1; 
				}
				if(isNaN(document.getElementById("cabinCrew").value) ||parseInt(document.getElementById("cabinCrew").value)<=0){
					$("#cabinCrew").addClass(" form-error ");	
					//$("#errorMessages").append("<li>Cabin Crew should not be empty </li>");
					if(errorMsg==null) errorMsg = "<li>Cabin Crew should not be empty</li>"; else errorMsg += "<li>Cabin Crew should not be empty</li>";
					isError = 1; 
				}

				
				if(isNaN(document.getElementById("takeOffFuel").value) ||parseInt(document.getElementById("takeOffFuel").value)<=0){
					$("#takeOffFuel").addClass(" form-error ");		
					//$("#errorMessages").append("<li>Define Take Off Fuel </li>");
					if(errorMsg==null) errorMsg = "<li>Define Take Off Fuel</li>"; else errorMsg += "<li>Define Take Off Fuel</li>";
					isError = 1; 
				}
				if(isNaN(document.getElementById("takeOffFuel").value) || maxTakeOffFuel<parseInt(document.getElementById("takeOffFuel").value)){					
					$("#takeOffFuel").addClass(" form-error ");						
					//$("#errorMessages").append("<li>Max Take Off Fuel limit exceeded </li>");
					if(errorMsg==null) errorMsg = "<li>Max Take Off Fuel limit exceeded</li>"; else errorMsg += "<li>Max Take Off Fuel limit exceeded</li>";
					isError = 1; 
				}
				if(isNaN(document.getElementById("tripFuel").value) || parseInt(document.getElementById("takeOffFuel").value)<=0){					
					$("#takeOffFuel").addClass(" form-error ");
					$("#tripFuel").addClass(" form-error ");					
					//$("#errorMessages").append("<li>Define Take Off Fuel </li>");
					if(errorMsg==null) errorMsg = "<li>Define Take Off Fuel</li>"; else errorMsg += "<li>Define Take Off Fuel</li>";
					isError = 1; 
				}

				if(parseInt(document.getElementById("tripFuel").value)>parseInt(document.getElementById("takeOffFuel").value)){					
					$("#takeOffFuel").addClass(" form-error ");
					$("#tripFuel").addClass(" form-error ");
					//$("#errorMessages").append("<li>Trim Fuel must be less than Take Off Fuel </li>");
					if(errorMsg==null) errorMsg = "<li>Trim Fuel must be less than Take Off Fuel</li>"; else errorMsg += "<li>Trim Fuel must be less than Take Off Fuel</li>";
					isError = 1; 
				}
				
				if(document.getElementById("preparedBy").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
					$("#preparedBy").addClass(" form-error ");
					//$("#errorMessages").append("<li>Prepared By could not be empty </li>");
					if(errorMsg==null) errorMsg = "<li>Prepared By could not be empty</li>"; else errorMsg += "<li>Prepared By could not be empty</li>";
					isError = 1; 
				}else{
					document.getElementById("preparedByParamID").value = document.getElementById("preparedBy").value;
				}
				if(document.getElementById("checkedBy").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
					$("#checkedBy").addClass(" form-error ");
					//$("#errorMessages").append("<li>Checked By could not be empty</li>");
					if(errorMsg==null) errorMsg = "<li>Checked By could not be empty</li>"; else errorMsg += "<li>Checked By could not be empty</li>";
					isError = 1; 
				}else{
					document.getElementById("checkedByParamID").value = document.getElementById("checkedBy").value;
				}
				if(document.getElementById("approvedBy").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
					$("#approvedBy").addClass(" form-error ");
					//$("#errorMessages").append("<li> Approved By could not be empty </li>");
					if(errorMsg==null) errorMsg = "<li>Approved By could not be empty</li>"; else errorMsg += "<li>Approved By could not be empty</li>";
					isError = 1; 
				}else{
					document.getElementById("approvedByParamID").value = document.getElementById("approvedBy").value;
				}
				document.getElementById("captainNoteParamID").value = document.getElementById("captainNote").value;

				if(isError==0){
					var frm=$("#flightInfoForm").serialize();
					try {
						$("#flightInfoForm").validationEngine();
						if(!$("#flightInfoForm").validationEngine("validate")){
							
						}else{
							if(calculationType=='DISTRIBUTE'){
								$.ajax({
								url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/loadSheetAutoDistribution.jsp',
								type: "POST",
								data:frm,
								success:function(data) {
										
										var holdsValue = data;
										document.getElementById("firstLegHoldB1").value=parseInt(holdsValue.substr(0,holdsValue.indexOf("@")));
										holdsValue = holdsValue.substr(holdsValue.indexOf("@")+1);
										document.getElementById("firstLegHoldB2").value=parseInt(holdsValue.substr(0,holdsValue.indexOf("@")));
										holdsValue = holdsValue.substr(holdsValue.indexOf("@")+1);
										document.getElementById("firstLegHoldB3").value=parseInt(holdsValue.substr(0,holdsValue.indexOf("@")));
										holdsValue = holdsValue.substr(holdsValue.indexOf("@")+1);
										document.getElementById("firstLegHoldB4").value=parseInt(holdsValue.substr(0,holdsValue.indexOf("@")));
										holdsValue = holdsValue.substr(holdsValue.indexOf("@")+1);
										document.getElementById("firstLegHoldB5").value=parseInt(holdsValue);
									}
								});
							}else{
								$.ajax({
								url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/loadSheetResult.jsp',
								type: "POST",
								data:frm,
								success:function(data) {
										$("#loadSheetResult").html(data);	
										if(data.indexOf("LOADSHEETCALCULATIONSUCCESS")>0){
											$.toast({
									            heading: ' Info  ',
									            text:'Load Sheet calculated',
									            position: 'top-right',
									            loaderBg:'#ff6849',
									            icon: 'info',
									            hideAfter: 10000
									          });
											$("#btnEnvelope").css("display","block");
											$("#btnLoadSheetOutput").css("display","block");
											$("#revNoID").css("display","none");
										}
										if(data.indexOf("LOADSHEETCALCULATIONERROR")>0){
											$.toast({
									            heading: 'Error  ',
									            text:'<ul><b>TRIM OUT</b></ul>',
									            position: 'top-right',
									            loaderBg:'#ff6849',
									            icon: 'error',
									            hideAfter: 60000
									          });
										}
										
									}
								});
							}
						}
					} catch (e) {
						alert("EROOR ");
					}	
				}else{		
					$.toast({
			            heading: 'Error  ',
			            text:'<ul>'+errorMsg+'</ul>',
			            position: 'top-right',
			            loaderBg:'#ff6849',
			            icon: 'error',
			            hideAfter: 60000
			          });
				}

			}
			function Envelope(){
				var loadSheetID=$("#loadSheetID").val();
				openit('/LOADSHEET/chart/loadSheetEnvelope.jsp?loadSheetID='+loadSheetID,'','scrollbars=yes,menubar=no,width=1024,resizable=yes,height=720,top=0,left=0');
			}	
			function LoadSheetOutput(){
				var loadSheetID=$("#loadSheetID").val();
				openit('/LOADSHEET/chart/loadSheetOutput.jsp?loadSheetID='+loadSheetID,'','scrollbars=yes,menubar=no,width=1024,resizable=yes,height=720,top=0,left=0');
			}	
			function openit(myurl,winname,stuff){
				window.open(myurl,winname,stuff + ',toolbar=no,status=yes'); 
			}
			
			function checkMatchBagWeight(){
				var matchWeightVal=0;
				var bagTotal=Number($("#firstLegHoldBTotal").val());
				var bHold1=Number($("#firstLegHoldB1").val());
				var bHold2=Number($("#firstLegHoldB2").val());
				var bHold3=Number($("#firstLegHoldB3").val());
				var bHold4=Number($("#firstLegHoldB4").val());
				var bHold5=Number($("#firstLegHoldB5").val());
				matchWeightVal=bagTotal-(bHold1+bHold2+bHold3+bHold4+bHold5);
				$("#bagWeightControl").val(matchWeightVal);
				if(matchWeightVal==0){
					$("#bagWeightControl").removeClass(" form-error ");
				}else{
					$("#bagWeightControl").addClass(" form-error ");
				}
					
			}
			
			function calculateADTFirstLeg(){
				var maleCount = Number($("#firstHoldMale").val());
				var femaleCount = Number($("#firstHoldFemale").val());
				$("#firstHoldAdt").val(maleCount+femaleCount);
			}
			function calculateADTSecondLeg(){
				var maleCount = Number($("#secondHoldMale").val());
				var femaleCount = Number($("#secondHoldFemale").val());
				$("#secondHoldAdt").val(maleCount+femaleCount);
			}
			function openCloseSecondLeg(operation){
				if(operation!=null){
					if(operation=='open'){
						$("#secondLegHR").css("display","block");
						$("#secondLegLabel").css("display","block");
						$("#secondLegRow").css("display","block");
					}
					if(operation=='close'){
						$("#secondLegHR").css("display","none");
						$("#secondLegLabel").css("display","none");
						$("#secondLegRow").css("display","none");
					}
				}
			}
			
			function getDowDoiValues(){
					var frm=$("#flightInfoForm").serialize();
					try {
						$.ajax({
						url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/getLoadSheetDowDoiValue.jsp',
						type: "POST",
						data:frm,
						success:function(data) {
								if(data!=null && data.indexOf('RESULT :')>0){
									var resultStr = data;
									resultStr = resultStr.substring(resultStr.indexOf('RESULT :')+8);
									var dow = resultStr.substring(0,resultStr.indexOf('-'));
									var doi = resultStr.substring(resultStr.indexOf('-')+1);
									document.getElementById("dryOperatingWeight").value = dow;
									document.getElementById("dryOperatingIndex").value = doi;
									
								}else{
									document.getElementById("dryOperatingWeight").value = "0";
									document.getElementById("dryOperatingIndex").value ="0";
								
								}
							}
						});

					} catch (e) {
						alert("EROOR ");
					}	
			}
			getDowDoiValues();
		</script>
	<jsp:include page="inc/incJSListFunctions.jsp"></jsp:include>
	<!--Style Switcher -->
	<script src="js/jQuery.style.switcher.js"></script>
</body>
</html>
