<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.process.flight.GetLoadSheetFlightDetail"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	System.out.println("getLoadSheetDowDoiValue.jsp sayfasi calisti");
	UserData users = (UserData)session.getAttribute(Constants.SESSION_USER);
	GetLoadSheetFlightDetail glfd = new GetLoadSheetFlightDetail();
	String[] dowDoiValues = glfd.getDowDoiValues(request.getParameter("aircraft"),Helper.string2int(request.getParameter("cockpit")),Helper.string2int(request.getParameter("cabinCrew")),request.getParameter("pantry"));
	if(dowDoiValues!=null){
		out.print("RESULT :"+dowDoiValues[0]+"-"+dowDoiValues[1]);
	}
%>
