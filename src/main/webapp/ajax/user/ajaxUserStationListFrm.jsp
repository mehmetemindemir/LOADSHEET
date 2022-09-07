<%@page import="adsdcs.bean.data.UserData"%>
<%@page import="adsdcs.util.ProjectConstants"%>
<%@page import="adsdcs.bean.data.user.UserInfoData"%>
<%@page import="adsdcs.process.userProcess.UserProcess"%>
<%@page import="adsdcs.bean.data.airport.AirportData"%>
<%@page import="java.util.List"%>
<%@page import="adsdcs.util.staticData.AirportList"%>
<%@page import="adsdcs.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData users = (UserData) session.getAttribute(ProjectConstants.SESSION_USER);
	AirportList airportPro=new AirportList();
	List<AirportData> locateList=airportPro.getAirportListMainScreen();
	String userName	=Helper.request2String(request, "userName");
	String userId	=Helper.request2String(request, "userId");
	String userType	=Helper.request2String(request, "userType");
	int		companyId=Helper.request2int(request, "companyId");
	UserProcess prd=new UserProcess();
	List<UserInfoData> data=prd.getUserDataList(userName, null,"ALL",companyId);
	for(UserInfoData item:data){
%>
	<h4 class="modal-title" ><span class="label label-danger" id=""><%=item.FIRST_NAME %> <%=item.LAST_NAME %> / <%=item.USER_NAME %></span></h4>
	 <br style="clear: both;">
     <form name="userStationListForm" id="userStationListForm" >
           <div class="col-md-10">
            	<div class="form-group">
               <label><%=Helper.getMessage(session, "Dcs.User.Station")%></label>
               <select name="userStation" class="select2 form-control"  data-validation-engine="validate[required]"  id="userStationSelect">
               		<option value="ALLC"><%=Helper.getMessage(session, "Dcs.Manifesto.RadioLaabel03") %></option>
				<%for(AirportData item2:locateList) {%>
					<option  <%=Helper.optionSelect(item.USER_LOCATION,item2.PORT_CODE) %> value="<%=item2.PORT_CODE%>"> <%=item2.PORT_NAME +"( "+ item2.PORT_CODE +" )" %></option>
				<%} %>
			</select>
             </div>
          </div>
          <div class="col-md-2 pull-right m-t-20" >
          	<a class="btn btn-success" onclick="addStationToUser(<%=item.USER_ID%>)"> 
          		<i class="fa fa-plus"></i> <%=Helper.getMessage(session ,"Dcs.Global.BtnADD") %>
          	</a>
          </div>
          <input type="hidden" name="userId" value="<%=item.USER_ID%>" > 
          <input type="hidden" name="userType" value="<%=userType%>" >
      </form>     
    <br style="clear: both;">
    <div id="userStationListContent">
    
    </div>
    
 <%}
 }else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
 %>