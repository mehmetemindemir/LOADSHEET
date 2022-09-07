<%@page import="com.loadsheet.util.Constants"%>
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
<%=mzfwData+"_"+mtowData+"_"+loadSheetOutput.getBalancezfactual()+"_"+loadSheetOutput.getLimitzfactual()+"_"+ loadSheetOutput.getBalancetoactual()+"_"+loadSheetOutput.getLimittoactual()+"_"+loadSheetOutput.getBalancelactual()+"_"+loadSheetOutput.getLimitlactual()%>

<%}%>