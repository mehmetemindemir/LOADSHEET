package com.loadsheet.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.AirportData;
import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.oracle.pool.ConnectionPool;

import oracle.jdbc.internal.OracleTypes;


public class AirportList{
	
	public List<AirportData> getAirportList(UserData user){
		List<AirportData> 	airportArr 	= new ArrayList<AirportData>();
		Connection 			conn 		= ConnectionPool.getConnection();
		String 				sqlString 	= "";
		CallableStatement 	sqlStmt 	= null;
		ResultSet 			sqlRslt 	= null;
		AirportData 		ad			= null;
		try{
			//sqlString = "{?=call dcs_pkg.airportlist }";
			sqlString="{?=call DCS_PKG_03.getUserAirportList("+user.getUserId()+") }";
			System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				ad = new AirportData();
				ad.CITY_CODE = sqlRslt.getString("CITY_CODE");
				ad.PORT_CODE = sqlRslt.getString("port_code");
				ad.PORT_NAME = sqlRslt.getString("PORT_NAME").toUpperCase();
				airportArr.add(ad);
			}
			sqlRslt.close();
			sqlStmt.close();
		}catch(Exception e){
			Helper.errorLogger(AirportList.class, e);
			System.out.println("An error occured in AirportList.java : "+e.getMessage());
			
		}finally{
			ConnectionPool.closeConnection(conn);
		}
		return airportArr;
	}
	public List<AirportData> getAirportList(){
		List<AirportData> 	airportArr 	= new ArrayList<AirportData>();
		Connection 			conn 		= ConnectionPool.getConnection();
		String 				sqlString 	= "";
		CallableStatement 	sqlStmt 	= null;
		ResultSet 			sqlRslt 	= null;
		AirportData 		ad			= null;
		try{
			sqlString = "{?=call dcs_pkg.airportlist }";
			//sqlString="{?=call getUserAirportList("+user.userId+") }";
			System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				ad = new AirportData();
				ad.CITY_CODE = sqlRslt.getString("CITY_CODE");
				ad.PORT_CODE = sqlRslt.getString("PORT_CODE");
				ad.PORT_NAME = sqlRslt.getString("PORT_NAME").toUpperCase();
				ad.STATUS = sqlRslt.getString("STATUS");
				airportArr.add(ad);
			}
			sqlRslt.close();
			sqlStmt.close();
		}catch(Exception e){
			Helper.errorLogger(AirportList.class, e);
			System.out.println("An error occured in AirportList.java : "+e.getMessage());
			
		}finally{
			ConnectionPool.closeConnection(conn);
		}
		return airportArr;
	}
	public List<AirportData> getAllAirportList(String lang){
		List<AirportData> 	airportArr 	= new ArrayList<AirportData>();
		Connection 			conn 		= ConnectionPool.getConnection();
		StringBuffer 		sqlString 	= null;
		Statement 			sqlStmt 	= null;
		ResultSet 			sqlRslt 	= null;
		AirportData 		ad 			= null;
		try{
			sqlString =new StringBuffer();
			sqlString.append(" select   ");
			sqlString.append(" 		aa.iatacode as city_code ");
			sqlString.append(" 		,aa.iatacode as port_code ");
			sqlString.append(" 		,aa.airport as port_name ");
			sqlString.append(" 		,cc.country_name ");
			sqlString.append(" 		,aa.city as city_name ");
			sqlString.append(" from ads.airports aa,ads.country cc  ");
			sqlString.append(" where aa.countrycode=cc.country_code  ");
			sqlString.append(" 		and aa.lang='"+lang+"' and cc.lang='"+lang+"' ");
			sqlString.append(" order by aa.airport ");
			//System.out.println("All Airport list sql="+sqlString);
			sqlStmt = conn.createStatement();
			sqlRslt = sqlStmt.executeQuery(sqlString.toString());
			while(sqlRslt.next()){
				ad = new AirportData();
				ad.CITY_CODE 	= Helper.checkNulls(sqlRslt.getString("city_code"),"");
				ad.PORT_CODE 	= Helper.checkNulls(sqlRslt.getString("port_code"),"");
				ad.PORT_NAME 	= Helper.checkNulls(Helper.utfConvStrEng(sqlRslt.getString("port_name")), "") ;
				ad.COUNTRY_NAME	= Helper.checkNulls(Helper.utfConvStrEng(sqlRslt.getString("country_name")), "") ;
				ad.CITY_NAME	= Helper.checkNulls(Helper.utfConvStrEng(sqlRslt.getString("city_name")), "") ;
				airportArr.add(ad);
			}
			sqlRslt.close();
			sqlStmt.close();
		}catch(Exception e){
			Helper.errorLogger(AirportList.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
		}
		return airportArr;
	}
	 
	
	public List<AirportData> getAirportListMainScreen(){
		List<AirportData> 	airportArr 	= new ArrayList<AirportData>();
		Connection 			conn 		= ConnectionPool.getConnection();
		AirportData 		ad 			= null;
		String 				sqlString 	= "";
		CallableStatement 	sqlStmt		= null;
		ResultSet 			sqlRslt 	= null; 
		try{
			
			sqlString = "{?=call dcs_pkg.airportListMainScreen }";
			//System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				ad = new AirportData();
				ad.CITY_CODE = sqlRslt.getString("CITY_CODE");
				ad.PORT_CODE = sqlRslt.getString("PORT_CODE");
				ad.PORT_NAME = sqlRslt.getString("PORT_NAME").toUpperCase();
				airportArr.add(ad);
			}
			sqlRslt.close();
			sqlStmt.close();
		
		}catch(Exception e){
			Helper.errorLogger(AirportList.class, e);
			System.out.println("An error occured in AirportList.java : "+e.getMessage());
		}finally{
			ConnectionPool.closeConnection(conn);
		}
		return airportArr;
	}
	
	public List<AirportData> getAirportListUA(UserData user){
		List<AirportData> 	airportArr 	= new ArrayList<AirportData>();
		Connection 			conn 		= ConnectionPool.getConnection();
		AirportData 		ad 			= null;
		String 				sqlString 	= "";
		CallableStatement 	sqlStmt 	= null;
		ResultSet 			sqlRslt 	= null;
		try{
			//sqlString = "{?=call dcs_pkg_02.destinationlistua }";
			sqlString="{?=call DCS_PKG_03.getUserAirportList("+user.getUserId()+") }";
			//System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				ad = new AirportData();
				ad.CITY_CODE = sqlRslt.getString("CITY_CODE");
				ad.PORT_CODE = sqlRslt.getString("PORT_CODE");
				ad.PORT_NAME = sqlRslt.getString("PORT_NAME").toUpperCase();
				airportArr.add(ad);
			}
			sqlRslt.close();
			sqlStmt.close();
		}catch(Exception e){
			Helper.errorLogger(AirportList.class, e);
			System.out.println("An error occured in AirportList.java : "+e.getMessage());
		}finally{
			ConnectionPool.closeConnection(conn);
		}
		return airportArr;
	}
	
}