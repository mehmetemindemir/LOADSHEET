<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.process.user.UserProcess"%>
<%@page import="com.loadsheet.bean.data.user.UserInfoData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	UserData 	users 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	UserInfoData user=new UserInfoData();
		user.FIRST_NAME		=Helper.removeForbiddenChar(Helper.request2String(request, "firstName"));
		user.LAST_NAME		=Helper.removeForbiddenChar(Helper.request2String(request, "lastName"));
		user.USER_POSITION	=Helper.request2String(request, "userPossion");
		user.INT_DOM			="A";
		user.USER_PASSWORD	=Helper.request2String(request, "password");
		user.USER_NAME		=Helper.removeForbiddenChar(Helper.request2String(request, "userName"));
		user.setUserEmail(Helper.request2String(request, "userEmailNew"));
		user.setUserPhone(Helper.request2String(request, "userPhoneNew"));
		user.setComment(Helper.request2String(request,"userComment"));
		user.setCreateBy(users.getUserName());
		if(users.getUserPosition().equals("6") && users.getCampanyId()==0){
			user.USER_LOCATION	=Helper.request2String(request, "arrval");
			user.setCompanyId(Helper.request2int(request, "userCompany"));
		}else{
			user.USER_LOCATION	=users.getUserLocation();
			user.setCompanyId(users.getCampanyId());
		}
		user.setUserProjectCode(2);
		UserProcess prd=new UserProcess();
		String result="";
	if(!Helper.request2String(request, "userPossion").equals("ADMIN") ){
		result=prd.insertUserData(user);
		out.print(result);
	}else if(users.getUserName().trim().equals("BKEBABCI")||users.getUserName().trim().equals("MED")||users.getUserName().trim().equals("MUSTAFAA")){
		result=prd.insertUserData(user);
		out.print(result);
	}else{
		out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38"));
	}
	
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
	
%>