<%@page import="com.loadsheet.bean.data.AirportData"%>
<%@page import="com.loadsheet.util.AirportList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.company.CompanyProcess"%>
<%@page import="com.loadsheet.bean.data.company.CompanyData"%>
<%@page import="com.loadsheet.bean.data.user.UserInfoData"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	String 	userName=Helper.request2String(request, "userName");
	int		companyId=Helper.request2int(request, "companyId");
	
	AirportList airportPro=new AirportList();
	List<AirportData> locateList=airportPro.getAirportListMainScreen();
	
	CompanyProcess cprd=new CompanyProcess();
	AjaxResponse rs=cprd.getCompanyList("0");
	List<CompanyData> compList=(List<CompanyData>)rs.getData();
	
	UserProcess prd=new UserProcess();
	List<UserInfoData> data=prd.getUserDataList(userName,null,"ALL",companyId,-1);
	for(UserInfoData item:data){
%>
     <form name="upUser" id="upUser" >
	                	<div class="col-md-4">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.FirstName")%></label>
		                      <input type="text"  id="firstName" value="<%=item.FIRST_NAME %>" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter(this);"  name="firstName" />
		                    </div>
		                </div>
	   					<div class="col-md-4">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.LastName") %></label>
		                     <input type="text" value="<%=item.LAST_NAME %>"  id="lastName"  class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter(this);" name="lastName" />
		                    </div>
	                  	</div>
	                  	<div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.UserName")%></label>
		                     <input type="text"  id="userName" value="<%=item.USER_NAME %>" class="form-control"  disabled="disabled"  data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justENChar(this);"  name="userName" />
		                    </div>
		                 </div>
		                 
		                  <%-- 
		                  <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.UserLocation")%></label>
		                     <select name="userTypeUp" id="userType"  data-validation-engine="validate[required]" class="form-control"  >
		                     	<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
			          			<option  <%=Helper.optionSelect(item.INT_DOM,"D") %> value="D"><%=Helper.getMessage(session, "Dcs.FlightList.Domestic") %></option>
		          				<option  <%=Helper.optionSelect(item.INT_DOM,"I") %> value="I"><%=Helper.getMessage(session, "Dcs.FlightList.International") %></option>
		          				<option  <%=Helper.optionSelect(item.INT_DOM,"A") %>value="A"><%=Helper.getMessage(session, "Dcs.Manifesto.RadioLaabel03") %></option>
			          		</select>
		                    </div>
		                 </div> --%>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "User Type")%></label>
		                     <select name="userPossionUp" id="userPossion"  data-validation-engine="validate[required]" class="form-control"  >
		                     		<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
			          				<option <%=Helper.optionSelect(item.USER_POSITION,"PERSONEL") %> value="PERSONEL">PERSONEL</option>
			          				<option <%=Helper.optionSelect(item.USER_POSITION,"SPV") %> value="SPV">SPV</option>
			          				<option <%=Helper.optionSelect(item.USER_POSITION,"DIRECTOR") %> value="DIRECTOR">DIRECTOR</option>
			          				<%if(users.getUserName().trim().equals("BKEBABCI")||users.getUserName().trim().equals("MED")||users.getUserName().trim().equals("MUSTAFAA")){ %>
			          					<option <%=Helper.optionSelect(item.USER_POSITION,"ADMIN") %> value="ADMIN" >**ADMIN</option>
			          				<%}else if(item.USER_POSITION.equals("ADMIN")){ %>
			          					<option <%=Helper.optionSelect(item.USER_POSITION,"ADMIN") %> value="ADMIN" >**ADMIN</option>
			          				<%} %>
				          		</select>
		                    </div>
		                 </div>
		                  <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Email")%></label>
		                     <input type="text"  id="userEmailNew" class="form-control"    name="userEmailUp" value="<%=item.getUserEmail()%>"/>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Phone")%></label>
		                     <input type="text"  id="userPhoneNew" class="form-control"      name="userPhoneUp" value="<%=item.getUserPhone()%>" onkeyup="justNumber(this);"/>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "User Comment")%></label>
		                     <input type="text"  id="userComment" class="form-control"    name="userComment" value="<%=item.getComment()%>" onkeyup="this.value=this.value.toUpperCase();"/>
		                    </div>
		                 </div>
		                 <%if(users.getUserPosition().equals("6") && users.getCampanyId()==0){ %>
		                 <div class="col-md-4">
	                    		<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Station")%></label>
		                      <select name="arrvalUp" class="select2 form-control"  data-validation-engine="validate[required]"  id="arrval">
		                      		<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
		      					<%for(AirportData item2:locateList) {%>
		      						<option  <%=Helper.optionSelect(item.USER_LOCATION,item2.PORT_CODE) %> value="<%=item2.PORT_CODE%>"><%=item2.PORT_CODE %></option>
		      					<%} %>
		      				</select>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    		<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Company")%></label>
		                     <select name="userCompany" id="userCompany"  data-validation-engine="validate[required]" class="form-control"  >
		                     	<option value="" >Select </option>
		                     	<option value="0" <%=Helper.optionSelect(String.valueOf( item.getCompanyId()), "0") %>>Atlas Global </option>
	           					<%for(CompanyData itemComp:compList){%>
	           						<option  <%=Helper.optionSelect(String.valueOf( item.getCompanyId()), itemComp.getCompanyId()) %>  value="<%=itemComp.getCompanyId()%>" ><%=itemComp.getCompanyName() %></option>
	           					<%} %>
			          		</select>
		                    </div>
		                 </div>
		                 <%} %>
		                 <div class="col-md-4 m-t-20" >
		                 	<a class="btn btn-success" onclick="upUserFrm();"> 
		                 		<i class="fa fa-check"></i> <%=Helper.getMessage(session ,"Dcs.Global.Update") %>
		                 	</a>
		                 </div>
		                 <input type="hidden" name="userName" value="<%=userName%>" > 
		             </form>     
    <br style="clear: both;">
    
 <%}
 }else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>