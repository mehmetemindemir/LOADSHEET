
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightData"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	UserData 	sessionUsers 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	String 		lang	=Helper.getLanguage(request);	
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
	#loadsheet-modal .modal-dialog  {width:1300px;}
	#seatmap-modal .modal-dialog  {width:1300px;}
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
			 <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="<%=Constants.PROJECT_PATH%>/loadPanel.jsp" data-toggle="collapse"  data-target=".navbar-collapse"><i class="ti-menu"></i></a>
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
								<a  href="#" style="font-weight: bold;color:#4cc1f6;text-decoration: underline;"><%=sessionUsers.getUserFirstName()+" "+sessionUsers.getUserLastName() %></a>
								<span id="airPortName" style="color:#ce0021; font-weight: bold;"><%=" (Airport: "+sessionUsers.getUserLocation()%>)	</span> 
								<span style="margin-right: 5px;font-weight: bold;"><%=Helper.getToDate() %></span>	
								<span style="margin-right: 5px;font-weight: bold;" id="txtClock" ></span>		
				        </div>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">

                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="white-box col-xs-12 ">
                <div class="row">
	                <div class=" col-md-12 col-lg-12 col-sm-12 col-xs-12 ">
	                    
						          <div class="panel panel-default">
						            <div class="">
						              <ul class="nav nav-pills">
						                <li class="active"> <a href="#navpills-5" data-toggle="tab" aria-expanded="false"><h4><span class="navSpan">A</span></h4></a> </li>
						                <li class=""> <a href="#navpills-6" data-toggle="tab" aria-expanded="false"><h4><span class="navSpan">B</span></h4></a> </li>
						                <li class=""> <a href="#navpills-7" data-toggle="tab" aria-expanded="true"><h4><span class="navSpan">C</span></h4></a> </li>
						              </ul>
							              <div class="tab-content br-n pn" style="margin-top: 0px !important;">
							                <div id="navpills-5" class="tab-pane">
							                  <div class="row">
							                	<div class="col-sm-12">
										          <div class="white-box">
										           <!-------------------- Loading Start --------------->
										          	<div class="col-sm-12 p-10" style="border: 3px solid #4393FB;border-radius: 10px;">
										              <div class="form-group" >
											              <br style="clear: both;">
											              
											              <div class="col-lg-12">
											              		<div class="col-sm-2 " >
											              			<label for="" class="col-sm-12 control-label text-info" >Code No</label>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
											              			<label for="" class="col-sm-12 control-label text-info">HOLD 1</label>
											              		</div>
											              		<div class="col-sm-1 b-all" style="text-align: center;">
											              			<label for="" class="col-sm-12 control-label text-info" >HOLD 2</label>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
											              			<label for="" class="col-sm-12 control-label text-info">HOLD 3</label>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
											              			<label for="" class="col-sm-12 control-label text-info">HOLD 4</label>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
											              			<label for="" class="col-sm-12 control-label text-info">HOLD 5</label>
											              		</div>
											              		<div class="col-sm-2 " style="text-align: center;">
											              			<label for="" class="col-sm-12 control-label text-info">ULD</label>
											              		</div>
											             	</div>
											             	
											             	<br style="clear: both;">
											             	
											             	<div class="col-lg-12 m-b-20 b-all">
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-5 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >-</label>
												              		</div>
												              		<div class="col-sm-7 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >Baggage:</label>
												              		</div>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-12 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
											              		</div>
											              		<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-success " > 
													                 		<i class="fa fa-cloud-upload"> LOAD</i>
													                 	</a>
												              	</div> 
												              	<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-danger " > 
													                 		<i class="fa fa-cloud-upload"> UNLOAD</i>
													                 	</a>
												              	</div> 
											             	</div>
											             	
											             	<br style="clear: both;">
											             	
											             	<div class="col-lg-12 m-b-20 b-all">
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-5 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
												              		<div class="col-sm-7 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >Cargo:</label>
												              		</div>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-12 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
											              		</div>
											              		<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-success " > 
													                 		<i class="fa fa-cloud-upload"> LOAD</i>
													                 	</a>
												              	</div> 
												              	<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-danger " > 
													                 		<i class="fa fa-cloud-upload"> UNLOAD</i>
													                 	</a>
												              	</div> 
											             	</div>
											             	
											             	<br style="clear: both;">
											             	
											             	<div class="col-lg-12 m-b-20 b-all">
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-5 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
												              		<div class="col-sm-7 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >Mail:</label>
												              		</div>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-12 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
											              		</div>
											              		<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-success " > 
													                 		<i class="fa fa-cloud-upload"> LOAD</i>
													                 	</a>
												              	</div> 
												              	<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-danger " > 
													                 		<i class="fa fa-cloud-upload"> UNLOAD</i>
													                 	</a>
												              	</div> 
											             	</div>
											             	
											             	<br style="clear: both;">
											             	
											             	<div class="col-lg-12 m-b-20 b-all">
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-5 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
												              		<div class="col-sm-7 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >Comail:</label>
												              		</div>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-12 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
											              		</div>
											              		<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-success " > 
													                 		<i class="fa fa-cloud-upload"> LOAD</i>
													                 	</a>
												              	</div> 
												              	<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-danger " > 
													                 		<i class="fa fa-cloud-upload"> UNLOAD</i>
													                 	</a>
												              	</div> 
											             	</div>
											             	
											             	<br style="clear: both;">
											             	
											             	<div class="col-lg-12 m-b-20 b-all">
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-5 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
												              		<div class="col-sm-7 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >EIC:</label>
												              		</div>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-12 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
											              		</div>
											              		<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-success " > 
													                 		<i class="fa fa-cloud-upload"> LOAD</i>
													                 	</a>
												              	</div> 
												              	<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-danger " > 
													                 		<i class="fa fa-cloud-upload"> UNLOAD</i>
													                 	</a>
												              	</div> 
											             	</div>
											             	
											             	<br style="clear: both;">
											             	<div class="col-lg-12 m-b-20 b-all">
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-5 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
												              		<div class="col-sm-7 " style="text-align: center;">
												              			<label for="" class="control-label text-info" >CSU:</label>
												              		</div>
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-1 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
											              		</div>
											              		<div class="col-sm-2 m-t-20" style="text-align: center;">
											              			<div class="col-sm-12 " style="text-align: center;">
												              			<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" >
												              		</div>
											              		</div>
											              		<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-success " > 
													                 		<i class="fa fa-cloud-upload"> LOAD</i>
													                 	</a>
												              	</div> 
												              	<div class="col-sm-1 m-t-20">
													                 	<a class="btn btn-danger " > 
													                 		<i class="fa fa-cloud-upload"> UNLOAD</i>
													                 	</a>
												              	</div> 
											             	</div>
											             	
											             	<br style="clear: both;">
											             	
										              </div>
										            </div>
										           <!-------------------- Loading End --------------->
										          
										          </div>
										        </div>
							                  </div>
							                </div>  
							                <div id="navpills-6" class="tab-pane">
							                  <div class="row">
							                 <!-------------------- Trip Info Start --------------->
							                	<div class="col-sm-12">
										          <div class="white-box">
											          <div class="row" >
												          <div class="col-lg-12 p-10"  >
												          		<!-- ROW Start -->
												          		<div class="row" >
													          		<div class="col-lg-6  p-t-10"  style="border: 3px solid #4393FB;border-radius: 10px;">
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
														             	
														             	<div class="col-lg-6  p-t-10" style="border: 3px solid #4393FB;border-radius: 10px;">
														             			
														             	</div>
												          		</div>
												          		<!-- ROW End -->
													              <!-- ROW Start -->
													              <div class="row" >
													              	<div class="col-lg-6" >
													              		<div>
													              		</div>
													              	</div>
													              	<div class="col-lg-6" >
														              
													              	</div>
													              </div>
													              <!-- ROW End-->
													             	
												            </div>
											          </div>
										          	
										            
										            <div class="col-sm-4 p-10" >
										            	<div class="form-group col-sm-12 p-t-10" style="border: 3px solid #4393FB;border-radius: 10px;">
												             <div class="col-sm-12">
										              			<label >PANTY</label>
											                     <select name="" id=""   class="form-control"  data-validation-engine="validate[required]">
												          			<option value="">Two Way Dom.</option>
											          				<option value="">One Way Dom.</option>
											          				<option value="">Two Way Int.</option>
											          				<option value="">One Way Int.</option>
												          		</select>
											                 </div>
											                 <br style="clear: both;">
											                 <br style="clear: both;">
											                 <div class="col-sm-12 " style="text-align: center;">
										              			<h3 class="box-title m-b-0 text-info text-center" >TRIP INFORMATION</h3>
										              		</div>
										              		<div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >DOI</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >DOW</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >BLOCK FUEL</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >TAXI FUEL</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >T/O FUEL</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >TRIP FUEL</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-4 control-label m-t-10" >MAX.T/O WEIGHT</label>
												              	<div class="col-sm-8">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
											                    <div class="form-group pull-right">
												                 	<a class="btn btn-danger " > 
												                 		<i class="fa fa-save"> SAVE</i>
												                 	</a>
												                 </div>
											              	</div> 
										                 </div>
										            </div>
										            
										            <div class="col-sm-4 p-10" >
										            	<div class="form-group col-sm-12 p-t-10" style="border: 3px solid #4393FB;border-radius: 10px;">
											              <div class="col-sm-12">
										                    	<label for="">PAX WEIGHT</label>
										                    	<select name="" id=""   class="form-control"  data-validation-engine="validate[required]">
										                    		<option value="">Select</option>
												          			<option value="">All Flight Male/Female</option>
											          				<option value="">All Flight Average Adults</option>
											          				<option value="">Holiday Charter Male/Female</option>
											          				<option value="">Holiday Charter Average Adults</option>
												          		</select>
										                  </div>
										                  <br style="clear: both;">
										                  <br style="clear: both;">
										                  <div class="col-sm-12 " style="text-align: center;">
										              			<h3 class="box-title m-b-0 text-info text-center" >PAX INFORMATION</h3>
										              		</div>
											                <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-3 control-label m-t-10" >MALE</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												                <label for="" class="col-sm-3 control-label m-t-10" >O/A</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-3 control-label m-t-10" >FEMALE</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												                <label for="" class="col-sm-3 control-label m-t-10" >O/B</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-3 control-label m-t-10" >CHILD</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												                <label for="" class="col-sm-3 control-label m-t-10" >O/C</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-3 control-label m-t-10" >INFANT</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												                <label for="" class="col-sm-4 control-label m-t-10" >JUMP SEAT</label>
												              	<div class="col-sm-2">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class=" control-label m-t-10 text-info" >TOTAL PASSENGER</label>
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												            </div>
												            <div class="col-sm-12 m-b-10">
												            	<label for="" class="col-sm-12 control-label m-t-10 text-info " >TOTAL BAGGAGE</label>
												              	<div class="col-sm-5">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >pcs.</label>
												                </div>
												                <div class="col-sm-7">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >kg</label>
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
											                    <div class="form-group pull-right">
												                 	<a class="btn btn-info " > 
												                 		<i class="fa fa-refresh"> REFRESH</i>
												                 	</a>
												                 </div>
											              	</div> 
											            </div>
										            </div>
										            
										            <div class="col-sm-4 p-10">
										            	<div class="form-group col-sm-12 p-t-10" style="border: 3px solid #4393FB;border-radius: 10px;">
												          <div class="col-sm-12">
										                    <label for="">CARGO TYPE</label>
										                    	<select name="" id=""   class="form-control"  data-validation-engine="validate[required]">
										                    		<option value="">Select</option>
												          		</select>
										                  </div>
										                  <br style="clear: both;">
										                  <br style="clear: both;">
										                  <div class="col-sm-12 " style="text-align: center;">
										              		<h3 class="box-title m-b-0 text-info text-center" >CARGO INFORMATION</h3>
										              	  </div>
										              	  <div class="col-sm-12 m-b-10">
												              	<div class="col-sm-5">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >pcs.</label>
												                </div>
												                <div class="col-sm-7">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >kg</label>
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-5 control-label m-t-10" >BULK/ULD NUMBER</label>
												              	<div class="col-sm-7">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-5 control-label m-t-10" >AWB NUMBER</label>
												              	<div class="col-sm-7">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-5 control-label m-t-10" >NATURE OF GOODS</label>
												              	<div class="col-sm-7">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10 text-info p-t-10 p-b-10" style="border: 3px solid #4393FB;border-radius: 10px;">
												              	<label for="" class="col-sm-5 control-label " >Cargo :</label>
												              	<label for="" class="col-sm-7 control-label " >### pcs. ##### kg.</label>
												              	<label for="" class="col-sm-5 control-label " >Mail :</label>
												              	<label for="" class="col-sm-7 control-label " >### pcs. ##### kg.</label>
												              	<label for="" class="col-sm-5 control-label " >Comail :</label>
												              	<label for="" class="col-sm-7 control-label " >### pcs. ##### kg.</label>
												              	<label for="" class="col-sm-5 control-label " >EIC :</label>
												              	<label for="" class="col-sm-7 control-label " >### pcs. ##### kg.</label>
												              	<label for="" class="col-sm-5 control-label " >CSU :</label>
												              	<label for="" class="col-sm-7 control-label " >### pcs. ##### kg.</label>
												            </div>
												            <div class="col-sm-12 m-b-10">
											                    <div class="form-group pull-right">
												                 	<a class="btn btn-warning " > 
												                 		<i class="fa fa-plus"> ADD</i>
												                 	</a>
												                 </div>
											              	</div> 
										                </div>
										            </div>
										            
										            <div class="col-sm-12 p-t-10" style="border: 3px solid #4393FB;border-radius: 10px;">
										            
										            	<div class="form-group col-sm-4 b-all" >
										                  <div class="col-sm-12 " style="text-align: center;">
										              		<h3 class="box-title m-b-0 text-info text-center" >TRANSIT PAX INFORMATION</h3>
										              	  </div>
										              	  <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-3 control-label m-t-10" >MALE</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												                <label for="" class="col-sm-3 control-label m-t-10" >FEMALE</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-3 control-label m-t-10" >CHILD</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												                <label for="" class="col-sm-3 control-label m-t-10" >INFANT</label>
												              	<div class="col-sm-3">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-6 control-label m-t-10 text-info" >TOTAL TRANSIT PAX</label>
												              	<div class="col-sm-6">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
										              	  <div class="col-sm-12 m-b-10">
										              	  		<label for="" class="col-sm-12 control-label m-t-10 text-info" >TOTAL TRANSIT BAGAGE</label>
												              	<div class="col-sm-5">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >pcs.</label>
												                </div>
												                <div class="col-sm-7">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >kg</label>
												                </div>
												            </div>
										                </div>
										            
										            
										            	<div class="form-group col-sm-4" >
										                  <div class="col-sm-12 " style="text-align: center;">
										              		<h3 class="box-title m-b-0 text-info text-center" >TRANSIT CARGO INFORMATION</h3>
										              	  </div>
										              	  <div class="col-sm-12 m-b-10">
										                    <label for="">CARGO TYPE</label>
										                    	<select name="" id=""   class="form-control"  data-validation-engine="validate[required]">
										                    		<option value="">Select</option>
												          		</select>
										                  </div>
										              	  <div class="col-sm-12 m-b-10">
												              	<div class="col-sm-5">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >pcs.</label>
												                </div>
												                <div class="col-sm-7">
												                  	<div class="col-sm-9">
													                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
													                </div>
													                <label for="" class="col-sm-3 control-label m-t-10" >kg</label>
												                </div>
												            </div>
												            <div class="col-sm-12 m-b-10">
												              	<label for="" class="col-sm-5 control-label m-t-10" >BULK/ULD NUMBER</label>
												              	<div class="col-sm-7">
												                  <input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												                </div>
												            </div>
										                </div>
										                
										                <div class="form-group col-sm-4 b-all" >
										                  <div class="col-sm-12 " style="text-align: center;">
										              		<h3 class="box-title m-b-0 text-info text-center" >ESTIMETED ZFW</h3>
										              	  </div>
										              	  <div class="col-sm-12 m-b-10">
												          	<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												          </div>
										                  <div class="col-sm-12 " style="text-align: center;">
										              		<h3 class="box-title m-b-0 text-info text-center" >ESTIMETED TRAFIC LOAD</h3>
										              	  </div>
										              	  <div class="col-sm-12 m-b-10">
												          	<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												          </div>
										              	  <div class="col-sm-12 " style="text-align: center;">
										              		<h3 class="box-title m-b-0 text-info text-center" >ESTIMETED UNDERLOAD</h3>
										              	  </div>
												          <div class="col-sm-12 m-b-10">
												          	<input type="text" class="form-control input-sm" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
												          </div>
										                </div>
										            </div>
										            
										          
										          </div>
										        </div>
							<!-------------------- Trip Info end --------------->
							                  </div>
							                </div>  
							                <div id="navpills-7" class="tab-pane">
							                  <div class="row">
							                 <!-------------------- Test Start --------------->
							                 
							                 <div class="form-group">
							                	<div class="col-md-4" style="border: 1px solid #ccc;margin: 2px 0px;border-radius: 4px;">
										          <div class="white-box">
										              <div class="form-group col-sm-3">
										                    <label >FROM</label>
										                    <div class="input-group ">
										                      <input type="text" name="" id="" class="form-control" data-validation-engine="validate[required]">
										                    </div>
										              </div>
										              <div class="form-group col-sm-3">
										                    <label >TO</label>
										                    <div class="input-group ">
										                      <input type="text" name="" id="" class="form-control" data-validation-engine="validate[required]">
										                    </div>
										              </div>
										              <div class="form-group col-sm-6">
										                    <label >FLIGHT NO</label>
										                    <div class="input-group ">
										                      <input type="text" name="" id="" class="form-control" data-validation-engine="validate[required]">
										                    </div>
										              </div>
										              
										               <div class="form-group col-sm-3">
										                    <label >Cocpit</label>
										                    <div class="input-group ">
										                      <input type="text" name="" id="" class="form-control" data-validation-engine="validate[required]">
										                    </div>
										              </div>
										              <div class="form-group col-sm-3">
										                    <label >Cabin</label>
										                    <div class="input-group ">
										                      <input type="text" name="" id="" class="form-control" data-validation-engine="validate[required]">
										                    </div>
										              </div>
									              		<div class="col-sm-6">
									              			<label >PANTY</label>
										                     <select name="" id=""   class="form-control"  data-validation-engine="validate[required]">
											          			<option value="">Two Way Dom.</option>
										          				<option value="">One Way Dom.</option>
										          				<option value="">Two Way Int.</option>
										          				<option value="">One Way Int.</option>
											          		</select>
										                 </div>
										              <div class="form-group col-sm-12">
									                    <label for="">PAX WEIGHT</label>
									                    	<select name="" id=""   class="form-control"  data-validation-engine="validate[required]">
									                    		<option value="">Select</option>
											          			<option value="">All Flight Male/Female</option>
										          				<option value="">All Flight Average Adults</option>
										          				<option value="">Holiday Charter Male/Female</option>
										          				<option value="">Holiday Charter Average Adults</option>
											          		</select>
									                  </div>
									                  <div class="form-group col-sm-4">
									                    <label for="">T/O FUEL</label>
									                    <input type="text" name="" id="" class="form-control" id="" placeholder="" data-validation-engine="validate[required]">
									                  </div>
									                  <div class="form-group col-sm-5">
									                    <label for="">TRIP FUEL</label>
									                    <input type="text" name="" id="" class="form-control" id="" placeholder="" data-validation-engine="validate[required]">
									                  </div>
									                  <div class="form-group col-sm-3">
									                    <label for="">POT. W</label>
									                    <input type="text" name="" id="" class="form-control" id="" placeholder="" data-validation-engine="validate[required]">
									                  </div>
									                  <div class="form-group col-sm-12 text-danger">
										                <label for=""><i class="fa fa fa-shopping-bag"></i> Total Cargo:</label>
										                <div class="col-sm-12">
										                  <input type="text" class="form-control" id="" name="" placeholder="" data-validation-engine="validate[required]">
										                </div>
										              </div>
										              <div class="form-group col-sm-12" style="height: 80px;">
										              <div class="col-sm-12 ">
										                    <div class="form-group pull-right">
											                 	<a class="btn btn-success " > 
											                 		<i class="fa fa-cloud-upload"> LOAD</i>
											                 	</a>
											                 </div>
										              	</div> 
										              </div>
										          </div>
										        </div>
										        <div class="col-md-4" style="border: 1px solid #ccc;margin: 2px 0px;border-radius: 4px;">
										        <h3 class="box-title m-b-0 text-info" style="text-align: center;font-size: 18px;">CABIN-CARGO DISTRIBUTION</h3>
										          <div class="white-box">
										              <div class="form-group" style="font-size: 16px; color:black;">
										                <label for="" class="col-sm-3 control-label ">OA:</label>
										                <div class="col-sm-4">
										                  <input type="text" class="form-control" id="" name="" placeholder="" data-validation-engine="validate[required]">
										                </div>
										                <label for="" class="col-sm-3 control-label" style="text-align: right !important;">46 Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px; color:black;">
										                <label for="" class="col-sm-3 control-label ">OB:</label>
										                <div class="col-sm-4">
										                  <input type="text" class="form-control" id="" name="" placeholder="" data-validation-engine="validate[required]">
										                </div>
										                <label for="" class="col-sm-3 control-label" style="text-align: right !important;">80 Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px; color:black;">
										                <label for="" class="col-sm-3 control-label ">OC:</label>
										                <div class="col-sm-4">
										                  <input type="text" class="form-control" id="" name="" placeholder="" data-validation-engine="validate[required]">
										                </div>
										                <label for="" class="col-sm-3 control-label" style="text-align: right !important;">78 Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px;">
										                <label for="" class="col-sm-3 control-label ">HOLD 1</label>
										                <label for="" class="col-sm-4 control-label text-center" >0</label>
										                <label for="" class="col-sm-5 control-label" style="text-align: right !important;">2202 Kg Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px;">
										                <label for="" class="col-sm-3 control-label ">HOLD 2</label>
										                <label for="" class="col-sm-4 control-label text-center" >0</label>
										                <label for="" class="col-sm-5 control-label" style="text-align: right !important;">3468 Kg Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px;">
										                <label for="" class="col-sm-3 control-label ">HOLD 3</label>
										                <label for="" class="col-sm-4 control-label text-center" >0</label>
										                <label for="" class="col-sm-5 control-label" style="text-align: right !important;">2200 Kg Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px;">
										                <label for="" class="col-sm-3 control-label ">HOLD 4</label>
										                <label for="" class="col-sm-4 control-label text-center" >0</label>
										                <label for="" class="col-sm-5 control-label" style="text-align: right !important;">2083 Kg Max</label>
										              </div>
										              <div class="form-group" style="font-size: 16px;">
										                <label for="" class="col-sm-3 control-label ">HOLD 5</label>
										                <label for="" class="col-sm-4 control-label text-center" >0</label>
										                <label for="" class="col-sm-5 control-label" style="text-align: right !important;">1495 Kg Max</label>
										              </div>
										          </div>
										        </div>
										        <div class="col-md-4" style="border: 1px solid #ccc;margin: 2px 0px;border-radius: 4px;">
										        	<h3 class="box-title m-b-0 " style="text-align: center;font-size: 18px;">WEIGHTS</h3>
										          <div class="white-box" style=" margin-top: -20px !important;">
											            	<select name="" id=""   class="form-control col-sm-12" style="margin-bottom: 12px;"  data-validation-engine="validate[required]">
									                    		<option value="">Select</option>
											          			<option value="">MANUAL DOW DOI</option>
										          				<option value="">OTO DOW DOI</option>
											          		</select>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >DOI</label>
											              	<div class="col-sm-6">
											                  <input type="text" class="form-control" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
											                </div>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >DOW</label>
											              	<div class="col-sm-6">
											                  <input type="text" class="form-control" id="" name="" value="" placeholder="" data-validation-engine="validate[required]">
											                </div>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >T/O FUEL</label>
											              	<label for="" class="col-sm-6 control-label text-center" >0</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >OPERATING W.</label>
											              	<label for="" class="col-sm-6 control-label text-center" >0</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >PASSENGER W.</label>
											              	<label for="" class="col-sm-6 control-label text-center" >0</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >HOLD WEIGHTS W.</label>
											              	<label for="" class="col-sm-6 control-label text-center" >0</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >TOTAL TR. LOAD</label>
											              	<label for="" class="col-sm-6 control-label text-center" >0</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >ALLOWED TR LOAD.</label>
											              	<label for="" class="col-sm-6 control-label text-center" >71500</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-6 control-label text-center" >UDER LOAD</label>
											              	<label for="" class="col-sm-6 control-label text-center" >71500</label>
											            </div>
											            
											            
										          </div>
										        </div>
										        <div class="col-md-12" style="border: 1px solid #ccc;margin: 2px;border-radius: 4px;">
										        	<div class="white-box">
										        	<div class="col-md-6" >
										        		<div class="form-group col-sm-12" style="font-size: 16px; color:black;">
										              		<h3 class="box-title m-b-0 text-info" style="text-align: center;font-size: 15px;">CABIN-CARGO DISTRIBUTION</h3>
										              	</div>
										              	<div class="form-group col-sm-12" >
											              	<label for="" class="col-sm-2 control-label text-center">TR/DEST</label>
											              	<label for="" class="col-sm-2 control-label text-center">ADULT</label>
											              	<label for="" class="col-sm-2 control-label text-center">MALE</label>
											              	<label for="" class="col-sm-2 control-label text-center">FEMALE</label>
											              	<label for="" class="col-sm-2 control-label text-center">CHILD</label>
											              	<label for="" class="col-sm-2 control-label text-center">INFANT</label>
											              </div>
											              <div class="form-group col-sm-12">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											              </div>
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-2 control-label text-center">DEST</label>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											              </div>
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-2 control-label text-center text-danger">TOTAL</label>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											              </div>
											              <div class="form-group col-sm-12" >
											              	<label for="" class="col-sm-2 control-label text-center"> </label>
											              	<label for="" class="col-sm-2 control-label text-center"> </label>
											              	<label for="" class="col-sm-2 control-label text-center"> </label>
											              	<label for="" class="col-sm-2 control-label text-center"> </label>
											              	<label for="" class="col-sm-2 control-label text-center">35 Kg</label>
											              	<label for="" class="col-sm-2 control-label text-center"> </label>
											              </div>
											              <div class="form-group col-sm-12" style="color: black; font-size: 14px;">
											              	<div class="form-group col-sm-2">
											                    <label >C CLASS</label>
											                    <div class="input-group ">
											                      <input type="text" name="" id="" class="form-control" data-validation-engine="validate[required]">
											                    </div>
												            </div>
											                <label for="" class="col-sm-3 control-label text-right ">CY</label>
											                <label for="" class="col-sm-2 control-label text-right ">0</label>
											                <label for="" class="col-sm-1 control-label text-center ">/</label>
											                <label for="" class="col-sm-2 control-label text-left ">0</label>
											              </div>
											               <div class="form-group col-sm-12" style="font-size: 14px;">
											                <label for="" class="col-sm-6 control-label text-left text-danger ">TOTAL NUMBER OF PAX</label>
											                <label for="" class="col-sm-6 control-label "> </label>
											              </div>
											              <div class="form-group col-sm-12" style="font-size: 14px;">
											                <label for="" class="col-sm-6 control-label text-left text-danger">TOTAL NUMBER ON BRD.</label>
											                <label for="" class="col-sm-6 control-label  "> </label>
											              </div>
										        	</div>
										  
										        	<div class="col-md-6" >
										        		<div class="form-group col-sm-12" >
											              	<label for="" class="col-sm-2 control-label" style="font-size: 15px; color:black;">HOLDS</label>
											                <label for="" class="col-sm-4 control-label">B.PCS TR/DEST:</label>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											              </div>
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label"> </label>
											              </div>
											              <div class="form-group col-sm-10" >
											              	<label for="" class="col-sm-2 control-label text-center">1</label>
											              	<label for="" class="col-sm-2 control-label text-center">2</label>
											              	<label for="" class="col-sm-2 control-label text-center">3</label>
											              	<label for="" class="col-sm-2 control-label text-center">4</label>
											              	<label for="" class="col-sm-2 control-label text-center">5</label>
											              	<label for="" class="col-sm-2 control-label text-center text-danger">TOTAL</label>
											              </div>
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label">TR</label>
											              </div>
											              <div class="form-group col-sm-10">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-2 control-label text-center">0</label>
											              </div>
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label">M</label>
											              </div>
											              <div class="form-group col-sm-10">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-2 control-label text-center">0</label>
											              </div>
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label">B</label>
											              </div>
											              <div class="form-group col-sm-10">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-2 control-label text-center">0</label>
											              </div>
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label">C</label>
											              </div>
											              <div class="form-group col-sm-10">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-2 control-label text-center">0</label>
											              </div>
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label">E/C</label>
											              </div>
											              <div class="form-group col-sm-10">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-2 control-label text-center">0</label>
											              </div>
											              
											              <div class="form-group col-sm-2">
											              	<label for="" class="col-sm-12 control-label text-success">DHC</label>
											              </div>
											              <div class="form-group col-sm-10">
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-3 control-label text-success">PAD</label>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-3 control-label text-success">JST</label>
											                <div class="col-sm-2">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											              </div>
											              <div class="form-group col-sm-12">
											                <label for="" class="col-sm-3 control-label text-info">INTERLINE</label>
											                <div class="col-sm-3">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-3 control-label text-info">WHCHR</label>
											                <div class="col-sm-3">
											                  <input type="text" class="form-control" id="" name="" value="0" placeholder="" data-validation-engine="validate[required]">
											                </div>
											              </div>
										        	</div>
										              
										          </div>
										        </div>
										        <div class="col-md-12" style="border: 1px solid #ccc;margin: 2px;border-radius: 4px;">
										          <div class="white-box">
										          	<div class="col-md-5" >
											              <div class="form-group col-sm-8" style="font-size: 16px; color:black;">
											              	<h3 class="box-title m-b-0 " style="text-align: center;font-size: 15px;">LIMITS</h3>
											              </div>
											              <div class="form-group col-sm-4" style="font-size: 16px; color:black;">
											              	<h3 class="box-title m-b-0 " style="text-align: center;font-size: 15px;">MAC</h3>
											              </div>
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-2 control-label text-center "> </label>
											              	<label for="" class="col-sm-3 control-label text-center ">ACTUAL</label>
											              	<label for="" class="col-sm-3 control-label text-center ">MAXIMUM</label>
											              	<label for="" class="col-sm-4 control-label text-center "> </label>
											              </div>
											              
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-2 control-label text-center ">ZWF</label>
											              	<label for="" class="col-sm-3 control-label text-center ">0</label>
											              	<label for="" class="col-sm-3 control-label text-center ">71500</label>
											              	<label for="" class="col-sm-4 control-label text-center "> </label>
											              </div>
											              
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-2 control-label text-center ">TOW</label>
											              	<label for="" class="col-sm-3 control-label text-center ">0</label>
											                <div class="col-sm-3">
											                  <input type="text" class="form-control" id="" name="" value="89000" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-4 control-label text-center "> </label>
											              </div>
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-2 control-label text-center ">LDW</label>
											              	<label for="" class="col-sm-3 control-label text-center ">0</label>
											                <div class="col-sm-3">
											                  <input type="text" class="form-control" id="" name="" value="75500" placeholder="" data-validation-engine="validate[required]">
											                </div>
											                <label for="" class="col-sm-4 control-label text-center "> </label>
											              </div>
										          	</div>
										          	<div class="col-md-5" >
										          		<div class="form-group col-sm-12" style="font-size: 16px; color:black;">
											              	<h3 class="box-title m-b-0 " style="text-align: center;font-size: 15px;">INDEX</h3>
											              </div>
											              <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-4 control-label text-center ">FORWARD </label>
											              	<label for="" class="col-sm-4 control-label text-center ">ACTUAL</label>
											              	<label for="" class="col-sm-4 control-label text-center ">AFT</label>
											              </div>
										          	</div>
										          	<div class="col-md-2" >
										          		<div class="form-group col-sm-12" >
											              	<label for="" class="col-sm-6 control-label text-center" style="font-size: 15px; color:black;">ZFW</label>
											            </div>
											            <div class="form-group col-sm-12">
											              	<label for="" class="col-sm-12 control-label text-center" style="font-size: 15px; color:black;">MCDU INPUT</label>
											              	<label for="" class="col-sm-6 control-label text-center ">A/C CG </label>
											              	<label for="" class="col-sm-6 control-label text-center ">WEIGHT</label>
											            </div>
											            
										          	</div>
										              
										          </div>
										        </div>
									        </div>
							                 
											 <!-------------------- Test end --------------->
							                  </div>
							                </div>  
						                </div>
						              </div>
						            </div>
                            <br class="clear">    
					        
	                    
	               	</div>
		        </div>
		        </div>
             

            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2016 &copy; </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>

    <!-- Popup -->
    
    
  
	<div id="loading-modal" class="modal fade in" role="dialog" aria-hidden="true" style="display: none;">
	 	 <div class="modal-dialog">
            <div class="modal-content"> 
                <div class="modal-body" style="height: 100px;width: 100px;" >
                	<div class="overlay" style="background: transparent;">
	                  <i class="fa fa-cog  fa-spin fa-5x icon-white" ></i>
	                </div>
                </div>
            </div>
        </div>  
		
	</div>
	
	
	<div id="loadsheet-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;overflow: scroll;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title text-success" id="myLargeModalLabel">AHM LOAD</h4>
                </div>   
                <div class="modal-body">
                	<br style="clear: both;">
                    <div id="loadSheetContent" style="overflow-x: scroll;"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
     <div class="modal fade" id="confirm-active" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title text-success" id="myModalLabel">Confirm Active</h4>
                </div>
            
                <div class="modal-body">
                    <p><%=Helper.getMessage(session, "Dsc.user.Alert.A")%></p>
                    <p class="debug-url"></p>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-danger btn-ok">Ok</a>
                </div>
            </div>
        </div>
    </div>
    
    
     <div class="modal fade" id="confirm-passive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title text-danger" id="myModalLabel">Confirm Passive</h4>
                </div>
            
                <div class="modal-body">
                    <p><%=Helper.getMessage(session, "Dsc.user.Alert.P")%></p>
                    <p class="debug-url"></p>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-danger btn-ok">Ok</a>
                </div>
            </div>
        </div>
    </div>
    
    <div id="alertAnnouncement" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>                   
                </div>
                <div class="modal-body" id="alertAnnouncementContent">
                
                   
		             <br style="clear: both;">
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
	<div id="ajax_loading" style="display: none; z-index: 999999999; background-color:transparent; width: 150px; height:150px; ">
	     <img style="width: 150px; height:150px;" src="<%=Constants.PROJECT_PATH %>/images/loader.gif" />  
	</div> 
    
	<jsp:include page="inc/incJs.jsp"></jsp:include> 
    <script type="text/javascript">
    function startTime() { 
	    var today=new Date();
	    var h=today.getHours();
	    var m=today.getMinutes();
	    var s=today.getSeconds();
	    m = checkTime(m);
	    s = checkTime(s);
	   document.getElementById('txtClock').innerHTML = h+":"+m+":"+s;
	    var t = setTimeout(function(){startTime()},500);
	}
	
	function checkTime(i) {
	    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
	    return i;
	}
	startTime();
    
    	var csrf_token = $('meta[name="auth-token"]').attr('content');
		$.ajaxPrefilter(function(options, originalOptions, jqXHR){
		    if (options.type.toLowerCase() === "post") {
		        options.data = options.data || "";
		        options.data += options.data?"&":"";	
		        options.data += "_token=" + csrf_token;
		    }
		});
         function ajaxLaoding(){
			$(document).on({
			   ajaxStart: function() {
			     $('#ajax_loading').show();
			   },
			   ajaxStop: function() {
			     $('#ajax_loading').hide();
			   }
			 });
		}
		
		
        $(document).ready(function () {  
        		
        	$("#exampleBasicASheet  .wizard-finish").attr("href", "#navpills-2").attr("data-toggle", "tab").html("Next");
            $("#exampleBasicBSheet  .wizard-finish").attr("href", "#navpills-3").attr("data-toggle", "tab").html("Next");
            $("#exampleBasicCSheet  .wizard-finish").attr("href", "#navpills-4").attr("data-toggle", "tab").html("Next");
            
            $( "#exampleBasicASheet  .wizard-finish" ).click(function() {
            	 $( "ul.nav li" ).each(function( index ) {
            		 $(".nav-pills li").removeClass("active");
               	});
            	 	$(".nav-pills li:eq( 1 )").attr("class","active");
            	 	$("html, body").animate({ scrollTop: 0 }, "slow");
      		});
            
            $( "#exampleBasicBSheet  .wizard-finish" ).click(function() {
           	 $( "ul.nav li" ).each(function( index ) {
           		 $(".nav-pills li").removeClass("active");
              	});
           	 	$(".nav-pills li:eq( 2 )").attr("class","active");
           	 	$("html, body").animate({ scrollTop: 0 }, "slow");
     		});
            $( "#exampleBasicCSheet  .wizard-finish" ).click(function() {
           	 	$( "ul.nav li" ).each(function( index ) {
           		 $(".nav-pills li").removeClass("active");
              	});
           	
           	 	$(".nav-pills li:eq( 3 )").attr("class","active");
           	 	
     		});
			/* [].slice.call(document.querySelectorAll('.sttabs')).forEach(function (el) {
                new CBPFWTabs(el);
            }); 
            $(function () {$('[data-toggle="tooltip"]').tooltip()});
		        //Popover
		   // $(function () {$('[data-toggle="popover"]').popover()});
            chart();*/
            $(".select2").select2();
			 $('.modal').on('show.bs.modal', function (event) {
		        var idx = $('.modal:visible').length;
		        $(this).css('z-index', 1040 + (10 * idx));
		    });
		    $('.modal').on('shown.bs.modal', function (event) {
		        var idx = ($('.modal:visible').length) - 1; // raise backdrop after animation.
		        $('.modal-backdrop').not('.stacked').css('z-index', 1039 + (10 * idx));
		        $('.modal-backdrop').not('.stacked').addClass('stacked');
		    });
		    
		    
		    $('input[id^="enabled_').change(function() {
		    	if ($(this).prop('checked')) {       // do what you need here     
		    		$(this).val("1");
		        }
		        else {
		           // do what you need here         
		        	$(this).val("0");
		        }
		    });
		    $('input[id^="trim_').change(function() {
		    	if ($(this).prop('checked')) {       // do what you need here     
		    		$(this).val("1");
		        }
		        else {
		           // do what you need here         
		        	$(this).val("0");
		        }
		    });
		    $('input[type=checkbox][name=actualCabinBaggage]').change(function() {
		        if (this.value == 'yes') {
		          $("#actualBaggageDV").css( "display","block" );
		        }
		        else if (this.value == 'no') {
		        	$("#actualBaggageDV").css( "display","none" );
		        }
		    });
		    
		    ajaxLaoding();
		});
        (function(){
            $('#exampleBasic').wizard({
                onFinish: function(){
                    
                }
            });

        })();
       
        (function(){
            $('#exampleBasicMain').wizard({
                onFinish: function(){
                   
                }
            });

        })();
        (function(){
            $('#exampleBasicASheet').wizard({
                onFinish: function(){
                	
                }
            });
        })();
        (function(){
            $('#exampleBasicBSheet').wizard({
            	onFinish: function(){
            			
                },
                onNext:function(){
                	$("html, body").animate({ scrollTop: 0 }, "slow");
                },
                autoFocus: true,
                keyboard: true,
                enableWhenVisited: true,
                enableAllSteps:true,
               
            });
        })();
        
        (function(){
            $('#exampleBasicCSheet').wizard({
                onFinish: function(){
                	
                },
                onNext:function(){
                	$("html, body").animate({ scrollTop: 0 }, "slow");
                },
         
                  autoFocus: true,
                  keyboard: true,
                  enableWhenVisited: true,
                  
            });
        })();
       
        $("#exampleBasicCSheet  .disabled").attr("data-toggle", "tab");
       
        (function(){
            $('#exampleBasicDSheet').wizard({
                onFinish: function(){
                		
                },
                onNext:function(){
                	$("html, body").animate({ scrollTop: 0 }, "slow");
                },
                autoFocus: true,
                keyboard: true,
                enableWhenVisited: true,
                enableAllSteps:true,
            });
            
        })();
        
		
		 function getAirCraftListForAHM(){
    		$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/ajaxAirCraftList.jsp',
				type: "POST",
				beforeSend: function(){
				},
				success:function(data) {
					$("#ahmContent").html(data);
					dataTable('seatmapListTable');	
				}
			});
			return false;
    	}
    	
        
        function upDateStatus(aircraftcode,status){
    		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/ajaxUpAirCraft.jsp',
				type: "POST",
				data: "status="+status+"&aircraftcode="+aircraftcode,
				beforeSend: function(){},
				success:function(data) {
					if($.trim(data)=="OK"){					
						getAirCraftList();	
						getAirCraftListForAHM();					
					}				
				}
			});
			} catch (e) {
				// TODO: handle exception
			}
			return false;
		}
		
    </script>
     <jsp:include page="inc/incJSListFunctions.jsp"></jsp:include>  
    <!--Style Switcher -->
    <script src="js/jQuery.style.switcher.js"></script>
</body>
</html>
