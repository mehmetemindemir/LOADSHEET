package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.dowDoi.DowDoiData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class DowDoiProcess {
	
	public String updateAllDowDoiStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_dowdoi('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" update all dowdoi  : "+sqlStr);
			/*stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);*/
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_dowdoi(?,?,?); end;";
			stm = conn.prepareCall(sqlStr);
			stm.setInt(1, Helper.string2int(bagweightId));
			stm.setString(2, userName);
			stm.registerOutParameter(3, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(3);
			System.out.println(" result="+result);
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
			System.out.println("An error occured in DowDoiProcess - updateAllDowDoiStatus() : "+e.getMessage());
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createDowDoiLimits(String bagweightId,String cockpit,String cabincrew,String dowvalue,String doivalue,String pantry, String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_dowdoi("+bagweightId+","+cockpit+","+cabincrew+","+dowvalue+","+doivalue+",'"+pantry+"','"+userName+"',?); end;";
			System.out.println(" create dow doi limits : "+sqlStr);
			
			/*
			stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);
			*/
			
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_dowdoi(?,?,?,?,?,?,?,?); end;";
			stm = conn.prepareCall(sqlStr);
			stm.setInt(1, Helper.string2int(bagweightId));
			stm.setInt(2, Helper.string2int(cockpit));
			stm.setInt(3, Helper.string2int(cabincrew));
			stm.setInt(4, Helper.string2int(dowvalue));
			stm.setDouble(5, Helper.string2Double(doivalue, 0));
			stm.setString(6, pantry);
			stm.setString(7, userName);
			stm.registerOutParameter(8, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(8);
			
			System.out.println(" result="+result);
		}
		catch(Exception e){
			Helper.errorLogger(DowDoiProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	
	public  List<DowDoiData>  getDowDoiLimits(int  revisionId){
		Connection 						conn		= ConnectionPool.getConnection();
		DowDoiData 						data		= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<DowDoiData> res=new ArrayList<DowDoiData>();
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getdowdoitable("+revisionId+")}";
			System.out.println("getdowdoitable data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new DowDoiData();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));	
					data.setDowDoiId(rs.getInt("dowdoi_id"));
					data.setCabinCrew(rs.getInt("cabin_crew"));
					data.setCockpit(rs.getInt("cockpit"));
					data.setDowValue(rs.getInt("dow_value"));
					data.setDoiValue(rs.getDouble("doi_value"));
					data.setPantry(Helper.checkNulls(rs.getString("pantry"), ""));
					data.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
					data.setCreateUser(Helper.checkNulls(rs.getString("create_user"), ""));
					data.setStatus(Helper.checkNulls(rs.getString("status"), ""));
					
					res.add(data);				
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
