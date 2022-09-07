<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData 	users 			= (UserData) session.getAttribute(Constants.SESSION_USER);
	String		bagweightId		= Helper.request2String(request, "bagweightId");
	String		code				= Helper.request2String(request, "code");
	int 			recordCount		= Helper.request2int(request, "recordCount");
%>
 <div class="col-sm-3">
    	<label >Weight</label>	      
    </div>
    <div class="col-sm-1">
     <div class="col-sm-6">  
      <label for="" class="col-sm-12 control-label" style="text-align: center;">+</label>     
  </div>
  <div class="col-sm-6">  
      <label for="" class="col-sm-12 control-label" style="text-align: center;">-</label>    
  </div>
 </div>
    <div class="col-sm-4">
    <label >Index </label>     
      		
   </div>
    <br style="clear: both;">
	<%for(int i=1;i<=recordCount;i++){ %>
    
    <div class="col-sm-3">
      		<input type="text" class="form-control input-sm m-b-5" id="<%=Helper.request2String(request, "weight_"+i) %>" name="weight_<%=i%>" value="<%=Helper.request2String(request, "weight_"+i) %>"  placeholder="" data-validation-engine="validate[required ,custom[number]]" />
      
    </div>
    <div class="col-sm-1">
     <div class="col-sm-6">  
      <div class="col-sm-12">
       
      		<input type="radio" class="form-control input-sm " id="" name="operations_<%=i %>" <%if(Helper.request2String(request, "operations_"+i).trim().equals("+")){ %>checked="checked"<%} %> value="+"   data-validation-engine="validate[required ]" />
      
      </div>
  </div>
  <div class="col-sm-6">  
      <div class="col-sm-12">
       
      		<input type="radio" class="form-control input-sm " id="" name="operations_<%=i %>"  <%if(Helper.request2String(request, "operations_"+i).trim().equals("-")){ %>checked="checked"<%} %> value="-"  data-validation-engine="validate[required ]" />
      
      </div>
  </div>
 </div>
    <div class="col-sm-4">
      		<input type="text" class="form-control input-sm m-b-5" id="" name="index_<%=i %>" value="<%=Helper.request2String(request, "index_"+i) %>"  placeholder="" data-validation-engine="validate[required,custom[number] ]" />      	
    </div>
    <input type="hidden"  name="llpId_<%=i %>"  id="lpId_<%=i %>"  value="<%=Helper.request2int(request, "llpId_"+i) %>" />
    <br style="clear: both;">
    <%} %>
         <div class="col-sm-12">
<div class="col-sm-1 pull-right" >
              <div class="form-group">
           	<a class="btn btn-success pull-right" onclick="saveLimitsPurposes('<%=code.trim() %>');" > 
          		<i class="fa fa-save"></i> Save
          	</a>
          </div>
        	</div>
        	
        	<div class="col-sm-3 pull-right">
<div class="col-sm-6"  onclick="limitsPurposesRow('<%if(recordCount==1){out.print(recordCount);}else{out.print(recordCount-1);}%>','<%=code.trim()%>');">
       <div class="form-group">
      	<a class="btn btn-danger pull-right" > 
     		<i class="fa fa-minus"></i>
     	</a>
    </div>
</div> 
<div class="col-sm-6" onclick="limitsPurposesRow('<%=recordCount+1%>','<%=code.trim()%>');">
       	<div class="form-group">
	     	<a class="btn btn-info "> 
		    		<i class="fa fa-plus"></i>
		    	</a>
	     </div>
 	</div> 
</div>
           </div>
           <div class="col-md-2 pull-right" style="font-weight: bolder;" id="<%=code.trim() %>LimitsPurposesMessage">
     		
  </div>
<input type="hidden" id="" name="formRecordCount" value="<%=recordCount %>" >