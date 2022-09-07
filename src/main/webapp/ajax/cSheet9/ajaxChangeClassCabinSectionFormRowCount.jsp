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
              			<div class="col-sm-4" >
					   			<input type="text" class="form-control input-sm m-b-5" id="" name="cabinsection_<%=k %>" value="<%=Helper.request2String(request, "cabinsection_"+k) %>"  placeholder="" data-validation-engine="validate[required]" >
	              		</div>
	              		<div class="col-sm-4 b-all" style="text-align: center;">
	              			<div class="col-sm-2">
							      	<input type="radio" class="form-control input-sm " id="" name="lengthoperations_<%=k %>" <%if(Helper.request2String(request, "lengthoperations_"+k).trim().equals("+")){ %>checked="checked"<%} %> value="+"  placeholder=""data-validation-engine="validate[required]" >
			                </div>
	              			<div class="col-sm-2">
							      	<input type="radio" class="form-control input-sm " id="" name="lengthoperations_<%=k %>" <%if(Helper.request2String(request, "lengthoperations_"+k).trim().equals("-")){ %>checked="checked"<%} %> value="-"  placeholder="" data-validation-engine="validate[required]" >
			                </div>
	              			<div class="col-sm-8">
						   			<input type="text" class="form-control input-sm m-b-5" id="" name="lengthunit_<%=k %>" value="<%=Helper.request2String(request, "lengthunit_"+k) %>"  placeholder="" data-validation-engine="validate[required,custom[number]]" >
	              			</div>
	              		</div>
	              		<div class="col-sm-4 b-all" style="text-align: center;">
	              			<div class="col-sm-2">
							      	<input type="radio" class="form-control input-sm " id="" name="indexoperation_<%=k %>" <%if(Helper.request2String(request, "indexoperation_"+k).trim().equals("+")){ %>checked="checked"<%} %> value="+"  placeholder="" data-validation-engine="validate[required]" >
			                </div>
	              			<div class="col-sm-2">
							      	<input type="radio" class="form-control input-sm " id="" name="indexoperation_<%=k %>" <%if(Helper.request2String(request, "indexoperation_"+k).trim().equals("-")){ %>checked="checked"<%} %> value="-"  placeholder="" data-validation-engine="validate[required]" >
			                </div>
	              			<div class="col-sm-8">
						   			<input type="text" class="form-control input-sm m-b-5" id="" name="perweightunit_<%=k %>" value="<%=Helper.request2String(request, "perweightunit_"+k) %>"  placeholder="" data-validation-engine="validate[required,custom[number]]" >
	              			</div>
	              		</div>
	             	</div>
	             	<br style="clear: both;">
	                <br style="clear: both;">
	                <input type="hidden"  name="classCabinSecId_<%=k %>"  id="classCabinSecId_<%=k %>"  value="<%=Helper.request2String(request, "classCabinSecId_"+k) %>" />
	                <%} %>
			      <div class="col-sm-12">
						<div class="col-sm-1 pull-right" >
						  <div class="form-group">
							<a class="btn btn-success pull-right" onclick="saveClassCabinSection();" > 
						 		<i class="fa fa-save"></i> Save
						 	</a>
						 </div>
						</div>
						        	
				        	<div class="col-sm-3 pull-right">
							<div class="col-sm-6"  onclick="classCabinSectionRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
						       	<div class="form-group">
							      	<a class="btn btn-danger pull-right" > 
							     		<i class="fa fa-minus"></i>
							     	</a>
							    </div>
							</div> 
							<div class="col-sm-6" onclick="classCabinSectionRowCount('<%=recordCount+1 %>');">
						       	<div class="form-group">
							     	<a class="btn btn-info "> 
								    		<i class="fa fa-plus"></i>
								    	</a>
							     </div>
						 	</div> 
						</div>
			        </div>
			        <div class="col-md-2 pull-right" style="font-weight: bolder;" id="classCabinSectionMessage">
			     		
			    		</div>
					<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >