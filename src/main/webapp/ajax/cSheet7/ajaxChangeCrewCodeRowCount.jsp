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
       		<label >Crew Code</label>
</div>
<div class="col-sm-2">
       		<label >Cockpit Crew</label>
</div>
<div class="col-sm-2">
		<label >Cabin Crew</label>
</div>
<div class="col-sm-2">
		<label >Location</label>
</div>
<div class="col-sm-4">
		<label >Location Of Crew Baggage</label>
</div>
<br style="clear: both;">

<%for(int k=1;k<=recordCount;k++){ %>
<div class="col-sm-2">
  			<input type="text" class="form-control input-sm m-b-5" id="" name="crwcode_<%=k %>" value="<%=Helper.request2String(request, "crwcode_"+k) %>" placeholder="" data-validation-engine="validate[required]" />
</div>
<div class="col-sm-2">
		<input type="text" class="form-control input-sm m-b-5" id="" name="cockpitcrew_<%=k %>" value="<%=Helper.request2String(request, "cockpitcrew_"+k) %>" placeholder=""  data-validation-engine="validate[required,custom[number]]" />
</div>
<div class="col-sm-2">
  		<input type="text" class="form-control input-sm m-b-5" id=""name="cabincrew_<%=k %>" value="<%=Helper.request2String(request, "cabincrew_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]" />
</div>
<div class="col-sm-2">
  		<input type="text" class="form-control input-sm m-b-5" id="" name="location_<%=k %>" value="<%=Helper.request2String(request, "location_"+k) %>" placeholder="" data-validation-engine="validate[required]" />
</div>
<div class="col-sm-4">
  		<input type="text" class="form-control input-sm m-b-5" id="" name="loccrwbaggage_<%=k%>" value="<%=Helper.request2String(request, "loccrwbaggage_"+k) %>" placeholder="" data-validation-engine="validate[required,custom[number]]" />
</div>
 <input type="hidden"  name="cdId_<%=k %>"  id="cdId_<%=k %>"  value="<%=Helper.request2String(request, "cdId_"+k) %>" />
<br style="clear: both;">
<%} %>
      
    <div class="col-sm-12">
	<div class="col-sm-1 pull-right" >
	  <div class="form-group">
		<a class="btn btn-success pull-right" onclick="saveCrewCode();" > 
	 		<i class="fa fa-save"></i> Save
	 	</a>
	 </div>
	</div>
	        	
       	<div class="col-sm-3 pull-right">
		<div class="col-sm-6"  onclick="crewCodeRowCount('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
	       	<div class="form-group">
		      	<a class="btn btn-danger pull-right" > 
		     		<i class="fa fa-minus"></i>
		     	</a>
		    </div>
		</div> 
		<div class="col-sm-6" onclick="crewCodeRowCount('<%=recordCount+1 %>');">
	       	<div class="form-group">
		     	<a class="btn btn-info "> 
			    		<i class="fa fa-plus"></i>
			    	</a>
		     </div>
	 	</div> 
	</div>
      </div>
      <div class="col-md-2 pull-right" style="font-weight: bolder;" id="crewCodeMessage">
   		
  		</div>
<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >