package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.FormuleConstants;
import com.loadsheet.bean.data.CSheet.StabTrim;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet2Process {

	public  FormuleConstants  getFomuleConstants(int  revisionId){
		Connection conn							= ConnectionPool.getConnection();
		FormuleConstants	resData			= null;
		String 	sqlString 								= "";
		CallableStatement 	st						= null;
		ResultSet  rs 									= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.get_formule_constants("+revisionId+")}";
			System.out.println("get_formule_constants data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new FormuleConstants();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setRefStaAt(rs.getDouble("RefStaAT"));
				resData.setkConstants(rs.getDouble("K_Constants"));
				resData.setcConstants(rs.getDouble("C_Constants"));
				resData.setlMac(rs.getDouble("L_MAC"));
				resData.setLeMac(rs.getDouble("LEMAC"));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
			}
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resData;
	}
	public String createFormuleConstant(String bagweightId,String refStaAt,String kConstant,String cConstant,String lMac,String leMac,int fcId, String userName) {
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_formule_constants('"+bagweightId+"',"+fcId+","+refStaAt+","+kConstant+","+cConstant+","+lMac+","+leMac+",'"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
			 	System.out.println("ins_formule_constants sql :"+sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	public  List<StabTrim>  getStabTrim(int  revisionId){
		Connection conn							= ConnectionPool.getConnection();
		StabTrim	resData							= null;
		String 	sqlString 								= "";
		CallableStatement 	st						= null;
		List<StabTrim> resList					=new ArrayList<StabTrim>();
		ResultSet  rs 									= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.get_stab_trim("+revisionId+")}";
			System.out.println("Stab Trim data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new StabTrim();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setMax(rs.getDouble("max"));
				resData.setMin(rs.getDouble("min"));
				resData.setName(Helper.checkNulls(rs.getString("name"), ""));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resData.setStabTrimId(rs.getInt("stap_trim_id"));
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
	public String createStabTrim(String bagweightId,String max,String min,String name,int stabtrimId, String userName) {
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_stab_trim('"+bagweightId+"',"+stabtrimId+",'"+name+"',"+max+","+min+",'A','"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
			 	System.out.println("Stab Trim sql :"+sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	public String updateAllStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_stab_trim_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" stab Trim  : "+sqlStr);
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
}
