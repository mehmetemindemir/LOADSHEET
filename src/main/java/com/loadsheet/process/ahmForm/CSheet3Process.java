package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.loadsheet.bean.data.CSheet.AircraftWeightIndex;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet3Process {
	public  AircraftWeightIndex  getAircraftWeightIndex(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		AircraftWeightIndex 				res	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getAircraftDryopeWei("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				res=new AircraftWeightIndex();					
				res.setAhmRevId(rs.getInt("ahmrevlist_id"));
				res.setWeightType(rs.getInt("weighttype"));
				res.setFiindexadjustment(Helper.checkNulls(rs.getString("fi_index_adjustment"), ""));
				res.setFitailnumber(Helper.checkNulls(rs.getString("fi_tail_number"), ""));
				res.setFiweightadjustment(Helper.checkNulls(rs.getString("fi_weight_adjustment"), ""));
				res.setFleetindex(Helper.checkNulls(rs.getString("fleet_index"), ""));
				res.setFleetweight(Helper.checkNulls(rs.getString("fleet_weight"), ""));
				res.setFwindexadjustment(Helper.checkNulls(rs.getString("fw_index_adjustment"), ""));
				res.setFwtailnumber(Helper.checkNulls(rs.getString("fw_tail_number"), ""));
				res.setFwweightadjustment(Helper.checkNulls(rs.getString("fw_weight_adjustment"), ""));
			//	res.setRecordCount(rs.getInt("code"));				
			}
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return res;
	}

	public String createRegistrationDryOpeWeight(String bagweightId,String fleetweight,String fleetindex,String fwtailnumber,String fwweightadjustment,String fwindexadjustment, String fitailnumber,String fiweightadjustment,String fiindexadjustment,String userName,int weightType) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		=null;
		String 				result	="";
		String 				sqlStr	="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_aircraftdryopewei('"+bagweightId+"','"+fleetweight+"','"+fleetindex+"','"+fwtailnumber+"','"+fwweightadjustment+"','"+fwindexadjustment+"','"+fitailnumber+"','"+fiweightadjustment+"','"+fiindexadjustment+"','"+userName+"',"+weightType+",?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create Registration Dry Ope Weight : "+sqlStr+" result="+result);
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
}
