<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightOutputData"%>
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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

<html>
	<head>
		<title>LOAD SHEET</title>
		<style>
			.inputRedBorderError{border: 2px solid #F64444; border-radius: 4px; background-color: #C7C5C5;}
			.inputRedBorderError{border: 2px solid #F64444; border-radius: 4px; background-color: #C7C5C5;}
			.inputRedBorder{border: 2px solid #black; border-radius: 4px;}
			.inputRedBorder12{border: 2px solid #black; border-radius: 4px;font-size:12px;}
			.inputRedBorderDisable{border: 2px solid #black; border-radius: 4px; background-color: #F0EDEC;}
			.tableHeader16{font-family: "Tahoma";font-size: 16px;font-weight:bold;}
			.tableHeader12{font-family: "Tahoma";font-size: 12px;font-weight:bold;}
			.tableHeader10{font-family: "Tahoma";font-size: 10px;font-weight:bold;}
			.tableText{font-family: "Tahoma";font-size: 10px;}
		</style>
		<script>
			function envelope(){
				document.flightResultForm.action="loadSheetEnvelope.jsp";
				document.flightResultForm.method="Post";
				document.flightResultForm.target="_blank";
				document.flightResultForm.submit();
			}
		</script>
	</head>
	
	<body>
	<center>
	<form name="flightResultForm">
		<table cellpadding="0" cellspacing="2" border="0">
			<tr>
				<td width="250" bgcolor="#6CC4F1">
					<table cellpadding="0" cellspacing="2" width="250" border="1">
						<tr>
							<td width="200" align="left" class="tableHeader12">Dry Operating Index (DOI)</td>
							<td width="50" align="left"><input type="text" name="doi" value="<%=loadSheetOutput.getDoi_value()%>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Dry Operating Weight (DOW)</td>
							<td align="left"><input type="text" name="dow" value="<%=loadSheetOutput.getDow_value()%>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="2" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Take Off Fuel Weight</td>
							<td align="left"><input type="text" name="tofw" value="<%=loadSheetOutput.getTofw_value()%>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Operating Weight</td>
							<td align="left"><input type="text" name="opeWeight" value="<%=loadSheetOutput.getOpewei() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Passenger Weight</td>
							<td align="left"><input type="text" name="paxWeight" value="<%=loadSheetOutput.getPaxweight_value() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Hold Weight</td>
							<td align="left"><input type="text" name="holdWeight" value="<%=loadSheetOutput.getHoldsvalue() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Zero Fuel Weight</td>
							<td align="left"><input type="text" name="opeWeight" value="<%=loadSheetOutput.getZerofuelwei()%>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
						</tr>
					</table>
				</td>
				<td width="250" bgcolor="#6CC4F1" valign="top">
					<table cellpadding="0" cellspacing="2" width="250" border="1">
						<tr>
							<td width="250" align="left" class="tableHeader12" bgcolor="white" colspan="2">S T A B&nbsp;&nbsp;&nbsp;T R I M</td>
						</tr>
						<tr>
							<td width="100" align="left" class="tableHeader12">STAB TO </td>
							<td width="100" align="left"><input type="text" name="flap26K" id="flap26KID" value="<%=loadSheetOutput.getStabtrim() %>" readonly="readonly" class="inputRedBorderDisable" style="width:100px;" tabindex="1" /></td>
						</tr>
						<!--tr>
							<td align="left" class="tableHeader12">24 K 1-5 Flap</td>
							<td align="left"><input type="text" name="flap24K" value="" readonly="readonly" class="inputRedBorderDisable" style="width:100px;" tabindex="2" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">22 K 1-5 Flap</td>
							<td align="left"><input type="text" name="flap22K" value="" readonly="readonly" class="inputRedBorderDisable" style="width:100px;" tabindex="3" /></td>
						</tr -->
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td width="250" bgcolor="#6CC4F1">
					<table cellpadding="0" cellspacing="2" width="250" border="1">
						<tr>
							<td width="250" align="left" class="tableHeader12" bgcolor="white" colspan="2">T R A F F I C&nbsp;&nbsp;&nbsp;L O A D</td>
						</tr>
						<tr>
							<td width="200" align="left" class="tableHeader12">Total Traffic Load</td>
							<td width="50" align="left"><input type="text" name="totalTraffic" value="<%= loadSheetOutput.getTotaltrfload() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Allowed Traffic Load</td>
							<td align="left"><input type="text" name="allowedTraffic" value="<%=loadSheetOutput.getAllowedtrfload() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="2" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Underload Before LMC</td>
							<td align="left"><input type="text" name="ulbLMC" value="<%=loadSheetOutput.getUnderloadlmc() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
						</tr>
					</table>
				</td>
				<td width="250" bgcolor="#6CC4F1" valign="top">
					<table cellpadding="0" cellspacing="2" width="250" border="1">
						<tr>
							<td width="250" align="left" class="tableHeader12" bgcolor="white" colspan="3">L I M I T S (WEIGHT)</td>
						</tr>
						<tr>
							<td width="50" align="left" class="tableHeader10">&nbsp;</td>
							<td width="50" align="left" class="tableHeader10">actual</td>
							<td width="50" align="left" class="tableHeader10">maximum</td>
							<!--td width="50" align="left" class="tableHeader10">limit</td -->
						</tr>
						<tr>
							<td width="50" align="left" class="tableHeader12">Zero Fuel</td>
							<td width="50" align="left"><input type="text" name="zeroFuelWeightActual" value="<%=loadSheetOutput.getLimitzfactual() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
							<td width="50" align="left"><input type="text" name="zeroFuelWeightMax" value="<%=loadSheetOutput.getLimitzfmax() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Take Off</td>
							<td align="left"><input type="text" name="takeOffWeight" value="<%=loadSheetOutput.getLimittoactual()%>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="2" /></td>
							<td align="left"><input type="text" name="takeOffWeightMax" value="<%=loadSheetOutput.getLimittomax() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Landing</td>
							<td align="left"><input type="text" name="landingWeight" value="<%=loadSheetOutput.getLimitlactual() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="3" /></td>
							<td align="left"><input type="text" name="landingWeightMax" value="<%=loadSheetOutput.getLimitlmax() %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td width="500" bgcolor="#6CC4F1" colspan="2">
					<table cellpadding="0" cellspacing="2" width="500" border="1">
						<tr>
							<td width="500" align="left" class="tableHeader12" bgcolor="white" colspan="5">B A L A N C E&nbsp;&nbsp;&nbsp;C O N D I T I O N S</td>
						</tr>
						<tr>
							<td width="140" align="left" class="tableHeader10">&nbsp;</td>
							<td width="90" align="left" class="tableHeader10">forwards</td>
							<td width="90" align="left" class="tableHeader10">actual</td>
							<td width="90" align="left" class="tableHeader10">aft</td>
							<td width="90" align="left" class="tableHeader10">MAC</td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Zero Fuel Weight</td>
							<td align="left"><input type="text" name="zeroFuelWeightForwards" value="<%=loadSheetOutput.getBalancezfforward() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="zeroFuelWeightActual" value="<%=loadSheetOutput.getBalancezfactual()%>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="zeroFuelWeightAft" value="<%=loadSheetOutput.getBalancezfaft()%>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="zeroFuelWeightMAC" value="<%=loadSheetOutput.getBalancezfmac()%>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Take Off Weight</td>
							<td align="left"><input type="text" name="takeOffWeightForwards" value="<%=loadSheetOutput.getBalancetoforward() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="2" /></td>
							<td align="left"><input type="text" name="takeOffWeightActual" value="<%=loadSheetOutput.getBalancetoactual() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="takeOffWeightAft" value="<%=loadSheetOutput.getBalancetoaft() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="takeOffWeightMAC" value="<%=loadSheetOutput.getBalancetomac() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12">Landing Weight</td>
							<td align="left"><input type="text" name="landingWeightForwards" value="<%=loadSheetOutput.getBalancelforward() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="3" /></td>
							<td align="left"><input type="text" name="landingWeightActual" value="<%=loadSheetOutput.getBalancelactual() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="landingWeightAft" value="<%=loadSheetOutput.getBalancelaft()%>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="landingWeightMAC" value="<%=loadSheetOutput.getBalancelmac() %>" readonly="readonly" class="inputRedBorderDisable" style="width:80px;" tabindex="1" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td><input type="Button" value="ENVELOPE >>" onclick="envelope();" /></td>
						</tr>
					
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td><div id="errorMessagesID"></div></td>
						</tr>
					
					</table>
				</td>
			</tr>

		</table>
		<input type="hidden" name="loadSheetID" value="<%=loadSheetOutput.getLoadSheetID()%>">
	</form>
	</center>
	</body>

<%
}
%>

</html>