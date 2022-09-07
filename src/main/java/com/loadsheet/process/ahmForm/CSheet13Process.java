package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.AsymMetricalLimitatitons;
import com.loadsheet.bean.data.CSheet.DetailSectionTrim;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet13Process {
	public String updateAllBayTrimStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_Bay_Trim_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String updateAllAsymLimitStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_asym_limit_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public  List<AsymMetricalLimitatitons>  getAsymLimit(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		AsymMetricalLimitatitons 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<AsymMetricalLimitatitons> res=new ArrayList<AsymMetricalLimitatitons>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getAsymmetricalLimitations("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new AsymMetricalLimitatitons();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setRefWeightCode(Helper.checkNulls(rs.getString("referance_weight_code"), ""));
					data.setLiteralInbalance(Helper.checkNulls(rs.getString("lateral_imbalance"), ""));
					data.setMac(rs.getInt("mac"));
					data.setRefWeight(rs.getInt("referance_weight"));
					data.setAsymLimitId(rs.getInt("asym_limit_id"));
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
	public  List<DetailSectionTrim>  getSectionTrim(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		DetailSectionTrim 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<DetailSectionTrim> res=new ArrayList<DetailSectionTrim>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getBayDetailTrim("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new DetailSectionTrim();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setBaySection(Helper.checkNulls(rs.getString("bay_section"), ""));
					data.setVolume(rs.getInt("volume"));
					data.setGrossWeight( rs.getInt("gross_weight"));
					data.setOperate(Helper.checkNulls(rs.getString("operations"), ""));
					data.setLenghtArm(rs.getInt("length_arm"));
					data.setPerWeightUnit(rs.getInt("per_weight_unit"));
					data.setBayTrimId(rs.getInt("bay_trim_id"));
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
	public String createBayDetailTrim(String bagweightId,String baysection,String grossweight,String volume,String lengtharm, String operations,String perweightunit,String userName,int bayTrimId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_bay_detail_trim('"+bagweightId+"','"+baysection+"','"+grossweight+"','"+volume+"','"+lengtharm+"','"+operations+"','"+perweightunit+"','"+userName+"',"+bayTrimId+",?); end;";
			System.out.println(" create bay detail trim : "+sqlStr);
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
	
	public String createAsymmetricalLimitations(String bagweightId,String referanceweightcode,String lateralimbalance,String referanceweight,String mac,String userName,int asymLimitId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_asymmetrical_limitations('"+bagweightId+"','"+referanceweightcode+"','"+lateralimbalance+"','"+referanceweight+"','"+mac+"','"+userName+"',"+asymLimitId+",?); end;";
			System.out.println(" create asymmetrical limitations : "+sqlStr);
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
