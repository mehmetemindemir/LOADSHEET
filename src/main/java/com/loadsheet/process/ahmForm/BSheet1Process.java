package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.BSheet.BSheet1ByClassWeight;
import com.loadsheet.bean.data.BSheet.BSheet1StandartPaxBag;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class BSheet1Process {
	
	public String updateAllStdPaxBagWeightStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_standart_paxbag_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" create effect fuel : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public  List<BSheet1StandartPaxBag>  getStndrBagWeight(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet1StandartPaxBag 				resData		= null;
		List<BSheet1StandartPaxBag> resList=new ArrayList<BSheet1StandartPaxBag>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getStndrBagWeight("+revisionId+")}";
			System.out.println("sql getStndrBagWeight :"+sqlString);
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
				resData.setSpwId(rs.getInt("spw_id"));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(BSheet1Process.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resList;
	}
	public  String createStdPaxBagWeight(String  bagweightId,String passangerType,String standart,String allFlights,String holidayCharter,String userName,int spwId){
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="NOK";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_stndrbagweight('"+bagweightId+"','"+passangerType+"','"+standart+"','"+allFlights+"','"+holidayCharter+"','"+userName+"',"+spwId+",?); end;";
		 	System.out.println("createStdPaxBagWeight: "+sqlStr);
			stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);
			System.out.println(" create standart passanger bag weight : "+sqlStr+" result="+result);			 
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String updateAllVaryByClassStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_varybagweight_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" updateAllVaryByClassStatus : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	public  List<BSheet1ByClassWeight>  getVaryByClassBagWeight(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet1ByClassWeight 				resData		= null;
		List<BSheet1ByClassWeight> resList=new ArrayList<BSheet1ByClassWeight>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getVaryPaxBagWeight("+revisionId+")}";
			System.out.println("sql getVaryByClassBagWeight :"+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BSheet1ByClassWeight();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setType(Helper.checkNulls(rs.getString("passenger_types"), ""));
				resData.setClass1(rs.getInt("class_1"));
				resData.setClass2(rs.getInt("class_2"));
				resData.setClass3(rs.getInt("class_3"));
				resData.setClass4(rs.getInt("class_4"));
				resData.setClass5(rs.getInt("class_5"));
				resData.setClass6(rs.getInt("class_6"));
				resData.setClass7(rs.getInt("class_7"));
				resData.setRowId(rs.getInt("VARYPAXBAGWEIGHT_ID"));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(BSheet1Process.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resList;
	}
	public  String createVaryByClassBagWeight(String  bagweightId,String passangerType,String class1,String class2,String class3,String class4,String class5,String class6,String class7,String userName,int rowId){
		Connection 			conn   = ConnectionPool.getConnection();
		CallableStatement 	stm    = null;
		String 				result = "";
		String 				sqlStr = "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_varypaxbag('"+bagweightId+"','"+passangerType+"','"+class1+"','"+class2+"','"+class3+"','"+class4+"','"+class5+"','"+class6+"','"+class7+"','"+userName+"',"+rowId+",?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create vary by class passanger bag weight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String updateAllCheckedBagWeight(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_checkedbag_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" updateAllCheckedBagWeight : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	public  List<BSheet1ByClassWeight>  getCheckedBagWeight(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet1ByClassWeight 				resData		= null;
		List<BSheet1ByClassWeight> resList=new ArrayList<BSheet1ByClassWeight>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCheckedBagWeight("+revisionId+")}";
			System.out.println("sql getCheckedBagWeight :"+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BSheet1ByClassWeight();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setType(Helper.checkNulls(rs.getString("bag_type"), ""));
				resData.setClass1(rs.getInt("class_1"));
				resData.setClass2(rs.getInt("class_2"));
				resData.setClass3(rs.getInt("class_3"));
				resData.setClass4(rs.getInt("class_4"));
				resData.setClass5(rs.getInt("class_5"));
				resData.setClass6(rs.getInt("class_6"));
				resData.setClass7(rs.getInt("class_7"));
				resData.setRowId(rs.getInt("CHECKBAAGWEIGHT_ID"));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(BSheet1Process.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resList;
	}
	public  String createCheckedBagWeight(String  bagweightId,String bagType,String class1,String class2,String class3,String class4,String class5,String class6,String class7,String userName,int rowId){
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_checkedbagweight('"+bagweightId+"','"+bagType+"','"+class1+"','"+class2+"','"+class3+"','"+class4+"','"+class5+"','"+class6+"','"+class7+"','"+userName+"',"+rowId+",?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" createCheckedBagWeight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String updateAllAssumptiondBagWeight(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_assumption_status('"+bagweightId+"','"+userName+"',?); end;";
			System.out.println(" updateAllAssumptiondBagWeight : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	public  List<BSheet1ByClassWeight>  getAssumptiondBagWeight(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		BSheet1ByClassWeight 				resData		= null;
		List<BSheet1ByClassWeight> resList=new ArrayList<BSheet1ByClassWeight>();
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		try{	
			
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getPlanningAssumption("+revisionId+")}";
			System.out.println("sql getAssumptiondBagWeight :"+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				resData=new BSheet1ByClassWeight();					
				resData.setAhmRevId(rs.getInt("ahmrevlist_id"));
				resData.setType(Helper.checkNulls(rs.getString("assumption_code"), ""));
				resData.setClass1(rs.getInt("class_1"));
				resData.setClass2(rs.getInt("class_2"));
				resData.setClass3(rs.getInt("class_3"));
				resData.setClass4(rs.getInt("class_4"));
				resData.setClass5(rs.getInt("class_5"));
				resData.setClass6(rs.getInt("class_6"));
				resData.setClass7(rs.getInt("class_7"));
				resData.setRowId(rs.getInt("ASSUMPTION_ID"));
				resData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				resList.add(resData);
			}
			
		} catch (Exception e) {
			Helper.errorLogger(BSheet1Process.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return resList;
	}
	
	public  String createAssumptiondBagWeight(String  bagweightId,String assumptionCode,String class1,String class2,String class3,String class4,String class5,String class6,String class7,String userName,int rowId){
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_planning_assumption('"+bagweightId+"','"+assumptionCode+"','"+class1+"','"+class2+"','"+class3+"','"+class4+"','"+class5+"','"+class6+"','"+class7+"','"+userName+"',"+rowId+",?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create assumption bag weight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(BSheet1Process.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
}
