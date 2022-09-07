package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.DSheet.LoadDeviceDetail;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;

public class DSheet2Process {
	public String updateAllLoadDeviceStatus(String bagweightId,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.upd_all_load_device_status('"+bagweightId+"','"+userName+"',?); end;";
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
	public  List<LoadDeviceDetail>  getLoadDevice(int  revisionId){
		Connection 						conn			= ConnectionPool.getConnection();
		LoadDeviceDetail 				data	= null;
		String 							sqlString 	= "";
		CallableStatement 				st			= null;
		ResultSet 						rs 			= null;
		List<LoadDeviceDetail> res=new ArrayList<LoadDeviceDetail>();
		
		
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getLoadDeviceDetail("+revisionId+")}";
			System.out.println("DryOpWeightIndex data="+sqlString);
			st= conn.prepareCall(sqlString);
			st.registerOutParameter(1,OracleTypes.CURSOR);
			st.execute();
			rs = (ResultSet)st.getObject(1);
			while(rs.next()){
					data=new LoadDeviceDetail();	
					data.setAhmRevId(rs.getInt("ahmrevlist_id"));		
					data.setTypeCode(Helper.checkNulls(rs.getString("type_code"), ""));
					data.setDeviceRemark(Helper.checkNulls(rs.getString("device_remarks"), ""));
					data.setTareWeight(rs.getInt("tare_weight"));
					data.setGrossWeight(rs.getInt("gross_weight"));
					data.setVolume(rs.getInt("volume"));
					data.setPositionRest(rs.getInt("position_restriction"));
					data.setHeightRest(rs.getInt("height_restriction"));
					data.setLoadDeviceId(rs.getInt("load_device_id"));
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
	public String createLoadDeviceDetail(String bagweightId,String typecode,String tareweight,String grossweight,String volume,String positionrestriction,String heightrestriction,String deviceremarks ,String userName,int LoadDeviceId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_load_device_detail('"+bagweightId+"','"+typecode+"','"+tareweight+"','"+grossweight+"','"+volume+"','"+positionrestriction+"','"+heightrestriction+"','"+deviceremarks+"','"+userName+"',"+LoadDeviceId+",?); end;";
			System.out.println(" create load device detail : "+sqlStr);
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
