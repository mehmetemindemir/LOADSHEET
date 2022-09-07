<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@page import="com.loadsheet.bean.data.flight.LoadSheetFlightData"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
String voyageCode = "20181114BGWISTKK1281";
LoadSheetFlightData lfd = new LoadSheetFlightData();
GetLoadSheetFlightDetail glsfd = new GetLoadSheetFlightDetail();
lfd = glsfd.getFlightDetail(voyageCode,0);

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
			.maxLimitInfo{font-family: "Tahoma";font-size: 9px;color:#5279a6;text-decoration: underline;}
		</style>
		<script type="text/javascript">
			function startCalculation(){
				
				var maxTakeOffFuel = 20000;
				var maxHold1 = <%=lfd.maxHold1%>;
				var maxHold2 = <%=lfd.maxHold2%>;
				var maxHold3 = <%=lfd.maxHold3%>;
				var maxHold4 = <%=lfd.maxHold4%>;
				var maxHold5 = <%=lfd.maxHold5%>;
				
				
				var zoneALimit = <%=lfd.zoneALimit%>;
				var zoneBLimit = <%=lfd.zoneBLimit%>;
				var zoneCLimit = <%=lfd.zoneCLimit%>;
				var zoneDLimit = <%=lfd.zoneDLimit%>;
				
				var zoneTotal = parseInt(document.flightInfoForm.Pax0AMale.value)+parseInt(document.flightInfoForm.Pax0AFemale.value)+parseInt(document.flightInfoForm.Pax0AChild.value)+parseInt(document.flightInfoForm.Pax0BMale.value)+parseInt(document.flightInfoForm.Pax0BFemale.value)+parseInt(document.flightInfoForm.Pax0BChild.value)+parseInt(document.flightInfoForm.Pax0CMale.value)+parseInt(document.flightInfoForm.Pax0CFemale.value)+parseInt(document.flightInfoForm.Pax0CChild.value);
				var genderTotal = parseInt(document.flightInfoForm.firstHoldMale.value) + parseInt(document.flightInfoForm.firstHoldFemale.value) + parseInt(document.flightInfoForm.firstHoldChd.value); 
				var paxTypeTotal = parseInt(document.flightInfoForm.firstHoldAdt.value) + parseInt(document.flightInfoForm.firstHoldChd.value); 
				
				var isError = 0;
				
				document.getElementById("Pax0AMaleID").className = "inputRedBorder";
				document.getElementById("Pax0AFemaleID").className = "inputRedBorder";
				document.getElementById("Pax0AChildID").className = "inputRedBorder";
				document.getElementById("Pax0AInfID").className = "inputRedBorder";
				document.getElementById("Pax0BMaleID").className = "inputRedBorder";
				document.getElementById("Pax0BFemaleID").className = "inputRedBorder";
				document.getElementById("Pax0BChildID").className = "inputRedBorder";
				document.getElementById("Pax0BInfID").className = "inputRedBorder";
				document.getElementById("Pax0CMaleID").className = "inputRedBorder";
				document.getElementById("Pax0CFemaleID").className = "inputRedBorder";
				document.getElementById("Pax0CChildID").className = "inputRedBorder";
				document.getElementById("Pax0CInfID").className = "inputRedBorder";
				document.getElementById("firstHoldMaleID").className = "inputRedBorderDisable";
				document.getElementById("firstHoldFemaleID").className = "inputRedBorderDisable";
				document.getElementById("firstHoldAdtID").className = "inputRedBorderDisable";
				document.getElementById("firstHoldChdID").className = "inputRedBorderDisable";
				document.getElementById("firstHoldInfID").className = "inputRedBorderDisable";
				document.getElementById("hold1ID").className = "inputRedBorderDisable"; 
				document.getElementById("hold2ID").className = "inputRedBorderDisable"; 
				document.getElementById("hold3ID").className = "inputRedBorderDisable"; 
				document.getElementById("hold4ID").className = "inputRedBorderDisable"; 
				document.getElementById("hold5ID").className = "inputRedBorderDisable"; 
				document.getElementById("takeOffFuelID").className = "inputRedBorder";
				document.getElementById("tripFuelID").className = "inputRedBorder";
				document.getElementById("cockpitID").className = "inputRedBorder";
				document.getElementById("cabinCrewID").className = "inputRedBorder";
				document.getElementById("preparedByID").className = "inputRedBorder";
				document.getElementById("checkedByID").className = "inputRedBorder";
				document.getElementById("approvedByID").className = "inputRedBorder";
				document.getElementById("errorMessagesID").style = "";
				document.getElementById("errorMessagesID").innerHTML = ""; 

				if((parseInt(document.flightInfoForm.Pax0AMale.value)+parseInt(document.flightInfoForm.Pax0AFemale.value)+parseInt(document.flightInfoForm.Pax0AChild.value))>zoneALimit){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Pax number limit exceeded in Zone A";
					document.getElementById("Pax0AMaleID").className = "inputRedBorderError"; 
					document.getElementById("Pax0AFemaleID").className = "inputRedBorderError"; 
					document.getElementById("Pax0AChildID").className = "inputRedBorderError"; 
					document.getElementById("Pax0AInfID").className = "inputRedBorderError"; 
					isError = 1;
				}else if((parseInt(document.flightInfoForm.Pax0BMale.value)+parseInt(document.flightInfoForm.Pax0BFemale.value)+parseInt(document.flightInfoForm.Pax0BChild.value))>zoneBLimit){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Pax number limit exceeded in Zone B";
					document.getElementById("Pax0BMaleID").className = "inputRedBorderError";
					document.getElementById("Pax0BFemaleID").className = "inputRedBorderError";
					document.getElementById("Pax0BChildID").className = "inputRedBorderError";
					document.getElementById("Pax0BInfID").className = "inputRedBorderError";
					isError = 1; 
				}else if((parseInt(document.flightInfoForm.Pax0CMale.value)+parseInt(document.flightInfoForm.Pax0CFemale.value)+parseInt(document.flightInfoForm.Pax0CChild.value))>zoneCLimit){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Pax number limit exceeded in Zone C";
					document.getElementById("Pax0CMaleID").className = "inputRedBorderError";
					document.getElementById("Pax0CFemaleID").className = "inputRedBorderError";
					document.getElementById("Pax0CChildID").className = "inputRedBorderError";
					document.getElementById("Pax0CInfID").className = "inputRedBorderError";
					isError = 1; 
				}else if(zoneTotal != genderTotal || zoneTotal!=paxTypeTotal || genderTotal != paxTypeTotal){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Pax number mismatch"; 
					document.getElementById("Pax0AMaleID").className = "inputRedBorderError";
					document.getElementById("Pax0AFemaleID").className = "inputRedBorderError";
					document.getElementById("Pax0AChildID").className = "inputRedBorderError";
					document.getElementById("Pax0AInfID").className = "inputRedBorderError";
					document.getElementById("Pax0BMaleID").className = "inputRedBorderError";
					document.getElementById("Pax0BFemaleID").className = "inputRedBorderError";
					document.getElementById("Pax0BChildID").className = "inputRedBorderError";
					document.getElementById("Pax0BInfID").className = "inputRedBorderError";
					document.getElementById("Pax0CMaleID").className = "inputRedBorderError";
					document.getElementById("Pax0CFemaleID").className = "inputRedBorderError";
					document.getElementById("Pax0CChildID").className = "inputRedBorderError";
					document.getElementById("Pax0CInfID").className = "inputRedBorderError";
					document.getElementById("firstHoldMaleID").className = "inputRedBorderError";
					document.getElementById("firstHoldFemaleID").className = "inputRedBorderError";
					document.getElementById("firstHoldAdtID").className = "inputRedBorderError";
					document.getElementById("firstHoldChdID").className = "inputRedBorderError";
					document.getElementById("firstHoldInfID").className = "inputRedBorderError";
					isError = 1;
				}else{
					document.getElementById("Pax0AMaleID").className = "inputRedBorder";
					document.getElementById("Pax0AFemaleID").className = "inputRedBorder";
					document.getElementById("Pax0AChildID").className = "inputRedBorder";
					document.getElementById("Pax0AInfID").className = "inputRedBorder";
					document.getElementById("Pax0BMaleID").className = "inputRedBorder";
					document.getElementById("Pax0BFemaleID").className = "inputRedBorder";
					document.getElementById("Pax0BChildID").className = "inputRedBorder";
					document.getElementById("Pax0BInfID").className = "inputRedBorder";
					document.getElementById("Pax0CMaleID").className = "inputRedBorder";
					document.getElementById("Pax0CFemaleID").className = "inputRedBorder";
					document.getElementById("Pax0CChildID").className = "inputRedBorder";
					document.getElementById("Pax0CInfID").className = "inputRedBorder";
					document.getElementById("firstHoldMaleID").className = "inputRedBorderDisable";
					document.getElementById("firstHoldFemaleID").className = "inputRedBorderDisable";
					document.getElementById("firstHoldAdtID").className = "inputRedBorderDisable";
					document.getElementById("firstHoldChdID").className = "inputRedBorderDisable";
					document.getElementById("firstHoldInfID").className = "inputRedBorderDisable";
					document.getElementById("errorMessagesID").style = "";
					document.getElementById("errorMessagesID").innerHTML = ""; 
				}
				
				var hold1Total = parseInt(document.getElementById("firstLegHoldTR1ID").value) + parseInt(document.getElementById("firstLegHoldB1ID").value) + parseInt(document.getElementById("firstLegHoldC1ID").value) + parseInt(document.getElementById("firstLegHoldM1ID").value);
				document.getElementById("firstLegHoldTotal1ID").value = hold1Total;
				document.getElementById("hold1ID").value = hold1Total;
				if(hold1Total>maxHold1){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "HOLD1 Overloaded";
					document.getElementById("hold1ID").className = "inputRedBorderError"; 
					isError = 1;
				}

				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldTR2ID").value) + parseInt(document.getElementById("firstLegHoldB2ID").value) + parseInt(document.getElementById("firstLegHoldC2ID").value) + parseInt(document.getElementById("firstLegHoldM2ID").value);
				document.getElementById("firstLegHoldTotal2ID").value = hold1Total;
				document.getElementById("hold2ID").value = hold1Total;
				if(hold1Total>maxHold2){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "HOLD2 Overloaded";
					document.getElementById("hold2ID").className = "inputRedBorderError"; 
					isError = 1;
				}

				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldTR3ID").value) + parseInt(document.getElementById("firstLegHoldB3ID").value) + parseInt(document.getElementById("firstLegHoldC3ID").value) + parseInt(document.getElementById("firstLegHoldM3ID").value);
				document.getElementById("firstLegHoldTotal3ID").value = hold1Total;
				document.getElementById("hold3ID").value = hold1Total;
				if(hold1Total>maxHold3){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "HOLD3 Overloaded";
					document.getElementById("hold3ID").className = "inputRedBorderError";
					isError = 1; 
				}

				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldTR4ID").value) + parseInt(document.getElementById("firstLegHoldB4ID").value) + parseInt(document.getElementById("firstLegHoldC4ID").value) + parseInt(document.getElementById("firstLegHoldM4ID").value);
				document.getElementById("firstLegHoldTotal4ID").value = hold1Total;
				document.getElementById("hold4ID").value = hold1Total;
				if(hold1Total>maxHold4){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "HOLD4 Overloaded";
					document.getElementById("hold4ID").className = "inputRedBorderError";
					isError = 1; 
				}

				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldTR5ID").value) + parseInt(document.getElementById("firstLegHoldB5ID").value) + parseInt(document.getElementById("firstLegHoldC5ID").value) + parseInt(document.getElementById("firstLegHoldM5ID").value);
				document.getElementById("firstLegHoldTotal5ID").value = hold1Total;
				document.getElementById("hold5ID").value = hold1Total;
				if(hold1Total>maxHold5){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "HOLD5 Overloaded";
					document.getElementById("hold5ID").className = "inputRedBorderError";
					isError = 1; 
				}
				
				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldTR1ID").value) + parseInt(document.getElementById("firstLegHoldTR2ID").value) + parseInt(document.getElementById("firstLegHoldTR3ID").value) + parseInt(document.getElementById("firstLegHoldTR4ID").value) + parseInt(document.getElementById("firstLegHoldTR5ID").value);
				document.getElementById("firstLegHoldTRTotalID").value = hold1Total;
				
				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldB1ID").value) + parseInt(document.getElementById("firstLegHoldB2ID").value) + parseInt(document.getElementById("firstLegHoldB3ID").value) + parseInt(document.getElementById("firstLegHoldB4ID").value) + parseInt(document.getElementById("firstLegHoldB5ID").value);
				document.getElementById("firstLegHoldBTotalID").value = hold1Total;
				
				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldC1ID").value) + parseInt(document.getElementById("firstLegHoldC2ID").value) + parseInt(document.getElementById("firstLegHoldC3ID").value) + parseInt(document.getElementById("firstLegHoldC4ID").value) + parseInt(document.getElementById("firstLegHoldC5ID").value);
				document.getElementById("firstLegHoldCTotalID").value = hold1Total;
				
				hold1Total = 0;
				hold1Total = parseInt(document.getElementById("firstLegHoldM1ID").value) + parseInt(document.getElementById("firstLegHoldM2ID").value) + parseInt(document.getElementById("firstLegHoldM3ID").value) + parseInt(document.getElementById("firstLegHoldM4ID").value) + parseInt(document.getElementById("firstLegHoldM5ID").value);
				document.getElementById("firstLegHoldMTotalID").value = hold1Total;
				
				
				hold1Total = parseInt(document.getElementById("firstLegHoldTRTotalID").value) + parseInt(document.getElementById("firstLegHoldBTotalID").value) + parseInt(document.getElementById("firstLegHoldCTotalID").value) + parseInt(document.getElementById("firstLegHoldMTotalID").value);
				document.getElementById("firstLegHoldTotalTotalID").value = hold1Total;
				
				if(isNaN(document.getElementById("cockpitID").value) ||parseInt(document.getElementById("cockpitID").value)<=0){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Cockpit could not be zero";
					document.getElementById("cockpitID").className = "inputRedBorderError";
					isError = 1; 
				}
				if(isNaN(document.getElementById("cabinCrewID").value) ||parseInt(document.getElementById("cabinCrewID").value)<=0){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Cabin Crew should not be empty";
					document.getElementById("cabinCrewID").className = "inputRedBorderError";
					isError = 1; 
				}

				
				if(isNaN(document.getElementById("takeOffFuelID").value) ||parseInt(document.getElementById("takeOffFuelID").value)<=0){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Define Take Off Fuel";
					document.getElementById("takeOffFuelID").className = "inputRedBorderError";
					isError = 1; 
				}
				if(maxTakeOffFuel<parseInt(document.getElementById("takeOffFuelID").value)){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Max Take Off Fuel limit exceeded";
					document.getElementById("takeOffFuelID").className = "inputRedBorderError";
					isError = 1; 
				}
				if(isNaN(document.getElementById("tripFuelID").value) || parseInt(document.getElementById("takeOffFuelID").value)<=0){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Define Take Off Fuel";
					document.getElementById("takeOffFuelID").className = "inputRedBorderError"; 
					document.getElementById("tripFuelID").className = "inputRedBorderError";
					isError = 1; 
				}

				if(parseInt(document.getElementById("tripFuelID").value)>parseInt(document.getElementById("takeOffFuelID").value)){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Trim Fuel must be less than Take Off Fuel";
					document.getElementById("takeOffFuelID").className = "inputRedBorderError"; 
					document.getElementById("tripFuelID").className = "inputRedBorderError";
					isError = 1; 
				}
				
				if(document.getElementById("preparedByID").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Prepared By could not be empty";
					document.getElementById("preparedByID").className = "inputRedBorderError"; 
					isError = 1; 
				}
				if(document.getElementById("checkedByID").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Checked By could not be empty";
					document.getElementById("checkedByID").className = "inputRedBorderError"; 
					isError = 1; 
				}
				if(document.getElementById("approvedByID").value.replace(/^\s+/, "").replace(/\s+$/, "") == ""){
					document.getElementById("errorMessagesID").style = "font-family: 'Tahoma';font-size: 16px;font-weight:bold;color:red";
					document.getElementById("errorMessagesID").innerHTML = "Approved By could not be empty";
					document.getElementById("approvedByID").className = "inputRedBorderError"; 
					isError = 1; 
				}
				
				if(isError==0){
					document.flightInfoForm.action="loadSheetResult.jsp";
					document.flightInfoForm.method="Post";
					document.flightInfoForm.target="resultSide";
					document.flightInfoForm.submit();
				}
				
				
				

			}
		</script>
	</head>
	
	<body>
	<center>
	<form name="flightInfoForm">
		<table cellpadding="0" cellspacing="2" border="0">
			<tr>
				<td width="500" bgcolor="#6CC4F1">
					<table cellpadding="1" cellspacing="2" width="400" border="0">
						<tr>
							<td width="75" align="left" class="tableHeader12">FROM</td>
							<td width="75" align="left" class="tableHeader12">TO</td>
							<td width="100" align="left" class="tableHeader12">FLIGHT NO</td>
							<td width="150" align="left" class="tableHeader12">A / C REG.</td>
						</tr>
						<tr>
							<td align="left"><input type="text" name="from" value="<%=lfd.originCode %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="1" /></td>
							<td align="left"><input type="text" name="to" value="<%=lfd.destinationCode %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="2"/></td>
							<td align="left"><input type="text" name="flightNumber" value="<%=lfd.flightNumber %>" readonly="readonly" class="inputRedBorderDisable" style="width:100px;" tabindex="3"/></td>
							<td align="left"><input type="text" name="aircraft" value="<%=lfd.aircraft %>" readonly="readonly" class="inputRedBorderDisable" style="width:200px;" tabindex="4"/></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12" colspan="2">COCKPIT</td>
							<td>
								<select class="inputRedBorder" name="cockpit" tabindex="5" id="cockpitID">
									<%for(int i=0;i<5;i++){%>
										<option value="<%=i%>"><%=i%></option>
									<%} %>
								</select>
							</td>
							<td valign="top" align="right" rowspan="6">
								<table cellpadding="0" cellspacing="0" width="200" border="1">
									<tr>
										<td width="145" bgcolor="white">
											<table cellpadding="0" cellspacing="0" width="100%">
												<tr>
													<td class="tableHeader12" width="30">&nbsp;</td>
													<td align="center" class="tableHeader12" width="35">M</td>
													<td align="center" class="tableHeader12" width="35">F</td>
													<td align="center" class="tableHeader12" width="35">CHD</td>
													<td align="center" class="tableHeader12" width="35">INF</td>
												</tr>

												<tr>
													<td class="tableHeader12" width="50">0A <font class="maxLimitInfo">(<%=lfd.zoneALimit%>)</font></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0AMale" value="<%=lfd.zoneAMale %>" class="inputRedBorder" style="width:25px;" tabindex="11" id="Pax0AMaleID" /></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0AFemale" value="<%=lfd.zoneAFemale %>" class="inputRedBorder" style="width:25px;" tabindex="11" id="Pax0AFemaleID" /></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0AChild" value="<%=lfd.zoneAChild %>" class="inputRedBorder" style="width:25px;" tabindex="11" id="Pax0AChildID" /></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0AInf" value="<%=lfd.zoneAInf %>" class="inputRedBorder" style="width:25px;" tabindex="11" id="Pax0AInfID" /></td>
												</tr>
												<tr>
													<td class="tableHeader12">0B <font class="maxLimitInfo">(<%=lfd.zoneBLimit%>)</font></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0BMale" value="<%=lfd.zoneBMale %>" class="inputRedBorder" style="width:25px;" tabindex="12"  id="Pax0BMaleID"/></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0BFemale" value="<%=lfd.zoneBFemale %>" class="inputRedBorder" style="width:25px;" tabindex="12"  id="Pax0BFemaleID"/></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0BChild" value="<%=lfd.zoneBChild %>" class="inputRedBorder" style="width:25px;" tabindex="12"  id="Pax0BChildID"/></td>
													<td align="left">&nbsp;&nbsp;<input type="text" name="Pax0BInf" value="<%=lfd.zoneBInf %>" class="inputRedBorder" style="width:25px;" tabindex="12"  id="Pax0BInfID"/></td>
												</tr>
												<tr>
													<td class="tableHeader12">0C <font class="maxLimitInfo">(<%=lfd.zoneCLimit%>)</font></td>
													<td align="left" >&nbsp;&nbsp;<input type="text" name="Pax0CMale" value="<%=lfd.zoneCMale %>" class="inputRedBorder" style="width:25px;" tabindex="13"  id="Pax0CMaleID"/></td>
													<td align="left" >&nbsp;&nbsp;<input type="text" name="Pax0CFemale" value="<%=lfd.zoneCFemale %>" class="inputRedBorder" style="width:25px;" tabindex="13"  id="Pax0CFemaleID"/></td>
													<td align="left" >&nbsp;&nbsp;<input type="text" name="Pax0CChild" value="<%=lfd.zoneCChild %>" class="inputRedBorder" style="width:25px;" tabindex="13"  id="Pax0CChildID"/></td>
													<td align="left" >&nbsp;&nbsp;<input type="text" name="Pax0CInf" value="<%=lfd.zoneCInf %>" class="inputRedBorder" style="width:25px;" tabindex="13"  id="Pax0CInfID"/></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width="145" bgcolor="white">
											<table cellpadding="0" cellspacing="0" width="100%">
												<tr>
													<td class="tableHeader10" width="30">&nbsp;&nbsp;Hold 1</td>
													<td align="left" width="50">&nbsp;&nbsp;<input type="text" name="hold1" id="hold1ID" value="0" readonly="readonly" class="inputRedBorderDisable" style="width:35px;" tabindex="14"/></td>
													<td class="maxLimitInfo" width="65">&nbsp;Max <%=lfd.maxHold1%> Kg</td>
												</tr>
												<tr>
													<td class="tableHeader10" width="30">&nbsp;&nbsp;Hold 2</td>
													<td align="left" width="50">&nbsp;&nbsp;<input type="text" name="hold2" id="hold2ID" value="0" readonly="readonly" class="inputRedBorderDisable" style="width:35px;" tabindex="15"/></td>
													<td class="maxLimitInfo" width="65">&nbsp;Max <%=lfd.maxHold2%> Kg</td>
												</tr>
												<tr>
													<td class="tableHeader10" width="30">&nbsp;&nbsp;Hold 3</td>
													<td align="left" width="50">&nbsp;&nbsp;<input type="text" name="hold3" id="hold3ID" value="0" readonly="readonly" class="inputRedBorderDisable" style="width:35px;" tabindex="16"/></td>
													<td class="maxLimitInfo" width="65">&nbsp;Max <%=lfd.maxHold3%> Kg</td>
												</tr>
												<tr>
													<td class="tableHeader10" width="30">&nbsp;&nbsp;Hold 4</td>
													<td align="left" width="50">&nbsp;&nbsp;<input type="text" name="hold4" id="hold4ID" value="0" readonly="readonly" class="inputRedBorderDisable" style="width:35px;" tabindex="17"/></td>
													<td class="maxLimitInfo" width="65">&nbsp;Max <%=lfd.maxHold4%> Kg</td>
												</tr>
												<tr>
													<td class="tableHeader10" width="30">&nbsp;&nbsp;Hold 5</td>
													<td align="left" width="50">&nbsp;&nbsp;<input type="text" name="hold5" id="hold5ID" value="0" readonly="readonly" class="inputRedBorderDisable" style="width:35px;" tabindex="17"/></td>
													<td class="maxLimitInfo" width="65">&nbsp;Max <%=lfd.maxHold5%> Kg</td>
												</tr>
											</table>
										</td>
									</tr>
								
								</table>
							</td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12" colspan="2">CABIN</td>
							<td>
								<select class="inputRedBorder" name="cabinCrew" tabindex="6" id="cabinCrewID">
									<%for(int i=0;i<10;i++){%>
										<option value="<%=i%>"><%=i%></option>
									<%} %>
								</select>
							</td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12" colspan="2">PANTRY</td>
							<td>
								<select class="inputRedBorder" name="pantry" tabindex="7">
										<option value="ONEWAYINT">ONE WAY INT</option>
										<option value="TWOWAYINT">TWO WAY INT</option>
										<option value="ONEWAYDOM">ONE WAY DOM</option>
										<option value="TWOWAYDOM">TWO WAY DOM</option>
										<option value="FERRY">FERRY</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12" colspan="2">PAX WEIGHT</td>
							<td>
								<select class="inputRedBorder" name="paxWeight" tabindex="8">
									<option value="holidayCharter">Holiday Charter</option>
									<option value="standartFlight" selected="selected">Standart M:88 Kg,F:70 Kg</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12" colspan="2">Take Off Fuel</td>
							<td><input type="text" name="takeOffFuel" id="takeOffFuelID" value="0" class="inputRedBorder" style="width:100px;" tabindex="9" /></td>
						</tr>
						<tr>
							<td align="left" class="tableHeader12" colspan="2">Trip Fuel</td>
							<td><input type="text" name="tripFuel" id="tripFuelID" value="0" class="inputRedBorder" style="width:100px;" tabindex="10" /></td>
						</tr>
					</table>
				</td>
				<td width="520" bgcolor="#C7C5C5" align="center" valign="top" rowspan="5">
					<iframe src="loadSheetResult.jsp" style="height:500px;width:520px; border:none;" name="resultSide"></iframe>
				</td>
			</tr>
			<tr>
				<td><hr/></td>
			</tr>
			<!-- First Leg -->
			<tr>
				<td bgcolor="#6CC4F1">
					<table cellpadding="1" cellspacing="2" border="0" width="500">
						<tr>
							<td width="100" class="tableHeader16" align="left" colspan="2">FIRST LEG</td>
							<td width="500" class="tableHeader12" align="center">&nbsp;H O L D S&nbsp;</td>
						</tr>
						
						<tr>
							<td width="50" class="tableHeader12">&nbsp;TO&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldTo" value="AYT" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="18"/></td>
							<td width="400" rowspan="8" valign="top" align="right">
								<table cellpadding="0" cellspacing="0" width="300" border="1">
									<tr>
										<td width="400" bgcolor="white">
											<table cellpadding="0" cellspacing="0" width="300">
												<tr>
													<td align="left" class="tableHeader12" width="15%">&nbsp;</td>
													<td align="left" class="tableHeader12" width="17%" align="center">1</td>
													<td align="left" class="tableHeader12" width="17%" align="center">2</td>
													<td align="left" class="tableHeader12" width="17%" align="center">3</td>
													<td align="left" class="tableHeader12" width="17%" align="center">4</td>
													<td align="left" class="tableHeader12" width="17%" align="center">5</td>
													<td align="left" class="tableHeader12" width="17%" align="center">TOTAL</td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">TR</td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTR1" id="firstLegHoldTR1ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="26"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTR2" id="firstLegHoldTR2ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="27"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTR3" id="firstLegHoldTR3ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="28"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTR4" id="firstLegHoldTR4ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="29"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTR5" id="firstLegHoldTR5ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="29"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTRTotal" id="firstLegHoldTRTotalID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="30"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">B</td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldB1" id="firstLegHoldB1ID" value="<%=lfd.totalPaxLggWeight %>" class="inputRedBorder12" style="width:40px;" tabindex="31"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldB2" id="firstLegHoldB2ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="32"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldB3" id="firstLegHoldB3ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="33"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldB4" id="firstLegHoldB4ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="34"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldB5" id="firstLegHoldB5ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="34"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldBTotal" id="firstLegHoldBTotalID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="35"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">C</td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldC1" id="firstLegHoldC1ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="36"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldC2" id="firstLegHoldC2ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="37"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldC3" id="firstLegHoldC3ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="37"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldC4" id="firstLegHoldC4ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="39"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldC5" id="firstLegHoldC5ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="39"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldCTotal" id="firstLegHoldCTotalID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="40"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">M</td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldM1" id="firstLegHoldM1ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="41"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldM2" id="firstLegHoldM2ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="42"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldM3" id="firstLegHoldM3ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="43"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldM4" id="firstLegHoldM4ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="44"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldM5" id="firstLegHoldM5ID" value="0" class="inputRedBorder12" style="width:40px;" tabindex="44"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldMTotal" id="firstLegHoldMTotalID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="45"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">TOTAL</td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTotal1" id="firstLegHoldTotal1ID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="46"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTotal2" id="firstLegHoldTotal2ID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="47"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTotal3" id="firstLegHoldTotal3ID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="48"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTotal4" id="firstLegHoldTotal4ID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="49"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTotal5" id="firstLegHoldTotal5ID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="49"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="firstLegHoldTotalTotal" id="firstLegHoldTotalTotalID" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="50"/></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							
							</td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;MALE&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldMale" id="firstHoldMaleID" value="<%=lfd.firstLegMale %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="19"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;FEMALE&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldFemale" id="firstHoldFemaleID" value="<%=lfd.firstLegFeMale %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="20"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;ADT&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldAdt" id="firstHoldAdtID" value="<%=lfd.firstLegADT %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="21"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;CHD&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldChd" id="firstHoldChdID" value="<%=lfd.firstLegCHD %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="22"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;INF&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldInf" id="firstHoldInfID" value="<%=lfd.firstLegINF %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="23"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;PAX&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldPax" id="firstHoldPaxID" value="<%=(lfd.firstLegADT + lfd.firstLegCHD)+"+"+lfd.firstLegINF%>" class="inputRedBorder12" style="width:50px;" tabindex="24"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;PAD&nbsp;</td>
							<td width="50"><input type="text" name="firstHoldPad" value="<%=lfd.firstLegPAD %>" class="inputRedBorder" style="width:50px;" tabindex="25"/></td>
						</tr>
					
					</table>
				</td>
			</tr>
			<!-- First Leg -->
			<%if(lfd.isSecondLeg>0){%>
			<tr>
				<td><hr/></td>
			</tr>
			<!-- Second Leg -->
			<tr>
				<td bgcolor="#F0EDEC">
					<table cellpadding="1" cellspacing="2" border="0" width="500">
						<tr>
							<td width="100" class="tableHeader16" align="left" colspan="2">SECOND LEG</td>
							<td width="500" class="tableHeader12" align="center">&nbsp;H O L D S&nbsp;</td>
						</tr>
						
						<tr>
							<td width="50" class="tableHeader12">&nbsp;TO&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldTo" value="<%=lfd.secondLegTo %>" readonly="readonly" class="inputRedBorder" style="width:50px;" tabindex="51"/></td>
							<td width="400" rowspan="8" valign="top" align="right">
								<table cellpadding="0" cellspacing="0" width="300" border="1">
									<tr>
										<td width="400" bgcolor="white">
											<table cellpadding="0" cellspacing="0" width="300">
												<tr>
													<td align="left" class="tableHeader12" width="15%">&nbsp;</td>
													<td align="left" class="tableHeader12" width="17%" align="center">1</td>
													<td align="left" class="tableHeader12" width="17%" align="center">2</td>
													<td align="left" class="tableHeader12" width="17%" align="center">3</td>
													<td align="left" class="tableHeader12" width="17%" align="center">4</td>
													<td align="left" class="tableHeader12" width="17%" align="center">5</td>
													<td align="left" class="tableHeader12" width="17%" align="center">TOTAL</td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">TR</td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTR1" value="0" class="inputRedBorder12" style="width:40px;" tabindex="59"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTR2" value="0" class="inputRedBorder12" style="width:40px;" tabindex="60"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTR3" value="0" class="inputRedBorder12" style="width:40px;" tabindex="61"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTR4" value="0" class="inputRedBorder12" style="width:40px;" tabindex="62"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTR5" value="0" class="inputRedBorder12" style="width:40px;" tabindex="62"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTRTotal" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="63"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">B</td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldB1" value="0" class="inputRedBorder12" style="width:40px;" tabindex="64"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldB2" value="0" class="inputRedBorder12" style="width:40px;" tabindex="65"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldB3" value="0" class="inputRedBorder12" style="width:40px;" tabindex="66"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldB4" value="0" class="inputRedBorder12" style="width:40px;" tabindex="67"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldB5" value="0" class="inputRedBorder12" style="width:40px;" tabindex="67"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldBTotal" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="68"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">C</td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldC1" value="0" class="inputRedBorder12" style="width:40px;" tabindex="69"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldC2" value="0" class="inputRedBorder12" style="width:40px;" tabindex="70"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldC3" value="0" class="inputRedBorder12" style="width:40px;" tabindex="71"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldC4" value="0" class="inputRedBorder12" style="width:40px;" tabindex="72"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldC5" value="0" class="inputRedBorder12" style="width:40px;" tabindex="72"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldCTotal" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="73"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">M</td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldM1" value="0" class="inputRedBorder12" style="width:40px;" tabindex="74"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldM2" value="0" class="inputRedBorder12" style="width:40px;" tabindex="75"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldM3" value="0" class="inputRedBorder12" style="width:40px;" tabindex="76"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldM4" value="0" class="inputRedBorder12" style="width:40px;" tabindex="77"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldM5" value="0" class="inputRedBorder12" style="width:40px;" tabindex="77"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldMTotal" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="78"/></td>
												</tr>
												<tr>
													<td align="left" class="tableHeader12" align="center">TOTAL</td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTotal1" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="79"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTotal2" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="80"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTotal3" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="81"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTotal4" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="82"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTotal5" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="82"/></td>
													<td align="left" class="tableHeader12"><input type="text" name="secondLegHoldTotalTotal" value="0" class="inputRedBorderDisable" style="width:40px;" tabindex="83"/></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							
							</td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;MALE&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldMale" value="<%=lfd.secondLegMale %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="52"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;FEMALE&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldFemale" value="<%=lfd.secondLegFeMale %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="53"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;ADT&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldAdt" value="<%=lfd.secondLegADT %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="54"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;CHD&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldChd" value="<%=lfd.secondLegCHD %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="55"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;INF&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldInf" value="<%=lfd.secondLegINF %>" readonly="readonly" class="inputRedBorderDisable" style="width:50px;" tabindex="56"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;PAX&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldPax" value="<%=(lfd.secondLegADT + lfd.secondLegCHD)+"+"+lfd.secondLegINF%>" class="inputRedBorder12" style="width:50px;" tabindex="57"/></td>
						</tr>
						<tr>
							<td width="50" class="tableHeader12">&nbsp;PAD&nbsp;</td>
							<td width="50"><input type="text" name="secondHoldPad" value="<%=lfd.secondLegPAD %>" class="inputRedBorder" style="width:50px;" tabindex="58"/></td>
						</tr>
					
					</table>
				</td>
			</tr>
			<!-- Second Leg -->
			<%} %>
			<tr>
				<td><hr/></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="tableHeader12">Prepared By</td>
							<td class="tableHeader12">&nbsp;:&nbsp;</td>
							<td><input type="text" name="preparedBy" id="preparedByID" value="Burak KEBABCI" class="inputRedBorder" style="width:170px;" tabindex=""/></td>
						</tr>
						<tr>
							<td class="tableHeader12">Checked By</td>
							<td class="tableHeader12">&nbsp;:&nbsp;</td>
							<td><input type="text" name="checkedBy" id="checkedByID" value="Barış KALENDERLİ" class="inputRedBorder" style="width:170px;" tabindex=""/></td>
						</tr>
						<tr>
							<td class="tableHeader12">Approved By</td>
							<td class="tableHeader12">&nbsp;:&nbsp;</td>
							<td><input type="text" name="approvedBy" id="approvedByID" value="Çağatay TATAR" class="inputRedBorder" style="width:170px;" tabindex=""/></td>
						</tr>
					
					</table>
				</td>
			</tr>
			<tr>
				<td><hr/></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td><input type="Button" value="RUN >>" onclick="startCalculation();" /></td>
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
		<input type="hidden" name="voyageCode" value="<%=voyageCode%>"/>
	</form>
	</center>
	</body>


</html>