package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.loadsheet.bean.data.BSheet.DryOpWeightIndex;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class Bsheet3Process {
	public  List<DryOpWeightIndex>  getDryOpWeightIndex(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		DryOpWeightIndex 				resData		= null;
		List<DryOpWeightIndex> resList=new ArrayList<DryOpWeightIndex>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getDryOpeIndx("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new DryOpWeightIndex();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setDow(rs.getInt("dow_include"));
				resData.setRemark(Helper.checkNulls(rs.getString("remarks"), ""));
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
	public String createDryOpeIndx(String bagweightId,String code,int dowinclude,int dowexclude,int doiinclude,int doiexclude,String remarks,String userName) {
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_dryopeindx('"+bagweightId+"','"+code+"','"+dowinclude+"','"+dowexclude+"','"+doiinclude+"','"+doiexclude+"','"+remarks+"','"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
			 	System.out.println("dryopeindx sql :"+sqlStr);
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
}
