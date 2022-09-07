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
			   			<input type="text" class="form-control input-sm m-b-5" id="" name="cabinname_<%=i %>" value="<%=Helper.request2String(request, "cabinname_"+i) %>" placeholder="" data-validation-engine="validate[required]" >
             		</div>
             		<div class="col-sm-8 b-all" style="text-align: center;">
             			<div class="col-sm-3">
				   			<input type="text" class="form-control input-sm m-b-5" id="" name="class1_<%=i %>" value="<%=Helper.request2String(request, "class1_"+i) %>" placeholder="" >
              		</div>
              		<div class="col-sm-2">
				   			<input type="text" class="form-control input-sm m-b-5" id="" name="class2_<%=i %>" value="<%=Helper.request2String(request, "class2_"+i) %>" placeholder=""  >
              		</div>
              		<div class="col-sm-2">
				   			<input type="text" class="form-control input-sm m-b-5" id="" name="class3_<%=i %>" value="<%=Helper.request2String(request, "class3_"+i) %>" placeholder="" " >
              		</div>
              		<div class="col-sm-2">
				   			<input type="text" class="form-control input-sm m-b-5" id="" name="class4_<%=i %>" value="<%=Helper.request2String(request, "class4_"+i) %>" placeholder=""  >
              		</div>
              		<div class="col-sm-3">
				   			<input type="text" class="form-control input-sm m-b-5" id="" name="class5_<%=i %>" value="<%=Helper.request2String(request, "class5_"+i) %>" placeholder=""  >
              		</div>
             		</div>
             		<div class="col-sm-2" style="text-align: center;">
			   			<input type="text" class="form-control input-sm m-b-5" id="" name="totalcabinsection_<%=i %>" value="<%=Helper.request2String(request, "totalcabinsection_"+i) %>" placeholder="" data-validation-engine="validate[required,custom[number]]" >
             		</div>
            	</div>
            	<input type="hidden"  name="paxCabinId_<%=i %>"  id="paxCabinId_<%=i %>"  value="<%=Helper.request2String(request, "paxCabinId_"+i) %>" />
	  <%} %>           	
	             	<br style="clear: both;">
	                <br style="clear: both;">
			      <div class="col-sm-12">
						<div class="col-sm-1 pull-right" >
						  <div class="form-group">
							<a class="btn btn-success pull-right" onclick="savePassengerCabin();" > 
						 		<i class="fa fa-save"></i> Save
						 	</a>
						 </div>
						</div>
						        	
				        	<div class="col-sm-3 pull-right">
							<div class="col-sm-6"  onclick="passengerCabinRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
						       	<div class="form-group">
							      	<a class="btn btn-danger pull-right" > 
							     		<i class="fa fa-minus"></i>
							     	</a>
							    </div>
							</div> 
							<div class="col-sm-6" onclick="passengerCabinRowCount('<%=recordCount+1 %>');">
						       	<div class="form-group">
							     	<a class="btn btn-info "> 
								    		<i class="fa fa-plus"></i>
								    	</a>
							     </div>
						 	</div> 
						</div>
			        </div>
			        <div class="col-md-2 pull-right" style="font-weight: bolder;" id="passengerCabinMessage">
			     		
			    		</div>
					<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >