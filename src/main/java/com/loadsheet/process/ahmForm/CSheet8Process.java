package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.Gallery;
import com.loadsheet.bean.data.CSheet.Pantry;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;
import oracle.jdbc.internal.OracleTypes;

public class CSheet8Process {
	
	public String createGalley(String bagweightId,String galleylocation,String maxweight,String armoperations, String unitlength,String operations,String perweightunit,String userName,int galleryId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_galley("+bagweightId+",'"+galleylocation+"',"+Helper.string2Double(maxweight, 0)+",'"+armoperations+"',"+Helper.string2Double(unitlength, 0)+",'"+operations+"',"+Helper.string2Double(perweightunit, 0)+",'"+userName+"',"+galleryId+",?); end;";
			System.out.println(" create  galley : "+sqlStr);
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
	public String updateAllGalleryStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_gallery_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String updateAllPantryStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_pantry_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public  List<Gallery>  getGallery(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		Gallery 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<Gallery> res=new ArrayList<Gallery>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getGalley("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new Gallery();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setGalleryLocation(Helper.checkNulls(rs.getString("galley_location"), ""));
					data.setGpId(rs.getInt("gallery_id"));
					data.setLenghtUnit(rs.getDouble("unit_length"));
					data.setOperatLU(Helper.checkNulls(rs.getString("arm_operations"), ""));
					data.setOperatWU(Helper.checkNulls(rs.getString("operations"), ""));
					data.setWeight(rs.getDouble("max_weight"));
					data.setWeightUnit(rs.getDouble("per_weight_unit"));
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
	public  List<Pantry>  getPantry(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		Pantry 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<Pantry> res=new ArrayList<Pantry>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getPantry("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new Pantry();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setWeight(rs.getDouble("max_weight"));
					data.setOperate(Helper.checkNulls(rs.getString("operations"), ""));
					data.setPantry(Helper.checkNulls(rs.getString("galley"), ""));
					data.setPantryId(rs.getInt("pantry_id"));
					data.setPerWeight(rs.getDouble("per_weight"));
					data.setFerryFlight(Helper.checkNulls(rs.getString("ferry_flight"), ""));
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
	public String createPantry(String bagweightId,String galley,String maxweight,String operations,String perweight,String ferryflight,String userName,int pantryId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_pantry('"+bagweightId+"','"+galley+"','"+maxweight+"','"+operations+"','"+perweight+"','"+ferryflight+"','"+userName+"',"+pantryId+",?); end;";
			System.out.println(" create  pantry : "+sqlStr);
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
