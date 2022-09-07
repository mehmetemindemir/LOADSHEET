package com.loadsheet.process.flight;

import java.io.FileOutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.loadsheet.bean.data.AirportData;
import com.loadsheet.bean.data.flight.Flight;
import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Constants;
import com.loadsheet.util.Helper;
import com.loadsheet.util.SendMail;

import oracle.jdbc.OracleTypes;

public class FlightProcess {
	
	public List<Flight>  getFlight(String userLocation,String departureDate ,String userName,String userAirline){
		List<Flight> flightList = new ArrayList<Flight>();
		CallableStatement st=null;
		ResultSet rs=null;
		Connection conn = ConnectionPool.getConnection();
		try{
			Flight flight = null;
			//String sqlString = "{?=call dcs_pkg.flightlist("+Helper.checkNullStringDB(departureDate)+",'"+userLocation+"',null,null,null,'KK','"+userName+"')}";
			//String sqlString = "{?=call dcs_pkg.flightlist(to_char(sysdate-1,'dd/mm/yyyy'),'"+userLocation+"',null,null,null,'KK','"+userName+"')}";
			//String sqlString = "{?=call dcs_pkg.flightlist('"+departureDate+"','"+userLocation+"',null,null,null,'KK','"+userName+"')}";
			String sqlString = "{?=call dcs_pkg_02.dcsFlightList("+Helper.checkNullStringDB(departureDate)+",'"+userLocation+"',null,null,'"+userAirline+"','"+userName+"')}";
			System.out.println(sqlString);
			st = conn.prepareCall(sqlString);
			st.registerOutParameter(1, OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet) st.getObject(1);
			while(rs.next()){
				//if(!rs.getString("AIRCRAFT").equals("AGG/A321-204-ATLJET")) continue;
				flight = new Flight();
				flight.AIRLINE = rs.getString("AIRLINE");
				flight.ORIGIN_CODE = rs.getString("ORIGIN_CODE");
				flight.ORIGIN_DESC = rs.getString("ORIGIN_DESC");
				flight.DESTINATION_CODE = rs.getString("DESTINATION_CODE");
				flight.DESTINAION_DESC = rs.getString("DESTINAION_DESC");
				flight.FLIGHT_NUMBER = rs.getString("FLIGHT_NUMBER");
				flight.DEPARTURE_DATE = rs.getString("DEPARTURE_DATE");
				flight.DEPARTURE_TIME = rs.getString("DEPARTURE_TIME");
				flight.DEPARTURE_DATE_GMT = rs.getString("DEPARTURE_DATE_GMT");
				flight.ARRIVAL_DATE = rs.getString("ARRIVAL_DATE");
				flight.ARRIVAL_TIME = rs.getString("ARRIVAL_TIME");
				flight.ARRIVAL_DATE_GMT = rs.getString("ARRIVAL_DATE_GMT");
				flight.AIRCRAFT = rs.getString("AIRCRAFT");
				flight.CHECKIN_STATUS = rs.getString("CHECKIN_STATUS");
				flight.BOARDING_STATUS = rs.getString("BOARDING_STATUS");
				flight.FLIGHT_STATUS = rs.getString("FLIGHT_STATUS");
				flight.GATE_NUMBER = rs.getString("GATE_NUMBER");
				flight.VOYAGE_CODE = rs.getString("VOYAGE_CODE");
				flight.BUSINESS = rs.getInt("BUSINESS");
				flight.FLIGHT_TYPE = rs.getString("FLIGHT_TYPE");
				flight.isLoadSheetExists = rs.getInt("ISLOADSHEETEXISTS");
				flight.setIsAHMExists(Helper.checkNulls(rs.getString("isAHMExists"), ""));
			
				flightList.add(flight);
			}
		}catch(Exception e){
			Helper.errorLogger(FlightProcess.class, e);
		}
		finally{
			ConnectionPool.closeConnection(conn);
		}
		return flightList;
		
	}
	
	public String insNewFlight(HttpServletRequest request){
		UserData user = (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
		String result = "NEW FLIGHT CREATION HAS NOT BEEN STARTED";
		Connection conn = ConnectionPool.getConnection();
		String sqlString = "";
		CallableStatement sqlStmt =null;
		try{
			sqlString = "begin dcs_pkg.ins_flight_main("+Helper.checkNullStringDB(request.getParameter("airlineCode"))+","+Helper.checkNullStringDB(request.getParameter("origin"))+","+Helper.checkNullStringDB(request.getParameter("destination"))+",'"+request.getParameter("airlineCode")+request.getParameter("flightNumber")+"',"+Helper.checkNullStringDB(request.getParameter("departureDate"))+",'"+request.getParameter("departureHour")+":"+request.getParameter("departureMinutes")+"',"+Helper.checkNullStringDB(request.getParameter("departureDate"))+",'"+request.getParameter("arrivalHour")+":"+request.getParameter("arrivalMinutes")+"',"+Helper.checkNullStringDB(request.getParameter("aircraft"))+","+Helper.checkNullStringDB(request.getParameter("route"))+",0,'"+user.getUserName()+"',?); end;";
			System.out.println(sqlString);
			if(user.getCampanyId()>0){
				String dayofweekStr = null;
				
				if(request.getParameterValues("dayofweek")==null){
					dayofweekStr="1,2,3,4,5,6,7";
				}else{
					String[] dayofweekArr = request.getParameterValues("dayofweek");
					if(dayofweekArr==null){
						dayofweekStr = "0";
					}else{
						for(int i=0;i<dayofweekArr.length;i++){
							if(dayofweekStr==null) dayofweekStr = dayofweekArr[i];
							else dayofweekStr += ","+dayofweekArr[i];
						}
					}
					
				}
				
				sqlString = "begin dcs_pkg_03.ins_flight_main_seasonal("+Helper.checkNullStringDB(request.getParameter("airlineCode"))+","+Helper.checkNullStringDB(request.getParameter("origin"))+","+Helper.checkNullStringDB(request.getParameter("destination"))+",'"+request.getParameter("airlineCode")+request.getParameter("flightNumber")+"',"+Helper.checkNullStringDB(request.getParameter("startDepartureDate"))+","+Helper.checkNullStringDB(request.getParameter("endDepartureDate"))+",'"+dayofweekStr+"','"+request.getParameter("departureHour")+":"+request.getParameter("departureMinutes")+"','"+request.getParameter("arrivalHour")+":"+request.getParameter("arrivalMinutes")+"',"+Helper.checkNulls(request.getParameter("baggageAllowenceEco"), "0")+","+Helper.checkNulls(request.getParameter("baggageAllowenceBuss"), "0")+","+Helper.checkNullStringDB(request.getParameter("aircraft"))+",'"+user.getUserName()+"',?); end;";				
			}
			System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, Types.VARCHAR);
			sqlStmt.execute();
			result = sqlStmt.getString(1);
			sqlStmt.close();
			
		}catch(Exception e){
			System.out.println("An error occured in FlightProcess.java : "+e.getMessage());
			result = "An error occured while creating new flight : "+e.getMessage();
		}finally {
			ConnectionPool.closeConnection(conn, sqlStmt, null);;
		}
		
		return result;
	}
	
	public List<AirportData> getCharterAirportList(){
			
			List<AirportData> airportArr = new ArrayList<AirportData>();
			AirportData airport = null;
			Connection conn = ConnectionPool.getConnection();
			CallableStatement sqlStmt =null;
			ResultSet sqlRslt = null;
			String sqlString = "";
			try{
				sqlString = "{?=call charter_dcs.chtr_airportlist}";
				sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				sqlRslt = (ResultSet) sqlStmt.getObject(1);
				while(sqlRslt.next()){
					airport = new AirportData();
					airport.CITY_CODE = sqlRslt.getString("CITY_CODE");
					airport.PORT_CODE = sqlRslt.getString("PORT_CODE");
					airport.PORT_NAME = sqlRslt.getString("PORT_NAME");
					airport.STATUS = sqlRslt.getString("STATUS");
					airportArr.add(airport);
				}
				sqlRslt.close();
				sqlStmt.close();
			}catch(Exception e){
				System.out.println("An error occured in CharterOperationProcess.java - getCharterAirportList() : "+e.getMessage());
			}finally {
				ConnectionPool.closeConnection(conn, sqlStmt,sqlRslt);
			}
			return airportArr;
		}
	
	public String changeFlightCheckinStatus(String voyageCode, String facilityType, String facilityStatus, String userName,int userID){
		Connection 			conn		= ConnectionPool.getConnection();
		StringBuilder 				sql 	= null;
		CallableStatement 	stm 	= null;
		String result="NOK";
		try{
			sql=new StringBuilder();
			sql.append( "begin dcs_pkg.updateFlightFacility("+Helper.checkNullStringDB(voyageCode)+", "+Helper.checkNullStringDB(facilityType)+", "+Helper.checkNullStringDB(facilityStatus)+",'"+userName+"'); end;");
			System.out.println(sql.toString());
			sql=new StringBuilder();
			sql.append( "begin dcs_pkg.updateFlightFacility(?, ?, ?,?,?,?); end;");

			stm = conn.prepareCall(sql.toString());
			stm.setString(1,voyageCode);
			stm.setString(2,facilityType);
			stm.setString(3,facilityStatus);
			stm.setString(4,userName);
			stm.setInt(5,userID);
			stm.registerOutParameter(6,OracleTypes.VARCHAR);
			stm.execute();
			result=stm.getString(6);

			stm.close();
		}catch(Exception e){
			Helper.errorLogger(FlightProcess.class, e);
		}finally{
			if(stm!=null){
				try {
					stm.close();
				} catch (Exception e2) {
					Helper.errorLogger(FlightProcess.class, e2);
				}
			}
			ConnectionPool.closeConnection(conn, stm, null);
		}
		return result;
	}
	
	public static Flight getFlightData(HttpServletRequest request){
		Flight flight = null;		
		Connection conn = ConnectionPool.getConnection();
		//System.out.println("voyage: "+request.getParameter("voyageCode"));
		String sqlString = "";
		CallableStatement sqlStmt = null;
		ResultSet sqlRslt =null;
		try{
			sqlString = "{?=call dcs_pkg.flightdetail("+Helper.checkNullStringDB(request.getParameter("voyageCode"))+")}";	
			System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				flight = new Flight();
				flight.AIRLINE = sqlRslt.getString("AIRLINE");
				flight.ORIGIN_CODE = sqlRslt.getString("ORIGIN_CODE");
				flight.ORIGIN_DESC = sqlRslt.getString("ORIGIN_DESC");
				flight.DESTINATION_CODE = sqlRslt.getString("DESTINATION_CODE");
				flight.DESTINAION_DESC = sqlRslt.getString("DESTINAION_DESC");
				flight.FLIGHT_NUMBER = sqlRslt.getString("FLIGHT_NUMBER");
				flight.DEPARTURE_DATE = sqlRslt.getString("DEPARTURE_DATE");
				flight.DEPARTURE_TIME = sqlRslt.getString("DEPARTURE_TIME");
				flight.DEPARTURE_DATE_GMT = sqlRslt.getString("DEPARTURE_DATE_GMT");
				flight.ARRIVAL_DATE = sqlRslt.getString("ARRIVAL_DATE");
				flight.ARRIVAL_TIME = sqlRslt.getString("ARRIVAL_TIME");
				flight.ARRIVAL_DATE_GMT = sqlRslt.getString("ARRIVAL_DATE_GMT");
				flight.AIRCRAFT = sqlRslt.getString("AIRCRAFT");
				flight.CHECKIN_STATUS = sqlRslt.getString("CHECKIN_STATUS");
				flight.BOARDING_STATUS = sqlRslt.getString("BOARDING_STATUS");
				flight.FLIGHT_STATUS = sqlRslt.getString("FLIGHT_STATUS");
				flight.GATE_NUMBER = sqlRslt.getString("GATE_NUMBER");
				flight.VOYAGE_CODE = sqlRslt.getString("VOYAGE_CODE");
				flight.BUSINESS = sqlRslt.getInt("BUSINESS");
				flight.INTDOM = sqlRslt.getString("INTDOM");
				flight.CON_BP_FLAG = sqlRslt.getString("CON_BP_FLAG");
				flight.setBusBagAllowence(Helper.checkNulls(sqlRslt.getString("BUSBAGALLOWENCE"), ""));
				flight.setEcoBagAllowence(Helper.checkNulls(sqlRslt.getString("ECOBAGALLOWENCE"), ""));
			}
			sqlRslt.close();
			sqlStmt.close();
		}catch(Exception e){
			Helper.errorLogger(FlightProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn, sqlStmt, sqlRslt);
		}
		return flight;
		
	}
	
	public String updateFlightDetail(HttpServletRequest request,String userName) {
		Connection conn = ConnectionPool.getConnection();
		String sqlString="";
		CallableStatement stm=null;
		String retVal="OK";
		try{
			
			if(request.getParameter("aircraft")!=null && request.getParameter("aircraft").equals("CNX/F16-1-ATLGLB")){
				FlightProcess fPrc = new FlightProcess();
				fPrc.cancelFlightManifest(request.getParameter("voyageCode"), userName);
			}
			if(request.getParameter("baggageAllowenceEco")!=null && !request.getParameter("baggageAllowenceEco").trim().equals("")) {
				sqlString = "begin dcs_pkg_03.updateflightbagallowence("+Helper.checkNullStringDB(request.getParameter("voyageCode"))+",'Y',"+Helper.checkNullStringDB(request.getParameter("baggageAllowenceEco"))+",'"+userName+"',?); end;";
				System.out.println("baggageAllowenceEco Update:"+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.registerOutParameter(1, Types.VARCHAR );
				stm.execute();
				stm.close();
			}
			if(request.getParameter("baggageAllowenceBuss")!=null && !request.getParameter("baggageAllowenceBuss").trim().equals("")) {
				sqlString = "begin dcs_pkg_03.updateflightbagallowence("+Helper.checkNullStringDB(request.getParameter("voyageCode"))+",'C',"+Helper.checkNullStringDB(request.getParameter("baggageAllowenceBuss"))+",'"+userName+"',?); end;";
				System.out.println("baggageAllowenceBuss Update:"+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.registerOutParameter(1, Types.VARCHAR );
				stm.execute();
				stm.close();
			}
			
			sqlString = "begin dcs_pkg.updateflightdetail("+Helper.checkNullStringDB(request.getParameter("departureHour"))+","+Helper.checkNullStringDB(request.getParameter("departureMinutes"))+","+Helper.checkNullStringDB(request.getParameter("arrivalHour"))+","+Helper.checkNullStringDB(request.getParameter("arrivalMinutes"))+","+Helper.checkNullStringDB(request.getParameter("aircraft"))+","+Helper.checkNullStringDB(request.getParameter("gateNumber"))+",0,"+Helper.checkNullStringDB(request.getParameter("voyageCode"))+","+Helper.checkNullStringDB(request.getParameter("route"))+","+Helper.checkNullintDB(request.getParameter("printType"))+",'"+userName+"'); end;";
			System.out.println(sqlString);
			stm = conn.prepareCall(sqlString);
			stm.execute();
			stm.close();
		}catch(Exception e){
			Helper.errorLogger(FlightProcess.class, e);
			retVal="NOK";
		}finally{
			ConnectionPool.closeConnection(conn, stm, null);
		}
		return retVal;
	}
	
	public void cancelFlightManifest(String voyageCode, String userName){
		
		prepareExcelFile(voyageCode,userName);
		
	}
	
	private void prepareExcelFile(String voyageCode, String userName){
		int 					rowIndex=0;
		String 				fileName = Constants.EXCEL_PATH+"CancelFlightManifest\\"+voyageCode+"_Manifest.xls";
		Connection 			conn = ConnectionPool.getConnection();
		HSSFWorkbook 		workbook = null;
		HSSFSheet 			sheet = null;
		HSSFRow 				rowhead = null;
		CallableStatement 	sqlStmt =null;
		ResultSet 			sqlRslt=null;
		FileOutputStream 	fileOut=null; 
		SendMail 			mailMain=null;
		try{
			
			workbook = new HSSFWorkbook();
			sheet = workbook.createSheet(voyageCode+" Manifesto");
			rowhead = sheet.createRow((short)0);
			rowhead.createCell((short)0).setCellValue("Sec No");
			rowhead.createCell((short)1).setCellValue("Name");
			rowhead.createCell((short)2).setCellValue("Pax Type");
			rowhead.createCell((short)3).setCellValue("Phone");
			rowhead.createCell((short)4).setCellValue("PNR");
			rowhead.createCell((short)5).setCellValue("Interline Ticket");
			rowhead.createCell((short)6).setCellValue("Nationality");
			rowhead.createCell((short)7).setCellValue("Seat Number");
			rowhead.createCell((short)8).setCellValue("Class");
			rowhead.createCell((short)9).setCellValue("Gender");
			rowhead.createCell((short)10).setCellValue("Inbound");
			rowhead.createCell((short)11).setCellValue("Outbound");
			rowhead.createCell((short)12).setCellValue("Baggage Piece");
			rowhead.createCell((short)13).setCellValue("Baggage Weight");
			rowhead.createCell((short)14).setCellValue("Note");
			rowhead.createCell((short)15).setCellValue("Transfer To");
			HSSFRow row = null;

			String sqlString = "{?=call dcs_pkg.getflightmanifest('"+voyageCode+"','0','SECNO','"+userName+"')}";
			System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				rowIndex++;
				row = sheet.createRow((short)rowIndex);
	            row.createCell((short)0).setCellValue(sqlRslt.getString("SECURITY_NUMBER"));
	            row.createCell((short)1).setCellValue(sqlRslt.getString("LAST_NAME")+" "+sqlRslt.getString("FIRST_NAME"));
	            row.createCell((short)2).setCellValue(sqlRslt.getString("PAX_TYPE"));
	            row.createCell((short)3).setCellValue(sqlRslt.getString("PHONE"));
	            row.createCell((short)4).setCellValue(sqlRslt.getString("LOCATOR"));
	            row.createCell((short)5).setCellValue(sqlRslt.getString("INTERLINE_TICKET"));
	            row.createCell((short)6).setCellValue(sqlRslt.getString("NATIONALITY"));
	            row.createCell((short)7).setCellValue(sqlRslt.getString("SEATNUMBER"));
	            row.createCell((short)8).setCellValue(sqlRslt.getString("FLIGHT_CLASS"));
	            row.createCell((short)9).setCellValue(sqlRslt.getString("PAXTYPE"));
	            row.createCell((short)10).setCellValue(sqlRslt.getString("INBOUND"));
	            row.createCell((short)11).setCellValue(sqlRslt.getString("OUTBOUND"));
	            row.createCell((short)12).setCellValue(sqlRslt.getString("LGGCOUNT"));
	            row.createCell((short)13).setCellValue(sqlRslt.getString("LGGWEIGHT"));
	            row.createCell((short)14).setCellValue(sqlRslt.getString("NOTES"));
	            row.createCell((short)15).setCellValue(sqlRslt.getString("USER_NAME"));
			}
			sqlRslt.close();
			sqlStmt.close();
			
			fileOut = new FileOutputStream(fileName);
            workbook.write(fileOut);
            fileOut.close();			 
	        System.out.println(fileName+" dosyasi olusturuldu");
	        
	        /** Manifesto yu mail gonder **/
	        Vector recipientVec = new Vector();
	        recipientVec.add("dcs@atlasglb.com");
	        recipientVec.add("burak.kebabci@vor.aero");
	        //recipientVec.add("dcs@atlasglb.com");
	        //recipientVec.add("occsch@atlasglb.com");
	        mailMain = new SendMail();
	        mailMain.setFromAddress("info@info.atlasglb.com");
	        mailMain.setToList(recipientVec);
	        mailMain.setMessageSubject(voyageCode+" Manifesto");
	        mailMain.setMessageBody("Iptal edilen "+voyageCode+" ucusuna ait manifesto excel formatinda ektedir");
	        mailMain.setFileName(fileName);
	        mailMain.sendIt();
	        /** Manifesto yu mail gonder **/
			
			
		}catch(Exception e){
			Helper.errorLogger(FlightProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn, sqlStmt, sqlRslt);
		}
		
		
	}
	
}
