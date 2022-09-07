<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.bean.data.CSheet.LimitationOfLoadSheet"%>
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightOutputData"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
LoadSheetFlightOutputData loadSheetOutput = new LoadSheetFlightOutputData(); 
GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
if(request!=null && request.getParameter("loadSheetID")!=null){
loadSheetOutput = glsfd.getLoadSheet(request);
}


if(loadSheetOutput==null){
	out.println("NO LOAD SHEET OUTPUT");
}else{

StringBuffer mzfwData = new StringBuffer();
LimitationOfLoadSheet[] envelopeLimits = glsfd.getEnvelopeLimits(request.getParameter("loadSheetID"));
for(int i=0;i<envelopeLimits.length;i++){
	if(envelopeLimits[i].getLimitCode().equals("FZFW")){
		if(mzfwData!=null&&mzfwData.length()>0)mzfwData.append(",");  
		mzfwData.append("["+envelopeLimits[i].getLimitIndex()+","+envelopeLimits[i].getWeight()+"]");
	}
}
for(int i=envelopeLimits.length-1;i>=0;i--){
	if(envelopeLimits[i].getLimitCode().equals("AZFW")){
		if(mzfwData!=null)mzfwData.append(",");  
		mzfwData.append("["+envelopeLimits[i].getLimitIndex()+","+envelopeLimits[i].getWeight()+"]");
	}
}


StringBuffer mtowData = new StringBuffer();
for(int i=0;i<envelopeLimits.length;i++){
	if(envelopeLimits[i].getLimitCode().equals("FTOW")){
		if(mtowData!=null&&mtowData.length()>0)mtowData.append(",");  
		mtowData.append("["+envelopeLimits[i].getLimitIndex()+","+envelopeLimits[i].getWeight()+"]");
	}
}
for(int i=envelopeLimits.length-1;i>=0;i--){
	if(envelopeLimits[i].getLimitCode().equals("ATOW")){
		if(mtowData!=null)mtowData.append(",");  
		mtowData.append("["+envelopeLimits[i].getLimitIndex()+","+envelopeLimits[i].getWeight()+"]");
	}
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Flot Examples: Basic Usage</title>
	<link href="css_js/examples.css" rel="stylesheet" type="text/css">
	<style type="text/css">
			@media print {
			  #printPageButton {
			    display: none;
			  }
		}
	</style>
	<script language="javascript" type="text/javascript" src="css_js/jquery.js"></script>
	<script language="javascript" type="text/javascript" src="css_js/jquery.flot.js"></script>
	<script language="javascript" type="text/javascript" src="css_js/jquery.flot.symbol.js"></script>
</head>
<body>
<table cellpadding="2" cellspacing="2" border="0" width="700">
	<tr>
		<td width="700" align="center"><h2 style="">VORDCS LOAD SHEET</h2></td>
	</tr>
	<tr>
		<td align="left"><%=loadSheetOutput.getLoadSheetRevID()+" "+loadSheetOutput.getLoadSheetTime() +" "+loadSheetOutput.getLoadSheetDate() %></td>
	</tr>
	<tr>
		<td align="left"><%=loadSheetOutput.getAirlineName() %><br/>LOAD SHEET</td>
	</tr>
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td>From</td>
					<td>To</td>
					<td>Flight</td>
					<td>A/C Registration</td>
					<td>Version</td>
					<td>Crew</td>
					<td>Pantry</td>
					<td>Date</td>
					<td>Time</td>
				</tr>
				<tr>
					<td><%=loadSheetOutput.getOriginCode() %></td>
					<td><%=loadSheetOutput.getDestinationCode() %></td>
					<td><%=loadSheetOutput.getFlightNumber() %></td>
					<td><%=loadSheetOutput.getRegistration() %></td>
					<td><%=loadSheetOutput.getAircraftVersion() %></td>
					<td><%=loadSheetOutput.getCockpit()+"/"+loadSheetOutput.getCabin() %></td>
					<td><%=loadSheetOutput.getPantry() %></td>
					<td><%=loadSheetOutput.getLoadSheetDate() %></td>
					<td><%=loadSheetOutput.getLoadSheetTime() %></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="1" width="100%">
				<tr>
					<td width="45%">LOAD IN COMPARTMENTS</td>
					<td width="10%" align="right"><%=loadSheetOutput.getHoldsvalue() %>&nbsp;&nbsp;&nbsp;</td>
					<td width="35%"><%=loadSheetOutput.getHoldDistribution() %></td>
					<td width="15%">&nbsp;</td>
				</tr>
				<tr>
					<td rowspan="2">PASSENGER / CABIN BAG</td>
					<td align="right"><%=loadSheetOutput.getPaxweight_value() %>&nbsp;&nbsp;&nbsp;</td>
					<td><%=loadSheetOutput.getMaleTotal()+"/"+loadSheetOutput.getFemaleTotal()+"/"+loadSheetOutput.getChildTotal()+"/"+loadSheetOutput.getInfTotal() %><!-- M/F/C/I --></td>
					<td>TTL <%=loadSheetOutput.getMaleTotal()+loadSheetOutput.getFemaleTotal()+loadSheetOutput.getChildTotal()+loadSheetOutput.getInfTotal()%><br/>CAB 0</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<!--td>PAX <%=(loadSheetOutput.getMaleTotal()+loadSheetOutput.getFemaleTotal()+loadSheetOutput.getChildTotal()+"+"+loadSheetOutput.getInfTotal()) %><br/>CY <%=loadSheetOutput.getPaxBus()+"/"+loadSheetOutput.getPaxEco()%></td -->
					<td><%=loadSheetOutput.getPaxDistrubition()%></td -->
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>TOTAL TRAFFIC LOAD</td>
					<td align="right"><%=loadSheetOutput.getTotaltrfload() %>&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>DRY OPERATING</td>
					<td align="right"><%=loadSheetOutput.getDow_value() %>&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>ZERO FUEL WEIGHT ACTUAL</td>
					<td align="right"><%=loadSheetOutput.getZerofuelwei() %>&nbsp;&nbsp;&nbsp;</td>
					<td>MAX <%=loadSheetOutput.getLimitzfmax()%><%if(loadSheetOutput.getTrafficloadparam()!=null && loadSheetOutput.getTrafficloadparam().equals("ZFW")) out.print("L");%></td>
					<td>ADJ</td>
				</tr>
				<tr>
					<td>TAKE OFF FUEL</td>
					<td align="right"><%=loadSheetOutput.getTofw_value() %>&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>TAKE OFF WEIGHT ACTUAL</td>
					<td align="right"><%=loadSheetOutput.getLimittoactual() %>&nbsp;&nbsp;&nbsp;</td>
					<td>MAX <%=loadSheetOutput.getLimittomax() %><%if(loadSheetOutput.getTrafficloadparam()!=null && loadSheetOutput.getTrafficloadparam().equals("TOW")) out.print("L");%></td>
					<td>ADJ</td>
				</tr>
				<tr>
					<td>TRIP FUEL</td>
					<td align="right"><%=loadSheetOutput.getTripFuel() %>&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>LANDING WEIGHT ACTUAL</td>
					<td align="right"><%=loadSheetOutput.getLimitlactual() %>&nbsp;&nbsp;&nbsp;</td>
					<td>MAX <%=loadSheetOutput.getLimitlmax() %><%if(loadSheetOutput.getTrafficloadparam()!=null && loadSheetOutput.getTrafficloadparam().equals("LW")) out.print("L");%></td>
					<td>ADJ</td>
				</tr>
				<tr>
					<td colspan="4">BALANCE AND SEATING CONDITIONS</td>
				</tr>
				<tr>
					<td>DOI</td>
					<td align="right"><%=loadSheetOutput.getDoi_value() %>&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td bgcolor="yellow">LIZFW</td>
					<td align="right" bgcolor="yellow"><%=loadSheetOutput.getBalancezfactual() %>&nbsp;&nbsp;&nbsp;</td>
					<td>MACZFW</td>
					<td><%=loadSheetOutput.getBalancezfmac() %></td>
				</tr>
				<tr>
					<td>LITOW</td>
					<td align="right"><%=loadSheetOutput.getBalancetoactual() %>&nbsp;&nbsp;&nbsp;</td>
					<td>MACTOW</td>
					<td><%=loadSheetOutput.getBalancetomac() %></td>
				</tr>
				<tr>
					<td>LILAW</td>
					<td align="right"><%=loadSheetOutput.getBalancelactual() %>&nbsp;&nbsp;&nbsp;</td>
					<td>MACLAW</td>
					<td><%=loadSheetOutput.getBalancelmac() %></td>
				</tr>
				<tr>
					<td>STAB TO</td>
					<td align="left"><%if(loadSheetOutput.getStabtrim()<0){out.print("ND "+(-1 * loadSheetOutput.getStabtrim()));}else{out.print("NU "+loadSheetOutput.getStabtrim());} %></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">SEATING</td>
				</tr>
				<tr>
					<td colspan="4">OA:<%=loadSheetOutput.getZoneAPax() %>&nbsp;&nbsp;OB:&nbsp;<%=loadSheetOutput.getZoneBPax() %>&nbsp;&nbsp;OC:&nbsp;<%=loadSheetOutput.getZoneCPax() %><%if(loadSheetOutput.getZoneDPax()>0){%>&nbsp;&nbsp;OC:&nbsp;<%=loadSheetOutput.getZoneDPax() %><%} %></td>
				</tr>
				<tr>
					<td rowspan="5">UNDERLOAD BEFORE LMC</td>
					<td align="right" rowspan="5"><%=loadSheetOutput.getUnderloadlmc() %>&nbsp;&nbsp;&nbsp;</td>
					<td colspan="2">LMC TOTAL +-</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td rowspan="5">CAPTAIN NOTE</td>
					<td colspan="3">&nbsp;<%if(loadSheetOutput.getCaptainNote()!=null)out.print(loadSheetOutput.getCaptainNote()); %></td>
				</tr>

			</table>
		</td>
	</tr>

	<tr>
		<td><br/>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td>Prepared By</td>
					<td>Checked By</td>
					<td>Approved By</td>
				</tr>
				<tr>
					<td><%=loadSheetOutput.getPreparedBy() %></td>
					<td><%=loadSheetOutput.getCheckedBy() %></td>
					<td><%=loadSheetOutput.getApprovedBy() %></td>
				</tr>
			</table>
		</td>
	</tr>

</table>
<div style="width: 100px; margin: 10px auto 10px auto  ;"   ><button onclick="myprint()" id="printPageButton">Print</button></div>

<script language="JavaScript"> 
		
		function myprint() {
			window.print();
		}
		
	</script>
</body>
</html>
<%}%>