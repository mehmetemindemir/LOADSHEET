package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.CSheet.EffectFuel;
import com.loadsheet.bean.data.CSheet.EffectFuelMain;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class CSheet6Process {
	public String createEffectFuel(String bagweightId,String proceduretype,String fueldensity,String weight, String operations,String fuelindex,String userName,int efid) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_effect_fuel('"+bagweightId+"','"+proceduretype+"',"+Helper.string2Double(fueldensity, 0)+","+Helper.string2Double(weight,0)+",'"+operations+"',"+Helper.string2Double(fuelindex, 0)+",'"+userName+"',"+efid+",?); end;";
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
	public String updateAllStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_All_effect_fuel_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public  EffectFuelMain  getEffectFuel(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		EffectFuel 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		EffectFuelMain res=new EffectFuelMain();
		
		 List<EffectFuel> dataList=new ArrayList<EffectFuel>();
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getEffectFuel("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
				data=new EffectFuel();	
				data.setAhmRevId(rs.getInt("ahmrevlist_id"));
				data.setWeight(rs.getDouble("weight"));
				data.setOpera(rs.getString("operations"));
				data.setFuelIndex(rs.getDouble("fuel_index"));
				data.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				data.setEfID(rs.getInt("ef_id"));
				res.setFuelDensity(rs.getString("fuel_density"));
				res.setProcedureName(rs.getString("procedure_type"));
				dataList.add(data);
			}
			res.setData(dataList);
			
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
