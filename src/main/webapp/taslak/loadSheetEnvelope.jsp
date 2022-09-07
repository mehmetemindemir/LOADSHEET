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

	<script language="javascript" type="text/javascript" src="css_js/jquery.js"></script>
	<script language="javascript" type="text/javascript" src="css_js/jquery.flot.js"></script>
	<script language="javascript" type="text/javascript" src="css_js/jquery.flot.symbol.js"></script>
	<script type="text/javascript">

	$(function() {

		var data = [{
			color:"#2E8B57",
			label : "MZFW",
			data : [<%=mzfwData%>],
			lines: { show: true, fill:true },
			points: { show: false }

			},
			{
			color:"#87CEEB",
			label : "MTOW",
			data : [<%=mtowData%>],
			lines: { show: true, fill:true },
			points: { show: false }
			},
			{
			color:"black",
			label : "ZFW",
			data : [[<%=loadSheetOutput.getBalancezfactual()%>,<%=loadSheetOutput.getLimitzfactual()%>]],
			lines: { show: true},
			points: { show: true, symbol:"cross" }
			},
			{
			color:"red",
			label : "TOW",
			data : [[<%=loadSheetOutput.getBalancetoactual()%>,<%=loadSheetOutput.getLimittoactual()%>]],
			lines: { show: true},
			points: { show: true, symbol:"cross" }
			},
			{
			color:"yellow",
			label : "LW",
			data : [[<%=loadSheetOutput.getBalancelactual()%>,<%=loadSheetOutput.getLimitlactual()%>]],
			lines: { show: true},
			points: { show: true, symbol:"cross" }
			
			},
			
		]
		var plot = $.plot("#placeholder", data, {
			grid: {
				hoverable: true,
				clickable: true
			},
			xaxis: {
				min : 10,
				max : 100
			},
			yaxis: {
				min: 45000,
				max : 90000
			}

		});

		$("<div id='tooltip'></div>").css({
			position: "absolute",
			display: "none",
			"background-color": "white",
			opacity: 0.80
		}).appendTo("body");

		$("#placeholder").bind("plothover", function (event, pos, item) {
			
			if (item) {
				var x = item.datapoint[0].toFixed(2),
					y = item.datapoint[1].toFixed(2);

				$("#tooltip").html(item.series.label + " : " + x + " , " + y)
					.css({top: item.pageY+5, left: item.pageX+5})
					.fadeIn(200);
			} else {
				$("#tooltip").hide();
			}
			
		});// Append it to the placeholder that Flot already uses for positioning
		
	});

	</script>
</head>
<body>

	<div id="header">
		<h2>VOR LOAD SHEET</h2>
	</div>

	<div id="content">

		<div class="demo-container" style="width:1000px; height:600px">
			<div id="placeholder" class="demo-placeholder"></div>
		</div>
		
		

	</div>


</body>
</html>
<%}%>