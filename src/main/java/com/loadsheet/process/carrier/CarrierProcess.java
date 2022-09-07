package com.loadsheet.process.carrier;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.AjaxResponse;
import com.loadsheet.bean.data.carrier.CarrierData;
import com.loadsheet.bean.data.carrier.HandlingCarrierData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.OracleTypes;

public class CarrierProcess {

	

	public AjaxResponse getCarrierList() {
		List<CarrierData> carList = new ArrayList<CarrierData>();
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res = new AjaxResponse();
		res.setStatus("NOK");
		String sqlString = null;
		ResultSet rs = null;
		CallableStatement stmt = null;
		CarrierData carier = null;
		try {
			sqlString = "{?=call company_carrier_pkg.carrierlist }";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(1);
			while (rs.next()) {
				carier = new CarrierData();
				// airline_name,iata_designator,three_digit_code,icao_designator
				carier.setAirlineName(Helper.checkNulls(rs.getString("airline_name"), ""));
				carier.setIataCode(Helper.checkNulls(rs.getString("three_digit_code"), ""));
				carier.setIataDes(Helper.checkNulls(rs.getString("iata_designator"), ""));
				carier.setIcaoDes(Helper.checkNulls(rs.getString("icao_designator"), ""));
				carList.add(carier);
			}
			res.setStatus("OK");
			res.setData(carList);
		} catch (Exception e) {
			Helper.errorLogger(CarrierProcess.class, e);
		} finally {
			ConnectionPool.closeConnection(conn, stmt, rs);
		}
		return res;
	}

	public AjaxResponse getCompanyCarrierList(int companyId, String carrierId) {
		List<HandlingCarrierData> carList = new ArrayList<HandlingCarrierData>();
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res = new AjaxResponse();
		res.setStatus("NOK");
		String sqlString = null;
		ResultSet rs = null;
		CallableStatement stmt = null;
		HandlingCarrierData carier = null;
		try {
			sqlString = "{?=call company_carrier_pkg.companycarrierlist(" +companyId+ ","
					+ Helper.checkNullintDB(carrierId) + ")  }";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			rs = (ResultSet) stmt.getObject(1);
			while (rs.next()) {
				carier = new HandlingCarrierData();
				// compcarrierid as
				// carrier_id,company_id,airline_code,billing_addr1,billing_addr2,zip_code,city_name,country_code,status
				carier.setCarrierId(Helper.checkNulls(rs.getString("carrier_id"), ""));
				carier.setCompanyId(Helper.checkNulls(rs.getString("company_id"), ""));
				carier.setCarrierCode(Helper.checkNulls(rs.getString("airline_code"), ""));
				carier.setBillingCode(Helper.utfConvJetmilStrNew(Helper.checkNulls(rs.getString("billing_addr1"), "")));
				carier.setBillingCode2(Helper.utfConvJetmilStrNew(Helper.checkNulls(rs.getString("billing_addr2"), "")));
				carier.setZipCode(Helper.checkNulls(rs.getString("zip_code"), ""));
				carier.setCityName(Helper.utfConvJetmilStrNew(Helper.checkNulls(rs.getString("city_name"), "")));
				carier.setCountryCode(Helper.checkNulls(rs.getString("country_code"), ""));
				carier.setCompanyName(Helper.utfConvJetmilStrNew(Helper.checkNulls(rs.getString("company_name"), "")));
				carier.setAirlineName(Helper.checkNulls(rs.getString("airline_name"), ""));
				carier.setSatus(Helper.checkNulls(rs.getString("status"), ""));
				carList.add(carier);
			}
			res.setStatus("OK");
			res.setData(carList);
		} catch (Exception e) {
			Helper.errorLogger(CarrierProcess.class, e);
		} finally {
			ConnectionPool.closeConnection(conn, stmt, rs);
		}
		return res;
	}

	public AjaxResponse insCompanyCarrier(int companyid, String airlinecode, String billingaddr1,
			String billingaddr2, String zipcode, String cityname, String countrycode, String username) {
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res = new AjaxResponse();
		res.setStatus("NOK");
		CallableStatement stmt = null;
		try {
			String sqlString = "begin company_carrier_pkg.ins_companycarrier(" +companyid+ ","
					+ Helper.checkNullStringDB(airlinecode) + "," + Helper.checkNullStringDB(Helper.getTurkish(Helper.utfConvJetmilStrNew(billingaddr1) ))+ ","
					+ Helper.checkNullStringDB(Helper.getTurkish(Helper.utfConvJetmilStrNew(billingaddr2) ))+ "," + Helper.checkNullStringDB(zipcode) + ","
					+ Helper.checkNullStringDB(Helper.getTurkish(Helper.utfConvJetmilStrNew(cityname) ))+ "," + Helper.checkNullStringDB(countrycode) + ","
					+ Helper.checkNullStringDB(username) + ",?); end;";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.registerOutParameter(1, Types.VARCHAR);
			stmt.execute();			
			res.setStatus( stmt.getString(1));
		} catch (Exception e) {
			Helper.errorLogger(CarrierProcess.class, e);
		} finally {

			ConnectionPool.closeConnection(conn, stmt, null);
		}
		return res;

	}
	
	public AjaxResponse updateCompanyCarrier(int companyid, int carrierId, String billingaddr1,
			String billingaddr2, String zipcode, String cityname, String countrycode, String username,String status) {
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res = new AjaxResponse();
		res.setStatus("NOK");
		CallableStatement stmt = null;
		try {
			String sqlString = "begin company_carrier_pkg.upd_companycarrier(" +companyid+ ","
					+carrierId+ "," + Helper.checkNullStringDB(Helper.getTurkish(Helper.utfConvJetmilStrNew(billingaddr1))) + ","
					+ Helper.checkNullStringDB(Helper.getTurkish(Helper.utfConvJetmilStrNew(billingaddr2))) + "," + Helper.checkNullStringDB(zipcode) + ","
					+ Helper.checkNullStringDB(Helper.getTurkish(Helper.utfConvJetmilStrNew(cityname) ))+ "," + Helper.checkNullStringDB(countrycode) + ","
					+ Helper.checkNullStringDB(username) + "," + Helper.checkNullStringDB(status) + "); end;";
			System.out.println(sqlString);
			stmt = conn.prepareCall(sqlString);
			stmt.execute();
			res.setStatus("OK");
		} catch (Exception e) {
			Helper.errorLogger(CarrierProcess.class, e);
		} finally {

			ConnectionPool.closeConnection(conn, stmt, null);
		}
		return res;

	}

	public AjaxResponse delCompanyCarrier(int companyid, int carrierId, String username) {
		Connection conn = ConnectionPool.getConnection();
		AjaxResponse res = new AjaxResponse();
		res.setStatus("NOK");
		CallableStatement stmt = null;
		try {
			String sqlString = "begin company_carrier_pkg.delete_companycarrier(" +companyid	+ "," +carrierId+ "," + Helper.checkNullStringDB(username)+ ");  end;";
			System.out.println(sqlString);			
			stmt = conn.prepareCall(sqlString);
			stmt.execute();			
			res.setStatus( "OK");
		} catch (Exception e) {
			Helper.errorLogger(CarrierProcess.class, e);
		} finally {

			ConnectionPool.closeConnection(conn, stmt, null);
		}
		return res;

	}

}
