<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		result			= "";
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>


<div class="col-sm-3" id="">
 	<label >Aırcraft Reg./Tail Number</label>
 	<%for(int i=1;i<=recordCount;i++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="tailnumber_<%=i %>" value="<%=Helper.request2String(request, "tailnumber_"+i) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-3" id="adjustmentDiv">
 	<label >Ramp Taxi</label>
   	<%for(int m=1;m<=recordCount;m++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="rampTaxi_<%=m %>" value="<%=Helper.request2String(request, "rampTaxi_"+m) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-2">
 	<label >Take-Off </label>
   	<%for(int k=1;k<=recordCount;k++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="takeOff_<%=k %>" value="<%=Helper.request2String(request, "takeOff_"+k) %>" placeholder="">
   	<%} %>
 </div>
<div class="col-sm-2">
	<label >Zero Fuel</label>
	<%for(int y=1;y<=recordCount;y++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="zeroFuel_<%=y %>" value="<%=Helper.request2String(request, "zeroFuel_"+y) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-2">
 	<label >Landing</label>
   	<%for(int z=1;z<=recordCount;z++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="landing_<%=z %>" value="<%=Helper.request2String(request, "landing_"+z) %>" placeholder="">
   	<%} %>
 </div>
 <br style="clear: both;">

	<div class="col-sm-12">
		<div class="col-sm-1 pull-right" >
	         <div class="form-group">
	         	<a class="btn btn-success pull-right" onclick="saveAircraftWeightLimitations();" > 
	  			<i class="fa fa-save"></i> Save
		  	</a>
		 	</div>
		</div>
	
	  	<div class="col-sm-3 pull-right">
	    <div class="col-sm-6"  onclick="removeAircraftLimitationsRow('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
	        <div class="form-group">
		      	<a class="btn btn-danger pull-right" > 
		     		<i class="fa fa-minus"></i>
		     	</a>
		    </div>
		</div> 
		<div class="col-sm-6" onclick="createAircraftLimitationsRow('<%=recordCount+1%>');">
	       	<div class="form-group">
		     	<a class="btn btn-info "> 
			    		<i class="fa fa-plus"></i>
			    	</a>
		     </div>
	 	</div> 
		</div>
	</div>
	<div class="col-md-2 pull-right" style="font-weight: bolder;" id="aircraftWeightLimitationsMessage">
	</div>
	<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >