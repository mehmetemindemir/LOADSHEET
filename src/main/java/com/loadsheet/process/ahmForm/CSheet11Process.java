package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.SeatPlan;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet11Process {
	public String updateAllSeatPlanStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_seatplan_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" create effect fuel : "+sqlStr);
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
	public  List<SeatPlan>  getSeatPlan(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		SeatPlan 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<SeatPlan> res=new ArrayList<SeatPlan>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getSeatplanLayout("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new SeatPlan();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setCabinSection(Helper.checkNulls(rs.getString("cabin_section"), ""));
					data.setRowLetterA(Helper.checkNulls(rs.getString("row_letter_a"), ""));
					data.setRowLetterB(Helper.checkNulls(rs.getString("row_letter_b"), ""));
					data.setRowLetterC(Helper.checkNulls(rs.getString("row_letter_c"), ""));
					data.setRowLetterD(Helper.checkNulls(rs.getString("row_letter_d"), ""));
					data.setRowLetterE(Helper.checkNulls(rs.getString("row_letter_e"), ""));
					data.setRowLetterF(Helper.checkNulls(rs.getString("row_letter_f"), ""));
					data.setLenghtArm(rs.getInt("length_arm"));
					data.setPerLenghtUnit(rs.getInt("per_weight_unit"));
					data.setSeatPlanId(rs.getInt("seatplan_id"));
					data.setOperate(Helper.checkNulls(rs.getString("operations"), ""));
					data.setRowNumber(rs.getInt("row_no"));
					
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
	
	
	public String createSeatplanLayout(String bagweightId,String cabinsection,String rowno,String rowletter_a, String rowletter_b,String rowletter_c,String rowletter_d, String rowletter_e,String rowletter_f,String lengtharm,String operations,String perweightunit,String userName,int seatPlanId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_seatplan_layout('"+bagweightId+"','"+cabinsection+"','"+rowno+"','"+rowletter_a+"','"+rowletter_b+"','"+rowletter_c+"','"+rowletter_d+"','"+rowletter_e+"','"+rowletter_f+"','"+lengtharm+"','"+operations+"','"+perweightunit+"','"+userName+"',"+seatPlanId+",?); end;";
			System.out.println(" create seatplan layout : "+sqlStr);
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


