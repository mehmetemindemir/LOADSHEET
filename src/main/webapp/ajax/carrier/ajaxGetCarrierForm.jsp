<%@page import="com.loadsheet.process.company.CompanyProcess"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.loadsheet.bean.data.company.CompanyData"%>
<%@page import="com.loadsheet.bean.data.country.CountryData"%>
<%@page import="com.loadsheet.process.country.CountryProcess"%>
<%@page import="com.loadsheet.bean.data.carrier.CarrierData"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 			sessionUsers 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	CarrierProcess		carrierPrc	=new CarrierProcess();
	AjaxResponse 		rs			=new AjaxResponse();
	CountryProcess		cntryPrc	=new CountryProcess();
	rs=carrierPrc.getCarrierList();
	List<CarrierData> 			carierList			=(List<CarrierData>)rs.getData();
	
	rs=cntryPrc.getCountryList();
	List<CountryData>			countryList			=(List<CountryData>)rs.getData();
	
	List<CompanyData> compList =new ArrayList<CompanyData>();
	CompanyProcess prd=new CompanyProcess();

	 rs=prd.getCompanyList("0");
	compList =(List<CompanyData>)rs.getData();
%>
<h3 class="text-danger">Add New Airline Form</h3>
	<form name="carrierForm" id="carrierForm" >
           		<div class="col-md-2 pull-left">
                   <div class="form-group">
                   	<label class="">
         				<%=Helper.getMessage(session, "Airline") %>
     				</label>
                	<select name="carrierCode" class="select2 form-control"  onchange="" data-validation-engine="validate[required]"  id="carrierCode">
      					<option value=""><%=Helper.getMessage(session, "Select") %></option>
      					<%for(CarrierData item:carierList) {%>
	      					<%if(!item.getIataDes().trim().equals("KK")&& !item.getIataDes().trim().equals("UH")){ %>
	      						<option value="<%=item.getIataDes()%>" ><%=item.getAirlineName() %> (<%=item.getIataDes()%>)</option>
	      					<%} %>
      					<%} %>
      				</select>
                 </div>
               	</div>
               	<div class="col-md-5">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "Address Str1")%></label>
                						<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="billingaddr1" />
                 </div>
             	</div> 
             	<div class="col-md-5">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "Address Str2")%></label>
                						<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="billingaddr2" />
                 </div>
             	</div> 
             	<div class="col-md-2">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "Zip Code")%></label>
                						<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="zipcode" />
                 </div>
             	</div> 
             	<div class="col-md-5">
                   <div class="form-group">
                   		<label><%=Helper.getMessage(session, "City Name")%></label>
                						<input type="text"  id="" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();"  name="cityname" />
                 </div>
             	</div> 
             	<div class="col-md-5 ">
                   <div class="form-group">
                   	<label class="">
         				<%=Helper.getMessage(session, "Country") %>
     				</label>
                	<select name="countrycode" class="select2 form-control"   data-validation-engine="validate[required]"  id="countrycode">
      					<option value=""><%=Helper.getMessage(session, "Select") %></option>
      					<%for(CountryData item:countryList) {%>
      						<option value="<%=item.getCountryCode()%>" ><%=item.getCountryName() %></option>
      					<%} %>
      				</select>
                 </div>
               	</div>
               	<%if(sessionUsers.getUserPosition().equals("6")){ %>
                	<div class="col-md-2">
                    <label class=" text-danger">
                    	<%=Helper.getMessage(session, "Company") %> 
      				</label>
                    <div class="form-group ">
		                	<select name="companyId" class="select2 form-control"  onchange="getCarrierList();" data-validation-engine="validate[required]"  id="companyId">
		                	<%for(CompanyData item:compList){%>
          						<option value="<%=item.getCompanyId()%>" ><%=item.getCompanyName() %></option>
          					<%} %>
	      				</select>
	                 </div>
                	</div>
                	<%} %>
               	<div class="col-md-1 m-t-20" >
                	<a class="btn btn-success" onclick="addCarrier();"> 
                		<i class="fa fa-check"></i> <%=Helper.getMessage(session ,"Dcs.Global.BtnADD") %>
                	</a>
                </div>
              	<br class="clearfix">
              	<br class="clearfix">
              	<br class="clearfix">
             </form>   
		<br style="clear: both;">
		<div class="white-box col-lg-12" id="">
	   		<div class="clearfix"  id="carrierListContent" style="overflow-x: scroll;">
	   			<br class="clearfix">
	   		</div> 
	    </div>
		             
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>