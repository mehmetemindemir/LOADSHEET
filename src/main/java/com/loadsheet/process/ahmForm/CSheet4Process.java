package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.loadsheet.bean.data.CSheet.AircraftLimitations;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet4Process {
	
	public String createAircraftWeightLimitations(String bagweightId,String tailnumber,String rampTaxi,String takeOff, String zeroFuel,String landing,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_aircraftweightlimitations('"+bagweightId+"','"+tailnumber+"','"+rampTaxi+"','"+takeOff+"','"+zeroFuel+"','"+landing+"','"+userName+"',?); end;";
			System.out.println(" create aircraft weight limitations : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	public  AircraftLimitations  getAircraftLimitations(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		AircraftLimitations 				res	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getAircraftWeiLimitation("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				res=new AircraftLimitations();	
				res.setAhmRevId(rs.getInt("ahmrevlist_id"));
				res.setAircraftReg(Helper.checkNulls(rs.getString("tail_number"), ""));
				res.setRampTaxi(rs.getInt("ramp_taxi"));
				res.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				res.setLanding(rs.getInt("landing"));
				res.setTakeOff(rs.getInt("take_off"));
				res.setZeroFuel(rs.getInt("zero_fuel"));
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
	
	
}
