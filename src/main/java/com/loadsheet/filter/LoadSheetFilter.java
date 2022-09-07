package com.loadsheet.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.loadsheet.bean.data.user.PageData;
import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.util.Constants;
import com.loadsheet.util.Helper;


public class LoadSheetFilter implements Filter {

	private String encoding=null;
	public void destroy() {
		this.encoding = null; 
	}
	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding = "UTF-8";
	}
	
	public boolean isAuthPage(String url,HttpSession session){
		boolean isAuthPage=false;
		try {
			List<PageData>  subPage=(List<PageData>)session.getAttribute(Constants.USER_NAME_AUTH);
			
			for (PageData item:subPage) {
				//System.out.println("subPage :"+item.getPageName());
				if(item.getPageName().indexOf(url)>-1){
					isAuthPage=true;					
					break;
				}
			}
		} catch (Exception e) {
			Helper.errorLogger(LoadSheetFilter.class, e);
		}
		
		return isAuthPage;
	}
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws ServletException, IOException { 	
		HttpSession session =((HttpServletRequest)request).getSession();
		String urlString 	=((HttpServletRequest)request).getRequestURL().toString();
		String pageName		="";
		boolean allUser		=false;
		boolean isLogged 	=false;
		boolean isAuth		=false;
		UserData userData =null;
		try {
			if(urlString.length()>0){
				pageName=urlString.substring(urlString.lastIndexOf("/")+1,urlString.lastIndexOf("."));
			}
			System.out.println("Page Name: "+pageName);
			String allUserPage="printBaggageTag,ajaxChangePassword,controleUserNameSendCode,captcha,ajaxUserNewPass,ajaxBaggageTagSendToMail,users,ajaxBaggageTagSendToMail,testTimatic,ajaxChangeEmail,login";
			if(urlString!=null&&  allUserPage.indexOf(pageName)>-1 ){
				allUser		=true;
				isLogged	=true;
			}else if(urlString!=null && urlString.indexOf("login.do")>-1){
				isLogged	=true;
			}
			
			if(!isLogged && session!=null && session.getAttribute(Constants.SESSION_USER)!=null){
				isLogged = true;
				isAuth=isAuthPage(pageName, session);
			}
			
			if(!isLogged && !(allUser) ){
				response.getWriter().print("<html>");
				response.getWriter().print("<head>");
				response.getWriter().print("<title></title>");
				response.getWriter().print("</head>");
				response.getWriter().print("<body>");
				response.getWriter().print("You need to re-login to Load Sheet System - "+isLogged+"-"+allUser+"-"+isAuth+"-"+urlString);
				response.getWriter().print("<br><br>");
				response.getWriter().print("<script> top.location.href='"+ Constants.PROJECT_PATH+ "';</script>");
				response.getWriter().print("</body>");
				response.getWriter().print("</html>");
				return;
			}else if(!(allUser) && !isAuth && !(urlString.indexOf("index")>-1 || urlString.indexOf("paxAutoComplete")>-1|| urlString.indexOf("logOut")>-1)){				
					response.getWriter().print("<html>");
					response.getWriter().print("<head>");
					response.getWriter().print("<title></title>");
					response.getWriter().print("</head>");
					response.getWriter().print("<body>");
					response.getWriter().print("You need to Authentication to Load Sheet System "+allUser+"-"+isAuth+"-"+urlString);
					response.getWriter().print("</body>");
					response.getWriter().print("</html>");
					return;				
				
			}else {				
				//System.out.println("User is Authentication :"+session.getId());
				userData=(UserData)session.getAttribute(Constants.SESSION_USER);
				String sessionState=Helper.checkUserSession(userData.getUserId(), session.getAttribute(Constants.USER_SESSION_ID).toString());
				
				if(sessionState.equals("NOK")) {				
					if(userData!=null)
						Helper.upUserSession(userData.getUserId(), session.getAttribute(Constants.USER_SESSION_ID).toString());
				}else {
					
					response.getWriter().print("<html>");
					response.getWriter().print("<head>");
					response.getWriter().println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />");
					response.getWriter().print("<title></title>");
					response.getWriter().print("</head>");
					response.getWriter().print("<body>");
					response.getWriter().print("You need to re-login to Load Sheet System - ");
					response.getWriter().print("<br><br>");
					response.getWriter().print("<script> top.location='"+ Constants.PROJECT_PATH+ "?userSession="+sessionState+"';</script>");
					response.getWriter().print("</body>");
					response.getWriter().print("</html>");
					
				}
			}
		}catch (Exception e) {
			Helper.errorLogger(LoadSheetFilter.class, e);
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		chain.doFilter(request, response);

	}
	
	

}
