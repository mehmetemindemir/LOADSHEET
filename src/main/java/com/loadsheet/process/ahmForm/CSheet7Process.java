package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.CrewDistribution;
import com.loadsheet.bean.data.CSheet.SeatAvarageLocation;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet7Process {
	
	public String updateAllStatus(String bagweightId,String userName,String  code) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_cockpit_status('"+bagweightId+"','"+userName+"','"+code+"',?); end;";
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
	public String updateAllCrewCodeStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_crewcode_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public String createCrewCode(String bagweightId,String crwcode,String cockpitcrew,String cabincrew, String location,String loccrwbaggage,String userName,int cdId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_crew_code('"+bagweightId+"','"+crwcode+"','"+cockpitcrew+"','"+cabincrew+"','"+location+"','"+loccrwbaggage+"','"+userName+"',"+cdId+",?); end;";
			System.out.println(" create  crew code : "+sqlStr);
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
	public String createCrewSeats(String bagweightId,String crewcode,String crewdesc,String crwseatloc, String maxseat,String weight,String lengthoperations, String unitlength,String arm,String operations,String perweightunit,String userName,int ccsId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_cockpitcabin_crew("+bagweightId+",'"+crewcode+"','"+crewdesc+"','"+crwseatloc+"','"+maxseat+"',"+weight+",'"+lengthoperations+"','"+unitlength+"','"+arm+"','"+operations+"','"+perweightunit+"','"+userName+"',"+ccsId+",?); end;";
			System.out.println(" create cockpit cabin crew seats : "+sqlStr);
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
	public  List<CrewDistribution>  getCrewDistribution(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		CrewDistribution 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<CrewDistribution> res=new ArrayList<CrewDistribution>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCrewCode("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new CrewDistribution();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));
					data.setCdId(rs.getInt("cd_id"));
					data.setCrewCode(Helper.checkNulls(rs.getString("crw_code"), ""));
					data.setCockpitCrew(rs.getInt("cockpit_crew"));
					data.setLocation(Helper.checkNulls(rs.getString("location"), ""));
					data.setLoccrwBag(Helper.checkNulls(rs.getString("loc_crw_baggage"), ""));
					data.setCabinCrew(rs.getInt("cabin_crew"));					
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
	public  List<SeatAvarageLocation>  getSeatAvarage(int  revisionId,String code){
		Connection 						conn			= ConnectionPool.getConnection();
		SeatAvarageLocation 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<SeatAvarageLocation> res=new ArrayList();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getCockpitCabinCrew("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				if(Helper.checkNulls(rs.getString("code"), "").equals(code)) {
					data=new SeatAvarageLocation();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));
					data.setArm(rs.getDouble("arm"));
					data.setCrewCode(Helper.checkNulls(rs.getString("code"), ""));
					data.setCrewLocation(Helper.checkNulls(rs.getString("crw_seat_loc"), ""));
					data.setLenghtOperate(Helper.checkNulls(rs.getString("length_operations"), ""));
					data.setOperate(Helper.checkNulls(rs.getString("operations"), ""));
					data.setPerUnitWeight(rs.getDouble("per_weight_unit"));
					data.setUnitLenght(rs.getDouble("unit_length"));
					data.setCcsId(rs.getInt("ccs_id"));
					data.setMaxCockSeat(rs.getInt("max_seat"));
					data.setWeight(rs.getDouble("weight"));
					res.add(data);
				}
				
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
}
