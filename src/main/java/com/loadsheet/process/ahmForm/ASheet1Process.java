package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.BSheet.BSheet1StandartPaxBag;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class ASheet1Process {
	public  List<BSheet1StandartPaxBag>  getAircraftRevisyonData(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet1StandartPaxBag 				resData		= null;
		List<BSheet1StandartPaxBag> resList=new ArrayList<BSheet1StandartPaxBag>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getStndrBagWeight("+revisionId+")}";
			System.out.println("aircraft revisyon data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BSheet1StandartPaxBag();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setAllFlight(rs.getInt("allflight"));
				resData.setHoliday(rs.getInt("holidaycharter"));
				resData.setStandart(rs.getInt("standart"));
				resData.setPaxType(Helper.checkNulls(rs.getString("passenger_types"), ""));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			
		}
		return resList;
	}
}
