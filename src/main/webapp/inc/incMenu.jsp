<%@page import="java.util.List"%>
<%@page import="com.loadsheet.bean.data.user.PageData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<ul class="nav" id="side-menu" style="font-size:18px; margin-top:11px;">

	<% for(PageData item:(List<PageData>)session.getAttribute(Constants.USER_NAME_AUTH)){
		if(!item.getPageSubId().equals("0"))
			continue;
		if(item.getIsSelect()>0){
		 
	%>
	<li> <a href="<%=item.getPageUrl() %>" class="waves-effect"><span class="hide-menu"> <%=Helper.getMessage(session, item.getPageTitle() ) %> <span class="fa arrow"></span> </span></a></li>
	<%}
		} %>
	<li> <a href="<%=Constants.PROJECT_PATH%>/logOut.do" class="waves-effect "> <span class="hide-menu"><%=Helper.getMessage(session, "Dcs.login.ButtonLogOut") %><span class="fa arrow"></span></span></a></li>
</ul>