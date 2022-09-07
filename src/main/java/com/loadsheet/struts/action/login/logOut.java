package com.loadsheet.struts.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.process.user.UserProcess;
import com.loadsheet.util.Constants;
import com.loadsheet.util.Helper;
public class logOut extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String forwardStr = Constants.SUCCESS;
		try {
			UserData user=(UserData)request.getSession().getAttribute(Constants.SESSION_USER);
			UserProcess prd=new UserProcess();
			prd.closeUserSession(user.getUserId(),request.getSession().getAttribute(Constants.USER_SESSION_ID).toString());	
			request.getSession().removeAttribute(Constants.SESSION_USER);	
			request.getSession().invalidate();
		} catch (Exception e) {
			Helper.errorLogger(logOut.class, e);
		}
		return mapping.findForward(forwardStr);
	}
}
