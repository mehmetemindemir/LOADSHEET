<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightOutputData"%>
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int calculationError = 0;
	LoadSheetFlightOutputData loadSheetOutput = new LoadSheetFlightOutputData(); 
	GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
	if(request!=null && request.getParameter("voyageCode")!=null){
		loadSheetOutput = glsfd.calculateLoadSheet(request);
	}
	
	
	if(loadSheetOutput==null){
		out.println("NO LOAD SHEET OUTPUT");
	}else{
%>
<div class="row">
	<div class="col-lg-12">
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label class="p-t-10" data-toggle="tooltip" title="Dry Operating Index"  data-placement="left"  data-original-title="Dry Operating Index" > Dry Operating Index (DOI)</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getDoi_value()%></button>
				</div>
				
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
		
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Dry Operating Weight"  data-placement="left"  data-original-title="Dry Operating Weight"> Dry Operating Weight (DOW)</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getDow_value()%></button>
				</div>
			</div>
		</div>
		
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Take Off Fuel Weight"  data-placement="left"  data-original-title="Take Off Fuel Weight" >Take Off Fuel Weight</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getTofw_value()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Operating Weight"  data-placement="left"  data-original-title="Operating Weight" >Operating Weigh</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getOpewei()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Passenger Weight"  data-placement="left"  data-original-title="Passenger Weight" >Passenger Weigh</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getPaxweight_value()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Hold Weight"  data-placement="left"  data-original-title="Hold Weight">Hold Weight</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getHoldsvalue()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Zero Fuel Weight"  data-placement="left"  data-original-title="Zero Fuel Weight">Zero Fuel Weight</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getZerofuelwei()%></button>
				</div>
			</div>
		</div>

	</div>
</div>
<hr style="border: 1px solid #4393FB;" />
<div class="row">
	<div class="col-lg-12">
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Total Traffic Load"  data-placement="left"  data-original-title="Total Traffic Load">Total Traffic Load</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getTotaltrfload()%></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Allowed Traffic Load"  data-placement="left"  data-original-title="Allowed Traffic Load">Allowed Traffic Load</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getAllowedtrfload() %></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-8" style="text-align: right;">
					<label  class="p-t-10" data-toggle="tooltip" title="Under Load Before LMC"  data-placement="left"  data-original-title="Underload Before LMC"> Underload Before LMC</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<!--button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getUnderloadlmc() %></button -->
					<%if(loadSheetOutput.getUnderloadlmc()<0){%>
						<button type="button" class="btn waves-effect waves-light btn-danger"><%=loadSheetOutput.getUnderloadlmc() %></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getUnderloadlmc() %></button>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</div>
<hr style="border: 1px solid #4393FB;" />
<div class="row">
	<div class="col-lg-12">
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Zero Fuel</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<%if(loadSheetOutput.getLimitzfactual()>loadSheetOutput.getLimitzfmax()){calculationError = 1;%>
						<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getLimitzfactual() %></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getLimitzfactual() %></button>
					<%} %>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<%if(loadSheetOutput.getLimitzfactual()>loadSheetOutput.getLimitzfmax()){calculationError = 1;%>
						<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getLimitzfmax() %></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getLimitzfmax() %></button>
					<%} %>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Take Off</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<%if(loadSheetOutput.getLimittoactual()>loadSheetOutput.getLimittomax()){calculationError = 1;%>
						<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getLimittoactual()%></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getLimittoactual()%></button>
					<%} %>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<%if(loadSheetOutput.getLimittoactual()>loadSheetOutput.getLimittomax()){calculationError = 1;%>
						<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getLimittomax() %></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getLimittomax() %></button>
					<%} %>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Landing</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<%if(loadSheetOutput.getLimitlactual()>loadSheetOutput.getLimitlmax()){calculationError = 1;%>
						<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getLimitlactual() %></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getLimitlactual() %></button>
					<%} %>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<%if(loadSheetOutput.getLimitlactual()>loadSheetOutput.getLimitlmax()){calculationError = 1;%>
						<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getLimitlmax() %></button>
					<%}else{%>
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getLimitlmax() %></button>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</div>
<hr style="border: 1px solid #4393FB;" />
<div class="row">
	<div class="col-lg-12">
		<div class="col-sm-4" style="text-align: right;"></div>
			<div class="col-sm-2" style="text-align: left;">
				<label class="p-t-10">forwards</label>
			</div>
			<div class="col-sm-2" style="text-align: left;">
				<label class="p-t-10">actual</label>
			</div>
			<div class="col-sm-2" style="text-align: left;">
				<label class="p-t-10">Aft</label>
			</div>
			<div class="col-sm-2" style="text-align: left;">
				<label class="p-t-10">Mac</label>
			</div>
		
	</div>
	<div class="col-lg-12">
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Zero Fuel Weight</label>
				</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancezfactual()<loadSheetOutput.getBalancezfforward()){%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancezfforward() %></button>
						<%}else{%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancezfforward() %></button>
						<%}%>
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancezfactual()>loadSheetOutput.getBalancezfforward() && loadSheetOutput.getBalancezfactual()<loadSheetOutput.getBalancezfaft()){%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancezfactual()%></button>
						<%}else{calculationError = 1;%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancezfactual()%></button>
						<%} %>
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancezfactual()>loadSheetOutput.getBalancezfaft()){%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancezfaft()%></button>
						<%}else{%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancezfaft()%></button>
						<%} %>
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancezfmac()%></button>
					</div>
				
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Take Off</label>
				</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancetoactual()<loadSheetOutput.getBalancetoforward()){%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancetoforward() %></button>
						<%}else{%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancetoforward() %></button>
						<%} %>
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancetoactual()>loadSheetOutput.getBalancetoforward() && loadSheetOutput.getBalancetoactual() < loadSheetOutput.getBalancetoaft()){%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancetoactual() %></button>
						<%}else{calculationError = 1;%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancetoactual() %></button>
						<%} %>
						
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancetoactual()>loadSheetOutput.getBalancetoaft()){%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancetoaft() %></button>
						<%}else{%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancetoaft() %></button>
						<%} %>
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancetomac() %></button>
					</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Landing Weight</label>
				</div>
				
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancelactual()<loadSheetOutput.getBalancelforward()){%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancelforward() %></button>
						<%}else{%>
							<button type="button" class="btn waves-effect waves-light btn-info " style="width: 65px;" ><%=loadSheetOutput.getBalancelforward() %></button>
						<%} %>
						
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancelactual()>loadSheetOutput.getBalancelforward() && loadSheetOutput.getBalancelactual()<loadSheetOutput.getBalancelaft()){%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancelactual() %></button>
						<%}else{calculationError = 1;%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancelactual() %></button>
						<%} %>
						
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<%if(loadSheetOutput.getBalancelactual()>loadSheetOutput.getBalancelaft()){%>
							<button type="button" class="btn waves-effect waves-light btn-danger" style="width: 65px;" ><%=loadSheetOutput.getBalancelaft()%></button>
						<%}else{%>
							<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancelaft()%></button>
						<%} %>
						
					</div>
					<div class="col-sm-2" style="text-align: left;">
						<button type="button" class="btn waves-effect waves-light btn-info" style="width: 65px;" ><%=loadSheetOutput.getBalancelmac() %></button>
					</div>
			</div>
		</div>
	</div>
</div>
<br style="clear: both;">
<input type="hidden" name="loadSheetID" id="loadSheetID" value="<%=loadSheetOutput.getLoadSheetID()%>">
<%if(calculationError == 1){%>
	<!--  LOADSHEETCALCULATIONERROR -->
<%}else{%>
	<!--  LOADSHEETCALCULATIONSUCCESS -->
<%}%>
<%}%>