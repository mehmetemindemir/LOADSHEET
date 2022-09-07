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
	              		<div class="col-sm-4" style="text-align: center;">
		              		<div class="col-sm-6">
		              			<input type="text" class="form-control input-sm m-b-5" id="" name="cockpit_<%=k %>" placeholder=""  value="<%=Helper.request2String(request, "cockpit_"+k) %>"  data-validation-engine="validate[required,custom[number]]"  onkeyup="justNumber(this)" />
		              		</div>
		              		<div class="col-sm-6">
		              			<input type="text" class="form-control input-sm m-b-5" id="" name="cabin_<%=k %>" placeholder=""  value="<%=Helper.request2String(request, "cabin_"+k) %>"  data-validation-engine="validate[required,custom[number]]"  onkeyup="justNumber(this)" />
		              		</div>
	              		</div>
	              		<div class="col-sm-8" style="text-align: center;">
	              			<div class="col-sm-4">
	              				<select class="form-control input-sm" name="pantry_<%=k %>" tabindex="7" data-validation-engine="validate[required]">
	              						<option value="">Select</option>
										<option value="ONEWAYINT" <%=Helper.selected(Helper.request2String(request, "pantry_"+k), "ONEWAYINT") %>>ONE WAY INT</option>
										<option value="TWOWAYINT" <%=Helper.selected(Helper.request2String(request, "pantry_"+k), "TWOWAYINT") %>>TWO WAY INT</option>
										<option value="ONEWAYDOM" <%=Helper.selected(Helper.request2String(request, "pantry_"+k), "ONEWAYDOM") %>>ONE WAY DOM</option>
										<option value="TWOWAYDOM" <%=Helper.selected(Helper.request2String(request, "pantry_"+k), "TWOWAYDOM") %>>TWO WAY DOM</option>
										<option value="FERRY" 	  <%=Helper.selected(Helper.request2String(request, "pantry_"+k), "FERRY") %>>FERRY</option>
								</select>
			                </div>	
	              			<div class="col-sm-4">
			                  <input type="text" class="form-control input-sm m-b-5" id="" name="dow_val_<%=k %>" placeholder=""  value="<%=Helper.request2String(request, "dow_val_"+k) %>"  data-validation-engine="validate[required,custom[number]]"  onkeyup="justNumber(this)" />
			                </div>
	              			<div class="col-sm-4">
			                  <input type="text" class="form-control input-sm m-b-5" id="" name="doi_val_<%=k %>" placeholder=""  value="<%=Helper.request2String(request, "doi_val_"+k) %>"  data-validation-engine="validate[required,custom[number]]" />
			                </div>
	              		</div>
	             	</div>
	             	<input type="hidden"  name="dowdoiId_<%=k %>"  id="dowdoiId_<%=k %>"  value="<%=Helper.request2String(request, "dowdoiId_"+k) %>" />	
	             	<br style="clear: both;">
	             <%} %>	
	                <div class="col-sm-12">
				  		<div class="col-sm-1 pull-right" >
		                    <div class="form-group">
			                		<a class="btn btn-success pull-right" onclick="saveDowdoi();" > 
			                 		<i class="fa fa-save"></i> Save
			                 	</a>
			                 </div>
	                 	</div>
	                 	
	                 	<div class="col-sm-3 pull-right">
						    <div class="col-sm-6"  onclick="dowdoiRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
						        <div class="form-group">
							      	<a class="btn btn-danger pull-right" > 
							     		<i class="fa fa-minus"></i>
							     	</a>
							    </div>
							</div> 
							<div class="col-sm-6" onclick="dowdoiRowCount('<%=recordCount+1 %>');">
						       	<div class="form-group">
							     	<a class="btn btn-info "> 
								    		<i class="fa fa-plus"></i>
								    	</a>
							     </div>
						 	</div> 
						</div>
                		</div>
	                <div class="col-md-2 pull-right" style="font-weight: bolder;" id="dowdoiMessage">
	                 		
	                </div>
        				<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >
