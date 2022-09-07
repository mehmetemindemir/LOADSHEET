package com.loadsheet.process.user;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.loadsheet.bean.data.AirportData;
import com.loadsheet.bean.data.user.UserAlertData;
import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.bean.data.user.UserHistoryData;
import com.loadsheet.bean.data.user.UserInfoData;
import com.loadsheet.bean.data.user.UserType;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;
import com.loadsheet.util.SendMail;
import oracle.jdbc.OracleTypes;


public class UserProcess {

public static void upUserSession(String userId,String sessionId){
		
		Connection conn = ConnectionPool.getConnection();
		try{
			String sqlString = "begin dcs_pkg_03.upUserSessionActivite('"+userId+"','"+sessionId+"'); end;";
			System.out.println("Update User session: "+sqlString);
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.execute();
			sqlStmt.close();			
		}catch(Exception e){
			Helper.errorLogger(UserProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
		}
	}
	public static void closeUserSession(int userId,String sessionId){
		
		Connection conn = ConnectionPool.getConnection();
		try{
			String sqlString = "begin dcs_pkg_03.closeUserSession("+userId+",'"+sessionId+"'); end;";
			System.out.println("Close User session: "+sqlString);
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.execute();
			sqlStmt.close();			
		}catch(Exception e){
			Helper.errorLogger(UserProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
		}
	}
		
		public static void changeUserLocation(UserData user){
			
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin dcs_pkg.changelocation('"+user.getUserName()+"','"+user.getUserLocation()+"'); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.execute();
				sqlStmt.close();
				
			}catch(Exception e){
				System.out.println("changeUserLocation error : "+e.getMessage());
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
		}
		public static void delUserAirport(int userId,String portCode,int delUserID){
				
				Connection conn = ConnectionPool.getConnection();
				CallableStatement stmt=null; 
				try{
					String sqlString = "begin DCS_PKG_03.delUserAirport("+userId+",'"+portCode+"',"+delUserID+"); end;";
					stmt = conn.prepareCall(sqlString);
					stmt.execute();
					
				}catch(Exception e){
					Helper.errorLogger(UserProcess.class, e);
				}finally{
					try {
						if(stmt!=null)
							stmt.close();
						
					} catch (Exception e2) {
						Helper.errorLogger(UserProcess.class, e2);
					}
					ConnectionPool.closeConnection(conn);
				}
		}
		public static void setUserAirport(int userId,String portCode,int createUserId){
			
			Connection conn = ConnectionPool.getConnection();
			CallableStatement stmt=null; 
			try{
				String sqlString = "begin DCS_PKG_03.setUserAirport("+userId+",'"+portCode+"',"+createUserId+"); end;";
				stmt = conn.prepareCall(sqlString);
				stmt.execute();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				try {
					if(stmt!=null)
						stmt.close();
					
				} catch (Exception e2) {
					Helper.errorLogger(UserProcess.class, e2);
				}
				ConnectionPool.closeConnection(conn);
			}
		}
		public List<AirportData> getUserAirportList(String userID) {
			List<AirportData> apList=new ArrayList<AirportData>();
			Connection conn = ConnectionPool.getConnection();
			String sqlString=null;
			ResultSet rs =null;
			CallableStatement stmt=null;
			AirportData airport=null;
			try {
				sqlString = "{?=call DCS_PKG_03.getUserAirportList("+userID+")}";
				System.out.println(sqlString);
				stmt = conn.prepareCall(sqlString);
				stmt.registerOutParameter(1, OracleTypes.CURSOR);
				stmt.execute();
				rs = (ResultSet) stmt.getObject(1);
				while (rs.next()) {
					airport=new AirportData();
					airport.CITY_CODE=Helper.checkNulls(rs.getString("airport_code"), "");
					airport.PORT_NAME=Helper.checkNulls(rs.getString("PORT_NAME"), "");
					apList.add(airport);
				}
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				try {
					if(rs!=null)
						rs.close();				
					if(stmt!=null)
						stmt.close();
				} catch (Exception e2) {
					Helper.errorLogger(UserProcess.class, e2);
				}		
				
				ConnectionPool.closeConnection(conn);
			}
			return apList;
		}
	
		public int changePassword(String userPass, int userId, int userAuth,String createUser){
			int state=0;
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin dcs_pkg_02.changeUserPassword('"+userPass+"',"+userId+","+userAuth+",?,'"+createUser+"'); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.NUMERIC);
				sqlStmt.execute();			
				state= sqlStmt.getInt(1);			
				sqlStmt.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return state;
		}
		public int controleCode(int userId,String type, int code){
			int state=0;
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin dcs_pkg_02.controleCode('"+type+"',"+userId+","+code+",?); end;";
				//System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.NUMERIC);
				sqlStmt.execute();			
				state= sqlStmt.getInt(1);			
				sqlStmt.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return state;
		}
		public int controleCodeEmailPhone(int userId,String type, int code,String contact){
			int state=0;
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin dcs_pkg_02.controleCodePhoneEmail('"+type+"',"+userId+","+code+",'"+contact+"',?); end;";
				//System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.NUMERIC);
				sqlStmt.execute();			
				state= sqlStmt.getInt(1);			
				sqlStmt.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
				state=-1;
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return state;
		}
		public List<UserInfoData> getUserCheckindetail(String startDate,String endDate,String from,String to,String flightNum,String flightType,String userName){
			List<UserInfoData> userList=new ArrayList<UserInfoData>();
			Connection conn = ConnectionPool.getConnection();
			try {
				UserInfoData user;
				StringBuilder sb=new StringBuilder();			
				sb.append(" select ");
				sb.append("     px.voyage_code, ");
				sb.append("     dd.first_name, ");
				sb.append("     dd.last_name, ");
				sb.append("    dd.user_location, ");
				sb.append("     count(px.bpid) as total_checked  ");
				sb.append(" from flight_paxlist px join dcs_users dd on dd.user_name=px.user_name ");
				sb.append(" where  ");
				sb.append(" px.checkin_date BETWEEN to_date('"+startDate+" 00:00:00','dd/mm/yyyy HH24:MI:SS' ) and to_date('"+endDate+" 23:59:59','dd/mm/yyyy HH24:MI:SS' )  ");
				sb.append(" and  px.user_name='"+userName+"'");
				sb.append("group by px.voyage_code,  dd.first_name, dd.last_name,   dd.user_location ");
				sb.append("order by  dd.user_location,  dd.first_name, dd.last_name ");
				//System.out.println("Sql : "+sb.toString());
				Statement stm=conn.createStatement();
				ResultSet rs=stm.executeQuery(sb.toString());
				while (rs.next()) {
					user=new UserInfoData();
					user.USER_NAME =rs.getString("voyage_code");
					user.STATUS=rs.getString("total_checked");
					user.FIRST_NAME=rs.getString("first_name");
					user.LAST_NAME=rs.getString("last_name");
					user.USER_LOCATION=rs.getString("user_location");
					userList.add(user);
				}
				stm.close();
				rs.close();
				
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return userList;
			
		}
		public List<UserInfoData> getUserCheckindetail(String voyageCode){
			List<UserInfoData> userList=new ArrayList<UserInfoData>();
			Connection conn = ConnectionPool.getConnection();
			try {
				UserInfoData user;
				String sqlString = "{?=call dcs_pkg_02.flightusercheckincount("+Helper.checkNullStringDB(voyageCode)+")}";
				//System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				ResultSet rs = (ResultSet) sqlStmt.getObject(1);
				while (rs.next()) {
					user=new UserInfoData();
					user.USER_NAME=rs.getString("user_name");
					user.USER_PASSWORD =rs.getString("checkin_count");
					userList.add(user);
				}
				sqlStmt.close();
				rs.close();
				
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return userList;
			
		}
		public List<UserInfoData> getUserOfTotalCheckin(String startDate,String endDate,String from,String to,String flightNum,String flightType){
			List<UserInfoData> userList=new ArrayList<UserInfoData>();
			Connection conn = ConnectionPool.getConnection();
			try {
				UserInfoData user;
				StringBuilder sb=new StringBuilder();
				
				sb.append(" select ");
				sb.append("     px.user_name, ");
				sb.append("     dd.first_name, ");
				sb.append("     dd.last_name, ");
				sb.append("    dd.user_location, ");
				sb.append("     count(px.bpid) as total_checked  ");
				sb.append(" from flight_paxlist px join dcs_users dd on dd.user_name=px.user_name ");
				sb.append(" where  ");
				sb.append(" px.checkin_date BETWEEN to_date('"+startDate+" 00:00:00','dd/mm/yyyy HH24:MI:SS' ) and to_date('"+endDate+" 23:59:59','dd/mm/yyyy HH24:MI:SS' )  ");
				sb.append("group by px.user_name,  dd.first_name, dd.last_name,   dd.user_location ");
				sb.append("order by  dd.user_location,px.user_name,  dd.first_name, dd.last_name ");
				//System.out.println("Sql : "+sb.toString());
				Statement stm=conn.createStatement();
				ResultSet rs=stm.executeQuery(sb.toString());
				while (rs.next()) {
					user=new UserInfoData();
					user.USER_NAME =rs.getString("user_name");
					user.STATUS=rs.getString("total_checked");
					user.FIRST_NAME=rs.getString("first_name");
					user.LAST_NAME=rs.getString("last_name");
					user.USER_LOCATION=rs.getString("user_location");
					userList.add(user);
				}
				stm.close();
				rs.close();
				
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return userList;
			
		}
		public int addUserCreateCodePhone(int userId,String message,String phoneNumber){
			int state=0;
			Connection conn = ConnectionPool.getConnection();
			try{
				phoneNumber=phoneNumber.replace("+", "");
				int code=Helper.getRandomNumberInRange(100000,999999);
				String sqlString = "begin dcs_pkg_02.userCreateCode('PHONE',"+userId+","+code+",?); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.NUMERIC);
				sqlStmt.execute();			
				state= sqlStmt.getInt(1);	
				sqlStmt.close();	
				message=message.replace("#DATE#", Helper.date2String(new Date(), "dd/mm/yyyy hh:mm:ss"));
				message=message.replace("#CODE#", String.valueOf(code));
				sendSms(message,phoneNumber,conn);
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
				state=-1;
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return state;
		}
		public void sendSms(String message,String mobilePhone,Connection conn){
			// ets_vnl.sms_send('','JETMIL CARD','JETMIL'); 
			try{
				String sqlString = "begin ets_vnl.sms_send('"+message+"','"+mobilePhone+"','ADSDCS','ATLASGLOBAL'); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.execute();					
				sqlStmt.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}
		}
		public int addUserCreateCodePassChange(String messagePhone,String messageMail,String processType, UserInfoData user){
			int state=0;
			int codeCount=0;
			Connection conn = ConnectionPool.getConnection();
			try{
				if(user!=null && user.USER_NAME !=null){
					if(processType.equals("EMAIL")&& user.getUserEmail().length()>5){					
						codeCount=addUserCreateCodeMail(user.USER_ID,messageMail,user.getUserEmail());
						state=2;//Email Yollandı
						if(codeCount>4){	
							state=codeCount;
						}
					}else if(processType.equals("PHONE")&& user.getUserPhone().length()>9){
						codeCount=addUserCreateCodePhone(user.USER_ID,messagePhone, user.getUserPhone());
						state=1;//SMS Yollandı
						if(codeCount>4){
							state=codeCount;
						}
						
					}
				}else{
					state=0;//Not found user
				}
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
				state=-1;
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return state;
		}
		
		public int addUserCreateCodeMail(int userId,String message,String email){
			int state=0;
			Connection conn = ConnectionPool.getConnection();
			try{
				String mobilPhone="";
				int code=Helper.getRandomNumberInRange(100000,999999);
				String sqlString = "begin dcs_pkg_02.userCreateCode('EMAIL',"+userId+","+code+",?); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.NUMERIC);
				sqlStmt.execute();			
				state= sqlStmt.getInt(1);	
				sqlStmt.close();	
				message=message.replace("#DATE#", Helper.date2String(new Date(), "dd/mm/yyyy hh:mm:ss"));
				message=message.replace("#CODE#", String.valueOf(code));
				SendMail mail=new SendMail();
				mail.setAirlineCode("KK");
				mail.getToList().add(email);
				mail.setMessageSubject("ADSDCS");
				mail.setMessageBody(message);
				mail.sendItHtml();
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
				state=-1;
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return state;
		}
		
		
		public UserInfoData getUser(String usrName  ){
			UserInfoData user=new UserInfoData();
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "{?=call dcs_pkg_02.getuser("+Helper.checkNullStringDB(usrName)+")}";
				//System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				ResultSet rs = (ResultSet) sqlStmt.getObject(1);
				while(rs.next()){
					user.USER_NAME = rs.getString("USER_NAME");
					user.USER_PASSWORD = rs.getString("USER_PASSWORD");
					user.FIRST_NAME = Helper.utfConvJetmilStrNew(rs.getString("FIRST_NAME"));
					user.LAST_NAME = Helper.utfConvJetmilStrNew(rs.getString("LAST_NAME"));
					user.USER_POSITION = rs.getString("USER_POSITION");
					user.STATUS = rs.getString("STATUS");
					user.USER_LOCATION = rs.getString("USER_LOCATION");
					user.USER_ID = rs.getInt("USER_ID");
					user.USER_TYPE=rs.getInt("user_type");	
					user.setUserEmail(rs.getString("user_email"));
					user.setUserPhone(rs.getString("user_phone"));				
				}
				rs.close();
				sqlStmt.close();
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}	
			return user;
		}
		
		public int getUserCountByState(List<UserInfoData> data,String status){
			int retVal=0;
			try {
				for (UserInfoData item : data) {
					if(status!=null ){
						if(item.STATUS.trim().equals(status))
							retVal++;
					}else{
						retVal++;
					}
						
					
				}
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}	
			return retVal;
		}
		/*public static String insertUserData(UserInfoData user){
			
			String resultStr = "OK";
			Connection conn = ConnectionPool.getConnection();
			int userType=Helper.getUserType(user.USER_POSITION);
			
			try{
				user.setUserEmail(user.getUserEmail().replace("NOK",""));
				user.setUserPhone(user.getUserPhone().replace("NOK",""));
				String sqlString = "begin  wghtandblnc.USER_PROCESS_PKG.ins_user(upper("+Helper.checkNullStringDB(Helper.checkUserNameCharacter(user.USER_NAME))+"),"+Helper.checkNullStringDB(Helper.generateMD5(user.USER_PASSWORD))+",upper("+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.FIRST_NAME)))+"),upper("+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.LAST_NAME)))+"),upper("+Helper.checkNullStringDB(user.USER_LOCATION)+"),"+userType+","+Helper.checkNullStringDB(user.getUserPhone())+","+Helper.checkNullStringDB(user.getUserEmail())+",'"+user.getComment()+"',"+user.getCompanyId()+",'"+user.getCreateBy()+"',?); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.VARCHAR);
				sqlStmt.execute();
				resultStr = sqlStmt.getString(1);
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}		
			return resultStr;
			
		}
		public static List<UserInfoData> getUserDataList(String userName,String usersStatus,int companyId){
			
			List<UserInfoData> userArray = new ArrayList<UserInfoData>();
			UserInfoData user = null;
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "{?=call wghtandblnc.USER_PROCESS_PKG.getuserlist("+Helper.checkNullStringDB(userName)+","+companyId+",'"+usersStatus+"')}";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				ResultSet sqlRslt = (ResultSet) sqlStmt.getObject(1);
				while(sqlRslt.next()){
					user = new UserInfoData();
						user.USER_NAME = sqlRslt.getString("user_name");
						user.FIRST_NAME = Helper.utfConvJetmilStrNew(sqlRslt.getString("first_name"));
						user.LAST_NAME = Helper.utfConvJetmilStrNew(sqlRslt.getString("last_name"));
						user.STATUS = sqlRslt.getString("STATUS");
						user.USER_LOCATION = sqlRslt.getString("user_station");
						user.USER_ID = sqlRslt.getInt("USER_ID");
						user.setUserEmail(Helper.checkNulls(sqlRslt.getString("email"), "") );
						user.setUserPhone(Helper.checkNulls(sqlRslt.getString("phone_number"), "") );
						user.USER_TYPE=sqlRslt.getInt("user_type");
						user.setComment(Helper.checkNulls(sqlRslt.getString("user_comment"),""));
						user.setCompanyId(sqlRslt.getInt("user_company"));
						user.USER_POSITION=Helper.checkNulls(sqlRslt.getString("user_position"),"");
					userArray.add(user);	
							
				}
				sqlRslt.close();
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			
			return userArray;
		}
		
		
		public static String updateUserData(UserInfoData user){
			String resultStr = "OK";
			Connection conn = ConnectionPool.getConnection();
			int userType=Helper.getUserType(user.USER_POSITION);
			try{
				String sqlString = "begin wghtandblnc.USER_PROCESS_PKG.upd_user("+Helper.checkNullStringDB(user.USER_NAME)+","+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.FIRST_NAME)))+","+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.LAST_NAME)))+","+Helper.checkNullStringDB(user.getUserEmail())+","+Helper.checkNullStringDB(user.getUserPhone())+","+userType+","+Helper.checkNullStringDB(user.getComment())+","+Helper.checkNullStringDB(user.getCreateBy())+","+user.getCompanyId()+",?); end;";
				Helper.sysConsoleOut(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.VARCHAR);
				sqlStmt.execute();
				resultStr = sqlStmt.getString(1);
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return resultStr;
		}
		public static void deleteUser(String userName,String status,String createUser){
			
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin wghtandblnc.USER_PROCESS_PKG.delete_user('"+userName+"','"+status+"','"+createUser+"'); end;";
				//System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.execute();
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
		}
		public List<UserHistoryData> getUserHistory(String userName){
			Connection 				conn				= ConnectionPool.getConnection();
			List<UserHistoryData> 	historyList		= new ArrayList<UserHistoryData>();
			StringBuffer				sql				= null;
			Statement 				stm				= null;
			ResultSet				rs				= null;
			UserHistoryData 			obj				= null;
			try {
				sql=new StringBuffer();
				sql.append(" select ");
				sql.append(" 	user_name, ");
				sql.append(" 	log_type, ");
				sql.append(" 	log,");
				sql.append(" 	create_user, ");
				sql.append(" 	TO_CHAR(create_date,'dd/MM/yyyy hh24:mi:ss') as create_date");
				sql.append(" from wghtandblnc.user_log dd  ");
				sql.append(" where dd.user_name='"+userName+"'  ");
				sql.append("  order by dd.create_date ");
				System.out.println("user log history=="+sql);
				stm=conn.createStatement();
				rs=stm.executeQuery(sql.toString());
				while (rs.next()) {
					obj=new UserHistoryData();
					obj.setUserName(Helper.checkNulls(rs.getString("user_name"), ""));
					obj.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
					obj.setCreateUser(Helper.checkNulls(rs.getString("create_user"), ""));
					obj.setLogType(Helper.checkNulls(rs.getString("log_type"), ""));
					obj.setLogText(Helper.checkNulls(rs.getString("log"), ""));
					historyList.add(obj);
				}
				rs.close();
				stm.close();
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally {
				ConnectionPool.closeConnection(conn);
			}
			
			return historyList;
		}*/
		
		
		
		public static String insertUserData(UserInfoData user){
			String resultStr = "OK";
			Connection conn = ConnectionPool.getConnection();
			int userType=Helper.getUserType(user.USER_POSITION);
			
			try{
				user.setUserEmail(user.getUserEmail().replace("NOK",""));
				user.setUserPhone(user.getUserPhone().replace("NOK",""));
				String sqlString = "begin dcs_pkg_02.ins_user(upper("+Helper.checkNullStringDB(Helper.checkUserNameCharacter(user.USER_NAME))+"),"+Helper.checkNullStringDB(Helper.generateMD5(user.USER_PASSWORD))+",upper("+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.FIRST_NAME)))+"),upper("+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.LAST_NAME)))+"),"+Helper.checkNullStringDB(user.USER_POSITION)+",upper("+Helper.checkNullStringDB(user.USER_LOCATION)+"),upper("+Helper.checkNullStringDB(user.INT_DOM)+"),"+userType+","+Helper.checkNullStringDB(user.getUserPhone())+","+Helper.checkNullStringDB(user.getUserEmail())+",'"+user.getComment()+"','"+user.getCreateBy()+"',"+user.getCompanyId()+","+user.getUserProjectCode()+",?); end;";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.VARCHAR);
				sqlStmt.execute();
				resultStr = sqlStmt.getString(1);
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}		
			return resultStr;
			
		}
		public static List<UserInfoData> getUserDataList(String userName, String userLocation,String usersStatus,int companyId,int userProjectCode){
			
			List<UserInfoData> userArray = new ArrayList<UserInfoData>();
			UserInfoData user = null;
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "{?=call dcs_pkg_02.getuserlist("+Helper.checkNullStringDB(userName)+","+Helper.checkNullStringDB(userLocation)+","+companyId+","+userProjectCode+",'"+usersStatus+"')}";
				System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				ResultSet sqlRslt = (ResultSet) sqlStmt.getObject(1);
				while(sqlRslt.next()){
					user = new UserInfoData();
					user.USER_NAME = sqlRslt.getString("USER_NAME");
					user.USER_PASSWORD = sqlRslt.getString("USER_PASSWORD");
					user.FIRST_NAME = Helper.utfConvJetmilStrNew(sqlRslt.getString("FIRST_NAME"));
					user.LAST_NAME = Helper.utfConvJetmilStrNew(sqlRslt.getString("LAST_NAME"));
					user.USER_POSITION = sqlRslt.getString("USER_POSITION");
					user.STATUS = sqlRslt.getString("STATUS");
					user.USER_LOCATION = sqlRslt.getString("USER_LOCATION");
					user.INT_DOM = sqlRslt.getString("INT_DOM");
					user.USER_ID = sqlRslt.getInt("USER_ID");
					user.setUserEmail(Helper.checkNulls(sqlRslt.getString("user_email"), "") );
					user.setUserPhone(Helper.checkNulls(sqlRslt.getString("user_phone"), "") );
					user.USER_TYPE=sqlRslt.getInt("user_type");
					user.setAirportCount(sqlRslt.getInt("airport_count"));
					user.setComment(Helper.checkNulls(sqlRslt.getString("user_comment"),""));
					user.setManifestUnlimitTime(sqlRslt.getInt("manifestStatus"));
					user.setCompanyId(sqlRslt.getInt("user_company_id"));
					user.setUserProjectCode(sqlRslt.getInt("user_project_code"));
					userArray.add(user);				
				}
				sqlRslt.close();
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			
			return userArray;
		}
		public static String updateUserData(UserInfoData user){
			String resultStr = "OK";
			Connection conn = ConnectionPool.getConnection();
			int userType=Helper.getUserType(user.USER_POSITION);
			try{
				String sqlString = "begin dcs_pkg_02.upd_user("+Helper.checkNullStringDB(user.USER_NAME)+","+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.FIRST_NAME)))+","+Helper.getTurkish(Helper.utfConvJetmilStrNew(Helper.checkNullStringDB(user.LAST_NAME)))+","+Helper.checkNullStringDB(user.USER_POSITION)+","+Helper.checkNullStringDB(user.USER_LOCATION)+","+Helper.checkNullStringDB(user.INT_DOM)+","+Helper.checkNullStringDB(user.getUserEmail())+","+Helper.checkNullStringDB(user.getUserPhone())+","+userType+","+Helper.checkNullStringDB(user.getComment())+","+Helper.checkNullStringDB(user.getCreateBy())+","+user.getCompanyId()+","+user.getUserProjectCode()+",?); end;";
				Helper.sysConsoleOut(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, Types.VARCHAR);
				sqlStmt.execute();
				resultStr = sqlStmt.getString(1);
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return resultStr;
		}
		public static void deleteUser(String userName,String status,String createUser){
			
			Connection conn = ConnectionPool.getConnection();
			try{
				String sqlString = "begin dcs_pkg_02.delete_user('"+userName+"','"+status+"','"+createUser+"'); end;";
				//System.out.println(sqlString);
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.execute();
				sqlStmt.close();
				
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
		}
		public List<UserHistoryData> getUserHistory(String userName){
			Connection 				conn				= ConnectionPool.getConnection();
			List<UserHistoryData> 	historyList		= new ArrayList<UserHistoryData>();
			StringBuffer				sql				= null;
			Statement 				stm				= null;
			ResultSet				rs				= null;
			UserHistoryData 			obj				= null;
			try {
				sql=new StringBuffer();
				sql.append(" select ");
				sql.append(" 	user_name, ");
				sql.append(" 	log_type, ");
				sql.append(" 	log,");
				sql.append(" 	create_user, ");
				sql.append(" 	TO_CHAR(create_date,'dd/MM/yyyy hh24:mi:ss') as create_date");
				sql.append(" from dcs_user_log dd  ");
				sql.append(" where dd.user_name='"+userName+"'  ");
				sql.append("  order by dd.create_date ");
				System.out.println("user log history=="+sql);
				stm=conn.createStatement();
				rs=stm.executeQuery(sql.toString());
				while (rs.next()) {
					obj=new UserHistoryData();
					obj.setUserName(Helper.checkNulls(rs.getString("user_name"), ""));
					obj.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
					obj.setCreateUser(Helper.checkNulls(rs.getString("create_user"), ""));
					obj.setLogType(Helper.checkNulls(rs.getString("log_type"), ""));
					obj.setLogText(Helper.checkNulls(rs.getString("log"), ""));
					historyList.add(obj);
				}
				rs.close();
				stm.close();
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally {
				ConnectionPool.closeConnection(conn);
			}
			
			return historyList;
		}
		
		public static void addAlertMessage(String  param,String paramType ,String alertMessageTitle,String alertMessage,String msgLang,String createUser){
			Connection 				conn 		= ConnectionPool.getConnection();
			String 					sqlString 	= "";
			CallableStatement 		stm 		= null;
			try{
				sqlString = "begin dcs_pkg_03.insAlertMessage('"+param+"','"+paramType+"','"+Helper.insDBTurkishCharacter( alertMessageTitle.replace("'", ""))+"','"+Helper.insDBTurkishCharacter(alertMessage.replace("'", ""))+"','"+msgLang+"','"+createUser+"'); end;";
				System.out.println("Add Alert Message: "+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.execute();
				stm.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn,stm,null);
			}
		}
		public static void upUserAlertReadStatus(int userId,int alertMessageId,int readStatus){
			Connection 				conn 		= ConnectionPool.getConnection();
			String 					sqlString 	= "";
			CallableStatement 		stm 		= null;
			try{
				sqlString = "begin dcs_pkg_03.upUserAlertReadStatus(?,?,?); end;";
				System.out.println("Up Alert Read Status: "+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.setInt(1, userId);
				stm.setInt(2, alertMessageId);
				stm.setInt(3, readStatus);
				stm.execute();
				stm.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn,stm,null);
			}
		}
		
		public static void upUserAlertMsgStatus(int userId,int alertMessageId,String status,String userName){
			Connection 				conn 		= ConnectionPool.getConnection();
			String 					sqlString 	= "";
			CallableStatement 		stm 		= null;
			try{
				sqlString = "begin dcs_pkg_03.upUserAlertMsgStatus(?,?,?,?); end;";
				System.out.println("Up Alert Status: "+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.setInt(1, userId);
				stm.setInt(2, alertMessageId);
				stm.setString(3, status);
				stm.setString(4, userName);
				stm.execute();
				stm.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn,stm,null);
			}
		}
		
		public static void upAlertMsgStatus(int alertMessageId,String status,String userName){
			Connection 				conn 		= ConnectionPool.getConnection();
			String 					sqlString 	= "";
			CallableStatement 		stm 		= null;
			try{
				sqlString = "begin dcs_pkg_03.upAlertMsgStatus(?,?,?); end;";
				System.out.println("Up Alert Status: "+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.setInt(1, alertMessageId);
				stm.setString(2, status);
				stm.setString(3, userName);
				stm.execute();
				stm.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn,stm,null);
			}
		}
		public static void upUserManifestDayVal(String userName,int dayVal,String createUser){
			Connection 				conn 		= ConnectionPool.getConnection();
			String 					sqlString 	= "";
			CallableStatement 		stm 		= null;
			try{
				sqlString = "begin dcs_pkg_03.insUserUnlimitTime(?,?,?); end;";
				System.out.println("Up  Status: "+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.setString(1, userName);
				stm.setInt(2, dayVal);
				stm.setString(3, createUser);
				stm.execute();
				stm.close();			
			}catch(Exception e){
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn,stm,null);
			}
		}
		public List<UserAlertData> getUserAlertList(int userID,String lang){
			List<UserAlertData> 	alertList	= new ArrayList<UserAlertData>();
			Connection 				conn 		= ConnectionPool.getConnection();
			CallableStatement 		sqlStmt		= null;
			ResultSet 				rs 			= null;
			UserAlertData 			userAlert	= null;
			try {
				
				String sqlString = "{?=call dcs_pkg_03.getUserAlertList(?,?) }";
				System.out.println(sqlString); 
				sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.setInt(2, userID);
				sqlStmt.setString(3, lang);
				sqlStmt.execute();
				rs = (ResultSet) sqlStmt.getObject(1);			   
				while(rs.next()){
					userAlert=new UserAlertData();
					userAlert.setAlertID(rs.getInt("alertm_id"));
					userAlert.setAlertMessage(Helper.checkNulls(Helper.getDBTurkishCharacter(rs.getString("alertm")),""));
					userAlert.setAlertTitle(Helper.checkNulls(Helper.getDBTurkishCharacter(rs.getString("alertm_title")),""));
					userAlert.setCreateDate(Helper.checkNulls(rs.getString("create_date"),""));
					userAlert.setCreateUser(Helper.checkNulls(rs.getString("create_user"),""));
					userAlert.setLang(Helper.checkNulls(rs.getString("lang"),""));
					userAlert.setReadStatus(rs.getInt("read_status"));
					userAlert.setReadDate(rs.getString("read_date"));
					userAlert.setUserMsgStatus(Helper.checkNulls(rs.getString("user_msg_status"), ""));
					alertList.add(userAlert);
				}
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally{			
				ConnectionPool.closeConnection(conn,sqlStmt,rs);
			}
			return alertList;
		}
		
		public List<UserAlertData> getAlertMsgList(){
			List<UserAlertData> 	alertList	= new ArrayList<UserAlertData>();
			Connection 				conn 		= ConnectionPool.getConnection();
			CallableStatement 		sqlStmt		= null;
			ResultSet 				rs 			= null;
			UserAlertData 			userAlert	= null;
			try {
				
				String sqlString = "{?=call dcs_pkg_03.getAlertMsgList() }";
				System.out.println(sqlString); 
				sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				rs = (ResultSet) sqlStmt.getObject(1);			   
				while(rs.next()){
					userAlert=new UserAlertData();
					userAlert.setAlertID(rs.getInt("alertm_id"));
					userAlert.setAlertMessage(Helper.checkNulls(Helper.getDBTurkishCharacter(rs.getString("alertm")),""));
					userAlert.setAlertTitle(Helper.checkNulls(Helper.getDBTurkishCharacter(rs.getString("alertm_title")),""));
					userAlert.setCreateDate(Helper.checkNulls(rs.getString("create_date"),""));
					userAlert.setCreateUser(Helper.checkNulls(rs.getString("create_user"),""));
					userAlert.setLang(Helper.checkNulls(rs.getString("lang"),""));
					userAlert.setStatus(rs.getInt("alertm_status"));
					userAlert.setTotalMsgCount(rs.getInt("total_msg_count"));
					userAlert.setReadedMsgCount(rs.getInt("readed_msg_count"));
					alertList.add(userAlert);
				}
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally{			
				ConnectionPool.closeConnection(conn,sqlStmt,rs);
			}
			return alertList;
		}
		
		public List<UserType> getUserTypeList(){
			List<UserType> uTypeList=new ArrayList<UserType>();
			Connection conn = ConnectionPool.getConnection();
			try {
				String sqlString = "{?=call wghtandblnc.USER_PROCESS_PKG.getUserType(?) }";
				System.out.println(sqlString); 
				CallableStatement sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.setString(2, "");
				sqlStmt.execute();
				ResultSet rs = (ResultSet) sqlStmt.getObject(1);
				UserType uType;   
				while(rs.next()){
					uType=new UserType();
					uType.setUserType(rs.getString ("user_type"));
					uType.setUserTypeId(rs.getInt("user_type_id"));
					uTypeList.add(uType);
				}
				rs.close();
				sqlStmt.close();
			} catch (Exception e) {
				Helper.errorLogger(UserProcess.class, e);
			}finally{
				ConnectionPool.closeConnection(conn);
			}
			return uTypeList;
		}
		
	}
	

