package com.loadsheet.process.company;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.AjaxResponse;
import com.loadsheet.bean.data.company.CompanyData;
import com.loadsheet.bean.data.company.CompanyProcessCount;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.OracleTypes;

public class CompanyProcess {

	public AjaxResponse insCompany(String userName,String companyName,String location) {
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res=new AjaxResponse();
		res.setStatus("NOK");
		CallableStatement stmt=null; 
		try{
			String sqlString = "begin company_carrier_pkg.ins_company("+Helper.checkNullStringDB(companyName)+","+Helper.checkNullStringDB(location)+",'A',"+Helper.checkNullStringDB(userName)+"); end;";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.execute();
			res.setStatus("OK");
		}catch(Exception e){
			Helper.errorLogger(CompanyProcess.class, e);
		}finally{
			
			ConnectionPool.closeConnection(conn,stmt,null);
		}
		return res;
	}
	public AjaxResponse delCompany(String userName,String companyId) {
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res=new AjaxResponse();
		res.setStatus("NOK");
		CallableStatement stmt=null; 
		try{
			String sqlString = "begin  company_carrier_pkg.delete_company("+Helper.checkNullintDB(companyId)+","+Helper.checkNullStringDB(userName)+"); end;";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.execute();
			res.setStatus("OK");
		}catch(Exception e){
			Helper.errorLogger(CompanyProcess.class, e);
		}finally{
			
			ConnectionPool.closeConnection(conn,stmt,null);
		}
		return res;
	}
	public AjaxResponse getCompanyList(String  companyId) {
		List<CompanyData> compList=new ArrayList<CompanyData>();
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res=new AjaxResponse();
		res.setStatus("NOK");
		String sqlString=null;
		ResultSet rs =null;
		CallableStatement stmt=null;
		CompanyData company=null;
		try {
			sqlString = "{?=call company_carrier_pkg.campnaylist("+companyId+") }";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(1);
			while (rs.next()) {
				company=new CompanyData(); 
				company.setCompanyName(Helper.checkNulls(rs.getString("company_name"), ""));
				company.setLocation( Helper.checkNulls(rs.getString("company_location"), ""));
				company.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
				company.setCreateUser(Helper.checkNulls(rs.getString("create_user"), ""));
				company.setCompanyId(Helper.checkNulls(rs.getString("company_id"), ""));
				compList.add(company);
			}
			res.setStatus("OK");
			res.setData(compList);
		}catch(Exception e){
			Helper.errorLogger(CompanyProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn,stmt,rs);
		}
		return res;
	}
	public AjaxResponse companyTotalChecked(){
		List<CompanyProcessCount> compPList=new ArrayList<CompanyProcessCount>();
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res=new AjaxResponse();
		res.setStatus("NOK");
		String sqlString=null;
		ResultSet rs =null;
		CallableStatement stmt=null;
		CompanyProcessCount companyP=null;
		try {
			sqlString = "{?=call DCS_PKG_03.companyTotalCheck }";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(1);
			while (rs.next()) {
				companyP=new CompanyProcessCount(); 
				companyP.setCompany(Helper.checkNulls(rs.getString("company"), ""));
				companyP.setDate(Helper.checkNulls(rs.getString("cpdate"), ""));
				companyP.setTotalChecked(Helper.checkNulls(rs.getString("CheckedPaxCount"), ""));
				compPList.add(companyP);
			}
			res.setStatus("OK");
			res.setData(compPList);
		}catch(Exception e){
			Helper.errorLogger(CompanyProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn,stmt,rs);
		}
		return res;
	}
}
