<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.bean.data.user.UserType"%>
<%@page import="com.loadsheet.util.AirportList"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.process.company.CompanyProcess"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.bean.data.company.CompanyData"%>
<%@page import="com.loadsheet.bean.data.AirportData"%>
<%@page import="java.util.List"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	UserData 	users 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	UserProcess proc=new UserProcess();
	AirportList airportPro=new AirportList();
	List<AirportData> locateList=airportPro.getAirportListMainScreen();
	List<AirportData> aiportList=airportPro.getAirportList();
	CompanyProcess prd=new CompanyProcess();
	AjaxResponse rs=prd.getCompanyList("0");
	List<CompanyData> compList=(List<CompanyData>)rs.getData();
%>

  <div id="userProcess-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                   
                    <h4 class="modal-title" id="myLargeModalLabel">Kullanıcı İşlemleri</h4>
                </div>
                <div class="modal-body">
                		<div class="col-md-2 pull-right">
		                    <div class="form-group">
			                	<a class="btn btn-success pull-right" onclick="openPopup('#addUser')"> 
			                 		<i class="fa fa-check"></i> <%=Helper.getMessage(session ,"Dcs.Announecement.NewAnnoun") %>
			                 	</a>
			                 </div>
	                 	</div>
	                 	<div class="col-md-2 pull-right">
		                    <div class="form-group">
			                 	<a class="btn btn-success pull-right" onclick="openPopup('#addUser')"> 
			                 		<i class="fa fa-check"></i> <%=Helper.getMessage(session ,"Dcs.User.AddUserWithExcesl.BtnOpenFrom") %>
			                 	</a>
			                 </div>
		              	</div>   	
                 	
                 	<br class="clearfix">
                 	<br class="clearfix">
                 	<br class="clearfix">
                    <div class="clearfix" id="userListDiv"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
     <div id="addUser-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>                   
                    <h4 class="modal-title" id="myLargeModalLabel">User Process</h4>
                </div>
                <div class="modal-body">
                
                    <form name="addUserFrm" id="addUserFrm" >
	                	<div class="col-md-6">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.FirstName")%></label>
		                      <input type="text"  id="firstName" class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter(this);"  name="firstName" />
		                    </div>
		                </div>
	   					<div class="col-md-6">
		                    <div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.LastName") %></label>
		                     <input type="text"  id="lastName"  class="form-control" data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justLatter(this);" name="lastName" />
		                    </div>
	                  	</div>
	                  	<div class="col-md-6">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.UserName")%></label>
		                     <input type="text"  id="userName" class="form-control"    data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justENChar(this);"  name="userName" />
		                    </div>
		                 </div>
		                 <div class="col-md-6">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Password")%></label>
		                     <input type="text"  id="password" class="form-control"    data-validation-engine="validate[required]" onkeyup="this.value=this.value.toUpperCase();justENChar(this);"  name="password" />
		                    </div>
		                 </div>
		                 
		                 <%--
		                 <div class="col-md-4">
	                    		<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.UserLocation")%></label>
		                     <select name="userType" id="userType"  data-validation-engine="validate[required]" class="form-control"  >
		                     	<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
			          			<option value="D"><%=Helper.getMessage(session, "Dcs.FlightList.Domestic") %></option>
		          				<option value="I"><%=Helper.getMessage(session, "Dcs.FlightList.International") %></option>
		          				<option value="A" selected="selected"><%=Helper.getMessage(session, "Dcs.Manifesto.RadioLaabel03") %></option>
			          		</select>
		                    </div>
		                 </div>
		                  --%>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "User Comment")%></label>
		                      <input type="text"  id="userComment" class="form-control"     name="userComment" onkeyup="this.value=this.value.toUpperCase();"/>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "User Type")%></label>
		                     <select name="userPossion" id="userPossion"  data-validation-engine="validate[required]" class="form-control"  >
		                     		<option value=""><%=Helper.getMessage(session, "Dcs.PassengerResultSearch.Select") %></option>
			          				<option value="PERSONEL">PERSONEL</option>
			          				<option value="SPV">SPV</option>
			          				<option value="DIRECTOR">DIRECTOR</option>
			          				<%if(users.getUserName().trim().equals("BKEBABCI")||users.getUserName().trim().equals("MED")||users.getUserName().trim().equals("MUSTAFAA")){ %>
			          					<option value="ADMIN" >**ADMIN</option>
			          				<%}%>
				          		</select>
		                    </div>
		                 </div>
		                 	<div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Email")%></label>
		                     <input type="text"  id="userEmailNew" class="form-control"     name="userEmailNew" onkeyup=""/>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Phone")%></label>
		                     <input type="text"  id="userPhoneNew" class="form-control"     name="userPhoneNew" onkeyup="this.value=this.value.toUpperCase();justNumber(this);"/>
		                    </div>
		                 </div>
		                 <%if(users.getUserPosition().equals("6") &&users.getCampanyId()==0){ %>
		                 <div class="col-md-4">
	                    		<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Station")%></label>
		                      <select name="arrval" class="select2 form-control"  data-validation-engine="validate[required]"  id="arrval">
		      					<%for(AirportData item:locateList) {%>
		      						<option value="<%=item.PORT_CODE%>" <%if(item.PORT_CODE.trim().equals("IST")){ %>selected="selected"<%} %>><%=item.PORT_CODE %></option>
		      					<%} %>
		      				</select>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    		<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.User.Company")%></label>
		                     <select name="userCompany" id="userCompany"  data-validation-engine="validate[required]" class="form-control"  >
		                     	<option value="0" >Atlas Global</option>
	           					<%for(CompanyData item:compList){%>
	           						<option value="<%=item.getCompanyId()%>" ><%=item.getCompanyName() %></option>
	           					<%} %>
			          		</select>
		                    </div>
		                 </div>
		                 <%} %>
		                 <div class="col-md-1 pull-right" >
		                 	<a class="btn btn-success" onclick="addUser();"> 
		                 		<i class="fa fa-check"></i> <%=Helper.getMessage(session ,"Dcs.Global.BtnADD") %>
		                 	</a>
		                 </div>
		             </form>     
		             <br style="clear: both;">
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
     <div id="upUser-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>                   
                    <h4 class="modal-title" id="myLargeModalLabel">User Process</h4>
                </div>
                <div class="modal-body" id="upUserbody">
                
                   
		             <br style="clear: both;">
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	<div id="userAuth-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" ><span class="label label-danger" id="userNameHead"></span></h4>
                </div>
                <div class="modal-body">
                 	<input type="hidden" id="usersList"> 
	                 <div class="col-md-12">
                    	<div class="form-group">
	                      <label>User Type</label>
	                      <select name="usersType" class="form-control" onchange="getPages()" data-validation-engine="validate[required]"  id="usersType">
	      						<option value="0" >Select</option>
           						<option value="2">PERSONEL</option>
           						<option value="4">SPV</option>
           						<option value="5">DIRECTOR</option>
	      				</select>
	                    </div>
	                 </div>
	                 <br style="clear: both;">
	                
	                 <div id="pageListContent"></div>
	                 <br style="clear: both;">
                </div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-success waves-effect text-left" onclick="saveUserPage();" >Save</button>
                   <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
               	</div>
            </div>
           
        </div>
    </div>
    
     <div id="userCheckinDetail-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title text-success" id="myLargeModalLabel"><%=Helper.getMessage(session,"Dcs.Admin.UserCheckinHistory") %></h4>
                </div>
                <div class="modal-body">
                	<form name="usercheckDetail" id="usercheckDetail">
                	<div class="col-md-4">
                    	<div class="form-group">
		                  <label><%=Helper.getMessage(session, "ExcessBaggage.include.excessBaggageSearchCriters.StartDate") %></label>
                          <div class="input-group">
		                    <input type="text" class="form-control" name="startDate" id="startDate" value="<%=Helper.getToDate() %>" placeholder="dd/mm/yyyy">
		                    <span class="input-group-addon"><i class="icon-calender"></i></span> 
		                   </div>
                        </div>
                    </div>
                    <div class="col-md-4">
		               <div class="form-group">
		                  <label><%=Helper.getMessage(session, "ExcessBaggage.include.excessBaggageSearchCriters.EndDate") %></label>
                          <div class="input-group">
		                    <input type="text" class="form-control" name="endDate" id="endDate" value="<%=Helper.getToDate() %>" placeholder="dd/mm/yyyy">
		                    <span class="input-group-addon"><i class="icon-calender"></i></span> 
		                   </div>
		                </div>
                     </div>
                    	
                		<div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.Manifesto.Departure") %></label>
		                      <select name="from" class="select2 form-control"  data-validation-engine="validate[required]"  >
		           					<option value="ALL">ALL</option>
	          					<%for(AirportData item:aiportList) {%>
		          					<option value="<%=item.PORT_CODE%>" ><%=item.PORT_NAME.trim() %><%="  (  "+item.PORT_CODE.trim()+" ) " %> </span></option>
	          					<%} %>
		      				</select>
		                    </div>
	                    </div>
	                    <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "Dcs.Manifesto.Destination") %></label>
		                      <select name="to" class="select2 form-control" data-validation-engine="validate[required]"  >
		           					<option value="ALL">ALL</option>
	          					<%for(AirportData item:aiportList) {%>
		          					<option value="<%=item.PORT_CODE%>" ><%=item.PORT_NAME.trim() %><%="  (  "+item.PORT_CODE.trim()+" ) " %> </span></option>
	          					<%} %>
		      				</select>
		                    </div>
	                    </div>
	                    <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "ExcessBaggage.include.excessBaggageSearchCriters.FlightNumber") %></label>
		                     <input type="text"  id="flightNum"  name="flightNum" class="form-control"    data-validation-engine="validate[required]"   onkeyup="this.value=this.value.toUpperCase();"/>
		                    </div>
		                 </div>
		                 <div class="col-md-4">
	                    	<div class="form-group">
		                      <label><%=Helper.getMessage(session, "ExcessBaggage.include.excessBaggageSearchCriters.IntDom") %></label>
		                      <select name="flightType" id="flightType" class="select2 form-control" data-validation-engine="validate[required]"  >
		           					<option alue="ALL">ALL</option>
               						<option value="DOM"><%=Helper.getMessage(session, "Dcs.FlightList.Domestic") %></option>
                  					<option value="INT"><%=Helper.getMessage(session, "Dcs.FlightList.International") %></option>
		      				</select>
		                    </div>
	                    </div>
	                    <div class="col-md-1 pull-right" >
		                 	<a class="btn btn-success" onclick="getUserCheckinDetail()"> 
		                 		<i class="fa fa-search"></i> <%=Helper.getMessage(session ,"Dcs.Global.BtnSearch") %>
		                 	</a>
		                 </div>
	                    <input type="hidden" name="selectedUser" id="selectedUser">
                	</form>
                	<br style="clear: both;">
                	<br style="clear: both;">
                    <div id="userCheckinDetailContent">
                    </div>
                    <br style="clear: both;">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <div id="userCheckin-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div id="userCheckinContent">
                    </div>
                </div>
                <br style="clear: both;">
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
        <div id="userAddExcell-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                   	<div id="fileuploader">Upload</div>
                   	<div id="addUserResult" ></div>
                </div>
                <br style="clear: both;">
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="flightCheckin-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div id="flightCheckinContent">
                    </div>
                </div>
                <br style="clear: both;">
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <div id="stationAlertMsg-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                	<h3 class="text-success"> Add alert message to station users</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body" id="alertMsgContent">
                    
                </div>
                <div class="modal-body" id="alertMsgListContent">
                </div>
                <br style="clear: both;">
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <div id="userAlertMsg-modal" class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                 <div class="modal-body" id="userAlertMsgContent">
                
                   
                </div>
                
                <div class="modal-body" id="userAlertMsgListContent">
                	
                
                   
		             <br style="clear: both;">
                </div>
                <br style="clear: both;">
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    