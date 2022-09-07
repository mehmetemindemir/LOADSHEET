package com.loadsheet.util.mongo;

import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.loadsheet.util.Constants;
import com.loadsheet.util.ErrorClass;
import com.loadsheet.util.Helper;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.ReadPreference;
import com.mongodb.WriteConcern;


public class MongoDBUtil {

	public static final String MONGODB_DBNAME 		= "atlasdb";
	public static final String ATLASJET_LOG_TABLE 	= "logs";
	public static final String SIRENA_LOG_TABLE 	= "sirenalogs";
	public static MongoClient getMongoClient() throws UnknownHostException{
		MongoClientOptions.Builder builder = new MongoClientOptions.Builder();
		builder.readPreference(ReadPreference.primary());
		builder.writeConcern(WriteConcern.UNACKNOWLEDGED);
		builder.minConnectionsPerHost(1);
		builder.connectionsPerHost(5);
		builder.maxConnectionIdleTime(50000);
		builder.maxConnectionLifeTime(50000);
		builder.connectTimeout(1000);
		builder.threadsAllowedToBlockForConnectionMultiplier(1);
		builder.socketKeepAlive(true);
		builder.cursorFinalizerEnabled(true);
		builder.alwaysUseMBeans(true);
		builder.heartbeatFrequency(51);
		builder.heartbeatConnectTimeout(53);
		builder.heartbeatSocketTimeout(54);		
		MongoClientOptions opts = builder.build();
		return new MongoClient(Constants.MONGODB_HOST, opts);
		
	}
	public static DBCollection atlasjetLogTable(MongoClient mongoClient) {
		try {
			DBCollection logTable;
			DB mongoDB = mongoClient.getDB(MONGODB_DBNAME);
			if (mongoDB.collectionExists(ATLASJET_LOG_TABLE)) {
				logTable = mongoDB.getCollection(ATLASJET_LOG_TABLE);
				logTable.createIndex("{project: 1, errorDate: 1,errorMessage:1}");
			} else {
				BasicDBObject log = new BasicDBObject();
				log.put("project", removeForbiddenChar(Constants.PROJECT_NAME));
				log.put("className", "");
				log.put("fileName", "");
				log.put("lineNumber", "");
				log.put("methodName", "");
				log.put("errorMessage", "logs tablosu oluşturuldu");
				log.put("userName", "");
				log.put("extraInfo", "");
				log.put("errorDate",Helper.date2String(new Date(), "dd/MM/yyyy HH:mm:SS"));
				log.put("errorTime", "00:00");
				logTable = mongoDB.createCollection(ATLASJET_LOG_TABLE, log);
			}
			return logTable;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static DBCollection sirenaLogTable(MongoClient mongoClient) {
		try {

			DBCollection logTable;
			DB mongoDB = mongoClient.getDB(MONGODB_DBNAME);
			if (mongoDB.collectionExists(SIRENA_LOG_TABLE)) {
				logTable = mongoDB.getCollection(SIRENA_LOG_TABLE);
				logTable.createIndex("{project: 1,processTime:1}");
			} else {
				BasicDBObject log = new BasicDBObject();
				log.put("project", removeForbiddenChar(Constants.PROJECT_NAME));
				log.put("officeId", "");
				log.put("agentId", "");
				log.put("methodName", "");
				log.put("webServerUrl", "");
				log.put("requestXml", "logs tablosu oluşturuldu");
				log.put("responseXml", "");
				log.put("creationDate",Helper.date2String(new Date(), "dd/MM/yyyy"));
				log.put("creationTime", "00:00");
				log.put("processTime",new Date());
				log.put("transactionId", 1);
				logTable = mongoDB.createCollection(SIRENA_LOG_TABLE, log);
			}
			return logTable;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void insertSirenaLog(String officeId,String methodName, String webServerUrl, String requestXml,String responseXml,String agentId) {

		MongoClient client = null;
		try {
			client = getMongoClient();
			BasicDBObject log = new BasicDBObject();
			Date now = new Date();
			String strHour = (now.getHours() > 9 ? ""	+ now.getHours() : ("0" + now.getHours()));
			String strMin = (now.getMinutes() > 9 ? ""+ now.getMinutes() : ("0" + now.getMinutes()));
			String strSec = (now.getSeconds() > 9 ? ""+ now.getSeconds() : ("0" + now.getSeconds()));
			String time = strHour + ":" + strMin + ":" + strSec;
			log.put("project", removeForbiddenChar(Constants.PROJECT_NAME));
			log.put("officeId", officeId);
			log.put("agentId", agentId);
			log.put("methodName", methodName);
			log.put("webServerUrl", webServerUrl);
			log.put("requestXml", requestXml);
			log.put("responseXml", responseXml);
			log.put("creationDate",Helper.date2String(now, "dd/MM/yyyy"));
			log.put("creationTime", time);
			log.put("processTime",Helper.date2String(now,"dd/MM/yyyy HH:mm:ss"));
			log.put("transactionId",0);
			DBCollection logTable = sirenaLogTable(client);
			if (logTable != null) {
				logTable.insert(log);
			} else {
				System.out.println("Hata..:" + log.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (client != null)
				client.close();
			client = null;
		}
	}
	public static void insertLog(String projectName	, String className	,
								 String fileName	, String methodName	, String lineNumber,
								 String userName	, String errorMsg	, String extraInfo, Date errorDate) {

		MongoClient client = null;
		try{
			client = getMongoClient();
			BasicDBObject log = new BasicDBObject();
			log.put("project", projectName);
			log.put("className", className);
			log.put("fileName", fileName);
			log.put("methodName", methodName);
			log.put("lineNumber", lineNumber);
			log.put("userName", userName);
			log.put("errorMessage", errorMsg);
			log.put("extraInfo", extraInfo);
			log.put("errorDate",Helper.date2String(new Date(), "dd/MM/yyyy HH:mm:SS"));
			String strHour = (errorDate.getHours() > 9  ? "" + errorDate.getHours()   : ("0" + errorDate.getHours()));
			String strMin = (errorDate.getMinutes() > 9 ? "" + errorDate.getMinutes() : ("0" + errorDate.getMinutes()));
			String strSec = (errorDate.getSeconds() > 9 ? "" + errorDate.getSeconds() : ("0" + errorDate.getSeconds()));
			String time = strHour + ":" + strMin + ":" + strSec;
			log.put("errorTime", time);
			DBCollection logTable = atlasjetLogTable(client);
			if (logTable != null) {
				logTable.insert(log);
			} else {
				System.out.println("Hata..:" + log.toString());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(client!=null)client.close();
			client = null;
		}
	}

	public static List queryAtlasjetLogs(String project,String errorBeginDate,String errorEndDate, String errorMsg, String className,	String fileName) {
		List list = new ArrayList();
		insertLog(Constants.PROJECT_NAME,"aaaa", "bbbb", "dddd", "eeee", "ffff", "gggggg", "hhhhh", new Date());
		MongoClient client = null;
		try {
			client = getMongoClient();
			BasicDBObject log = new BasicDBObject();
			log.put("project",project);
			
			if (errorMsg != null && errorMsg.length() >= 3) {
				log.put("errorMessage",java.util.regex.Pattern.compile(errorMsg));
			}
			
			log.put("errorDate", new BasicDBObject("$gte", errorBeginDate).append("$lte", errorEndDate));
			 
			if (className != null && className.length() >= 3) {
				log.put("className", java.util.regex.Pattern.compile(className));
			}
			if (fileName != null && fileName.length() >= 3) {
				log.put("fileName", java.util.regex.Pattern.compile(fileName));
			}
			
			BasicDBObject sort = new BasicDBObject();
			sort.put("errorDate", 1);
			
			System.out.println("lllloooooggg....:" + log.toString());
			DBCollection logTable = atlasjetLogTable(client);
			if (logTable != null) {
				DBCursor cur = logTable.find(log).sort(sort); 
				try{
					while (cur.hasNext()) {
						DBObject temp = cur.next();
						ErrorClass err = new ErrorClass();
						err.setClassName(Helper.checkNulls(temp.get("className"),""));
						err.setErrorDate(Helper.checkNulls(temp.get("errorDate"),""));
						err.setErrorMessage(Helper.checkNulls(temp.get("errorMessage"),""));
						err.setErrorTime(Helper.checkNulls(temp.get("errorTime"),""));
						err.setExtraInfo(Helper.checkNulls(temp.get("extraInfo"),""));
						err.setFileName(Helper.checkNulls(temp.get("fileName"),""));
						err.setLineNumber(Helper.checkNulls(temp.get("lineNumber"),""));
						err.setMethodName(Helper.checkNulls(temp.get("methodName"),""));
						err.setProject(Helper.checkNulls(temp.get("project"),""));
						err.setUserName(Helper.checkNulls(temp.get("userName"),""));						
						list.add(err);	
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					cur.close();
				}
			} else {
				System.out.println("Hata..:" + log.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(client!=null)client.close();
			client = null;
		}
		return list;
	}

	public static void dropAtlasjetLogDB() {
		Mongo mongo = new Mongo(Constants.MONGODB_HOST);
		DB mongoDB = mongo.getDB(MongoDBUtil.MONGODB_DBNAME);
		mongoDB.dropDatabase();
	}

	public static String date2String(Date date) {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat();
			sdf.applyPattern("dd/MM/yyyy");
			return sdf.format(date);
		} else {
			return "";
		}
	}
	
	public static String removeForbiddenChar(String str) {
    	if(str!=null && str.length()>0){
    		String EMAIl_PATTERN = "[()?:!,'+/;+&$#%€~|^<>\"]";
			str = str.replaceAll(EMAIl_PATTERN, "");
    	}
		return str;
	}

}
