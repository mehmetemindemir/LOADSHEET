<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>
			


		              
		              
		              
			          <br style="clear: both;">
			          <div class="col-lg-12 p-10" style="border: 3px solid #4393FB;border-radius: 10px;">
			              <div class="form-group" >				                
				                <br style="clear: both;">
					             <div class="col-lg-12" >
					             	<div class="col-sm-3">
					               	<label >Lateral Imbalance</label>
					               </div>
					                <div class="col-sm-3">
					               	<label >Referance Weight</label>
					               </div>
					               <div class="col-sm-3">
					               	<label >% MAC</label>
					               </div>
					                  <div class="col-lg-3 ">  																			                
						                <div class="col-sm-2">
						                	<label for="" class="col-sm-1 control-label m-t-10">TOW</label>
						                </div>																			                
						                <div class="col-sm-2">
						                	<label for="" class="col-sm-1 control-label m-t-10">TAXI</label>
						                </div>
						                
						                <div class="col-sm-2">
						                	<label for="" class="col-sm-1 control-label m-t-10">LDW</label>
						                </div>
					              </div>
					             </div>
					              <br style="clear: both;">
				                <%for(int k=1;k<=recordCount;k++){ %>
					               <div class="col-lg-12">
					              	<div class="col-sm-3">
					                  	<input type="text" class="form-control input-sm m-b-5" id="" name="lateralimbalance_<%=k %>" value="<%=Helper.request2String(request, "lateralimbalance_"+k) %>" placeholder=""  data-validation-engine="validate[required]"/>
					                </div>
					                 <div class="col-sm-3">
					                  	<input type="text" class="form-control input-sm m-b-5" id="" name="referanceweight_<%=k %>" value="<%=Helper.request2String(request, "referanceweight_"+k) %>" placeholder="" data-validation-engine="validate[required]"/>
					                </div>
					                <div class="col-sm-3">
					                  	<input type="text" class="form-control input-sm m-b-5" id="" name="mac_<%=k %>" value="<%=Helper.request2String(request, "mac_"+k) %>" placeholder="" data-validation-engine="validate[required]"/>
					                </div>
					                   <div class="col-lg-3 ">  
							                <div class="col-sm-2">
							                  <input type="radio" class="form-control input-sm " id="" name="referanceweightcode_<%=k %>" <%if(Helper.request2String(request, "referanceweightcode_"+k).trim().equals("TOW")){ %>checked="checked"<%} %>  value="TOW" placeholder="" data-validation-engine="validate[required]">
							                </div>
							                <div class="col-sm-2">
							                  <input type="radio" class="form-control input-sm " id="" name="referanceweightcode_<%=k %>" <%if(Helper.request2String(request, "referanceweightcode_"+k).trim().equals("TAXI")){ %>checked="checked"<%} %>  value="TAXI" placeholder="" data-validation-engine="validate[required]">
							                </div>
							                <div class="col-sm-2">
							                  <input type="radio" class="form-control input-sm " id="" name="referanceweightcode_<%=k %>" <%if(Helper.request2String(request, "referanceweightcode_"+k).trim().equals("LDW")){ %>checked="checked"<%} %>  value="LDW" placeholder="" data-validation-engine="validate[required]">
							                </div>
						              </div>
					              </div>
					              <input type="hidden"  name="asymLimitId_<%=k %>"  id="asymLimitId_<%=k %>"  value="<%=Helper.request2String(request, "asymLimitId_"+k) %>" />	
					               <br style="clear: both;">
					              <%} %>
				                <div class="col-sm-12">
							  		<div class="col-sm-1 pull-right" >
					                    <div class="form-group">
						                		<a class="btn btn-success pull-right" onclick="saveAsymmetricalLimitations();" > 
						                 		<i class="fa fa-save"></i> Save
						                 	</a>
						                 </div>
				                 	</div>
				                 	
				                 	<div class="col-sm-3 pull-right">
									    <div class="col-sm-6"  onclick="asymmetricalLimitationsRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
									        <div class="form-group">
										      	<a class="btn btn-danger pull-right" > 
										     		<i class="fa fa-minus"></i>
										     	</a>
										    </div>
										</div> 
										<div class="col-sm-6" onclick="asymmetricalLimitationsRowCount('<%=recordCount+1 %>');">
									       	<div class="form-group">
										     	<a class="btn btn-info "> 
											    		<i class="fa fa-plus"></i>
											    	</a>
										     </div>
									 	</div> 
									</div>
			                		</div>
				                <div class="col-md-2 pull-right" style="font-weight: bolder;" id="asymmetricalLimitationsMessage">
				                 		
				                </div>
		            				<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >
			              </div>
			            </div>
