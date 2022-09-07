<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		result			= "";
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>

<div class="col-sm-2" id="">
 	<label >Registration/Tail Number</label>
 	<%for(int i=1;i<=recordCount;i++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="fwtailnumber_<%=i %>" value="<%=Helper.request2String(request, "fwtailnumber_"+i) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-2" id="adjustmentDiv">
 	<label >Weight Adjustment</label>
   	<%for(int m=1;m<=recordCount;m++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="fwweightadjustment_<%=m %>" value="<%=Helper.request2String(request, "fwweightadjustment_"+m) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-2">
 	<label >Index Adjustment </label>
   	<%for(int k=1;k<=recordCount;k++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="fwindexadjustment_<%=k %>" value="<%=Helper.request2String(request, "fwindexadjustment_"+k) %>" placeholder="">
   	<%} %>
 </div>
<div class="col-sm-2">
 	<label >Registration/Tail Number</label>
	<%for(int y=1;y<=recordCount;y++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="fitailnumber_<%=y %>" value="<%=Helper.request2String(request, "fitailnumber_"+y) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-2">
 	<label >Weight Adjustment</label>
   	<%for(int z=1;z<=recordCount;z++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="fiweightadjustment_<%=z %>" value="<%=Helper.request2String(request, "fiweightadjustment_"+z) %>" placeholder="">
   	<%} %>
 </div>
 <div class="col-sm-2">
 	<label >Index Adjustment </label>
   	<%for(int x=1;x<=recordCount;x++){ %>
   		<input type="text" class="form-control input-sm m-b-5" id="" name="fiindexadjustment_<%=x %>" value="<%=Helper.request2String(request, "fiindexadjustment_"+x) %>" placeholder="">
   	<%} %>
 </div>
 <br style="clear: both;">

<div class="col-sm-12">
	<div class="col-sm-1 pull-right" >
         <div class="form-group">
         	<a class="btn btn-success pull-right" onclick="saveRegistrationDetail();" > 
  			<i class="fa fa-save"></i> Save
	  	</a>
	 	</div>
	</div>

  	<div class="col-sm-3 pull-right">
    <div class="col-sm-6"  onclick="removeRegistrationRow('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>');">
        <div class="form-group">
	      	<a class="btn btn-danger pull-right" > 
	     		<i class="fa fa-minus"></i>
	     	</a>
	    </div>
	</div> 
	<div class="col-sm-6" onclick="createRegistrationRow('<%=recordCount+1%>');">
       	<div class="form-group">
	     	<a class="btn btn-info "> 
		    		<i class="fa fa-plus"></i>
		    	</a>
	     </div>
 	</div> 
	</div>
</div>
<div class="col-md-2 pull-right" style="font-weight: bolder;" id="paxRegistrationMessage">
</div>
<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >