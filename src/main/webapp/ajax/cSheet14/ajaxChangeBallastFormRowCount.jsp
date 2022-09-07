<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>
		          <div class="col-lg-12 " style="border: 3px solid #4393FB;border-radius: 10px;">
		              <div class="form-group" >
			                 <div class="col-lg-12 ">
			                		<div class="col-sm-3">
					                	<label >Location</label>
					                </div>
					                 <div class="col-sm-3">
					                	<label >Weight</label>
					                </div>
					                <div class="col-sm-3">
					                	<label >Index + -</label>
					                </div>
					                <div class="col-sm-3 ">  
						                <div class="col-lg-2">
						                	<label for="" class="col-sm-1 control-label m-t-10">YES</label>
						                </div>																			                
						                <div class="col-lg-2">
						                	<label for="" class="col-sm-1 control-label m-t-10">NO</label>
					                	</div>
		              				</div>
			                </div>
			                <%for(int k=1;k<=recordCount;k++){ %>
			                <div class="col-lg-12 ">
			                	<div class="col-sm-3">
							   			<input type="text" class="form-control input-sm m-b-5" id="" name="ballastlocation_<%=k %>" value="<%=Helper.request2String(request, "ballastlocation_"+k) %>" placeholder="" data-validation-engine="validate[required]">
				                </div>
				                 <div class="col-sm-3">
							   			<input type="text" class="form-control input-sm m-b-5" id="" name="weight_<%=k %>" value="<%=Helper.request2String(request, "weight_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
				                </div>
				                <div class="col-sm-3">
							   			<input type="text" class="form-control input-sm m-b-5" id="" name="ballindex_<%=k %>" value="<%=Helper.request2String(request, "ballindex_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]">
				                </div>
				                 <div class="col-sm-3 ">  
						                <div class="col-sm-2">
						                  <input type="radio" class="form-control input-sm " id="" name="yesno_<%=k %>" <%if(Helper.request2String(request, "yesno_"+k).trim().equals("YES")){ %>checked="checked"<%} %> value="YES"  placeholder="" data-validation-engine="validate[required]">
						                </div>
						                <div class="col-sm-2">
						                  <input type="radio" class="form-control input-sm " id="" name="yesno_<%=k %>" <%if(Helper.request2String(request, "yesno_"+k).trim().equals("NO")){ %>checked="checked"<%} %> value="NO" placeholder="" data-validation-engine="validate[required]">
						                </div>
					              </div>
			                </div>
			                <input type="hidden"  name="ballastId_<%=k %>"  id="ballastId_<%=k %>"  value="<%=Helper.request2String(request, "ballastId_"+k) %>" />	
			                <%} %>
			                 <div class="col-sm-12">
						  		<div class="col-sm-1 pull-right" >
				                    <div class="form-group">
					                		<a class="btn btn-success pull-right" onclick="saveBallast();" > 
					                 		<i class="fa fa-save"></i> Save
					                 	</a>
					                 </div>
			                 	</div>
			                 	
			                 	<div class="col-sm-3 pull-right">
								    <div class="col-sm-6"  onclick="ballastRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
								        <div class="form-group">
									      	<a class="btn btn-danger pull-right" > 
									     		<i class="fa fa-minus"></i>
									     	</a>
									    </div>
									</div> 
									<div class="col-sm-6" onclick="ballastRowCount('<%=recordCount+1 %>');">
								       	<div class="form-group">
									     	<a class="btn btn-info "> 
										    		<i class="fa fa-plus"></i>
										    	</a>
									     </div>
								 	</div> 
								</div>
		                		</div>
			                <div class="col-md-2 pull-right" style="font-weight: bolder;" id="ballastMessage">
			                 		
			                </div>
	            				<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >
		              </div>
		            </div>
