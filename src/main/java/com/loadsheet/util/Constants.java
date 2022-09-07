package com.loadsheet.util;

public class Constants {
	public static final String USER_NAME="BIT2_USERNAME";
	public static final String USER_SESSION_ID="USER_SESSION_ID";
	public static final String USER_HAVE_SESSION="USER_HAVE_SESSION";
	public static final String USER_LOGIN_ERROR="USER_LOGIN_ERROR";
	public static final String AJAX_TOKEN="AJAX_TOKEN";
	public static final String USER_NAME_AUTH="USER_NAME_AUTH";
	public static final String USER_NAME_VALUE="DCS";
	public static final String USER_ID="USER_ID_FOR_NEW_PASS";
	public static final String USER_AUTORIZED_CODE="USER_AUTORIZED_CODE";
	public static final String USER_AGENCY_NUMBER="BIT2_AGENCY_NUMBER";
	public static final String USER_AGENCY_NUMBER_VALUE="2005";
	public static String USER_AIRLINE_CODE = "610";
	public static String DEFAULT_AIRLINE = "KK";
	public static final String ENCODING="UTF-8";
	public static final String REQ_ETICKET_DATA = "ETICKET_DATA";
	public static final String REQ_ETICKET_TEXT_DATA = "ETICKET_TEXT_DATA";
	public static final String REQ_ETICKET_ADDTEXT_DATA = "ETICKET_ADDTEXT_DATA";
	public static final String REQ_ETICKET_SEGMENT_DATA = "ETICKET_SEGMENT_DATA";
	public static final String SUCCESS_KK = "success_kk";
	public static final String SUCCESS_UH = "success_uh";
	public static final String SYSTEM_TYPE = "TEST"; /** TODO TEST ICIN TEST OLACAK **/
	//public static final String SYSTEM_TYPE = "PROD"; /** TODO PRODUCTION ICIN PRODUCTION OLACAK **/	
	public static String PROJECT_NAME = "ADSDCS";
	//public static String PROJECT_URL= "http://adstest.atlasglb.com/ADSDCS";  /** TODO TEST ICIN TEST OLACAK **/
	//public static String PROJECT_URL= "http://91.230.73.14/ADSDCS";  /** TODO Product ICIN TEST OLACAK **/
	public static String PROJECT_URL= "http://91.230.73.46/ADSDCS";  /** TODO localhost ICIN TEST OLACAK **/
	//public static String PROJECT_URL= "http://localhost:8080/ADSDCS";  /** TODO localhost ICIN TEST OLACAK **/
	public static String PROJECT_PATH= "/LOADSHEET"; 
	public static String SESSION_LANG="language";
	public static String USER_LANG="language";
	public static String EMPTY="";	
	public static final String SYSTEMNAME = "Atlasjet Distribution System";
	public static final String PROJECTNAME = "ADS Departure Control System";
	public static final String PROJECTSHORTNAME = "ADS DCS";
	public static final String FAILURE = "failure";
	public static final String SUCCESS = "success";
	public static final String ICON_PATH = "/"+PROJECT_PATH+"/images/icons";
	public static final String REQUEST_OBJECT_NAME="REQUEST_OBJECT_NAME";
	public static final String REQUEST_INVALID_TICKET_MESSAGE="REQUEST_INVALID_TICKET_MESSAGE";
	public static final String REQUEST_CHECKIN_MESSAGE="REQUEST_CHECKIN_MESSAGE";
	public static final String SESSION_USER = "SESSION_USER";
	public static final String SESSION_RESA_LOG_PATH = "SESSION_RESA_LOG_PATH";
	public static final String SESSION_RESA_LOG_FOLDER = "SESSION_RESA_LOG_FOLDER";	
	public static final String USER_LOGIN = "SESSION_RESA_LOG_FOLDER";	
	//SEATMAP
	public static final String SEATMAP_HUB="DCSPRODUCTION";
	//public static final String DEFAULT_OFFICE_ID = "61000100";
	public static final String DEFAULT_OFFICE_ID_KK = "61000100";
	public static final String DEFAULT_OFFICE_ID_UH = "50000100";
	public static final String DEFAULT_LMU_CLASS = "I";
	
	//public static final String FILE_OUTPUT = "C:/"; /** TODO TEST ICIN **/
	public static final String FILE_OUTPUT = "\\arsiv\\eticket\\tmp\\ExcelFile\\"; /** TODO PRODUCTION ICIN **/
	public static final String ADS_WEB_SRVUSER = "ALTAR1";
	public static final String ADS_WEB_SRVPASS = "12KUR2015";
	//MongoDB
	public static String  MONGODB_HOST="9.1.1.98";
	public static boolean USE_MONGODB_FOR_LOGS 	= false;
	public static boolean SirenaSalter = true; 
	//ElasticSearch
	public static final String ELASTIC_HOST="http://9.1.1.99";
	public static final String ELASTIC_PORT="9200";
	public static String ERROR_LOG_PROVIDER 	= "ELASTIC";//MONGO,OTHER
		
	//public static String EXCEL_PATH="\\arsiv\\eticket\\tmp\\ExcelFile\\"; 
	public static String EXCEL_PATH="\\arsiv\\eticket\\tmp\\ExcelFile\\";
	
	public static boolean SYS_CONSOLE_OUT=true;
	
}
