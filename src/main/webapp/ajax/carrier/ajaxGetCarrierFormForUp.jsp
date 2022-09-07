<%@page import="com.loadsheet.bean.data.country.CountryData"%>
<%@page import="com.loadsheet.bean.data.carrier.HandlingCarrierData"%>
<%@page import="com.loadsheet.bean.data.carrier.CarrierData"%>
<%@page import="com.loadsheet.process.country.CountryProcess"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 			users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	String				carrierId	= Helper.request2String(request, "carrierId");
	int				companyId	= 0;
	if(users.getUserPosition().trim().equals("6")){
		companyId=Helper.request2int(request, "companyId");
	}else{
		companyId=users.getCampanyId();
	}
	
	CarrierProcess		carrierPrc	=new CarrierProcess();
	AjaxResponse 		rs			=new AjaxResponse();
	CountryProcess		cntryPrc	=new CountryProcess();
	rs=carrierPrc.getCarrierList();
	List<CarrierData> 			carierList			=(List<CarrierData>)rs.getData();
	List<HandlingCarrierData> 	carrierList = new ArrayList<HandlingCarrierData>();
	
	rs=cntryPrc.getCountryList();
	List<CountryData>			countryList			=(List<CountryData>)rs.getData();
	
	
	rs=carrierPrc.getCompanyCarrierList(companyId, carrierId);
	if(rs.getStatus().equals("OK")){
		carrierList =(List<HandlingCarrierData>)rs.getData();
	
%>
<h3 class="text-danger" id="airlineNameTitle"></h3>
<%for(HandlingCarrierData data:carrierList){ %>
	<form name="carrierFormUp" id="carrierFormUp" >
           		<div class="col-md-2 pull-left">
                   <div class="form-group">
                   	<label class="">
         				<%=Helper.getMessage(session, "Airline") %>
     				</label>
                	<select name="carrierCode" class="select2 form-control"  onchange="" data-validation-engine="validate[required]"   disabled="disabled">
      					<option value=""><%=Helper.getMessage(session, "Select") %></option>
      					<%for(CarrierData item:carierList) {%>
      						<option value="<%=item.getIataDes()%>"  <%=Helper.selected(data.getCarrierCode(), item.getIataDes()) %> ><%=item.getAirlineName() %></option>
      					<%} %>
      				</select>
                 </div>
               	</div>
               	<div class="col-md-5">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "Address Str1")%></label>
                			<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="billingaddr1" value="<%=data.getBillingCode()%>"/>
                 </div>
             	</div> 
             	<div class="col-md-5">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "Address Str2")%></label>
                			<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="billingaddr2" value="<%=data.getBillingCode2()%>"/>
                 </div>
             	</div> 
             	<div class="col-md-2">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "Zip Code")%></label>
                			<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="zipcode" value="<%=data.getZipCode()%>"/>
                 </div>
             	</div> 
             	<div class="col-md-5">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "City Name")%></label>
                			<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="cityname" value="<%=data.getCityName()%>"/>
                 </div>
             	</div> 
             	<div class="col-md-5 ">
                   <div class="form-group">
                   	<label class="">
         				<%=Helper.getMessage(session, "Country") %>
     				</label>
                	<select name="countrycode" class="select2 form-control"  onchange="" data-validation-engine="validate[required]"  >
      					<option value=""><%=Helper.getMessage(session, "Select") %></option>
      					<%for(CountryData item:countryList) {%>
      						<option value="<%=item.getCountryCode()%>" <%=Helper.selected(data.getCountryCode(), item.getCountryCode()) %>><%=item.getCountryName() %></option>
      					<%} %>
      				</select>
                 </div>
               	</div>
               	<div class="col-md-1 " >
                	<a class="btn btn-warning" onclick="updateCarrier();"> 
                		<i class="fa fa-check"></i> <%=Helper.getMessage(session ,"Update") %>
                	</a>
                </div>
              	<br class="clearfix">
              	<br class="clearfix">
              	<br class="clearfix">
              	<input name="carrierId" value="<%=carrierId%>" type="hidden">
              	<input name="companyId" value="<%=companyId%>" type="hidden">
             </form>   
		<br style="clear: both;">
		<%} %>
	<%}else{ %>
		<div style="width: auto;color: red;text-align: center;">System has Error</div>
	<%} %>
		             
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>