<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.bean.data.user.UserInfoData"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		= (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	UserInfoData user=new UserInfoData();
		user.FIRST_NAME		=Helper.removeForbiddenChar(Helper.request2String(request, "firstName"));
		user.LAST_NAME		=Helper.removeForbiddenChar(Helper.request2String(request, "lastName"));
		user.USER_POSITION	=Helper.request2String(request, "userPossionUp");
		user.INT_DOM			="A";
		user.USER_NAME		=Helper.removeForbiddenChar(Helper.request2String(request, "userName"));
		user.setUserEmail(Helper.request2String(request, "userEmailUp"));
		user.setUserPhone(Helper.request2String(request, "userPhoneUp"));
		user.setComment(Helper.request2String(request, "userComment"));
		user.setCreateBy(users.getUserName());
	if(users.getUserPosition().equals("6") && users.getCampanyId()==0){
		user.setCompanyId(Helper.request2int(request, "userCompany"));
		user.USER_LOCATION=Helper.request2String(request, "arrvalUp");
	}else{
		user.setCompanyId(users.getCampanyId());
		user.USER_LOCATION	=users.getUserLocation();
	}
		user.setUserProjectCode(2);
		
	UserProcess prd=new UserProcess();
	String result="";
	if(!Helper.request2String(request, "userPossion").equals("ADMIN") ){
		result=prd.updateUserData(user);
		out.print(result);
	}else if(users.getUserName().trim().equals("BKEBABCI")||users.getUserName().trim().equals("MED")||users.getUserName().trim().equals("MUSTAFAA")){
		result=prd.updateUserData(user);
		out.print(result);
	}else{
		out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38"));
	}
	
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>