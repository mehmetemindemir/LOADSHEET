package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.DSheet.CGLimits;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class DSheet1Process {
	public String updateAllCGLimitStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_cg_limit_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" update cg limits fuel : "+sqlStr);
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
	public  List<CGLimits>  getCGLimits(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		CGLimits 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<CGLimits> res=new ArrayList<CGLimits>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCgLimits("+revisionId+")}";
			System.out.println("cg limits data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new CGLimits();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setOperate(Helper.checkNulls(rs.getString("operations"), ""));
					data.setIndex(rs.getDouble("cg_value"));
					data.setWeight(rs.getInt("weight"));
					data.setCqLimitId(rs.getInt("cg_limit_id"));
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
	public String createCgLimits(String bagweightId,String weight,String operations,String cgvalue,String userName,int cgLimitId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_cg_limits('"+bagweightId+"','"+weight+"','"+operations+"','"+cgvalue+"','"+userName+"',"+cgLimitId+",?); end;";
			System.out.println(" create cg limits : "+sqlStr);
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
