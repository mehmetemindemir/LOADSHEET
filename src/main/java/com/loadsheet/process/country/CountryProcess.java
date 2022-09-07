package com.loadsheet.process.country;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.AjaxResponse;
import com.loadsheet.bean.data.country.CountryData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.OracleTypes;

public class CountryProcess {
	public AjaxResponse getCountryList() {		
		List<CountryData> countList=new ArrayList<CountryData>();
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res=new AjaxResponse();
		res.setStatus("NOK");
		String sqlString=null;
		ResultSet rs =null;
		CallableStatement stmt=null;
		CountryData country=null;
		try {
			sqlString = "{?=call  company_utility.countrylist }";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(1);
			while (rs.next()) {
				country=new CountryData(); 
				country.setCountryName(Helper.checkNulls(rs.getString("country_name"), ""));
				country.setCountryCode(Helper.checkNulls(rs.getString("country_code"), ""));
				country.setNationalityCode(Helper.checkNulls(rs.getString("nationality_code"), ""));
				country.setCurrencyCode(Helper.checkNulls(rs.getString("currency_code"), ""));
				countList.add(country);
			}
			res.setStatus("OK");
			res.setData(countList);
		}catch(Exception e){
			Helper.errorLogger(CountryProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn,stmt,rs);
		}
		return res;
	}
	
}
