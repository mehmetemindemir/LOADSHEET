package com.loadsheet.util;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.loadsheet.util.elastic.ElasticLogger;
import com.loadsheet.util.mongo.MongoDBUtil;



public class ErrorHandler implements Serializable {
	private String strClassName 	= "";
	private String strFileName  	= "";
	private String strLineNumber 	= "";
	private String strMethodName	= "";
	private String strErrorMessage	= "";
	private Class  className;	
	private Exception exception;
	private String	userName;
	private String	logtype 		= "error";
	private String	serverName		= "";
	private String	extraInfo		= "";
	
	public ErrorHandler() {
		super();
	}
		
	public ErrorHandler(Exception e){
		this(ErrorHandler.class, e);	
	}
	public ErrorHandler(Class c,Exception e){
		this(c, e,"");
	}	
	public ErrorHandler(Class c,Exception e,String username){
		this(c, e, username, "error");
	}
	public ErrorHandler(Class c,Exception e,String username,String logtype){
		this.className = c;
		this.exception = e;
		this.userName  = username;
		this.logtype   = logtype;	
	}
	
	public void logwrite(){
		try {
			StackTraceElement[] errs = exception.getStackTrace();
			Date 	today 	= new Date();
			List<ErrorClass> errorList=new ArrayList<ErrorClass>();
			ErrorClass error;
			String	strDate	= Helper.date2String(today);
			
			for(StackTraceElement er:errs){ 			
				error=new ErrorClass();
				strClassName 	= er.getClassName();
				strFileName		= er.getFileName();
				strLineNumber	= String.valueOf(er.getLineNumber());
				strMethodName	= er.getMethodName();
				strErrorMessage	= exception.getMessage();
				if((strClassName==null || strClassName.length()==0 || (strClassName.indexOf("loadshet")>-1||strClassName.indexOf("timatic")>-1||strClassName.indexOf("sirena")>-1))&&(strClassName.indexOf("filter")<0) ){					
					error.setProject(Constants.PROJECT_NAME );
					error.setClassName(strClassName);
					error.setFileName(strFileName);
					error.setMethodName(strMethodName);
					error.setLineNumber(strLineNumber);
					error.setUserName(userName);
					error.setErrorMessage(strErrorMessage);
					error.setExtraInfo(extraInfo);
					error.setErrorDate(strDate);
					error.setErrorTime(Helper.date2String(today,"HH:mm:ss"));
					error.setProcessDate(Helper.date2String(today, "yyyyMMddHHmmss"));
					error.setServerIP(Helper.getServerIPAddress());
					errorList.add(error);
					System.out.println(error.getProject() + "|" + error.getServerIP() + "|" + error.getErrorDate()+"|" + error.getErrorTime() + "|" + error.getFileName() + "|" + error.getClassName() + "|" +error.getMethodName()+ "|" + error.getLineNumber() + "|" + error.getUserName()+ "|" + error.getErrorMessage() + "|" + exception + "|" + error.getExtraInfo());	
				}
				
				
			}
			
			
			if(Constants.ERROR_LOG_PROVIDER.equals("MONGO")){
				for(ErrorClass item:errorList){
					MongoDBUtil.insertLog(item.getProject(),item.getClassName(), item.getFileName(), item.getMethodName(), item.getLineNumber(), item.getUserName(), item.getErrorMessage(), item.getExtraInfo(), today);
				}
			}else if(Constants.ERROR_LOG_PROVIDER.equals("ELASTIC")){
				ElasticLogger elasticLog=new ElasticLogger();
				elasticLog.insertLog(errorList);
			}else {
				for(ErrorClass item:errorList){
					Helper.sysConsoleOut(item.getProject() + "|" + item.getServerIP() + "|" + item.getErrorDate()+"|" + item.getErrorTime() + "|" + item.getFileName() + "|" + item.getClassName() + "|" +item.getMethodName()+ "|" + item.getLineNumber() + "|" + item.getUserName()+ "|" + item.getErrorMessage() + "|" + exception + "|" + item.getExtraInfo());	
					
				}
			}
			for(ErrorClass item:errorList){
				Helper.sysConsoleOut(item.getProject() + "|" + item.getServerIP() + "|" + item.getErrorDate()+"|" + item.getErrorTime() + "|" + item.getFileName() + "|" + item.getClassName() + "|" +item.getMethodName()+ "|" + item.getLineNumber() + "|" + item.getUserName()+ "|" + item.getErrorMessage() + "|" + exception + "|" + item.getExtraInfo());	
				
			}
		} catch (Exception e) {
			Helper.sysConsoleOut("Error  ErrorHandler.logwrite :"+e.getMessage());
		}
		
		
	}
	
	
	public String getStrClassName() {
		return strClassName;
	}

	public void setStrClassName(String strClassName) {
		this.strClassName = strClassName;
	}

	public String getStrFileName() {
		return strFileName;
	}

	public void setStrFileName(String strFileName) {
		this.strFileName = strFileName;
	}

	public String getStrLineNumber() {
		return strLineNumber;
	}

	public void setStrLineNumber(String strLineNumber) {
		this.strLineNumber = strLineNumber;
	}

	public String getStrMethodName() {
		return strMethodName;
	}

	public void setStrMethodName(String strMethodName) {
		this.strMethodName = strMethodName;
	}

	public String getStrErrorMessage() {
		return strErrorMessage;
	}

	public void setStrErrorMessage(String strErrorMessage) {
		this.strErrorMessage = strErrorMessage;
	}

	public Class getClassName() {
		return className;
	}

	public void setClassName(Class className) {
		this.className = className;
	}

	public String getLogtype() {
		return logtype;
	}

	public void setLogtype(String logtype) {
		this.logtype = logtype;
	}

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public Exception getException() {
		return exception;
	}

	public void setException(Exception exception) {
		this.exception = exception;
	}

	public String getExtraInfo() {
		return extraInfo;
	}

	public void setExtraInfo(String extraInfo) {
		this.extraInfo = extraInfo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
