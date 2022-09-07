<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>
	
				<%for(int k=1;k<=recordCount;k++){ %>
							<div class="col-lg-12">
				              	<div class="col-sm-6 b-all" style="text-align: center;">
			              			<div class="col-sm-4">
			              					<input type="text" class="form-control input-sm m-b-5" id="" name="zonename_<%=k %>" value="<%=Helper.request2String(request, "zonename_"+k) %>" placeholder="" data-validation-engine="validate[required]">
					                </div>
			              			<div class="col-sm-4">
			              					<input type="text" class="form-control input-sm m-b-5" id="" name="zonefrom_<%=k %>" value="<%=Helper.request2String(request, "zonefrom_"+k) %>" placeholder="" data-validation-engine="validate[required]">
					                </div>
					                <div class="col-sm-4">
			              					<input type="text" class="form-control input-sm m-b-5" id="" name="zoneto_<%=k %>" value="<%=Helper.request2String(request, "zoneto_"+k) %>" placeholder="" data-validation-engine="validate[required]">
					                </div>
			              		</div>
		              			<div class="col-sm-2" >
			              					<input type="text" class="form-control input-sm m-b-5" id="" name="maxweight_<%=k %>" value="<%=Helper.request2String(request, "maxweight_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
			              		</div>
			              		<div class="col-sm-2" >
		              					<input type="text" class="form-control input-sm m-b-5" id="" name="maxcomulative_<%=k %>" value="<%=Helper.request2String(request, "maxcomulative_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
			              		</div>
			              		<div class="col-sm-2" style="text-align: center;">
		              					<input type="text" class="form-control input-sm m-b-5" id="" name="operations_<%=k %>" value="<%=Helper.request2String(request, "operations_"+k) %>" placeholder="" data-validation-engine="validate[required]">
			              		</div>
			             	</div>
			             <br style="clear: both;">
			             <input type="hidden"  name="comulativeId_<%=k %>"  id="comulativeId_<%=k %>"  value="<%=Helper.request2String(request, "comulativeId_"+k) %>" />	
			           	<%} %>  
			                <div class="col-sm-12">
							  		<div class="col-sm-1 pull-right" >
					                    <div class="form-group">
						                		<a class="btn btn-success pull-right" onclick="saveComulativeLoadLimits();" > 
						                 		<i class="fa fa-save"></i> Save
						                 	</a>
						                 </div>
				                 	</div>
				                 	
				                 	<div class="col-sm-3 pull-right">
									    <div class="col-sm-6"  onclick="comulativeLoadLimitsRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
									        <div class="form-group">
										      	<a class="btn btn-danger pull-right" > 
										     		<i class="fa fa-minus"></i>
										     	</a>
										    </div>
										</div> 
										<div class="col-sm-6" onclick="comulativeLoadLimitsRowCount('<%=recordCount+1 %>');">
									       	<div class="form-group">
										     	<a class="btn btn-info "> 
											    		<i class="fa fa-plus"></i>
											    	</a>
										     </div>
									 	</div> 
									</div>
			                		</div>
				                <div class="col-md-2 pull-right" style="font-weight: bolder;" id="comulativeLoadLimitsMessage">
				                 		
				                </div>
		            				<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >