package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.CabinSection;
import com.loadsheet.bean.data.CSheet.ClassCabinSection;
import com.loadsheet.bean.data.CSheet.PassengerCabin;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet9Process {

	public String updateAllPaxCabinStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_paxcabin_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String updateAllCabinSectionStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_cabinsection_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String updateAllClassCabinSectionStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_classcabinsec_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public  List<PassengerCabin>  getPassengerCabin(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		PassengerCabin 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<PassengerCabin> res=new ArrayList<PassengerCabin>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getPassengerCabin("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new PassengerCabin();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setCabinName(Helper.checkNulls(rs.getString("cabin_name"), ""));
					data.setClass1(Helper.checkNulls(rs.getString("class_1"), ""));
					data.setClass2(Helper.checkNulls(rs.getString("class_2"), ""));
					data.setClass3(Helper.checkNulls(rs.getString("class_3"), ""));
					data.setClass4(Helper.checkNulls(rs.getString("class_4"), ""));
					data.setClass5(Helper.checkNulls(rs.getString("class_5"), ""));
					data.setTotalCabinSection(rs.getInt("total_cabin_section"));
					data.setPaxCabinId(rs.getInt("paxcabin_id"));
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
	public  List<CabinSection>  getCabinSection(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		CabinSection 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<CabinSection> res=new ArrayList<CabinSection>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCabinSection("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new CabinSection();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setCabinSection(Helper.checkNulls(rs.getString("cabin_section"), ""));
					data.setArmOperate(Helper.checkNulls(rs.getString("arm_operations"), ""));
					data.setInfluOperate(Helper.checkNulls(rs.getString("influence_operation"), ""));
					data.setArm(rs.getInt("arm"));
					data.setArmSection(Helper.checkNulls(rs.getString("arm_station"), ""));
					data.setPerWeightUnit(rs.getInt("per_weight_unit"));					
					data.setTotalSeat(rs.getInt("total_seats"));
					data.setCabinSectionId(rs.getInt("cabinsection_id"));
					data.setRowNumber(Helper.checkNulls(rs.getString("row_numbers"), "") );
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
	
	public  List<ClassCabinSection>  getClassCabinSection(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		ClassCabinSection 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<ClassCabinSection> res=new ArrayList<ClassCabinSection>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getClassCabinSection("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new ClassCabinSection();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setCabinSection(Helper.checkNulls(rs.getString("cabin_section"), ""));
					data.setIndexOperate(Helper.checkNulls(rs.getString("index_operation"), ""));
					data.setLenghtOperate(Helper.checkNulls(rs.getString("length_operations"), ""));
					data.setLenghtUnit(rs.getDouble("length_unit"));
					data.setPerWeightUnit(rs.getDouble("per_weight_unit"));					
					data.setClassCabinSecId(rs.getInt("class_cabin_sec_id"));
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
	public String createPassengerCabin(String bagweightId,String cabinname,String class1,String class2, String class3,String class4,String class5,String totalcabinsection,String userName,int paxCabinId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_passenger_cabin('"+bagweightId+"','"+cabinname+"','"+class1+"','"+class2+"','"+class3+"','"+class4+"','"+class5+"','"+totalcabinsection+"','"+userName+"',"+paxCabinId+",?); end;";
			System.out.println(" create  passengercabin : "+sqlStr);
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
	
	public String createCabinSection(String bagweightId,String cabinsection,String rownumbers,String totalseats,String armoperations, String armstation,String arm,String influenceoperation,String perweightunit,String userName,int cabinSectionId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_cabin_section("+bagweightId+",'"+cabinsection+"','"+rownumbers+"',"+totalseats+",'"+armoperations+"',"+Helper.string2Double(armstation, 0)+","+Helper.string2Double(arm, 0)+",'"+influenceoperation+"',"+Helper.string2Double(perweightunit, 0)+",'"+userName+"',"+cabinSectionId+",?); end;";
			System.out.println(" create  cabin section : "+sqlStr);
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
	
	public String createClassCabinSection(String bagweightId,String cabinsection,String lengthoperations,String lengthunit,String indexoperation, String perweightunit,String userName,int classCabinSecId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_class_cabin_section('"+bagweightId+"','"+cabinsection+"','"+lengthoperations+"',"+Helper.string2Double(lengthunit, 0)+",'"+indexoperation+"',"+Helper.string2Double(perweightunit, 0)+",'"+userName+"',"+classCabinSecId+",?); end;";
			System.out.println(" create Class cabin section : "+sqlStr);
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
