package com.loadsheet.process.ahmForm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.ahmForm.ASheet3RevisyonData;
import com.loadsheet.bean.data.ahmForm.AhmGetData;
import com.loadsheet.bean.data.user.UserHistoryData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;



public class AhmLoadProcess {
	
	public AhmGetData getAhmData(String aircraftCode,int  revisionId) {
		AhmGetData resData=new AhmGetData();
		try {
			BSheet1Process 	bSheet1			=new BSheet1Process();
			BSheet2Process 	bSheet2			=new BSheet2Process();
			Bsheet3Process 	bSheet3			=new Bsheet3Process();
			CSheet1Process 	cSheet1			=new CSheet1Process();
			CSheet2Process 	cSheet2			=new CSheet2Process();
			CSheet3Process 	cSheet3			=new CSheet3Process();
			CSheet4Process 	cSheet4			=new CSheet4Process();
			CSheet5Process 	cSheet5			=new CSheet5Process();
			CSheet6Process 	cSheet6			=new CSheet6Process();
			CSheet7Process 	cSheet7			=new CSheet7Process();
			CSheet8Process 	cSheet8			=new CSheet8Process();
			CSheet9Process 	cSheet9			=new CSheet9Process();
			CSheet11Process 	cSheet11		=new CSheet11Process();
			CSheet12Process 	cSheet12		=new CSheet12Process();
			CSheet13Process 	cSheet13		=new CSheet13Process();
			CSheet14Process 	cSheet14		=new CSheet14Process();
			DSheet1Process		dSheet1			=new DSheet1Process();
			DSheet2Process		dSheet2			=new DSheet2Process();
			DowDoiProcess			dowDoiData		=new DowDoiProcess();
			resData.setRevData(getAircraftRevisyonData(aircraftCode, revisionId));
			if(resData!=null && resData.getRevData()!=null && resData.getRevData().getRevisionId()!=null ) {
				resData.setStandartPaxBag(bSheet1.getStndrBagWeight(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setVaryByClassBagWeight(bSheet1.getVaryByClassBagWeight(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setCheckedBagWeight(bSheet1.getCheckedBagWeight(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setAssumptiondBagWeight(bSheet1.getAssumptiondBagWeight(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setCrewWeight(bSheet2.getCrewWeight(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setCrewBagWeight(bSheet2.getCrewBagWeight(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setDyOpWeightIndex(bSheet3.getDryOpWeightIndex(Integer.parseInt( resData.getRevData().getRevisionId())));			
				resData.setOutBalance(cSheet1.getBalanceOut(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setOutTrim(cSheet1.getTrimOut(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setAircraftWeightIndex(cSheet3.getAircraftWeightIndex(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setAircraftLimitations(cSheet4.getAircraftLimitations(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setLoadSheetLimitations(cSheet5.getLoadSheetLimitations(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setEffectfuel(cSheet6.getEffectFuel(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setSeatCocpiteAvarage(cSheet7.getSeatAvarage(Integer.parseInt( resData.getRevData().getRevisionId()),"COCKPIT"));
				resData.setSeatCabinAvarage(cSheet7.getSeatAvarage(Integer.parseInt( resData.getRevData().getRevisionId()),"CABIN"));
				resData.setCrewDistribution(cSheet7.getCrewDistribution(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setGallery(cSheet8.getGallery(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setPantry(cSheet8.getPantry(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setPaxCabin(cSheet9.getPassengerCabin(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setCabinSection(cSheet9.getCabinSection(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setClassCabinSection(cSheet9.getClassCabinSection(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setSeatPlan(cSheet11.getSeatPlan(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setComTrim(cSheet12.getComTrim(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setComLoadLimits(cSheet12.getComLoadLimit(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setComulative(cSheet12.getComulativeLoadLimit(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setSectionTrim(cSheet13.getSectionTrim(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setAsymLimit(cSheet13.getAsymLimit(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setCgLimit(dSheet1.getCGLimits(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setLoadDevice(dSheet2.getLoadDevice(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setBallast(cSheet14.getBallast(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setFormuleConstants(cSheet2.getFomuleConstants(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setStabTrim(cSheet2.getStabTrim(Integer.parseInt( resData.getRevData().getRevisionId())));
				resData.setDowDoiData(dowDoiData.getDowDoiLimits(Integer.parseInt( resData.getRevData().getRevisionId())));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally {
			
		}
		return resData;
	}
	
	
		
	/*----------------------------------------------A Sheet 1--------------------------------------------------------------------------------*/
	public  int insertAhmRevision(String aircraftCode,String revSheet,String multiPageInd,String seetIssueNo,String userName,String section ,String revDate){
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String sqlStr="";
		int bagweightId=0;
		try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_ahmrevision('"+aircraftCode+"','"+revSheet+"','"+multiPageInd+"','"+seetIssueNo+"','"+userName+"','"+section+"','"+revDate+"',?); end;";
				System.out.println("insertAhmRevision: "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.NUMBER);
				stm.execute();
				bagweightId = stm.getInt(1);
				System.out.println(" AHM insert revisyon : "+sqlStr+" result="+bagweightId);
				stm.close();
				//bagweightId=createBagweightId(revListId);
				
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return bagweightId;
	}
	
	public  ASheet3RevisyonData  getAircraftRevisyonData(String aircraftCode,int  revisionId){
		Connection conn				= ConnectionPool.getConnection();
		ASheet3RevisyonData revData	= null;
		String sqlString			= "";
		CallableStatement stm		= null;
		ResultSet rs				= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getaircrafrevisionlist('"+aircraftCode+"',"+revisionId+")}";
			System.out.println("aircraft revisyon data="+sqlString);
			stm = conn.prepareCall(sqlString);
			stm.registerOutParameter(1,OracleTypes.CURSOR);
			stm.execute();
			rs = (ResultSet)stm.getObject(1);
			while(rs.next()){
				revData=new ASheet3RevisyonData();					
				revData.setAircraftCode(Helper.checkNulls(rs.getString("aircraft_code"), ""));
				revData.setSection(Helper.checkNulls(rs.getString("section_str"), ""));
				revData.setRevisionId(Helper.checkNulls(rs.getString("ahmrevlist_id"), ""));	
				revData.setRevSheet(Helper.checkNulls(rs.getString("rev_sheet"), ""));
				revData.setMultiPageInd(Helper.checkNulls(rs.getString("multi_page_ind"), ""));
				revData.setSeetIssueNo(Helper.checkNulls(rs.getString("rev_sheet_issueno"), ""));
				revData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				revData.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
				revData.setRevDate(Helper.checkNulls(rs.getString("rev_date"), ""));
			}
			rs.close();
			stm.close();
			
			if(revData==null){
				int revID = insertAhmRevision(aircraftCode,"REV SHEET","MULTI PAGE","ISSUE NO","SYSTEM","SECTION",Helper.getToDate());
				sqlString = "{?=call  wghtandblnc.ahm_pkg01.getaircrafrevisionlist('"+aircraftCode+"',"+revID+")}";
				System.out.println("aircraft revisyon data="+sqlString);
				stm = conn.prepareCall(sqlString);
				stm.registerOutParameter(1,OracleTypes.CURSOR);
				stm.execute();
				rs = (ResultSet)stm.getObject(1);
				while(rs.next()){
					revData=new ASheet3RevisyonData();					
					revData.setAircraftCode(Helper.checkNulls(rs.getString("aircraft_code"), ""));
					revData.setSection(Helper.checkNulls(rs.getString("section_str"), ""));
					revData.setRevisionId(Helper.checkNulls(rs.getString("ahmrevlist_id"), ""));	
					revData.setRevSheet(Helper.checkNulls(rs.getString("rev_sheet"), ""));
					revData.setMultiPageInd(Helper.checkNulls(rs.getString("multi_page_ind"), ""));
					revData.setSeetIssueNo(Helper.checkNulls(rs.getString("rev_sheet_issueno"), ""));
					revData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
					revData.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
					revData.setRevDate(Helper.checkNulls(rs.getString("rev_date"), ""));
				}
			}
			
			
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn, stm, rs);
		}
		return revData;
	}
	
	public  List<ASheet3RevisyonData>   getAircraftAllRevisyonList(String aircraftCode,int  revisionId){
		Connection conn				= ConnectionPool.getConnection();
		List<ASheet3RevisyonData>  rList=new ArrayList();
		ASheet3RevisyonData revData	= null;
		String sqlString			= "";
		CallableStatement stm		= null;
		ResultSet rs				= null;
		try{	
			sqlString = "{?=call  wghtandblnc.ahm_pkg01.getaircrafrevisionlist('"+aircraftCode+"',"+revisionId+")}";
			System.out.println("aircraft All revisyon list="+sqlString);
			stm = conn.prepareCall(sqlString);
			stm.registerOutParameter(1,OracleTypes.CURSOR);
			stm.execute();
			rs = (ResultSet)stm.getObject(1);
			while(rs.next()){
				revData=new ASheet3RevisyonData();					
				revData.setAircraftCode(Helper.checkNulls(rs.getString("aircraft_code"), ""));
				revData.setSection(Helper.checkNulls(rs.getString("section_str"), ""));
				revData.setRevisionId(Helper.checkNulls(rs.getString("ahmrevlist_id"), ""));	
				revData.setRevSheet(Helper.checkNulls(rs.getString("rev_sheet"), ""));
				revData.setMultiPageInd(Helper.checkNulls(rs.getString("multi_page_ind"), ""));
				revData.setSeetIssueNo(Helper.checkNulls(rs.getString("rev_sheet_issueno"), ""));
				revData.setStatus(Helper.checkNulls(rs.getString("status"), ""));
				revData.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
				revData.setRevDate(Helper.checkNulls(rs.getString("rev_date"), ""));
				revData.setCreateName(Helper.checkNulls(rs.getString("create_user"), ""));
				rList.add(revData);
			}
			rs.close();
			stm.close();
			
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn, stm, rs);
		}
		return rList;
	}
	
	public List<UserHistoryData> getAhmHistory(int revisionID){
		Connection 				conn				= ConnectionPool.getConnection();
		List<UserHistoryData> 	historyList		= new ArrayList<UserHistoryData>();
		String					sql				= null;
		CallableStatement 		stm				= null;
		ResultSet				rs				= null;
		UserHistoryData 			obj				= null;
		try {
			sql = "{?=call  wghtandblnc.ahm_pkg01.getahmhistory("+revisionID+")}";
			System.out.println("AHM log history=="+sql);
			stm = conn.prepareCall(sql);
			stm.registerOutParameter(1,OracleTypes.CURSOR);
			stm.execute();
			rs = (ResultSet)stm.getObject(1);
			while (rs.next()) {
				obj=new UserHistoryData();
				obj.setUserName(Helper.checkNulls(rs.getString("user_name"), ""));
				obj.setCreateDate(Helper.checkNulls(rs.getString("create_date"), ""));
				obj.setCreateUser(Helper.checkNulls(rs.getString("user_name"), ""));
				obj.setLogType(Helper.checkNulls(rs.getString("history_code"), ""));
				obj.setLogText(Helper.checkNulls(rs.getString("history_text"), ""));
				historyList.add(obj);
			}
			rs.close();
			stm.close();
		} catch (Exception e) {
			Helper.errorLogger(AhmLoadProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn, stm, rs);
		}
		
		return historyList;
	}
	
	public  int createBagweightId(int revListId){
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		int bagweightId=0;
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_ahmbggweight_rlt('"+revListId+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.NUMBER);
				stm.execute();
				bagweightId = stm.getInt(1);
				System.out.println(" create bagweightId : "+sqlStr+" result="+bagweightId);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return bagweightId;
	}
	
	public  String createStdPaxBagWeight(String  bagweightId,String passangerType,String standart,String allFlights,String holidayCharter,String userName){
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="NOK";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_stndrbagweight('"+bagweightId+"','"+passangerType+"','"+standart+"','"+allFlights+"','"+holidayCharter+"','"+userName+"',?); end;";
		 	System.out.println("createStdPaxBagWeight: "+sqlStr);
			stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);
			System.out.println(" create standart passanger bag weight : "+sqlStr+" result="+result);
			stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	
	
	
	public  String createCrewWeight(String  bagweightId,String code,String standart,String male,String female,String userName){
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_crewweight('"+bagweightId+"','"+code+"','"+standart+"','"+male+"','"+female+"','"+userName+"',?); end;";
				System.out.println("createCrewWeight :"+ sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create crew weight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public  String createCrewBagWeight(String  bagweightId,String code,String cockpit,String cabin,String userName){
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_crewbagweight('"+bagweightId+"','"+code+"','"+cockpit+"','"+cabin+"','"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create crew bag weight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createDryOpeIndx(String bagweightId,String code,int dowinclude,int dowexclude,int doiinclude,int doiexclude,String remarks,String userName) {
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_dryopeindx('"+bagweightId+"','"+code+"','"+dowinclude+"','"+dowexclude+"','"+doiinclude+"','"+doiexclude+"','"+remarks+"','"+userName+"',?); end;";
			System.out.println(sqlStr);
			 	stm = conn.prepareCall(sqlStr);
			 	System.out.println("dryopeindx sql :"+sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createBalanceOutput(String bagweightId,String code,int enabled,String remarks,String userName) {
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_balanceoutput('"+bagweightId+"','"+code+"','"+enabled+"','"+remarks+"','"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create balance output index : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	
	public String createPaxTrimOutput(String bagweightId,String code,int enabled,String remarks,String userName) {
		Connection conn = ConnectionPool.getConnection();
		CallableStatement stm =null;
		String result="";
		String sqlStr="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_paxtrimoutput('"+bagweightId+"','"+code+"','"+enabled+"','"+remarks+"','"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create Pax trim output index : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createRegistrationDryOpeWeight(String bagweightId,String fleetweight,String fleetindex,String fwtailnumber,String fwweightadjustment,String fwindexadjustment, String fitailnumber,String fiweightadjustment,String fiindexadjustment,String userName,int weightType) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		=null;
		String 				result	="";
		String 				sqlStr	="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_aircraftdryopewei('"+bagweightId+"','"+fleetweight+"','"+fleetindex+"','"+fwtailnumber+"','"+fwweightadjustment+"','"+fwindexadjustment+"','"+fitailnumber+"','"+fiweightadjustment+"','"+fiindexadjustment+"','"+userName+"',"+weightType+",?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create Registration Dry Ope Weight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createRegistrationBasicWeight(String bagweightId,String fleetweight,String fleetindex,String fwtailnumber,String fwweightadjustment,String fwindexadjustment, String fitailnumber,String fiweightadjustment,String fiindexadjustment,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		=null;
		String 				result	="";
		String 				sqlStr	="";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_aircraftbasicwei('"+bagweightId+"','"+fleetweight+"','"+fleetindex+"','"+fwtailnumber+"','"+fwweightadjustment+"','"+fwindexadjustment+"','"+fitailnumber+"','"+fiweightadjustment+"','"+fiindexadjustment+"','"+userName+"',?); end;";
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" create Registration Basic Weight : "+sqlStr+" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	
	public String createAircraftWeightLimitations(String bagweightId,String tailnumber,String rampTaxi,String takeOff, String zeroFuel,String landing,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			tailnumber = Helper.removeChar(tailnumber, '<');
			tailnumber = Helper.removeChar(tailnumber, '>');
			tailnumber = Helper.removeChar(tailnumber, '"');
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_aircraftweightlimitations('"+bagweightId+"','"+tailnumber+"','"+Helper.string2int(rampTaxi)+"','"+Helper.string2int(takeOff)+"','"+Helper.string2int(zeroFuel)+"','"+Helper.string2int(landing)+"','"+userName+"',?); end;";
			System.out.println(" create aircraft weight limitations : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	
	public String createLimitsPurposes(String bagweightId,String limitcode, String weight,String operations,String index,String userName,int llpId) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_limit_loadsheet_purposes("+bagweightId+",'"+limitcode+"',"+weight+",'"+operations+"',"+Helper.string2Double(index, 0)+",'"+userName+"',"+llpId+",?); end;";
			System.out.println(" create Limits Purposes : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String calculateLandingLimits(String bagweightId,String limitcode) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.calculatelandinglimits("+bagweightId+",'"+limitcode+"',?); end;";
			System.out.println(" create Limits Purposes : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
			 
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
//================== C SHEET 6 START
	public String createEffectFuel(String bagweightId,String proceduretype,String fueldensity,String weight, String operations,String fuelindex,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_effect_fuel("+bagweightId+",'"+proceduretype+"',"+Helper.string2Double(fueldensity, 0)+","+weight+",'"+operations+"',"+Helper.string2Double(fuelindex, 0)+",'"+userName+"',?); end;";
			System.out.println(" create effect fuel : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
//>>>>>>>>>>>>>>>>>C SHEET 6 END

//================== C SHEET 7 START
	public String createCrewSeats(String bagweightId,String crewcode,String crewdesc,String crwseatloc, String maxseat,String weight,String lengthoperations, String unitlength,String arm,String operations,String perweightunit,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_cockpitcabin_crew('"+bagweightId+"','"+crewcode+"','"+crewdesc+"','"+crwseatloc+"','"+maxseat+"','"+weight+"','"+lengthoperations+"','"+unitlength+"','"+arm+"','"+operations+"','"+perweightunit+"','"+userName+"',?); end;";
			System.out.println(" create cockpit cabin crew seats : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	
	public String createCrewCode(String bagweightId,String crwcode,String cockpitcrew,String cabincrew, String location,String loccrwbaggage,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_crew_code('"+bagweightId+"','"+crwcode+"','"+cockpitcrew+"','"+cabincrew+"','"+location+"','"+loccrwbaggage+"','"+userName+"',?); end;";
			System.out.println(" create  crew code : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
//>>>>>>>>>>>>>>>>>C SHEET 7 END
	
//================== C SHEET 8 START
	public String createGalley(String bagweightId,String galleylocation,String maxweight,String armoperations, String unitlength,String operations,String perweightunit,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_galley("+bagweightId+",'"+galleylocation+"',"+Helper.string2Double(maxweight, 0)+",'"+armoperations+"',"+Helper.string2Double(unitlength, 0)+",'"+operations+"',"+Helper.string2Double(perweightunit, 0)+",'"+userName+"',?); end;";
			System.out.println(" create  galley : "+sqlStr);
			stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);
			System.out.println(" result="+result);
			stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createPantry(String bagweightId,String galley,String maxweight,String lengtharm, String arm,String operations,String perweight,String intway1,String intway2,String domway1,String domway2,String ferryflight,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_pantry('"+bagweightId+"','"+galley+"','"+maxweight+"','"+lengtharm+"','"+arm+"','"+operations+"','"+perweight+"','"+intway1+"','"+intway2+"','"+domway1+"','"+domway2+"','"+ferryflight+"','"+userName+"',?); end;";
			System.out.println(" create  pantry : "+sqlStr);
			stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);
			System.out.println(" result="+result);
			stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
//>>>>>>>>>>>>>>>>>C SHEET 8 END
	
//================== C SHEET 9 START
	public String createPassengerCabin(String bagweightId,String cabinname,String class1,String class2, String class3,String class4,String class5,String totalcabinsection,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_passenger_cabin('"+bagweightId+"','"+cabinname+"','"+class1+"','"+class2+"','"+class3+"','"+class4+"','"+class5+"','"+totalcabinsection+"','"+userName+"',?); end;";
			System.out.println(" create  passengercabin : "+sqlStr);
			stm = conn.prepareCall(sqlStr);
			stm.registerOutParameter(1, OracleTypes.VARCHAR);
			stm.execute();
			result = stm.getString(1);
			System.out.println(" result="+result);
			stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createCabinSection(String bagweightId,String cabinsection,String rownumbers,String totalseats,String armoperations, String armstation,String arm,String influenceoperation,String perweightunit,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_cabin_section('"+bagweightId+"','"+cabinsection+"','"+rownumbers+"','"+totalseats+"','"+armoperations+"','"+armstation+"','"+arm+"','"+influenceoperation+"','"+perweightunit+"','"+userName+"',?); end;";
			System.out.println(" create  cabin section : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
	public String createClassCabinSection(String bagweightId,String cabinsection,String lengthoperations,String lengthunit,String indexoperation, String perweightunit,String userName) {
		Connection 			conn 	= ConnectionPool.getConnection();
		CallableStatement 	stm 		= null;
		String 				result	= "";
		String 				sqlStr	= "";
		try{
			sqlStr = "begin wghtandblnc.ahm_pkg01.ins_class_cabin_section('"+bagweightId+"','"+cabinsection+"','"+lengthoperations+"','"+lengthunit+"','"+indexoperation+"','"+perweightunit+"','"+userName+"',?); end;";
			System.out.println(" create Class cabin section : "+sqlStr);
			 	stm = conn.prepareCall(sqlStr);
				stm.registerOutParameter(1, OracleTypes.VARCHAR);
				stm.execute();
				result = stm.getString(1);
				System.out.println(" result="+result);
				stm.close();
		}
		catch(Exception e){
			Helper.errorLogger(AhmLoadProcess.class, e);
		}
		finally {
			ConnectionPool.closeConnection(conn,stm,null);
		}
		return result;
	}
	
//>>>>>>>>>>>>>>>>>C SHEET 9 END
	
//================== C SHEET 11 START
		public String createSeatplanLayout(String bagweightId,String cabinsection,String rowno,String rowletter_a, String rowletter_b,String rowletter_c,String rowletter_d, String rowletter_e,String rowletter_f,String lengtharm,String operations,String perweightunit,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_seatplan_layout('"+bagweightId+"','"+cabinsection+"','"+rowno+"','"+rowletter_a+"','"+rowletter_b+"','"+rowletter_c+"','"+rowletter_d+"','"+rowletter_e+"','"+rowletter_f+"','"+lengtharm+"','"+operations+"','"+perweightunit+"','"+userName+"',?); end;";
				System.out.println(" create seatplan layout : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
				 
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
		
//>>>>>>>>>>>>>>>>>C SHEET 11 END
		
//================== C SHEET 12 START
		public String createCompartmentDetail(String bagweightId,String compartmentnumber,String description,String grossweight, String volume,String lengtharm,String operations, String perweightunit,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_compartment_detail('"+bagweightId+"','"+compartmentnumber+"','"+description+"','"+grossweight+"','"+volume+"','"+lengtharm+"','"+operations+"','"+perweightunit+"','"+userName+"',?); end;";
				System.out.println(" create compartment detail : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
				 
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
		
		public String createCombinedLoadLimits(String bagweightId,String cptorhold1,String cptorhold2,String cptorhold3, String maxcombined,String remarks,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_combined_load_limits('"+bagweightId+"','"+cptorhold1+"','"+cptorhold2+"','"+cptorhold3+"','"+maxcombined+"','"+remarks+"','"+userName+"',?); end;";
				System.out.println(" create  combined load limits: "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
		
		public String createComulativeLoadLimits(String bagweightId,String condition,String zonename,String zonefrom, String zoneto,String maxweight,String maxcomulative,String operations,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_comulative_load_limits('"+bagweightId+"','"+condition+"','"+zonename+"','"+zonefrom+"','"+zoneto+"','"+maxweight+"','"+maxcomulative+"','"+operations+"','"+userName+"',?); end;";
				System.out.println(" create comulative load limits: "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
//>>>>>>>>>>>>>>>>>C SHEET 12 END

//================== C SHEET 13 START
		public String createBayDetailTrim(String bagweightId,String baysection,String grossweight,String volume,String lengtharm, String operations,String perweightunit,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_bay_detail_trim('"+bagweightId+"','"+baysection+"','"+grossweight+"','"+volume+"','"+lengtharm+"','"+operations+"','"+perweightunit+"','"+userName+"',?); end;";
				System.out.println(" create bay detail trim : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
		
		public String createAsymmetricalLimitations(String bagweightId,String referanceweightcode,String lateralimbalance,String referanceweight,String mac,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_asymmetrical_limitations('"+bagweightId+"','"+referanceweightcode+"','"+lateralimbalance+"','"+referanceweight+"','"+mac+"','"+userName+"',?); end;";
				System.out.println(" create asymmetrical limitations : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
//>>>>>>>>>>>>>>>>>C SHEET 13 END

//================== C SHEET 14 START

		public String createBallast(String bagweightId,String yesno,String ballastlocation,String weight,String ballindex,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_ballast('"+bagweightId+"','"+yesno+"','"+ballastlocation+"','"+weight+"','"+ballindex+"','"+userName+"',?); end;";
				System.out.println(" create ballast : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
//>>>>>>>>>>>>>>>>>C SHEET 14 END
		
//================== D SHEET 1 START

		public String createCgLimits(String bagweightId,String weight,String operations,String cgvalue,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_cg_limits('"+bagweightId+"','"+weight+"','"+operations+"','"+cgvalue+"','"+userName+"',?); end;";
				System.out.println(" create cg limits : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
//>>>>>>>>>>>>>>>>>D SHEET 1 END

		//================== D SHEET 2 START

		public String createLoadDeviceDetail(String bagweightId,String typecode,String tareweight,String grossweight,String volume,String positionrestriction,String heightrestriction,String deviceremarks ,String userName) {
			Connection 			conn 	= ConnectionPool.getConnection();
			CallableStatement 	stm 		= null;
			String 				result	= "";
			String 				sqlStr	= "";
			try{
				sqlStr = "begin wghtandblnc.ahm_pkg01.ins_load_device_detail('"+bagweightId+"','"+typecode+"','"+tareweight+"','"+grossweight+"','"+volume+"','"+positionrestriction+"','"+heightrestriction+"','"+deviceremarks+"','"+userName+"',?); end;";
				System.out.println(" create load device detail : "+sqlStr);
				 	stm = conn.prepareCall(sqlStr);
					stm.registerOutParameter(1, OracleTypes.VARCHAR);
					stm.execute();
					result = stm.getString(1);
					System.out.println(" result="+result);
					stm.close();
			}
			catch(Exception e){
				Helper.errorLogger(AhmLoadProcess.class, e);
			}
			finally {
				ConnectionPool.closeConnection(conn,stm,null);
			}
			return result;
		}
//>>>>>>>>>>>>>>>>>D SHEET 2 END
		
		
}
