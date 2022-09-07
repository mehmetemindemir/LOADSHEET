package com.loadsheet.struts.action.login;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.loadsheet.bean.data.user.PageData;
import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.process.user.AuthProcess;
import com.loadsheet.util.Constants;
import com.loadsheet.util.Helper;


public class LoginAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String forwardStr = Constants.FAILURE;
		String loginStatus = null;
		
		
		String userSessionId=Helper.getCurrentDateTimeMS() +System.nanoTime();
		String userIpAddress=Helper.getServerIPAddress();
		int checkSesion=1;//Default 1 For Check Session
		checkSesion=Helper.request2int(request, "checkUserSession");
		String userName=Helper.request2String(request, "username");
		String userPass=Helper.request2String(request, "password");
		String airline=Helper.request2String(request, "airline");
		int userHaveSession=0;
		System.out.println("Session ID :"+userSessionId+"  user ip:"+userIpAddress);
		if(request.getParameter("username")==null) return mapping.findForward(forwardStr);
		String sqlString = "begin wghtandblnc.USER_PROCESS_PKG.dcs_login(upper('"+userName.toUpperCase()+"'), '"+Helper.generateMD5(userPass.toUpperCase())+"','"+userIpAddress+"','"+userSessionId+"',"+checkSesion+",'"+Helper.getLanguage(request)+"',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
		System.out.println(sqlString);
		Connection conn = ConnectionPool.getConnection();
		try{
			UserData userInformation = new UserData();
			CallableStatement loginStmt = (CallableStatement) conn.prepareCall(sqlString);
			loginStmt.registerOutParameter(1, Types.VARCHAR);
			loginStmt.registerOutParameter(2, Types.VARCHAR);
			loginStmt.registerOutParameter(3, Types.VARCHAR);
			loginStmt.registerOutParameter(4, Types.VARCHAR);
			loginStmt.registerOutParameter(5, Types.VARCHAR);
			loginStmt.registerOutParameter(6, Types.VARCHAR);
			loginStmt.registerOutParameter(7, Types.VARCHAR);
			loginStmt.registerOutParameter(8, Types.VARCHAR);
			loginStmt.registerOutParameter(9, Types.VARCHAR);
			loginStmt.registerOutParameter(10, Types.VARCHAR);
			loginStmt.registerOutParameter(11, Types.VARCHAR);
			loginStmt.registerOutParameter(12, Types.NUMERIC);
			loginStmt.registerOutParameter(13, Types.VARCHAR);
			loginStmt.registerOutParameter(14, Types.VARCHAR);
			loginStmt.registerOutParameter(15, Types.NUMERIC);
			loginStmt.registerOutParameter(16, Types.NUMERIC);
			loginStmt.registerOutParameter(17, Types.NUMERIC);
			loginStmt.registerOutParameter(18, Types.NUMERIC);
			loginStmt.execute();
			loginStatus	= loginStmt.getString(1);
			System.out.println("loginStatus :"+ loginStatus);
			if(loginStatus.equals("OK")) {
				userHaveSession	= loginStmt.getInt(15);
				if(userHaveSession==0) {			
					loginStatus	= loginStmt.getString(1);
					userInformation.setUserName(loginStmt.getString(2));
					userInformation.setUserFirstName(  loginStmt.getString(3));
					userInformation.setUserLastName(loginStmt.getString(4));
					userInformation.setUserPosition( loginStmt.getString(5));
					userInformation.setUserLocation( loginStmt.getString(6));
					userInformation.setUserIntDom( loginStmt.getString(7));
					userInformation.setUserCheckinSystem( loginStmt.getString(8));
					userInformation.setUserAgencyCode( loginStmt.getString(9));		
					userInformation.setUserId(loginStmt.getInt(12));				
					userInformation.setUserEmail( loginStmt.getString(13));
					userInformation.setUserPhone(loginStmt.getString(14));
					userInformation.setAlertCount(loginStmt.getInt(16));
					userInformation.setCampanyId(loginStmt.getInt(18));
					userInformation.setTimeFrame(loginStmt.getInt(17));			
					
					loginStmt.close();
					userInformation.setUserAirline( airline);					
						
						AuthProcess authP=new AuthProcess();
						List<PageData> userAuth=authP.getSubPagesList("-1",userInformation.getUserId(),1,Integer.parseInt( userInformation.getUserPosition()));
						request.getSession().setAttribute(Constants.USER_NAME_AUTH, userAuth);
						request.getSession().setAttribute(Constants.USER_SESSION_ID, userSessionId);
						request.getSession().setAttribute(Constants.SESSION_USER, userInformation);				
						request.getSession().setAttribute(Constants.SESSION_RESA_LOG_PATH, request.getParameter("logPath"));
						request.getSession().setAttribute(Constants.SESSION_RESA_LOG_FOLDER, "c:/temp/");
						
						if(userInformation.getAlertCount()>0) {
							System.out.println("alertCount: "+userInformation.getAlertCount());
							request.setAttribute(Constants.USER_LOGIN, userInformation.getAlertCount());
						}
					
					System.out.println("loginStatus : "+loginStatus);		
					
					String firstLang = "en";
					String secondLang = "US";
					request.getSession().setAttribute("bundle",ResourceBundle.getBundle("LOADSHEET",new Locale(firstLang, secondLang)));
					forwardStr = Constants.SUCCESS;
				}else {
					userInformation.setUserName( userName);
					userInformation.setUserPassword(userPass);
					userInformation.setUserId(1);
					userInformation.setUserAirline(airline);
					request.setAttribute(Constants.USER_HAVE_SESSION, userInformation);
					
				}
			}else {
				request.setAttribute(Constants.USER_LOGIN_ERROR, "LOGINERROR");				
			}
			

		}catch(Exception e){
			Helper.errorLogger(LoginAction.class, e);
			forwardStr = Constants.FAILURE;
			e.printStackTrace();
		}
		finally{
			ConnectionPool.closeConnection(conn);
		}
		System.out.println("	forwardStr :"+forwardStr);
		return mapping.findForward(forwardStr);
		
		
	}

}
