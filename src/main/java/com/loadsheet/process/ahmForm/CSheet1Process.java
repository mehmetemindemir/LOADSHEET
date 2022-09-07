package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.BalanceOut;
import com.loadsheet.bean.data.CSheet.TrimOut;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet1Process {
	public  List<BalanceOut>  getBalanceOut(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BalanceOut 				resData		= null;
		List<BalanceOut> resList=new ArrayList<BalanceOut>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getBalanceOutput("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BalanceOut();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setOutBalance(rs.getInt("enabled"));
				resData.setRemarks(Helper.checkNulls(rs.getString("remarks"), ""));
				resData.setCode(Helper.checkNulls(rs.getString("code"), ""));
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
	public  List<TrimOut>  getTrimOut(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		TrimOut 				resData		= null;
		List<TrimOut> resList=new ArrayList<TrimOut>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getpaxTrimOutput("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new TrimOut();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setOutTrim(rs.getInt("enabled"));
				resData.setRemarks(Helper.checkNulls(rs.getString("remarks"), ""));
				resData.setCode(Helper.checkNulls(rs.getString("code"), ""));
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
