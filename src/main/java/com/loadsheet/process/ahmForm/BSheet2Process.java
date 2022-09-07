package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.BSheet.BSheet2CrewBagWeight;
import com.loadsheet.bean.data.BSheet.BSheet2CrewWeight;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class BSheet2Process {
	public  List<BSheet2CrewWeight>  getCrewWeight(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet2CrewWeight 				resData		= null;
		List<BSheet2CrewWeight> resList=new ArrayList<BSheet2CrewWeight>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCrewWeight("+revisionId+")}";
			System.out.println("sql getRewWeight :"+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BSheet2CrewWeight();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setCode(Helper.checkNulls( rs.getString("code"),""));
				resData.setFemale(rs.getInt("female"));
				resData.setStandart(rs.getInt("standart"));
				resData.setMale(rs.getInt("male"));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resList;
	}
	public  List<BSheet2CrewBagWeight>  getCrewBagWeight(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet2CrewBagWeight 				resData		= null;
		List<BSheet2CrewBagWeight> resList=new ArrayList<BSheet2CrewBagWeight>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCrewBagWeight("+revisionId+")}";
			System.out.println("sql getRewWeight :"+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BSheet2CrewBagWeight();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setCode(Helper.checkNulls( rs.getString("code"),""));
				resData.setCabin(rs.getInt("cabin"));
				resData.setCocpit(rs.getInt("cockpit"));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resList;
	}
}
