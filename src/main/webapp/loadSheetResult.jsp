<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightOutputData"%>
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10" data-toggle="tooltip" title="Dry Operating Index"  data-placement="left"  data-original-title="Dry Operating Index" > (DOI)</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getDoi_value()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Dry Operating Weight (DOW)</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getDow_value()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Take Off Fuel Weight</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getTofw_value()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Operating Weight</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getOpewei()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Passenger Weight</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getPaxweight_value()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Hold Weight</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getHoldsvalue()%></button>
				</div>
			</div>
		</div>

		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Zero Fuel Weight</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getZerofuelwei()%></button>
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
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Total Traffic Load</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getTotaltrfload()%></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Allowed Traffic Load</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getAllowedtrfload() %></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-7" style="text-align: right;">
					<label class="p-t-10">Underload Before LMC</label>
				</div>
				<div class="col-sm-5" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getUnderloadlmc() %></button>
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
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getLimitzfactual() %></button>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getLimitzfmax() %></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Take Off</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getLimittoactual()%></button>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getLimittomax() %></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-4" style="text-align: right;">
					<label class="p-t-10">Landing</label>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getLimitlactual() %></button>
				</div>
				<div class="col-sm-4" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getLimitlmax() %></button>
				</div>
			</div>
		</div>
	</div>
</div>
<hr style="border: 1px solid #4393FB;" />
<div class="row">
	<div class="col-lg-12">
		<div class="col-sm-2" style="text-align: right;"></div>
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
				<div class="col-sm-2" style="text-align: right;">
					<label class="p-t-10">Zero Fuel Weight</label>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancezfforward() %></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancezfactual()%></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancezfaft()%></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancezfmac()%></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-2" style="text-align: right;">
					<label class="p-t-10">Take Off</label>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancetoforward() %></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancetoactual() %></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancetoaft() %></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancetomac() %></button>
				</div>
			</div>
		</div>
		<div class="row m-t-5 ">
			<div class="col-lg-12">
				<div class="col-sm-2" style="text-align: right;">
					<label class="p-t-10">Landing Weight</label>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancelforward() %></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancelactual() %></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancelaft()%></button>
				</div>
				<div class="col-sm-2" style="text-align: left;">
					<button type="button" class="btn waves-effect waves-light btn-info"><%=loadSheetOutput.getBalancelmac() %></button>
				</div>
			</div>
		</div>
	</div>
</div>
<br style="clear: both;">
<%}%>