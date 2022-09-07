<%@page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	UserData sessionUsers = (UserData) session.getAttribute(Constants.SESSION_USER);
	String lang = Helper.getLanguage(request);
	String voyageCode = "20181114BGWISTKK1281";
	LoadSheetFlightData lfd = new LoadSheetFlightData();
	GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
	lfd = glsfd.getFlightDetail(voyageCode,0);
	
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
													          		<div class="col-lg-8  p-t-10"  >
													          				<div class="row">
													          					<div class="col-lg-12">
													          							<div class="col-sm-3">
																	              			<label for="" class="col-sm-12 control-label " >FLIGHT NO</label>
																	              			<div class="col-sm-11">
																			                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
																			                </div>
																	              		</div>
																	              		<div class="col-sm-2 " >
																	              			<label for="" class="col-sm-12 control-label ">From</label>
																	              			<input type="text" class="form-control input-sm m-b-5" id="" name="" placeholder="">
																	              		</div>
																	              		<div class="col-sm-2" >
																	              			<label for="" class="col-sm-12 control-label ">To</label>
																	              			<input type="text" class="form-control input-sm m-b-5" id="" name="" placeholder="">
																	              		</div>
																	              		<div class="col-sm-2 " >
																	              			<label for="" class="col-sm-12 control-label ">Date</label>
																	              			<input type="text" class="form-control input-sm m-b-5" id="" name="" placeholder="">
																	              		</div>
																	              		<div class="col-sm-3 " >
																	              			<label for="" class="col-sm-12 control-label ">Registration</label>
																	              			<div class="col-sm-10">
																			                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
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
																					                  	<select class="inputRedBorder" name="cockpit" tabindex="5" id="cockpitID">
																											<%for(int i=0;i<5;i++){%>
																												<option value="<%=i%>"><%=i%></option>
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
																					                 	<select class="inputRedBorder" name="cabinCrew" tabindex="6" id="cabinCrewID">
																											<%for(int i=0;i<10;i++){%>
																												<option value="<%=i%>"><%=i%></option>
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
																			              				<select class="inputRedBorder" name="pantry" tabindex="7">
																												<option value="ONEWAYINT">ONE WAY INT</option>
																												<option value="TWOWAYINT">TWO WAY INT</option>
																												<option value="ONEWAYDOM">ONE WAY DOM</option>
																												<option value="TWOWAYDOM">TWO WAY DOM</option>
																												<option value="FERRY">FERRY</option>
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
																					                  	<select class="inputRedBorder" name="paxWeight" tabindex="8">
																											<option value="holidayCharter">Holiday Charter</option>
																											<option value="standartFlight" selected="selected">Standart M:88 Kg,F:70 Kg</option>
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
																					                  <input type="text" class="form-control input-sm" name="takeOffFuel" id="takeOffFuelID" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                </div>	
														             							</div>
														             					</div>			
														             					<div class="row m-t-5" >
														             							<div class="col-sm-12">
														             								<div class="col-sm-4" style="text-align: left;"> 
																			              				<label >Trip Fuel </label>
																			              			</div>
																			              			<div class="col-sm-8">
																					                  <input type="text" class="form-control input-sm"  name="tripFuel" id="tripFuelID" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																					                </div>	
														             							</div>
														             					</div>													             					
														             																				             																								           
																             		</div>
																             		
																             		<div class="col-lg-6">
																             				<div class="row">
																             					<div class="col-lg-12">
																             						<div class="row" >
																             							<div class="col-sm-12">
																             								<div class="col-sm-3" > 
																					              			</div>
																					              			<div class="col-sm-9">
																							                  		<label for="" class="col-sm-3 control-label " >M</label>
																									              	<label for="" class="col-sm-3 control-label " >F</label>
																									              	<label for="" class="col-sm-3 control-label " >CHD</label>
																									              	<label for="" class="col-sm-3 control-label " >INF</label>
																							                </div>
																             							</div>
																             						</div>																             						
																             						
																             						<div class="row m-t-5" >
																             							<div class="col-sm-12">
																             								<div class="col-sm-3" > 
																             									<label  >OA 10/46</label>
																					              			</div>
																					              			<div class="col-sm-9">																							                  
																								               <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0AMale" id="pax0AMale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0AFemale" id="pax0AMale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0AChild" id="pax0AMale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0AInf" id="pax0AMale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																             								</div>
																             							</div>	
																             						</div>
																             						<div class="row m-t-5" >
																             							<div class="col-sm-12">
																             								<div class="col-sm-3" > 
																             									<label  >OB 20/80</label>
																					              			</div>
																					              			<div class="col-sm-9">
																							                  	<div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0BMale" id="pax0BMale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0BFemale" id="pax0BFemale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0BChild" id="pax0BChild" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0BInf" id="pax0BInf" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																							                </div>
																             							</div>
																             						</div>	
																             						
																             						<div class="row m-t-5" >
																             							<div class="col-sm-12">
																             								<div class="col-sm-3" > 
																             									<label  >OC 40/78</label>
																					              			</div>
																					              			<div class="col-sm-9">
																							                  	<div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0CMale" id="pax0CMale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0CFemale" id="pax0CFemale" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0CChild" id="pax0CChild" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																								                <div class="col-sm-3">
																								                  <input type="text" class="form-control input-sm"  name="pax0CInf" id="pax0CInf" value="0"  placeholder=""   data-validation-engine="validate[required]" />
																								                </div>	
																							                </div>
																             							</div>
																             						</div>	
																             						
																             					</div>
																             				</div>
															             					
															             					<div class="row m-t-10">
															             							<div class="col-lg-12">
															             									<div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Hold 1 </label>
																					              			</div>
																					              			<div class="col-sm-4">
																							                  <input type="text" class="form-control input-sm" name="hold_1" id="hold_1" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																							                </div>	
																							                <div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Max 123 kg </label>
																					              			</div>
															             							</div>
															             					</div>
															             					<div class="row m-t-10">
															             							<div class="col-lg-12">
															             									<div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Hold 2 </label>
																					              			</div>
																					              			<div class="col-sm-4">
																							                  <input type="text" class="form-control input-sm" name="hold_2" id="hold_2" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																							                </div>	
																							                <div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Max 123 kg </label>
																					              			</div>
															             							</div>
															             					</div>
															             					<div class="row m-t-10">
															             							<div class="col-lg-12">
															             									<div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Hold 3 </label>
																					              			</div>
																					              			<div class="col-sm-4">
																							                  <input type="text" class="form-control input-sm" name="hold_3" id="hold_3" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																							                </div>	
																							                <div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Max 123 kg </label>
																					              			</div>
															             							</div>
															             					</div>
															             					<div class="row m-t-10">
															             							<div class="col-lg-12">
															             									<div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Hold 4 </label>
																					              			</div>
																					              			<div class="col-sm-4">
																							                  <input type="text" class="form-control input-sm" name="hold_4" id="hold_1" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																							                </div>	
																							                <div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Max 123 kg </label>
																					              			</div>
															             							</div>
															             					</div>
															             					<div class="row m-t-10">
															             							<div class="col-lg-12">
															             									<div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Hold 5 </label>
																					              			</div>
																					              			<div class="col-sm-4">
																							                  <input type="text" class="form-control input-sm" name="hold_5" id="hold_5" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																							                </div>	
																							                <div class="col-sm-4" style="text-align: left;"> 
																					              				<label >Max 123 kg </label>
																					              			</div>
															             							</div>
															             					</div>
															             					
															             					
															             			</div>
													          				</div>
													          				
														              		<br style="clear: both;">											                 				
											                 				<hr style="border:1px solid #4393FB;">
											                 				<div class="row">
											                 						<div class="col-lg-3" >											                 						
											                 								<div class="row m-t-5"   >
														             							<div class="col-sm-12">
														             								<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >To </label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="flightLegTo_01" id="flightLegTo_01" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>		
														             							
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >Male</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxMale" id="paxMale" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>		
														             							
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >Female</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxFemale" id="paxFemale" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>		
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >ADT</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxADT" id="paxADT" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >CHD</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxCHD" id="paxCHD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >INF</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxINF" id="paxINF" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >PAX</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxPAX" id="paxPAX" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-4" style="text-align: left;"> 
																			              					<label >PAD</label>
																			              				</div>
																			              				<div class="col-sm-8">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							<br style="clear: both;">
											                 								</div>
													                 						<div class="col-lg-9" >
													                 							
													                 							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             										<div class="col-sm-2"></div>
																					              			<div class="col-sm-2">
																							                  			<label for="" class="col-sm-2 control-label " style="text-align: center;"  >TR</label>
																							                  </div>		
																							                  <div class="col-sm-2">
																									              		<label for="" class="col-sm-2 control-label "  style="text-align: center;">B</label>
																									            </div> 	
																									            <div class="col-sm-2">  	
																									              		<label for="" class="col-sm-2 control-label "  style="text-align: center;">C</label>
																									             </div> 	
																									             <div class="col-sm-2"> 	
																									              		<label for="" class="col-sm-2 control-label "  style="text-align: center;">M</label>
																									              </div>
																									              <div class="col-sm-2">	
																									              		<label for="" class="col-sm-2 control-label "  style="text-align: center;">Total</label>
																							               			</div>
														             								</div>
														             							</div>
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-2" style="text-align: right;"> 
																			              					<label >1</label>
																			              				</div>
																			              				<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             									<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-2" style="text-align: right;"> 
																			              					<label >2</label>
																			              				</div>
																			              				<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-2" style="text-align: right;"> 
																			              					<label >3</label>
																			              				</div>
																			              				<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-2" style="text-align: right;"> 
																			              					<label >4</label>
																			              				</div>
																			              				<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
														             							<div class="row m-t-5"   >
														             								<div class="col-sm-12">
														             									<div class="col-sm-2" style="text-align: right;"> 
																			              					<label >5</label>
																			              				</div>
																			              				<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
																					                	<div class="col-sm-2">
																					                  		<input type="text" class="form-control input-sm" name="paxPAD" id="paxPAD" value="0"  placeholder=""  data-validation-engine="validate[required]" />
																					                	</div>	
														             								</div>
														             							</div>
													                 						
													                 							<br style="clear: both;">
													                 						</div>
											                 					</div>
											                 				          		
														             	</div>
														            <div class="col-lg-4  p-t-10 m-l-3" style="border-left: 1px solid #4393FB;">
														            	<div class="row">
														            			<div class="col-lg-12"  >
														            				<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Dry Operating Index (DOI)</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>		
																             		
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Dry Operating Weight (DOW)</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>		
																             		
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Take Off Fuel Weight</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>		
																             		
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Operating Weight</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>		
																             		
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Passenger Weight</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>		
																             		
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Hold Weight</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>		
																             		
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Zero Fuel Weight</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
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
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Total Traffic Load</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>	
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Allowed Traffic Load</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>	
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-7" style="text-align: right;"> 
																	              					<label  class="p-t-10">Underload Before LMC</label>
																					        	</div>
																					        	<div class="col-sm-5" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
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
																             					<div class="col-sm-4" style="text-align: right;"> 
																	              					<label  class="p-t-10">Zero Fuel</label>
																					        	</div>
																					        	<div class="col-sm-4" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																					        	<div class="col-sm-4" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>	
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-4" style="text-align: right;"> 
																	              					<label  class="p-t-10">Take Off</label>
																					        	</div>
																					        	<div class="col-sm-4" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																					        	<div class="col-sm-4" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																             			</div>
																             		</div>	
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-4" style="text-align: right;"> 
																	              					<label  class="p-t-10">Landing</label>
																					        	</div>
																					        	<div class="col-sm-4" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">0.0</button>
																					        	</div>
																					        	<div class="col-sm-4" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">70000000</button>
																					        	</div>
																             			</div>
																             		</div>	
														             		</div>
														             	</div>
														             	<hr style="border:1px solid #4393FB;" />
														             	<div class="row">
														             		<div class="col-lg-12" >
													             					<div class="col-sm-2" style="text-align: right;"> 
														              					
																		        	</div>
																		        	<div class="col-sm-2" style="text-align: left;"> 
														              					<label  class="p-t-10">forwards</label>
																		        	</div>
																		        	<div class="col-sm-2" style="text-align: left;"> 
														              					<label  class="p-t-10">actual</label>
																		        	</div>
																		        	<div class="col-sm-2" style="text-align: left;"> 
														              					<label  class="p-t-10">Aft</label>
																		        	</div>
																		        	<div class="col-sm-2" style="text-align: left;"> 
														              					<label  class="p-t-10">Mac</label>
																		        	</div>
													             			</div>
														             		<div class="col-lg-12" >
														             			<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-2" style="text-align: right;"> 
																	              					<label  class="p-t-10">Take Off</label>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																             			</div>
																             		</div>	
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-2" style="text-align: right;"> 
																	              					<label  class="p-t-10">Take Off</label>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																             			</div>
																             		</div>	
																             		<div class="row m-t-5 " >
																             			<div class="col-lg-12" >
																             					<div class="col-sm-2" style="text-align: right;"> 
																	              					<label  class="p-t-10">Take Off</label>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																					        	<div class="col-sm-2" style="text-align: left;"> 
																	              					<button type="button" class="btn waves-effect waves-light btn-info">34.44</button>
																					        	</div>
																             			</div>
																             		</div>	
														             		</div>
														             	</div>
														             	
														             	<br style="clear: both;">
														             </div>
												          		
												          		</div>
												          		<!-- ROW End -->
												          		<hr style="border:1px solid #4393FB;" />
													              <!-- ROW Start -->
													              <div class="row" >
													              	<div class="col-lg-3" >
													              		<a class="btn btn-success pull-left p-l-20 p-r-20" onclick="saveAhmRevision();"> <i class="fa fa-run"></i> Run  >>> 	</a>
													              	</div>
													              	<div  class="col-lg-3">
													              		<label for="" class="col-sm-12 control-label " >Prepared By</label>
												              			<div class="col-sm-11">
														                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
														                </div>
													              	</div>
													              	<div  class="col-lg-3">
													              		<label for="" class="col-sm-12 control-label " >Checked By </label>
												              			<div class="col-sm-11">
														                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
														                </div>
													              	</div>
													              	<div  class="col-lg-3">
													              		<label for="" class="col-sm-12 control-label " >Approved By </label>
												              			<div class="col-sm-11">
														                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
														                </div>
													              	</div>
													              	
													              	<div class="col-lg-6" >
														              	
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
				function startCalculation(){					
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
					
					var zoneTotal = parseInt(document.flightInfoForm.Pax0AMale.value)+parseInt(document.flightInfoForm.Pax0AFemale.value)+parseInt(document.flightInfoForm.Pax0AChild.value)+parseInt(document.flightInfoForm.Pax0BMale.value)+parseInt(document.flightInfoForm.Pax0BFemale.value)+parseInt(document.flightInfoForm.Pax0BChild.value)+parseInt(document.flightInfoForm.Pax0CMale.value)+parseInt(document.flightInfoForm.Pax0CFemale.value)+parseInt(document.flightInfoForm.Pax0CChild.value);
					var genderTotal = parseInt(document.flightInfoForm.firstHoldMale.value) + parseInt(document.flightInfoForm.firstHoldFemale.value) + parseInt(document.flightInfoForm.firstHoldChd.value); 
					var paxTypeTotal = parseInt(document.flightInfoForm.firstHoldAdt.value) + parseInt(document.flightInfoForm.firstHoldChd.value); 
					
					var isError = 0;
					

			
					if((parseInt(document.flightInfoForm.Pax0AMale.value)+parseInt(document.flightInfoForm.Pax0AFemale.value)+parseInt(document.flightInfoForm.Pax0AChild.value))>zoneALimit){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Pax number limit exceeded in Zone A";
						document.getElementById("Pax0AMaleID").className = "inputRedBorderError"; 
						document.getElementById("Pax0AFemaleID").className = "inputRedBorderError"; 
						document.getElementById("Pax0AChildID").className = "inputRedBorderError"; 
						document.getElementById("Pax0AInfID").className = "inputRedBorderError"; 
						isError = 1;
					}else if((parseInt(document.flightInfoForm.Pax0BMale.value)+parseInt(document.flightInfoForm.Pax0BFemale.value)+parseInt(document.flightInfoForm.Pax0BChild.value))>zoneBLimit){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Pax number limit exceeded in Zone B";
						document.getElementById("Pax0BMaleID").className = "inputRedBorderError";
						document.getElementById("Pax0BFemaleID").className = "inputRedBorderError";
						document.getElementById("Pax0BChildID").className = "inputRedBorderError";
						document.getElementById("Pax0BInfID").className = "inputRedBorderError";
						isError = 1; 
					}else if((parseInt(document.flightInfoForm.Pax0CMale.value)+parseInt(document.flightInfoForm.Pax0CFemale.value)+parseInt(document.flightInfoForm.Pax0CChild.value))>zoneCLimit){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Pax number limit exceeded in Zone C";
						document.getElementById("Pax0CMaleID").className = "inputRedBorderError";
						document.getElementById("Pax0CFemaleID").className = "inputRedBorderError";
						document.getElementById("Pax0CChildID").className = "inputRedBorderError";
						document.getElementById("Pax0CInfID").className = "inputRedBorderError";
						isError = 1; 
					}else if(zoneTotal != genderTotal || zoneTotal!=paxTypeTotal || genderTotal != paxTypeTotal){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Pax number mismatch"; 
						document.getElementById("Pax0AMaleID").className = "inputRedBorderError";
						document.getElementById("Pax0AFemaleID").className = "inputRedBorderError";
						document.getElementById("Pax0AChildID").className = "inputRedBorderError";
						document.getElementById("Pax0AInfID").className = "inputRedBorderError";
						document.getElementById("Pax0BMaleID").className = "inputRedBorderError";
						document.getElementById("Pax0BFemaleID").className = "inputRedBorderError";
						document.getElementById("Pax0BChildID").className = "inputRedBorderError";
						document.getElementById("Pax0BInfID").className = "inputRedBorderError";
						document.getElementById("Pax0CMaleID").className = "inputRedBorderError";
						document.getElementById("Pax0CFemaleID").className = "inputRedBorderError";
						document.getElementById("Pax0CChildID").className = "inputRedBorderError";
						document.getElementById("Pax0CInfID").className = "inputRedBorderError";
						document.getElementById("firstHoldMaleID").className = "inputRedBorderError";
						document.getElementById("firstHoldFemaleID").className = "inputRedBorderError";
						document.getElementById("firstHoldAdtID").className = "inputRedBorderError";
						document.getElementById("firstHoldChdID").className = "inputRedBorderError";
						document.getElementById("firstHoldInfID").className = "inputRedBorderError";
						isError = 1;
					}else{
						document.getElementById("Pax0AMaleID").className = "inputRedBorder";
						document.getElementById("Pax0AFemaleID").className = "inputRedBorder";
						document.getElementById("Pax0AChildID").className = "inputRedBorder";
						document.getElementById("Pax0AInfID").className = "inputRedBorder";
						document.getElementById("Pax0BMaleID").className = "inputRedBorder";
						document.getElementById("Pax0BFemaleID").className = "inputRedBorder";
						document.getElementById("Pax0BChildID").className = "inputRedBorder";
						document.getElementById("Pax0BInfID").className = "inputRedBorder";
						document.getElementById("Pax0CMaleID").className = "inputRedBorder";
						document.getElementById("Pax0CFemaleID").className = "inputRedBorder";
						document.getElementById("Pax0CChildID").className = "inputRedBorder";
						document.getElementById("Pax0CInfID").className = "inputRedBorder";
						document.getElementById("firstHoldMaleID").className = "inputRedBorderDisable";
						document.getElementById("firstHoldFemaleID").className = "inputRedBorderDisable";
						document.getElementById("firstHoldAdtID").className = "inputRedBorderDisable";
						document.getElementById("firstHoldChdID").className = "inputRedBorderDisable";
						document.getElementById("firstHoldInfID").className = "inputRedBorderDisable";
						document.getElementById("errorMessagesID").style = "";
						document.getElementById("errorMessagesID").innerHTML = ""; 
					}
					
					var hold1Total = parseInt(document.getElementById("firstLegHoldTR1ID").value) + parseInt(document.getElementById("firstLegHoldB1ID").value) + parseInt(document.getElementById("firstLegHoldC1ID").value) + parseInt(document.getElementById("firstLegHoldM1ID").value);
					document.getElementById("firstLegHoldTotal1ID").value = hold1Total;
					document.getElementById("hold1ID").value = hold1Total;
					if(hold1Total>maxHold1){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "HOLD1 Overloaded";
						document.getElementById("hold1ID").className = "inputRedBorderError"; 
						isError = 1;
					}
			
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldTR2ID").value) + parseInt(document.getElementById("firstLegHoldB2ID").value) + parseInt(document.getElementById("firstLegHoldC2ID").value) + parseInt(document.getElementById("firstLegHoldM2ID").value);
					document.getElementById("firstLegHoldTotal2ID").value = hold1Total;
					document.getElementById("hold2ID").value = hold1Total;
					if(hold1Total>maxHold2){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "HOLD2 Overloaded";
						document.getElementById("hold2ID").className = "inputRedBorderError"; 
						isError = 1;
					}
			
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldTR3ID").value) + parseInt(document.getElementById("firstLegHoldB3ID").value) + parseInt(document.getElementById("firstLegHoldC3ID").value) + parseInt(document.getElementById("firstLegHoldM3ID").value);
					document.getElementById("firstLegHoldTotal3ID").value = hold1Total;
					document.getElementById("hold3ID").value = hold1Total;
					if(hold1Total>maxHold3){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "HOLD3 Overloaded";
						document.getElementById("hold3ID").className = "inputRedBorderError";
						isError = 1; 
					}
			
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldTR4ID").value) + parseInt(document.getElementById("firstLegHoldB4ID").value) + parseInt(document.getElementById("firstLegHoldC4ID").value) + parseInt(document.getElementById("firstLegHoldM4ID").value);
					document.getElementById("firstLegHoldTotal4ID").value = hold1Total;
					document.getElementById("hold4ID").value = hold1Total;
					if(hold1Total>maxHold4){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "HOLD4 Overloaded";
						document.getElementById("hold4ID").className = "inputRedBorderError";
						isError = 1; 
					}
			
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldTR5ID").value) + parseInt(document.getElementById("firstLegHoldB5ID").value) + parseInt(document.getElementById("firstLegHoldC5ID").value) + parseInt(document.getElementById("firstLegHoldM5ID").value);
					document.getElementById("firstLegHoldTotal5ID").value = hold1Total;
					document.getElementById("hold5ID").value = hold1Total;
					if(hold1Total>maxHold5){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "HOLD5 Overloaded";
						document.getElementById("hold5ID").className = "inputRedBorderError";
						isError = 1; 
					}
					
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldTR1ID").value) + parseInt(document.getElementById("firstLegHoldTR2ID").value) + parseInt(document.getElementById("firstLegHoldTR3ID").value) + parseInt(document.getElementById("firstLegHoldTR4ID").value) + parseInt(document.getElementById("firstLegHoldTR5ID").value);
					document.getElementById("firstLegHoldTRTotalID").value = hold1Total;
					
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldB1ID").value) + parseInt(document.getElementById("firstLegHoldB2ID").value) + parseInt(document.getElementById("firstLegHoldB3ID").value) + parseInt(document.getElementById("firstLegHoldB4ID").value) + parseInt(document.getElementById("firstLegHoldB5ID").value);
					document.getElementById("firstLegHoldBTotalID").value = hold1Total;
					
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldC1ID").value) + parseInt(document.getElementById("firstLegHoldC2ID").value) + parseInt(document.getElementById("firstLegHoldC3ID").value) + parseInt(document.getElementById("firstLegHoldC4ID").value) + parseInt(document.getElementById("firstLegHoldC5ID").value);
					document.getElementById("firstLegHoldCTotalID").value = hold1Total;
					
					hold1Total = 0;
					hold1Total = parseInt(document.getElementById("firstLegHoldM1ID").value) + parseInt(document.getElementById("firstLegHoldM2ID").value) + parseInt(document.getElementById("firstLegHoldM3ID").value) + parseInt(document.getElementById("firstLegHoldM4ID").value) + parseInt(document.getElementById("firstLegHoldM5ID").value);
					document.getElementById("firstLegHoldMTotalID").value = hold1Total;
					
					
					hold1Total = parseInt(document.getElementById("firstLegHoldTRTotalID").value) + parseInt(document.getElementById("firstLegHoldBTotalID").value) + parseInt(document.getElementById("firstLegHoldCTotalID").value) + parseInt(document.getElementById("firstLegHoldMTotalID").value);
					document.getElementById("firstLegHoldTotalTotalID").value = hold1Total;
					
					if(isNaN(document.getElementById("cockpitID").value) ||parseInt(document.getElementById("cockpitID").value)<=0){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Cockpit could not be zero";
						document.getElementById("cockpitID").className = "inputRedBorderError";
						isError = 1; 
					}
					if(isNaN(document.getElementById("cabinCrewID").value) ||parseInt(document.getElementById("cabinCrewID").value)<=0){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Cabin Crew should not be empty";
						document.getElementById("cabinCrewID").className = "inputRedBorderError";
						isError = 1; 
					}
			
					
					if(isNaN(document.getElementById("takeOffFuelID").value) ||parseInt(document.getElementById("takeOffFuelID").value)<=0){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Define Take Off Fuel";
						document.getElementById("takeOffFuelID").className = "inputRedBorderError";
						isError = 1; 
					}
					if(maxTakeOffFuel<parseInt(document.getElementById("takeOffFuelID").value)){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Max Take Off Fuel limit exceeded";
						document.getElementById("takeOffFuelID").className = "inputRedBorderError";
						isError = 1; 
					}
					if(isNaN(document.getElementById("tripFuelID").value) || parseInt(document.getElementById("takeOffFuelID").value)<=0){
						document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
						document.getElementById("errorMessagesID").innerHTML = "Define Take Off Fuel";
						document.getElementById("takeOffFuelID").className = "inputRedBorderError"; 
						document.getElementById("tripFuelID").className = "inputRedBorderError";
						isError = 1; 
					}
			
					if(parseInt(document.getElementById("tripFuelID").value)>parseInt(document.getElementById("takeOffFuelID").value)){
					
						isError = 1; 
					}
					
					if(document.getElementById("preparedByID").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
						isError = 1; 
					}
					if(document.getElementById("checkedByID").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
						isError = 1; 
					}
					if(document.getElementById("approvedByID").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
						
						isError = 1; 
					}
					
					if(isError==0){

					}
					
					
					
			
				}
	</script>
	<jsp:include page="inc/incJSListFunctions.jsp"></jsp:include>
	<!--Style Switcher -->
	<script src="js/jQuery.style.switcher.js"></script>
</body>
</html>
