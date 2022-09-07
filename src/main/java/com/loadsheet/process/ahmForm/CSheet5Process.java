package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.loadsheet.bean.data.CSheet.LimitationOfLoadSheet;
import com.loadsheet.bean.data.CSheet.LimitationsLoadSheetMain;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet5Process {
	public String createLimitsPurposes(String bagweightId,String limitcode, String weight,String operations,String index,String userName,int llpId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_limit_loadsheet_purposes('"+bagweightId+"','"+limitcode+"','"+weight+"','"+operations+"','"+index+"','"+userName+"',"+llpId+",?); end;";
			System.out.println(" create Limits Purposes : "+sqlStr);
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
	public String updateAllStatus(String bagweightId,String limitcode, String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_limit_loadsheet_status('"+bagweightId+"','"+limitcode+"','"+userName+"',?); end;";
			System.out.println(" create Limits Purposes : "+sqlStr);
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
	public  LimitationsLoadSheetMain  getLoadSheetLimitations(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		LimitationOfLoadSheet 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		LimitationsLoadSheetMain res=new LimitationsLoadSheetMain();
		
		 List<LimitationOfLoadSheet> forwardZFW=new ArrayList<LimitationOfLoadSheet>();
		 List<LimitationOfLoadSheet> aftZFW=new ArrayList<LimitationOfLoadSheet>();
		 List<LimitationOfLoadSheet> forwardTFW=new ArrayList<LimitationOfLoadSheet>();
		 List<LimitationOfLoadSheet> aftTFW=new ArrayList<LimitationOfLoadSheet>();
		 List<LimitationOfLoadSheet> forwardLW=new ArrayList<LimitationOfLoadSheet>();
		 List<LimitationOfLoadSheet> aftLW=new ArrayList<LimitationOfLoadSheet>();
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getLimitLoadsheetPurposes("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				data=new LimitationOfLoadSheet();	
				data.setAhmRevId(rs.getInt("ahmrevlist_id"));
				data.setLimitCode(Helper.checkNulls(rs.getString("limit_code"), ""));
				data.setLimitIndex(rs.getDouble("limit_index"));
				data.setWeight(rs.getDouble("weight"));
				data.setOpera(rs.getString("operations"));
				data.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				data.setLlpID(rs.getInt("llp_id"));
				if(data.getLimitCode().equals("FZFW")) {
					forwardZFW.add(data);
				}else if(data.getLimitCode().equals("AZFW")) {
					aftZFW.add(data);
				}else  if(data.getLimitCode().equals("FTOW")) {
					forwardTFW.add(data);
				}else  if(data.getLimitCode().equals("ATOW")) {
					aftTFW.add(data);
				}else  if(data.getLimitCode().equals("FLW")) {
					forwardLW.add(data);
				}else  if(data.getLimitCode().equals("ALW")) {
					aftLW.add(data);
				}
			}
			res.setAftLW(aftLW);
			res.setForwardLW(forwardLW);
			res.setAftTFW(aftTFW);
			res.setAftZFW(aftZFW);
			res.setForwardTFW(forwardTFW);
			res.setForwardZFW(forwardZFW);
			
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
