<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.AjaxResponse"%>
<%@page import="com.loadsheet.process.carrier.CarrierProcess"%>
<%@page import="com.loadsheet.bean.data.carrier.HandlingCarrierData"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3 class="text-success">Airline List</h3>
<% 
if(Helper.checkAjaxRequest(request)){
	UserData 			users 		= (UserData) session.getAttribute(Constants.SESSION_USER);
	int 					i			= 0;
	List<HandlingCarrierData> 	carrierList = new ArrayList<HandlingCarrierData>();
	CarrierProcess 		prd			= new CarrierProcess();
	int					companyId	=0;
	if(users.getUserPosition().trim().equals("6")){
		companyId=Helper.request2int(request, "companyId");
	}else{
		companyId=users.getCampanyId();
	}
	String				carrierId	="0";

	AjaxResponse rs=prd.getCompanyCarrierList(companyId, carrierId);
	if(rs.getStatus().equals("OK")){
		carrierList =(List<HandlingCarrierData>)rs.getData();
	if (carrierList.size()>0){
%>
		<div>            
		<table cellpadding="0" cellspacing="0" width="100%" style="font-weight: bolder;" id="companyListTable" class="display dataTable" >
		 <colgroup>
			<col width="2%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="17%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
		</colgroup> 
		<thead>
			<tr>
				<th >No</th>
				<th ><%=Helper.getMessage(session, "Company Name") %></th>
				<th ><%=Helper.getMessage(session, "Airline Name") %></th>
				<th ><%=Helper.getMessage(session, "Address1") %></th>
				<th ><%=Helper.getMessage(session, "Address2") %></th>
				<th ><%=Helper.getMessage(session, "Zip Code") %></th>
				<th ><%=Helper.getMessage(session, "City Name") %></th>
				<th ><%=Helper.getMessage(session, "Country Code") %></th>
				<th ><%=Helper.getMessage(session, "Update") %></th>
				<th ><%=Helper.getMessage(session, "Delete") %></th>
				<%-- <th ><%=Helper.getMessage(session, "Cabin Class") %></th>
				<th ><%=Helper.getMessage(session, "Bagage Allowance ") %></th> --%>
			</tr>
		</thead>
		<tbody>
			<%
			for(HandlingCarrierData item : carrierList){
				i++;	
			%>
			<tr>
					<td><%=i %></td>
					<td><%=item.getCompanyName()%></td>
					<td><%=item.getAirlineName()+"( "+item.getCarrierCode()+" )" %></td>
					<td><%=item.getBillingCode() %></td>
					<td><%=item.getBillingCode2() %></td>
					<td><%=item.getZipCode() %></td>
					<td><%=item.getCityName() %></td>
					<td><%=item.getCountryCode() %></td>
					<td>
						<button  class="btn-xs btn-info btn-circle" onclick="javascript:getCarrierFormForUp('<%=item.getCarrierId() %>','<%=item.getAirlineName() %>','<%=companyId %>');" data-toggle="tooltip" data-original-title=""> 
							<i class="fa fa-refresh "></i> 
						</button>
		             </td>
					<td>
						<button class="btn btn-danger btn-circle" data-href="javascript:deleteCarrier('<%=item.getCompanyId() %>','<%=item.getCarrierId() %>');" data-toggle="modal" data-target="#confirm-passive" >
					        <i data-toggle="tooltip" data-original-title="<%=Helper.getMessage(session, "Dcs.User.Delete") %>" class="fa fa-trash-o"></i> 
					    </button>
		             </td>
		             <%-- <td>
						<button  class="btn-xs btn-info btn-circle" onclick="javascript:getCarrierCabinClasForm('<%=item.getCarrierId() %>','<%=item.getAirlineName() %>');" data-toggle="tooltip" data-original-title=""> 
							<i class="fa fa-plus "></i> 
						</button>
		             </td>
		             <td>
						<button  class="btn-xs btn-warning btn-circle" onclick="javascript:getCabinBagWeightAllowanceForm('<%=item.getCarrierId() %>','<%=item.getAirlineName() %>');" data-toggle="tooltip" data-original-title=""> 
							<i class="fa fa-plus "></i> 
						</button>
		             </td> --%>
			</tr>
			<%}%>
			</tbody>
		</table>  
	</div>


	<%}else{ %>
		<div style="width: auto;color: red;text-align: center;">Bu kriterlerde kayıt yok</div>
	<%} %>
	<%}else{ %>
		<div style="width: auto;color: red;text-align: center;">System has Error</div>
	<%} %>
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>