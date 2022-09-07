<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>
						<div class="col-sm-2">
		                	<label >By, CPT Or Hold</label>
		                </div>
		                 <div class="col-sm-2">
		                	<label >By, CPT Or Hold</label>
		                </div>
		                <div class="col-sm-2">
		                	<label >By, CPT Or Hold</label>
		                </div>
		                <div class="col-sm-3">
		                	<label >Max Combined Weight</label>
		                </div>
		                <div class="col-sm-3">
		                	<label >Remarks</label>
		                </div>
		                
				<%for(int k=1;k<=recordCount;k++){ %>
		              <br style="clear: both;">
		                <div class="col-sm-2">
              					<input type="text" class="form-control input-sm m-b-5" id="" name="cptorhold1_<%=k %>" value="<%=Helper.request2String(request, "cptorhold1_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
		                </div>
		                 <div class="col-sm-2">
              					<input type="text" class="form-control input-sm m-b-5" id="" name="cptorhold2_<%=k %>" value="<%=Helper.request2String(request, "cptorhold2_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
		                </div>
		                <div class="col-sm-2">
              					<input type="text" class="form-control input-sm m-b-5" id="" name="cptorhold3_<%=k %>" value="<%=Helper.request2String(request, "cptorhold3_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
		                </div>
		                <div class="col-sm-3">
              					<input type="text" class="form-control input-sm m-b-5" id="" name="maxcombined_<%=k %>" value="<%=Helper.request2String(request, "maxcombined_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
		                </div>
		                <div class="col-sm-3">
              					<input type="text" class="form-control input-sm m-b-5" id="" name="remarks_<%=k %>" value="<%=Helper.request2String(request, "remarks_"+k) %>" placeholder="" data-validation-engine="validate[required]">
		                </div>
		                <input type="hidden"  name="comLoadLimId_<%=k %>"  id="comLoadLimId_<%=k %>"  value="<%=Helper.request2String(request, "comLoadLimId_"+k) %>" />	
		                <br style="clear: both;">
		             <%} %>   
		                <div class="col-sm-12">
						  		<div class="col-sm-1 pull-right" >
				                    <div class="form-group">
					                	<a class="btn btn-success pull-right" onclick="saveCombinedLoadLimits();" > 
					                 		<i class="fa fa-save"></i> Save
					                 	</a>
					                 </div>
			                 	</div>
			                 	
			                 	<div class="col-sm-3 pull-right">
								    <div class="col-sm-6"  onclick="combinedLoadLimitsRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
								        <div class="form-group">
									      	<a class="btn btn-danger pull-right" > 
									     		<i class="fa fa-minus"></i>
									     	</a>
									    </div>
									</div> 
									<div class="col-sm-6" onclick="combinedLoadLimitsRowCount('<%=recordCount+1 %>');">
								       	<div class="form-group">
									     	<a class="btn btn-info "> 
										    		<i class="fa fa-plus"></i>
										    	</a>
									     </div>
								 	</div> 
								</div>
		                		</div>
			                <div class="col-md-2 pull-right" style="font-weight: bolder;" id="combinedLoadLimitsMessage">
			                 		
			                </div>
	            				<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >