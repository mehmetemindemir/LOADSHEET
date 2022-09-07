package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.CombinedLoadLimits;
import com.loadsheet.bean.data.CSheet.CompartmentTrim;
import com.loadsheet.bean.data.CSheet.ComulativeLoadLimit;
import com.loadsheet.bean.data.CSheet.ComulativeLoadLimits;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet12Process {
	public String updateAllComTrimStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_com_trim_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String updateAllComLoadLimStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_com_load_lim_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String updateAllComulativeLoadLimitsStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_comulative_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public  ComulativeLoadLimit getComulativeLoadLimit(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		ComulativeLoadLimits 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<ComulativeLoadLimits> res=new ArrayList<ComulativeLoadLimits>();
		ComulativeLoadLimit retval=new ComulativeLoadLimit();
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getComulativeLoadLimits("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new ComulativeLoadLimits();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setMaxComulative(rs.getInt("max_comulative"));
					data.setMaxWeight(rs.getInt("max_weight"));
					data.setName(Helper.checkNulls(rs.getString("zone_name"), ""));
					data.setOperta(Helper.checkNulls(rs.getString("operations"), ""));
					data.setComulativeId(rs.getInt("comulative_id"));
					data.setFrom(Helper.checkNulls(rs.getString("zone_from"), ""));				
					data.setTo(Helper.checkNulls(rs.getString("zone_to"), ""));
					retval.setCondition(Helper.checkNulls(rs.getString("condition"), ""));
					res.add(data);				
			}
			retval.setComulativeLoadLimits(res);
			
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeResultSet(rs);
			ConnectionPool.closeStatement(st);
			
		}
		return retval;
	}
	public  List<CombinedLoadLimits>  getComLoadLimit(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		CombinedLoadLimits 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<CombinedLoadLimits> res=new ArrayList<CombinedLoadLimits>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCombinedLoadLimits("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new CombinedLoadLimits();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setRemark(Helper.checkNulls(rs.getString("remarks"), ""));
					data.setComLoadId(rs.getInt("com_load_lim_id"));
					data.setCombinedWeight(rs.getInt("max_combined"));
					data.setHold01(rs.getInt("cpt_or_hold_1"));
					data.setHold02(rs.getInt("cpt_or_hold_2"));
					data.setHold03(rs.getInt("cpt_or_hold_3"));
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
	public  List<CompartmentTrim>  getComTrim(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		CompartmentTrim 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<CompartmentTrim> res=new ArrayList<CompartmentTrim>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCompartmentDetail("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new CompartmentTrim();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setDesc(Helper.checkNulls(rs.getString("description"), ""));
					data.setVolume(rs.getDouble("volume"));
					data.setGrossWeight( rs.getInt("gross_weight"));
					data.setOperate(Helper.checkNulls(rs.getString("operations"), ""));
					data.setLenghtArm(rs.getDouble("length_arm"));
					data.setPerWeightUnit(rs.getDouble("per_weight_unit"));
					data.setComNumber(rs.getInt("compartment_number"));	
					data.setComTrimId(rs.getInt("com_trim_id"));
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
	
	public String createCompartmentDetail(String bagweightId,String compartmentnumber,String description,String grossweight, String volume,String lengtharm,String operations, String perweightunit,String userName,int comTrimId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_compartment_detail('"+bagweightId+"','"+compartmentnumber+"','"+description+"','"+grossweight+"','"+volume+"','"+lengtharm+"','"+operations+"','"+perweightunit+"','"+userName+"',"+comTrimId+",?); end;";
			System.out.println(" create compartment detail : "+sqlStr);
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_compartment_detail(?,?,?,?,?,?,?,?,?,?,?); end;";
			stm = conn.prepareCall(sqlStr);
			stm.setInt(1, Helper.string2int(bagweightId));
			stm.setInt(2, Helper.string2int(compartmentnumber));
			stm.setString(3, description);
			stm.setInt(4, Helper.string2int(grossweight));
			stm.setDouble(5, Helper.string2Double(volume, 0));
			stm.setDouble(6, Helper.string2Double(lengtharm, 0));
			stm.setString(7, operations);
			stm.setDouble(8, Helper.string2Double(perweightunit, 0));
			stm.setString(9, userName);
			stm.setInt(10, comTrimId);
			stm.registerOutParameter(11, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(11);
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
	public String createCombinedLoadLimits(String bagweightId,String cptorhold1,String cptorhold2,String cptorhold3, String maxcombined,String remarks,String userName,int comLoadLimId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_combined_load_limits('"+bagweightId+"','"+cptorhold1+"','"+cptorhold2+"','"+cptorhold3+"','"+maxcombined+"','"+remarks+"','"+userName+"',"+comLoadLimId+",?); end;";
			System.out.println(" create  combined load limits: "+sqlStr);
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
	public String createComulativeLoadLimits(String bagweightId,String condition,String zonename,String zonefrom, String zoneto,String maxweight,String maxcomulative,String operations,String userName,int comulativeId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_comulative_load_limits('"+bagweightId+"','"+condition+"','"+zonename+"','"+zonefrom+"','"+zoneto+"','"+maxweight+"','"+maxcomulative+"','"+operations+"','"+userName+"',"+comulativeId+",?); end;";
			System.out.println(" create comulative load limits: "+sqlStr);
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
