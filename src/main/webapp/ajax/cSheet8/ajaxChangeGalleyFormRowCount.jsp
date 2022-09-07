<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>
					<%for(int i=1;i<=recordCount;i++){ %>
					<div class="col-lg-12">						
              			<div class="col-sm-2" >
					   			<input type="text" class="form-control input-sm m-b-5" id="" name="galleylocation_<%=i %>" value="<%=Helper.request2String(request, "galleylocation_"+i) %>" placeholder=""  data-validation-engine="validate[required]" >
	              		</div>
	              		<div class="col-sm-2" >
					   			<input type="text" class="form-control input-sm m-b-5" id="" name="maxweight_<%=i %>" value="<%=Helper.request2String(request, "maxweight_"+i) %>" onkeyup="justNumber(this);" placeholder="" data-validation-engine="validate[required,custom[number]]" >
	              		</div>
	              		<div class="col-sm-3" style="text-align: center;">
	              			<div class="col-sm-2">
							      	<input type="radio" class="form-control input-sm " id="" name="armoperations_<%=i %>" <%if(Helper.request2String(request, "armoperations_"+i).trim().equals("+")){ %>checked="checked"<%} %> value="+"  placeholder="" data-validation-engine="validate[required,custom[number]]" >
			                </div>
	              			<div class="col-sm-2">
						      	<input type="radio" class="form-control input-sm " id="" name="armoperations_<%=i %>" <%if(Helper.request2String(request, "armoperations_"+i).trim().equals("-")){ %>checked="checked"<%} %> value="-"  placeholder="" data-validation-engine="validate[required,custom[number]]" >
			                </div>
	              			<div class="col-sm-8">
						   			<input type="text" class="form-control input-sm m-b-5" id="" name="unitlength_<%=i %>" value="<%=Helper.request2String(request, "unitlength_"+i) %>" placeholder="" data-validation-engine="validate[required,custom[number]]" >
	              			</div>
	              		</div>
	              		
	              		<div class="col-sm-3" style="text-align: center;">
	              			<div class="col-sm-2">
						      	<input type="radio" class="form-control input-sm " id="" name="operations_<%=i %>" <%if(Helper.request2String(request, "operations_"+i).trim().equals("+")){ %>checked="checked"<%} %> value="+"  placeholder="" data-validation-engine="validate[required,custom[number]]" >
			                </div>
	              			<div class="col-sm-2">
						      	<input type="radio" class="form-control input-sm " id="" name="operations_<%=i %>" <%if(Helper.request2String(request, "operations_"+i).trim().equals("-")){ %>checked="checked"<%} %> value="-"  placeholder="" data-validation-engine="validate[required,custom[number]]" >
			                </div>
	              			<div class="col-sm-8">
						   			<input type="text" class="form-control input-sm m-b-5" id="" name="perweightunit_<%=i %>" value="<%=Helper.request2String(request, "perweightunit_"+i) %>" placeholder="">
	              			</div>
	              		</div>	              		
	             	</div>
	             	<br style="clear: both;">
	                <br style="clear: both;">
	                <%} %>
			      <div class="col-sm-12">
						<div class="col-sm-1 pull-right" >
						  <div class="form-group">
							<a class="btn btn-success pull-right" onclick="saveGalley();" > 
						 		<i class="fa fa-save"></i> Save
						 	</a>
						 </div>
						</div>
						        	
				        	<div class="col-sm-3 pull-right">
							<div class="col-sm-6"  onclick="galleyRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
						       	<div class="form-group">
							      	<a class="btn btn-danger pull-right" > 
							     		<i class="fa fa-minus"></i>
							     	</a>
							    </div>
							</div> 
							<div class="col-sm-6" onclick="galleyRowCount('<%=recordCount+1 %>');">
						       	<div class="form-group">
							     	<a class="btn btn-info "> 
								    		<i class="fa fa-plus"></i>
								    	</a>
							     </div>
						 	</div> 
						</div>
			        </div>
			        <div class="col-md-2 pull-right" style="font-weight: bolder;" id="galleyMessage">
			     		
			    		</div>
					<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >