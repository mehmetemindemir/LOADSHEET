package com.loadsheet.process.flight;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.loadsheet.bean.data.CSheet.LimitationOfLoadSheet;
import com.loadsheet.bean.data.flight.LoadSheetFlightData;
import com.loadsheet.bean.data.flight.LoadSheetFlightOutputData;
import com.loadsheet.bean.data.user.UserData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Constants;
import com.loadsheet.util.Helper;

import oracle.jdbc.internal.OracleTypes;


public class GetLoadSheetFlightDetail{
	
	public LoadSheetFlightData getFlightDetail(String voyageCode, int companyID){
		LoadSheetFlightData lfd = new LoadSheetFlightData();
		Connection conn = ConnectionPool.getConnection();
		try{
			String sqlString = "begin wghtandblnc.loadsheet_pkg.getflightdetail("+Helper.checkNullStringDB(voyageCode)+","+companyID+",?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.getflightdetail(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setString(1, voyageCode);
			sqlStmt.setInt(2, companyID);
			sqlStmt.registerOutParameter(3, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(4, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(5, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(6, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(7, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(8, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(9, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(10, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(11, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(12, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(13, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(14, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(15, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(16, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(17, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(18, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(19, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(20, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(21, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(22, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(23, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(24, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(25, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(26, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(27, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(28, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(29, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(30, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(31, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(32, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(33, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(34, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(35, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(36, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(37, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(38, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(39, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(40, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(41, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(42, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(43, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(44, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(45, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(46, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(47, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(48, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(49, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(50, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(51, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(52, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(53, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(54, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(55, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(56, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(57, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(58, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(59, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(60, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(61, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(62, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(63, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(64, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(65, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(66, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(67, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(68, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(69, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(70, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(71, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(72, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(73, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(74, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(75, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(76, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(77, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(78, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(79, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(80, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(81, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(82, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(83, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(84, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(85, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(86, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(87, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(88, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(89, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(90, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(91, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(92, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(93, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(94, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(95, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(96, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(97, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(98, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(99, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(100, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(101, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(102, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(103, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(104, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(105, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(106, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(107, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(108, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(109, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(110, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(111, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(112, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(113, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(114, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(115, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(116, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(117, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(118, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(119, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(120, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(121, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(122, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(123, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(124, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(125, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(126, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(127, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(128, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(129, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(130, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(131, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(132, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(133, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(134, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(135, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(136, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(137, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(138, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(139, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(140, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(141, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(142, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(143, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(144, OracleTypes.NUMBER);
			sqlStmt.registerOutParameter(145, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(146, OracleTypes.VARCHAR);
			sqlStmt.execute();
			lfd.voyageCode = voyageCode;
			lfd.companyID = companyID;
			lfd.departureDate = sqlStmt.getString(3);
			lfd.originCode = sqlStmt.getString(4);
			lfd.originDest = sqlStmt.getString(5);
			lfd.destinationCode = sqlStmt.getString(6);
			lfd.destinationDesc = sqlStmt.getString(7);
			lfd.flightNumber = sqlStmt.getString(8);
			lfd.aircraft = sqlStmt.getString(9);
			lfd.zoneA = sqlStmt.getInt(10);
			lfd.zoneB = sqlStmt.getInt(11);
			lfd.zoneC = sqlStmt.getInt(12);
			lfd.zoneD = sqlStmt.getInt(13);
			lfd.firstLegTo = sqlStmt.getString(14);
			lfd.firstLegMale = sqlStmt.getInt(15);
			lfd.firstLegFeMale = sqlStmt.getInt(16);
			lfd.firstLegADT = sqlStmt.getInt(17);
			lfd.firstLegCHD = sqlStmt.getInt(18);
			lfd.firstLegINF = sqlStmt.getInt(19);
			lfd.firstLegPAD = sqlStmt.getInt(20);
			lfd.isSecondLeg = sqlStmt.getInt(21);
			lfd.secondLegTo = sqlStmt.getString(22);
			lfd.secondLegMale = sqlStmt.getInt(23);
			lfd.secondLegFeMale = sqlStmt.getInt(24);
			lfd.secondLegADT = sqlStmt.getInt(25);
			lfd.secondLegCHD = sqlStmt.getInt(26);
			lfd.secondLegINF = sqlStmt.getInt(27);
			lfd.secondLegPAD = sqlStmt.getInt(28);
			lfd.zoneALimit = sqlStmt.getInt(29);
			lfd.zoneBLimit = sqlStmt.getInt(30);
			lfd.zoneCLimit = sqlStmt.getInt(31);
			lfd.zoneDLimit = sqlStmt.getInt(32);
			lfd.totalPaxLggWeight = sqlStmt.getInt(33);
			lfd.zoneAMale = sqlStmt.getInt(34);
			lfd.zoneAFemale = sqlStmt.getInt(35);
			lfd.zoneAChild = sqlStmt.getInt(36);
			lfd.zoneAInf = sqlStmt.getInt(37);
			lfd.zoneBMale = sqlStmt.getInt(38);
			lfd.zoneBFemale = sqlStmt.getInt(39);
			lfd.zoneBChild = sqlStmt.getInt(40);
			lfd.zoneBInf = sqlStmt.getInt(41);
			lfd.zoneCMale = sqlStmt.getInt(42);
			lfd.zoneCFemale = sqlStmt.getInt(43);
			lfd.zoneCChild = sqlStmt.getInt(44);
			lfd.zoneCInf = sqlStmt.getInt(45);
			lfd.zoneDMale = sqlStmt.getInt(46);
			lfd.zoneDFemale = sqlStmt.getInt(47);
			lfd.zoneDChild = sqlStmt.getInt(48);
			lfd.zoneDInf = sqlStmt.getInt(49);
			lfd.maxHold1 = sqlStmt.getInt(50);
			lfd.maxHold2 = sqlStmt.getInt(51);
			lfd.maxHold3 = sqlStmt.getInt(52);
			lfd.maxHold4 			= sqlStmt.getInt(53);
			lfd.maxHold5 			= sqlStmt.getInt(54);
			lfd.revNo				= sqlStmt.getString(55);
		    lfd.actualCockpit		= sqlStmt.getInt(56);
		    lfd.actualCabin	    	= sqlStmt.getInt(57);
		    lfd.actualPantry		= sqlStmt.getString(58);
		    lfd.actualPaxWeight		= sqlStmt.getString(59);
		    lfd.actualTakeOffFuel	= sqlStmt.getInt(60);
		    lfd.actualTripFuel		= sqlStmt.getInt(61);
		    lfd.actualPAD		    = sqlStmt.getInt(62);
		    lfd.actualHold1	    	= sqlStmt.getInt(63);
		    lfd.actualHold2       	= sqlStmt.getInt(64);
		    lfd.actualHold3       	= sqlStmt.getInt(65);
		    lfd.actualHold4       	= sqlStmt.getInt(66);
		    lfd.actualHold5       	= sqlStmt.getInt(67);
		    lfd.actualHold1TR     	= sqlStmt.getInt(68);
		    lfd.actualHold1B      	= sqlStmt.getInt(69);
		    lfd.actualHold1C      	= sqlStmt.getInt(70);
		    lfd.actualHold1M     	= sqlStmt.getInt(71);
		    lfd.actualHold2TR	    = sqlStmt.getInt(72);
		    lfd.actualHold2B     	= sqlStmt.getInt(73);
		    lfd.actualHold2C		= sqlStmt.getInt(74);
		    lfd.actualHold2M	    = sqlStmt.getInt(75);
		    lfd.actualHold3TR     	= sqlStmt.getInt(76);
		    lfd.actualHold3B      	= sqlStmt.getInt(77);
		    lfd.actualHold3C      	= sqlStmt.getInt(78);
		    lfd.actualHold3M      	= sqlStmt.getInt(79);
		    lfd.actualHold4TR     	= sqlStmt.getInt(80);
		    lfd.actualHold4B      	= sqlStmt.getInt(81);
		    lfd.actualHold4C      	= sqlStmt.getInt(82);
		    lfd.actualHold4M      	= sqlStmt.getInt(83);
		    lfd.actualHold5TR     	= sqlStmt.getInt(84);
		    lfd.actualHold5B      	= sqlStmt.getInt(85);
		    lfd.actualHold5C      	= sqlStmt.getInt(86);
		    lfd.actualHold5M      	= sqlStmt.getInt(87);
		    lfd.preparedBy	    	= sqlStmt.getString(88);
		    lfd.checkedBy	        = sqlStmt.getString(89);
		    lfd.approvedBy        	= sqlStmt.getString(90);
		    lfd.calcDOI           	= sqlStmt.getDouble(91);
		    lfd.calcDOW	       	 	= sqlStmt.getInt(92);
		    lfd.calcTOFW          	= sqlStmt.getInt(93);
		    lfd.calcOW            	= sqlStmt.getInt(94);
		    lfd.calcPW            	= sqlStmt.getInt(95);
		    lfd.calcHW            	= sqlStmt.getInt(96);
		    lfd.calcZFW           	= sqlStmt.getInt(97);
		    lfd.calcTTL           	= sqlStmt.getInt(98);
		    lfd.calcATL           	= sqlStmt.getInt(99);
		    lfd.calcULBLM	        = sqlStmt.getInt(100);
		    lfd.calcLimitZFW      	= sqlStmt.getInt(101);
		    lfd.calcLimitZFWMax   	= sqlStmt.getInt(102);
		    lfd.calcLimitTO       	= sqlStmt.getInt(103);
		    lfd.calcLimitTOMax    	= sqlStmt.getInt(104);
		    lfd.calcLimitLW       	= sqlStmt.getInt(105);
		    lfd.calcLimitLWMax		= sqlStmt.getInt(106);
		    lfd.calcBlncFwdZFW		= sqlStmt.getDouble(107);
		    lfd.calcBlncActZFW		= sqlStmt.getDouble(108);
		    lfd.calcBlncAftZFW		= sqlStmt.getDouble(109);
		    lfd.calcBlncMacZFW		= sqlStmt.getDouble(110);
		    lfd.calcBlncFwdTOW		= sqlStmt.getDouble(111);
		    lfd.calcBlncActTOW		= sqlStmt.getDouble(112);
		    lfd.calcBlncAftTOW		= sqlStmt.getDouble(113);
		    lfd.calcBlncMacTOW		= sqlStmt.getDouble(114);
		    lfd.calcBlncFwdLDW		= sqlStmt.getDouble(115);
		    lfd.calcBlncActLDW		= sqlStmt.getDouble(116);
		    lfd.calcBlncAftLDW		= sqlStmt.getDouble(117);
		    lfd.calcBlncMacLDW		= sqlStmt.getDouble(118);
		    lfd.stabTrim         	= sqlStmt.getDouble(119);
		    lfd.firstPaxBus			= sqlStmt.getInt(120);
		    lfd.firstPaxEco			= sqlStmt.getInt(121);
		    lfd.captain_note		= sqlStmt.getString(122);
		    lfd.actualHold1TRScnd  	= sqlStmt.getInt(123);
		    lfd.actualHold1BScnd  	= sqlStmt.getInt(124);
		    lfd.actualHold1CScnd  	= sqlStmt.getInt(125);
		    lfd.actualHold1MScnd 	= sqlStmt.getInt(126);
		    lfd.actualHold2TRScnd   = sqlStmt.getInt(127);
		    lfd.actualHold2BScnd 	= sqlStmt.getInt(128);
		    lfd.actualHold2CScnd	= sqlStmt.getInt(129);
		    lfd.actualHold2MScnd    = sqlStmt.getInt(130);
		    lfd.actualHold3TRScnd   = sqlStmt.getInt(131);
		    lfd.actualHold3BScnd    = sqlStmt.getInt(132);
		    lfd.actualHold3CScnd    = sqlStmt.getInt(133);
		    lfd.actualHold3MScnd    = sqlStmt.getInt(134);
		    lfd.actualHold4TRScnd   = sqlStmt.getInt(135);
		    lfd.actualHold4BScnd    = sqlStmt.getInt(136);
		    lfd.actualHold4CScnd    = sqlStmt.getInt(137);
		    lfd.actualHold4MScnd    = sqlStmt.getInt(138);
		    lfd.actualHold5TRScnd   = sqlStmt.getInt(139);
		    lfd.actualHold5BScnd    = sqlStmt.getInt(140);
		    lfd.actualHold5CScnd    = sqlStmt.getInt(141);
		    lfd.actualHold5MScnd    = sqlStmt.getInt(142);
		    lfd.secondPaxBus		= sqlStmt.getInt(143);
		    lfd.secondPaxEco		= sqlStmt.getInt(144);
		    lfd.secondPaxStr		= sqlStmt.getString(145);
		    lfd.firstPaxStr			= sqlStmt.getString(146);
		    sqlStmt.close();
			//System.out.println("departure date : "+lfd.departureDate+" - "+lfd.originCode);
			
		}catch(Exception e){
			System.out.println("an error occured in GetLoadSheetFlightDetail.java - getFlightDetail() "+e.getMessage());
			
		}
		ConnectionPool.closeConnection(conn);
		
		return lfd;
		
	}
	
	public double calculateMACValue(double C_Value,double indexValue, double K_Value, int weiValue, double RefSTAValue, double LEMAC, double MACRC){
		
		double macValue = 0;
		try{
			if(weiValue>0)
			macValue = (((C_Value * (indexValue - K_Value))/weiValue)+RefSTAValue - LEMAC) / (MACRC/100);
			
		}catch(Exception e){
			
			System.out.println("an error occured in MAC Calculation : "+e.getMessage());
		}
		
		return Helper.roundDouble(macValue);
		
		
	}

	public LoadSheetFlightOutputData calculateLoadSheet(HttpServletRequest request){
		
		LoadSheetFlightOutputData loadSheetOutput = null;
		UserData user = (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
		
		String sqlString = "begin wghtandblnc.loadsheet_pkg.prepareloadsheet('"+Helper.request2String(request, "voyageCode")+"',0,'"+Helper.request2String(request, "aircraft")+"',"+Helper.request2String(request, "cockpit")+","+Helper.request2String(request, "cabinCrew")+",'"+Helper.request2String(request, "pantry")+"','"+Helper.request2String(request, "paxWeight")+"',"+Helper.request2String(request, "takeOffFuel")+","+Helper.request2String(request, "tripFuel")+","+Helper.request2String(request, "Pax0AMale")+","+Helper.request2String(request, "Pax0AFemale")+","+Helper.request2String(request, "Pax0AChild")+","+Helper.request2String(request, "Pax0AInf")+","+Helper.request2String(request, "Pax0BMale")+","+Helper.request2String(request, "Pax0BFemale")+","+Helper.request2String(request, "Pax0BChild")+","+Helper.request2String(request, "Pax0BInf")+","+Helper.request2String(request, "Pax0CMale")+","+Helper.request2String(request, "Pax0CFemale")+","+Helper.request2String(request, "Pax0CChild")+","+Helper.request2String(request, "Pax0CInf")+","+Helper.request2String(request, "Pax0DMale")+","+Helper.request2String(request, "Pax0DFemale")+","+Helper.request2String(request, "Pax0DChild")+","+Helper.request2String(request, "Pax0DInf")+","+Helper.request2String(request, "firstHoldPad")+","+Helper.request2String(request, "hold1")+","+Helper.request2String(request, "hold2")+","+Helper.request2String(request, "hold3")+","+Helper.request2String(request, "hold4")+","+Helper.request2String(request, "hold5")+",'"+Helper.request2String(request, "preparedByParam")+"','"+Helper.request2String(request, "checkedByParam")+"','"+Helper.request2String(request, "approvedByParam")+"','"+user.getUserName()+"',"+Helper.string2int(Helper.request2String(request, "paxBUS"))+","+Helper.string2int(Helper.request2String(request, "paxECO"))+",'"+Helper.request2String(request, "date")+"','"+Helper.request2String(request, "captainNoteParam")+"',"+Helper.string2int(Helper.request2String(request, "Pax0A"))+","+Helper.string2int(Helper.request2String(request, "Pax0B"))+","+Helper.string2int(Helper.request2String(request, "Pax0C"))+","+Helper.string2int(Helper.request2String(request, "Pax0D"))+",?,"+Helper.string2int(Helper.request2String(request, "dryOperatingWeight"))+","+Helper.string2Double(Helper.request2String(request, "dryOperatingIndex"), 0)+"); end;";
		Connection conn = ConnectionPool.getConnection();
		try{
			System.out.println("sqlString : "+sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.prepareloadsheet(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setString(1, Helper.request2String(request, "voyageCode"));
			sqlStmt.setInt(2, 0);
			sqlStmt.setString(3, Helper.request2String(request, "aircraft"));
			sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "cockpit")));
			sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "cabinCrew")));
			sqlStmt.setString(6, Helper.request2String(request, "pantry"));
			sqlStmt.setString(7, Helper.request2String(request, "paxWeight"));
			sqlStmt.setInt(8, Helper.string2int(Helper.request2String(request, "takeOffFuel")));
			sqlStmt.setInt(9, Helper.string2int(Helper.request2String(request, "tripFuel")));
			sqlStmt.setInt(10, Helper.string2int(Helper.request2String(request, "Pax0AMale")));
			sqlStmt.setInt(11, Helper.string2int(Helper.request2String(request, "Pax0AFemale")));
			sqlStmt.setInt(12, Helper.string2int(Helper.request2String(request, "Pax0AChild")));
			sqlStmt.setInt(13, Helper.string2int(Helper.request2String(request, "Pax0AInf")));
			sqlStmt.setInt(14, Helper.string2int(Helper.request2String(request, "Pax0BMale")));
			sqlStmt.setInt(15, Helper.string2int(Helper.request2String(request, "Pax0BFemale")));
			sqlStmt.setInt(16, Helper.string2int(Helper.request2String(request, "Pax0BChild")));
			sqlStmt.setInt(17, Helper.string2int(Helper.request2String(request, "Pax0BInf")));
			sqlStmt.setInt(18, Helper.string2int(Helper.request2String(request, "Pax0CMale")));
			sqlStmt.setInt(19, Helper.string2int(Helper.request2String(request, "Pax0CFemale")));
			sqlStmt.setInt(20, Helper.string2int(Helper.request2String(request, "Pax0CChild")));
			sqlStmt.setInt(21, Helper.string2int(Helper.request2String(request, "Pax0CInf")));
			sqlStmt.setInt(22, Helper.string2int(Helper.request2String(request, "Pax0DMale")));
			sqlStmt.setInt(23, Helper.string2int(Helper.request2String(request, "Pax0DFemale")));
			sqlStmt.setInt(24, Helper.string2int(Helper.request2String(request, "Pax0DChild")));
			sqlStmt.setInt(25, Helper.string2int(Helper.request2String(request, "Pax0DInf")));
			sqlStmt.setInt(26, Helper.string2int(Helper.request2String(request, "firstHoldPad")));
			sqlStmt.setInt(27, Helper.string2int(Helper.request2String(request, "hold1")));
			sqlStmt.setInt(28, Helper.string2int(Helper.request2String(request, "hold2")));
			sqlStmt.setInt(29, Helper.string2int(Helper.request2String(request, "hold3")));
			sqlStmt.setInt(30, Helper.string2int(Helper.request2String(request, "hold4")));
			sqlStmt.setInt(31, Helper.string2int(Helper.request2String(request, "hold5")));
			sqlStmt.setString(32, Helper.request2String(request, "preparedByParam"));
			sqlStmt.setString(33, Helper.request2String(request, "checkedByParam"));
			sqlStmt.setString(34, Helper.request2String(request, "approvedByParam"));
			sqlStmt.setString(35, user.getUserName());
			sqlStmt.setInt(36, Helper.string2int(Helper.request2String(request, "paxBUS")));
			sqlStmt.setInt(37, Helper.string2int(Helper.request2String(request, "paxECO")));
			sqlStmt.setString(38, Helper.request2String(request, "date"));
			sqlStmt.setString(39, Helper.request2String(request, "captainNoteParam"));
			sqlStmt.setInt(40, Helper.string2int(Helper.request2String(request, "Pax0A")));
			sqlStmt.setInt(41, Helper.string2int(Helper.request2String(request, "Pax0B")));
			sqlStmt.setInt(42, Helper.string2int(Helper.request2String(request, "Pax0C")));
			sqlStmt.setInt(43, Helper.string2int(Helper.request2String(request, "Pax0D")));
			sqlStmt.registerOutParameter(44, OracleTypes.NUMBER);
			sqlStmt.setInt(45, Helper.string2int(Helper.request2String(request, "dryOperatingWeight")));
			sqlStmt.setDouble(46, Helper.string2Double(Helper.request2String(request, "dryOperatingIndex"), 0));			
			sqlStmt.execute();
			int loadSheetID = sqlStmt.getInt(44);
			sqlStmt.close();
			
			/*sqlString = "begin wghtandblnc.loadsheet_pkg.calculationloadsheetdata("+loadSheetID+",?,?); end;";
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.calculationloadsheetdata(?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.registerOutParameter(2, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(3, OracleTypes.VARCHAR);
			sqlStmt.execute();
			String errorCode = sqlStmt.getString(2);
			String errorMssg = sqlStmt.getString(3);
			sqlStmt.close();*/
			
			
			for(int i=1;i<=5 && loadSheetID>0;i++){
				sqlString = "begin wghtandblnc.loadsheet_pkg.ins_hold_distribution("+loadSheetID+","+i+","+Helper.string2int(Helper.request2String(request, "firstLegHoldTR"+i))+","+Helper.string2int(Helper.request2String(request, "firstLegHoldB"+i))+","+Helper.string2int(Helper.request2String(request, "firstLegHoldC"+i))+","+Helper.string2int(Helper.request2String(request, "firstLegHoldM"+i))+",1); end;"; 
				System.out.println(sqlString);
				sqlString = "begin wghtandblnc.loadsheet_pkg.ins_hold_distribution(?,?,?,?,?,?,?); end;";
				sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.setInt(1, loadSheetID);
				sqlStmt.setInt(2, i);
				sqlStmt.setInt(3, Helper.string2int(Helper.request2String(request, "firstLegHoldTR"+i)));
				sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "firstLegHoldB"+i)));
				sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "firstLegHoldC"+i)));
				sqlStmt.setInt(6, Helper.string2int(Helper.request2String(request, "firstLegHoldM"+i)));
				sqlStmt.setInt(7, 1);
				sqlStmt.execute();
				sqlStmt.close();
			}
			for(int i=1;i<=5 && loadSheetID>0;i++){
				sqlString = "begin wghtandblnc.loadsheet_pkg.ins_hold_distribution("+loadSheetID+","+i+","+Helper.string2int(Helper.request2String(request, "secondLegHoldTR"+i))+","+Helper.string2int(Helper.request2String(request, "secondLegHoldB"+i))+","+Helper.string2int(Helper.request2String(request, "secondLegHoldC"+i))+","+Helper.string2int(Helper.request2String(request, "secondLegHoldM"+i))+",2); end;"; 
				System.out.println(sqlString);
				sqlString = "begin wghtandblnc.loadsheet_pkg.ins_hold_distribution(?,?,?,?,?,?,?); end;";
				sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.setInt(1, loadSheetID);
				sqlStmt.setInt(2, i);
				sqlStmt.setInt(3, Helper.string2int(Helper.request2String(request, "secondLegHoldTR"+i)));
				sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "secondLegHoldB"+i)));
				sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "secondLegHoldC"+i)));
				sqlStmt.setInt(6, Helper.string2int(Helper.request2String(request, "secondLegHoldM"+i)));
				sqlStmt.setInt(7, 2);
				sqlStmt.execute();
				sqlStmt.close();
			}
			

			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution("+loadSheetID+",'"+Helper.request2String(request, "firstHoldTo")+"',"+Helper.string2int(Helper.request2String(request, "firstHoldMale"))+","+Helper.string2int(Helper.request2String(request, "firstHoldFemale"))+","+Helper.string2int(Helper.request2String(request, "firstHoldAdt"))+","+Helper.string2int(Helper.request2String(request, "firstHoldChd"))+","+Helper.string2int(Helper.request2String(request, "firstHoldInf"))+","+Helper.string2int(Helper.request2String(request, "firstPaxBUS"))+","+Helper.string2int(Helper.request2String(request, "firstPaxECO"))+","+Helper.string2int(Helper.request2String(request, "firstHoldPad"))+",'"+Helper.request2String(request, "firstPaxPAX")+"',1); end;"; 
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution(?,?,?,?,?,?,?,?,?,?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.setString(2, Helper.request2String(request, "firstHoldTo"));
			sqlStmt.setInt(3, Helper.string2int(Helper.request2String(request, "firstHoldMale")));
			sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "firstHoldFemale")));
			sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "firstHoldAdt")));
			sqlStmt.setInt(6, Helper.string2int(Helper.request2String(request, "firstHoldChd")));
			sqlStmt.setInt(7, Helper.string2int(Helper.request2String(request, "firstHoldInf")));
			sqlStmt.setInt(8, Helper.string2int(Helper.request2String(request, "firstPaxBUS")));
			sqlStmt.setInt(9, Helper.string2int(Helper.request2String(request, "firstPaxECO")));
			sqlStmt.setInt(10, Helper.string2int(Helper.request2String(request, "firstHoldPad")));
			sqlStmt.setString(11, Helper.request2String(request, "firstPaxPAX"));
			sqlStmt.setInt(12, 1);
			sqlStmt.execute();
			sqlStmt.close();
			
			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution("+loadSheetID+",'"+Helper.request2String(request, "secondHoldTo")+"',"+Helper.string2int(Helper.request2String(request, "secondHoldMale"))+","+Helper.string2int(Helper.request2String(request, "secondHoldFemale"))+","+Helper.string2int(Helper.request2String(request, "secondHoldAdt"))+","+Helper.string2int(Helper.request2String(request, "secondHoldChd"))+","+Helper.string2int(Helper.request2String(request, "secondHoldInf"))+","+Helper.string2int(Helper.request2String(request, "secondPaxBUS"))+","+Helper.string2int(Helper.request2String(request, "secondPaxECO"))+","+Helper.string2int(Helper.request2String(request, "secondHoldPad"))+",'"+Helper.request2String(request, "secondPaxPAX")+"',2); end;"; 
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution(?,?,?,?,?,?,?,?,?,?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.setString(2, Helper.request2String(request, "secondHoldTo"));
			sqlStmt.setInt(3, Helper.string2int(Helper.request2String(request, "secondHoldMale")));
			sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "secondHoldFemale")));
			sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "secondHoldAdt")));
			sqlStmt.setInt(6, Helper.string2int(Helper.request2String(request, "secondHoldChd")));
			sqlStmt.setInt(7, Helper.string2int(Helper.request2String(request, "secondHoldInf")));
			sqlStmt.setInt(8, Helper.string2int(Helper.request2String(request, "secondPaxBUS")));
			sqlStmt.setInt(9, Helper.string2int(Helper.request2String(request, "secondPaxECO")));
			sqlStmt.setInt(10, Helper.string2int(Helper.request2String(request, "secondHoldPad")));
			sqlStmt.setString(11, Helper.request2String(request, "secondPaxPAX"));
			sqlStmt.setInt(12, 2);
			sqlStmt.execute();
			sqlStmt.close();
			
			sqlString = "begin wghtandblnc.loadsheet_pkg.calculationloadsheetdata("+loadSheetID+",?,?); end;";
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.calculationloadsheetdata(?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.registerOutParameter(2, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(3, OracleTypes.VARCHAR);
			sqlStmt.execute();
			String errorCode = sqlStmt.getString(2);
			String errorMssg = sqlStmt.getString(3);
			sqlStmt.close();
			
			if(errorCode!=null && errorMssg!=null){
				System.out.println(errorCode+" - "+errorMssg);	
			}else{
				sqlString = "{?=call wghtandblnc.loadsheet_pkg.getFlightLoadSheetOutput('"+loadSheetID+"')}";
				sqlStmt = conn.prepareCall(sqlString);
				sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
				sqlStmt.execute();
				ResultSet sqlRslt = (ResultSet) sqlStmt.getObject(1);
				while(sqlRslt.next()){
					loadSheetOutput = new LoadSheetFlightOutputData();
					loadSheetOutput.setLoadSheetID(sqlRslt.getInt("LOADSHEET_ID"));
					loadSheetOutput.setDow_value(sqlRslt.getInt("DOW_VALUE"));
					loadSheetOutput.setDoi_value(sqlRslt.getDouble("DOI_VALUE"));
					loadSheetOutput.setTofw_value(sqlRslt.getInt("TOFW_VALUE"));
					loadSheetOutput.setPaxweight_value(sqlRslt.getInt("PAXWEIGHT_VALUE")); 
					loadSheetOutput.setHoldsvalue(sqlRslt.getInt("HOLDSVALUE"));
					loadSheetOutput.setOpewei(sqlRslt.getInt("OPEWEI"));
					loadSheetOutput.setZerofuelwei(sqlRslt.getInt("ZEROFUELWEI"));
					loadSheetOutput.setTotaltrfload(sqlRslt.getInt("TOTALTRFLOAD"));
					loadSheetOutput.setAllowedtrfload(sqlRslt.getInt("ALLOWEDTRFLOAD"));
					loadSheetOutput.setUnderloadlmc(sqlRslt.getInt("UNDERLOADLMC"));
					loadSheetOutput.setTrafficloadparam(sqlRslt.getString("TRAFFICLOADPARAM")); 
					loadSheetOutput.setLimitzfactual(sqlRslt.getInt("LIMITZFACTUAL"));
					loadSheetOutput.setLimittoactual(sqlRslt.getInt("LIMITTOACTUAL"));
					loadSheetOutput.setLimitlactual(sqlRslt.getInt("LIMITLACTUAL"));
					loadSheetOutput.setLimitzfmax(sqlRslt.getInt("LIMITZFMAX"));
					loadSheetOutput.setLimittomax(sqlRslt.getInt("LIMITTOMAX"));
					loadSheetOutput.setLimitlmax(sqlRslt.getInt("LIMITLMAX"));
					loadSheetOutput.setBalancezfforward(sqlRslt.getDouble("BALANCEZFFORWARD")); 
					loadSheetOutput.setBalancezfactual(sqlRslt.getDouble("BALANCEZFACTUAL"));
					loadSheetOutput.setBalancezfaft(sqlRslt.getDouble("BALANCEZFAFT"));
					loadSheetOutput.setBalancezfmac(sqlRslt.getDouble("BALANCEZFMAC"));
					loadSheetOutput.setBalancetoforward(sqlRslt.getDouble("BALANCETOFORWARD")); 
					loadSheetOutput.setBalancetoactual(sqlRslt.getDouble("BALANCETOACTUAL"));
					loadSheetOutput.setBalancetoaft(sqlRslt.getDouble("BALANCETOAFT"));
					loadSheetOutput.setBalancetomac(sqlRslt.getDouble("BALANCETOMAC"));
					loadSheetOutput.setBalancelforward(sqlRslt.getDouble("BALANCELFORWARD"));
					loadSheetOutput.setBalancelactual(sqlRslt.getDouble("BALANCELACTUAL"));
					loadSheetOutput.setBalancelaft(sqlRslt.getDouble("BALANCELAFT"));
					loadSheetOutput.setBalancelmac(sqlRslt.getDouble("BALANCELMAC"));
					loadSheetOutput.setStabtrim(sqlRslt.getDouble("STABTRIM"));
					loadSheetOutput.setCaptainNote(sqlRslt.getString("CAPTAIN_NOTE"));
				}
				sqlRslt.close();
				sqlStmt.close();
			}
			
		}catch(Exception e){
			System.out.println("An error occured in GetLoadSheetFlightDetail.java - calculateLoadSheet() : "+e.getMessage());
		}
		ConnectionPool.closeConnection(conn);
		return loadSheetOutput;
		
	}

	public LoadSheetFlightOutputData getLoadSheet(HttpServletRequest request){
		
		LoadSheetFlightOutputData loadSheetOutput = null;
		String sqlString = null;
		Connection conn = ConnectionPool.getConnection();
		try{
			sqlString = "{?=call wghtandblnc.loadsheet_pkg.getFlightLoadSheetOutput('"+Helper.request2String(request, "loadSheetID")+"')}";
			System.out.println("sqlString : "+sqlString);
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			ResultSet sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				loadSheetOutput = new LoadSheetFlightOutputData();
				loadSheetOutput.setLoadSheetID(sqlRslt.getInt("LOADSHEET_ID"));
				loadSheetOutput.setDow_value(sqlRslt.getInt("DOW_VALUE"));
				loadSheetOutput.setDoi_value(sqlRslt.getDouble("DOI_VALUE"));
				loadSheetOutput.setTofw_value(sqlRslt.getInt("TOFW_VALUE"));
				loadSheetOutput.setPaxweight_value(sqlRslt.getInt("PAXWEIGHT_VALUE")); 
				loadSheetOutput.setHoldsvalue(sqlRslt.getInt("HOLDSVALUE"));
				loadSheetOutput.setOpewei(sqlRslt.getInt("OPEWEI"));
				loadSheetOutput.setZerofuelwei(sqlRslt.getInt("ZEROFUELWEI"));
				loadSheetOutput.setTotaltrfload(sqlRslt.getInt("TOTALTRFLOAD"));
				loadSheetOutput.setAllowedtrfload(sqlRslt.getInt("ALLOWEDTRFLOAD"));
				loadSheetOutput.setUnderloadlmc(sqlRslt.getInt("UNDERLOADLMC"));
				loadSheetOutput.setTrafficloadparam(sqlRslt.getString("TRAFFICLOADPARAM")); 
				loadSheetOutput.setLimitzfactual(sqlRslt.getInt("LIMITZFACTUAL"));
				loadSheetOutput.setLimittoactual(sqlRslt.getInt("LIMITTOACTUAL"));
				loadSheetOutput.setLimitlactual(sqlRslt.getInt("LIMITLACTUAL"));
				loadSheetOutput.setLimitzfmax(sqlRslt.getInt("LIMITZFMAX"));
				loadSheetOutput.setLimittomax(sqlRslt.getInt("LIMITTOMAX"));
				loadSheetOutput.setLimitlmax(sqlRslt.getInt("LIMITLMAX"));
				loadSheetOutput.setBalancezfforward(sqlRslt.getDouble("BALANCEZFFORWARD")); 
				loadSheetOutput.setBalancezfactual(sqlRslt.getDouble("BALANCEZFACTUAL"));
				loadSheetOutput.setBalancezfaft(sqlRslt.getDouble("BALANCEZFAFT"));
				loadSheetOutput.setBalancezfmac(sqlRslt.getDouble("BALANCEZFMAC"));
				loadSheetOutput.setBalancetoforward(sqlRslt.getDouble("BALANCETOFORWARD")); 
				loadSheetOutput.setBalancetoactual(sqlRslt.getDouble("BALANCETOACTUAL"));
				loadSheetOutput.setBalancetoaft(sqlRslt.getDouble("BALANCETOAFT"));
				loadSheetOutput.setBalancetomac(sqlRslt.getDouble("BALANCETOMAC"));
				loadSheetOutput.setBalancelforward(sqlRslt.getDouble("BALANCELFORWARD"));
				loadSheetOutput.setBalancelactual(sqlRslt.getDouble("BALANCELACTUAL"));
				loadSheetOutput.setBalancelaft(sqlRslt.getDouble("BALANCELAFT"));
				loadSheetOutput.setBalancelmac(sqlRslt.getDouble("BALANCELMAC"));
				loadSheetOutput.setStabtrim(sqlRslt.getDouble("STABTRIM"));
				loadSheetOutput.setLoadSheetRevID(sqlRslt.getString("LOADSHEETREVID"));
				loadSheetOutput.setLoadSheetTime(sqlRslt.getString("LOADSHEETTIME"));
				loadSheetOutput.setLoadSheetDate(sqlRslt.getString("LOADSHEETDATE"));
				loadSheetOutput.setAirlineName(sqlRslt.getString("AIRLINE_NAME"));
				loadSheetOutput.setOriginCode(sqlRslt.getString("ORIGIN"));
				loadSheetOutput.setDestinationCode(sqlRslt.getString("DESTINATION"));
				loadSheetOutput.setFlightNumber(sqlRslt.getString("FLIGHT_NUMBER"));
				loadSheetOutput.setRegistration(sqlRslt.getString("REGISTRATION"));
				loadSheetOutput.setCockpit(sqlRslt.getInt("COCKPIT"));
				loadSheetOutput.setCabin(sqlRslt.getInt("CABIN"));
				loadSheetOutput.setAircraftVersion(sqlRslt.getString("AIRCRAFT_VERSION"));
				loadSheetOutput.setHoldDistribution(sqlRslt.getString("HOLDDISTRIBUTION"));
				loadSheetOutput.setMaleTotal(sqlRslt.getInt("MALETOTAL"));
				loadSheetOutput.setFemaleTotal(sqlRslt.getInt("FEMALETOTAL"));
				loadSheetOutput.setChildTotal(sqlRslt.getInt("CHILDTOTAL"));
				loadSheetOutput.setInfTotal(sqlRslt.getInt("INFTOTAL"));
				loadSheetOutput.setTripFuel(sqlRslt.getInt("TRIPFUEL"));
				loadSheetOutput.setPreparedBy(sqlRslt.getString("PREPAREDBY"));
				loadSheetOutput.setCheckedBy(sqlRslt.getString("CHECKEDBY"));
				loadSheetOutput.setApprovedBy(sqlRslt.getString("APPROVEDBY"));
				loadSheetOutput.setPantry(sqlRslt.getString("pantry"));
				loadSheetOutput.setTrafficloadparam(sqlRslt.getString("TRAFFICLOADPARAM"));
				loadSheetOutput.setZoneAPax(sqlRslt.getInt("ZONEAPAXES"));
				loadSheetOutput.setZoneBPax(sqlRslt.getInt("ZONEBPAXES"));
				loadSheetOutput.setZoneCPax(sqlRslt.getInt("ZONECPAXES"));
				loadSheetOutput.setZoneDPax(sqlRslt.getInt("ZONEDPAXES"));
				loadSheetOutput.setPaxBus(sqlRslt.getInt("PAXBUS"));
				loadSheetOutput.setPaxEco(sqlRslt.getInt("PAXECO"));
				loadSheetOutput.setDepartureDate(sqlRslt.getString("DEPARTURE_DATE"));
				loadSheetOutput.setDepartureTime(sqlRslt.getString("DEPARTURE_TIME"));
				loadSheetOutput.setCaptainNote(sqlRslt.getString("CAPTAIN_NOTE"));
				loadSheetOutput.setPaxDistrubition(sqlRslt.getString("PAXDISTRUBITION"));
			}
			sqlRslt.close();
			sqlStmt.close();

			
		}catch(Exception e){
			System.out.println("An error occured in GetLoadSheetFlightDetail.java - calculateLoadSheet() : "+e.getMessage());
		}
		ConnectionPool.closeConnection(conn);
		return loadSheetOutput;
		
	}
	
	public LimitationOfLoadSheet[] getEnvelopeLimits(String loadSheetID){
		LimitationOfLoadSheet[] envelopeLimitArray = null;
		LimitationOfLoadSheet envelopeLimit = null;
		Vector<LimitationOfLoadSheet> envVec = new Vector<LimitationOfLoadSheet>();

		Connection conn = ConnectionPool.getConnection();
		try{
			String sqlString = "{?=call wghtandblnc.loadsheet_pkg.getEnvelopeLimits("+loadSheetID+")}";
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			ResultSet sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				envelopeLimit = new LimitationOfLoadSheet();
				envelopeLimit.setAhmRevId(sqlRslt.getInt("AHMREVLIST_ID"));
				envelopeLimit.setLimitCode(sqlRslt.getString("LIMIT_CODE"));
				envelopeLimit.setWeight(sqlRslt.getDouble("WEIGHT"));
				envelopeLimit.setLimitIndex(sqlRslt.getDouble("LIMIT_INDEX"));
				envelopeLimit.setOpera(sqlRslt.getString("OPERATIONS"));
				envelopeLimit.setStatus(sqlRslt.getString("STATUS"));
				envelopeLimit.setLlpID(sqlRslt.getInt("LLP_ID"));
				envVec.add(envelopeLimit);
			}
			sqlRslt.close();
			sqlStmt.close();
			envelopeLimitArray = new LimitationOfLoadSheet[envVec.size()];
			for(int i=0;i<envVec.size();i++){
				envelopeLimitArray[i] = envVec.get(i);
			}
			envVec.removeAllElements();
			envVec = null;
			
		}catch(Exception e){
			System.out.println("An error occured in GetLoadSheetFlightDetail.java - getEnvelopeLimits() : "+e.getMessage());
		}
		ConnectionPool.closeConnection(conn);
		
		return envelopeLimitArray;
	}

	public String[] getDowDoiValues(String aircraft, int cockpit, int cabinCrew, String pantry){
		
		String [] dowDoiVal = null;
		Connection conn = ConnectionPool.getConnection();
		try{
			String sqlString = "{?=call wghtandblnc.loadsheet_pkg.getdowdoivalues('"+aircraft+"',"+cockpit+","+cabinCrew+",'"+pantry+"')}";
			System.out.println(sqlString);
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			ResultSet sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				dowDoiVal = new String[2];
				dowDoiVal[0] = sqlRslt.getString("DOW_VALUE");
				dowDoiVal[1] = sqlRslt.getString("DOI_VALUE");
			}
			sqlRslt.close();
			sqlStmt.close();
			
		}catch (Exception e) {
			System.out.println("An error occured in GetLoadSheetFlightDetail.java - getDowDoiValues() : "+e.getMessage());
		}
		ConnectionPool.closeConnection(conn);
		return dowDoiVal;
	}

	public String[] holdDistribution(HttpServletRequest request){
		System.out.println(Helper.request2String(request, "voyageCode"));
		System.out.println(Helper.request2String(request, "aircraft"));
		LoadSheetFlightOutputData loadSheetOutput = null;
		UserData user = (UserData) request.getSession().getAttribute(Constants.SESSION_USER);
		String holds[] = null;
		int totalWeight = 0;
		
		String sqlString = "begin wghtandblnc.loadsheet_pkg.prepareloadsheet('"+Helper.request2String(request, "voyageCode")+"',0,'"+Helper.request2String(request, "aircraft")+"',"+Helper.request2String(request, "cockpit")+","+Helper.request2String(request, "cabinCrew")+",'"+Helper.request2String(request, "pantry")+"','"+Helper.request2String(request, "paxWeight")+"',"+Helper.request2String(request, "takeOffFuel")+","+Helper.request2String(request, "tripFuel")+","+Helper.request2String(request, "Pax0AMale")+","+Helper.request2String(request, "Pax0AFemale")+","+Helper.request2String(request, "Pax0AChild")+","+Helper.request2String(request, "Pax0AInf")+","+Helper.request2String(request, "Pax0BMale")+","+Helper.request2String(request, "Pax0BFemale")+","+Helper.request2String(request, "Pax0BChild")+","+Helper.request2String(request, "Pax0BInf")+","+Helper.request2String(request, "Pax0CMale")+","+Helper.request2String(request, "Pax0CFemale")+","+Helper.request2String(request, "Pax0CChild")+","+Helper.request2String(request, "Pax0CInf")+","+Helper.request2String(request, "Pax0DMale")+","+Helper.request2String(request, "Pax0DFemale")+","+Helper.request2String(request, "Pax0DChild")+","+Helper.request2String(request, "Pax0DInf")+","+Helper.request2String(request, "firstHoldPad")+","+Helper.request2String(request, "hold1")+","+Helper.request2String(request, "hold2")+","+Helper.request2String(request, "hold3")+","+Helper.request2String(request, "hold4")+","+Helper.request2String(request, "hold5")+",'"+Helper.request2String(request, "preparedByParam")+"','"+Helper.request2String(request, "checkedByParam")+"','"+Helper.request2String(request, "approvedByParam")+"','"+user.getUserName()+"',"+Helper.string2int(Helper.request2String(request, "paxBUS"))+","+Helper.string2int(Helper.request2String(request, "paxECO"))+",'"+Helper.request2String(request, "date")+"','"+Helper.request2String(request, "captainNoteParam")+"',"+Helper.string2int(Helper.request2String(request, "Pax0A"))+","+Helper.string2int(Helper.request2String(request, "Pax0B"))+","+Helper.string2int(Helper.request2String(request, "Pax0C"))+","+Helper.string2int(Helper.request2String(request, "Pax0D"))+",?,"+Helper.string2int(Helper.request2String(request, "dryOperatingWeight"))+","+Helper.string2Double(Helper.request2String(request, "dryOperatingIndex"), 0)+"); end;";
		Connection conn = ConnectionPool.getConnection();
		try{
			System.out.println("sqlString : "+sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.prepareloadsheet(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
			CallableStatement sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setString(1, Helper.request2String(request, "voyageCode"));
			sqlStmt.setInt(2, 0);
			sqlStmt.setString(3, Helper.request2String(request, "aircraft"));
			sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "cockpit")));
			sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "cabinCrew")));
			sqlStmt.setString(6, Helper.request2String(request, "pantry"));
			sqlStmt.setString(7, Helper.request2String(request, "paxWeight"));
			sqlStmt.setInt(8, Helper.string2int(Helper.request2String(request, "takeOffFuel")));
			sqlStmt.setInt(9, Helper.string2int(Helper.request2String(request, "tripFuel")));
			sqlStmt.setInt(10, Helper.string2int(Helper.request2String(request, "Pax0AMale")));
			sqlStmt.setInt(11, Helper.string2int(Helper.request2String(request, "Pax0AFemale")));
			sqlStmt.setInt(12, Helper.string2int(Helper.request2String(request, "Pax0AChild")));
			sqlStmt.setInt(13, Helper.string2int(Helper.request2String(request, "Pax0AInf")));
			sqlStmt.setInt(14, Helper.string2int(Helper.request2String(request, "Pax0BMale")));
			sqlStmt.setInt(15, Helper.string2int(Helper.request2String(request, "Pax0BFemale")));
			sqlStmt.setInt(16, Helper.string2int(Helper.request2String(request, "Pax0BChild")));
			sqlStmt.setInt(17, Helper.string2int(Helper.request2String(request, "Pax0BInf")));
			sqlStmt.setInt(18, Helper.string2int(Helper.request2String(request, "Pax0CMale")));
			sqlStmt.setInt(19, Helper.string2int(Helper.request2String(request, "Pax0CFemale")));
			sqlStmt.setInt(20, Helper.string2int(Helper.request2String(request, "Pax0CChild")));
			sqlStmt.setInt(21, Helper.string2int(Helper.request2String(request, "Pax0CInf")));
			sqlStmt.setInt(22, Helper.string2int(Helper.request2String(request, "Pax0DMale")));
			sqlStmt.setInt(23, Helper.string2int(Helper.request2String(request, "Pax0DFemale")));
			sqlStmt.setInt(24, Helper.string2int(Helper.request2String(request, "Pax0DChild")));
			sqlStmt.setInt(25, Helper.string2int(Helper.request2String(request, "Pax0DInf")));
			sqlStmt.setInt(26, Helper.string2int(Helper.request2String(request, "firstHoldPad")));
			sqlStmt.setInt(27, Helper.string2int(Helper.request2String(request, "hold1")));
			sqlStmt.setInt(28, Helper.string2int(Helper.request2String(request, "hold2")));
			sqlStmt.setInt(29, Helper.string2int(Helper.request2String(request, "hold3")));
			sqlStmt.setInt(30, Helper.string2int(Helper.request2String(request, "hold4")));
			sqlStmt.setInt(31, Helper.string2int(Helper.request2String(request, "hold5")));
			sqlStmt.setString(32, Helper.request2String(request, "preparedByParam"));
			sqlStmt.setString(33, Helper.request2String(request, "checkedByParam"));
			sqlStmt.setString(34, Helper.request2String(request, "approvedByParam"));
			sqlStmt.setString(35, user.getUserName());
			sqlStmt.setInt(36, Helper.string2int(Helper.request2String(request, "paxBUS")));
			sqlStmt.setInt(37, Helper.string2int(Helper.request2String(request, "paxECO")));
			sqlStmt.setString(38, Helper.request2String(request, "date"));
			sqlStmt.setString(39, Helper.request2String(request, "captainNoteParam"));
			sqlStmt.setInt(40, Helper.string2int(Helper.request2String(request, "Pax0A")));
			sqlStmt.setInt(41, Helper.string2int(Helper.request2String(request, "Pax0B")));
			sqlStmt.setInt(42, Helper.string2int(Helper.request2String(request, "Pax0C")));
			sqlStmt.setInt(43, Helper.string2int(Helper.request2String(request, "Pax0D")));
			sqlStmt.registerOutParameter(44, OracleTypes.NUMBER);
			sqlStmt.setInt(45, Helper.string2int(Helper.request2String(request, "dryOperatingWeight")));
			sqlStmt.setDouble(46, Helper.string2Double(Helper.request2String(request, "dryOperatingIndex"), 0));			
			sqlStmt.execute();
			int loadSheetID = sqlStmt.getInt(44);
			sqlStmt.close();			

			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution("+loadSheetID+",'"+Helper.request2String(request, "firstHoldTo")+"',"+Helper.string2int(Helper.request2String(request, "firstHoldMale"))+","+Helper.string2int(Helper.request2String(request, "firstHoldFemale"))+","+Helper.string2int(Helper.request2String(request, "firstHoldAdt"))+","+Helper.string2int(Helper.request2String(request, "firstHoldChd"))+","+Helper.string2int(Helper.request2String(request, "firstHoldInf"))+","+Helper.string2int(Helper.request2String(request, "firstPaxBUS"))+","+Helper.string2int(Helper.request2String(request, "firstPaxECO"))+","+Helper.string2int(Helper.request2String(request, "firstHoldPad"))+",'"+Helper.request2String(request, "firstPaxPAX")+"',1); end;"; 
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution(?,?,?,?,?,?,?,?,?,?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.setString(2, Helper.request2String(request, "firstHoldTo"));
			sqlStmt.setInt(3, Helper.string2int(Helper.request2String(request, "firstHoldMale")));
			sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "firstHoldFemale")));
			sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "firstHoldAdt")));
			sqlStmt.setInt(6, Helper.string2int(Helper.request2String(request, "firstHoldChd")));
			sqlStmt.setInt(7, Helper.string2int(Helper.request2String(request, "firstHoldInf")));
			sqlStmt.setInt(8, Helper.string2int(Helper.request2String(request, "firstPaxBUS")));
			sqlStmt.setInt(9, Helper.string2int(Helper.request2String(request, "firstPaxECO")));
			sqlStmt.setInt(10, Helper.string2int(Helper.request2String(request, "firstHoldPad")));
			sqlStmt.setString(11, Helper.request2String(request, "firstPaxPAX"));
			sqlStmt.setInt(12, 1);
			sqlStmt.execute();
			sqlStmt.close();
			
			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution("+loadSheetID+",'"+Helper.request2String(request, "secondHoldTo")+"',"+Helper.string2int(Helper.request2String(request, "secondHoldMale"))+","+Helper.string2int(Helper.request2String(request, "secondHoldFemale"))+","+Helper.string2int(Helper.request2String(request, "secondHoldAdt"))+","+Helper.string2int(Helper.request2String(request, "secondHoldChd"))+","+Helper.string2int(Helper.request2String(request, "secondHoldInf"))+","+Helper.string2int(Helper.request2String(request, "secondPaxBUS"))+","+Helper.string2int(Helper.request2String(request, "secondPaxECO"))+","+Helper.string2int(Helper.request2String(request, "secondHoldPad"))+",'"+Helper.request2String(request, "secondPaxPAX")+"',2); end;"; 
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.ins_pax_distribution(?,?,?,?,?,?,?,?,?,?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.setString(2, Helper.request2String(request, "secondHoldTo"));
			sqlStmt.setInt(3, Helper.string2int(Helper.request2String(request, "secondHoldMale")));
			sqlStmt.setInt(4, Helper.string2int(Helper.request2String(request, "secondHoldFemale")));
			sqlStmt.setInt(5, Helper.string2int(Helper.request2String(request, "secondHoldAdt")));
			sqlStmt.setInt(6, Helper.string2int(Helper.request2String(request, "secondHoldChd")));
			sqlStmt.setInt(7, Helper.string2int(Helper.request2String(request, "secondHoldInf")));
			sqlStmt.setInt(8, Helper.string2int(Helper.request2String(request, "secondPaxBUS")));
			sqlStmt.setInt(9, Helper.string2int(Helper.request2String(request, "secondPaxECO")));
			sqlStmt.setInt(10, Helper.string2int(Helper.request2String(request, "secondHoldPad")));
			sqlStmt.setString(11, Helper.request2String(request, "secondPaxPAX"));
			sqlStmt.setInt(12, 2);
			sqlStmt.execute();
			sqlStmt.close();

			
			
			totalWeight += Helper.string2int(Helper.request2String(request, "firstLegHoldBTotal"));
			totalWeight += Helper.string2int(Helper.request2String(request, "secondLegHoldBTotal"));
			
			
			
			sqlString = "begin wghtandblnc.loadsheet_pkg.autoHoldDistribution("+loadSheetID+","+totalWeight+",?,?,?); end;";
			System.out.println(sqlString);
			sqlString = "begin wghtandblnc.loadsheet_pkg.autoHoldDistribution(?,?,?,?,?); end;";
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.setInt(1, loadSheetID);
			sqlStmt.setInt(2, totalWeight);
			sqlStmt.registerOutParameter(3, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(4, OracleTypes.VARCHAR);
			sqlStmt.registerOutParameter(5, OracleTypes.VARCHAR);
			sqlStmt.execute();
			String distibutedString = sqlStmt.getString(3);
			String errorCode = sqlStmt.getString(4);
			String errorMssg = sqlStmt.getString(5);
			sqlStmt.close();
			
			if(errorCode!=null && errorMssg!=null){
				System.out.println(errorCode+" - "+errorMssg);	
			}else{
				System.out.println("distibutedString : "+distibutedString);
				StringTokenizer st = new StringTokenizer(distibutedString,"@");
				holds = new String[st.countTokens()];
				int index = 0;
				while(st.hasMoreTokens()){
					holds[index] = st.nextToken();
					index++;
				}
				
				
			}
			
		}catch(Exception e){
			System.out.println("An error occured in GetLoadSheetFlightDetail.java - calculateLoadSheet() : "+e.getMessage());
		}
		ConnectionPool.closeConnection(conn);
		return holds;
		
	}



}