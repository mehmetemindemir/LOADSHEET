package com.loadsheet.process.flight;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.loadsheet.bean.data.flight.AirCraft;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.OracleTypes;

public class AirCraftProcess {
	public List<AirCraft> getAirCraftList(String capacity, String registerName,int companyId){
		List<AirCraft> 		listAirCraft=new ArrayList<AirCraft>();
		Connection 			conn=ConnectionPool.getConnection();
		CallableStatement 	stmt=null;
		ResultSet 			rs =null;
		String 				sql="";
		try {
			sql="{?=call dcs_pkg_02.getaircraftlist(0,null,"+companyId+")}";
			System.out.println("sql getAirCraftList="+sql);
			stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.execute();
			AirCraft air;
			rs = (ResultSet) stmt.getObject(1);
			while (rs.next()) {
				if(rs.getString("status")==null || rs.getString("status").equals("P")) continue;
				air=new AirCraft();
				air.setAircraftBrand(Helper.checkNulls(rs.getString("aircraft_brand"),""));
				air.setAircraftCode(Helper.checkNulls(rs.getString("aircraft_code"),""));
				air.setAircraftType(Helper.checkNulls(rs.getString("aircraft_type"),""));
				air.setAircraftVersion(Helper.checkNulls(rs.getString("aircraft_version"),""));
				air.setCapacity(Helper.checkNulls(rs.getString("capacity"),""));
				air.setRegisterName(Helper.checkNulls(rs.getString("register_name"),""));
				air.setStatus(Helper.checkNulls(rs.getString("status"),""));
				air.setWingsStart(rs.getInt("wingStart"));
				air.setWingsEnd(rs.getInt("wingEnd"));
				air.setBusinessLine(rs.getInt("business_line"));
				air.setCarrierCode(Helper.checkNulls(rs.getString("carrier_code"), ""));
				air.setIsAHMExists(Helper.checkNulls(rs.getString("isAHMExists"), ""));
				listAirCraft.add(air);
			}			
			stmt.close();
			rs.close();
		} catch (Exception e) {
			Helper.errorLogger(AirCraftProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn, stmt, rs);
		}
		return listAirCraft;
	}
	
	public void saveSeatMap(String airtype,String saln,String sasch,String zone,String satype,int sastat  ,String userName,String ex, String wings,String sa4){
		Connection 	conn=ConnectionPool.getConnection();
		String 		sql="";
		Statement 	stm=null;
		try {
			sql="begin dcs_pkg_02.ins_aircraftV2("+Helper.checkNullStringDB(airtype)+","+Helper.checkNullStringDB(saln)+","+Helper.checkNullStringDB(sasch)+","+Helper.checkNullStringDB(zone)+","+Helper.checkNullStringDB(satype)+","+sastat+","+Helper.checkNullStringDB(ex)+","+Helper.checkNullStringDB(wings)+",'"+sa4+"'); end;";
			System.out.println(sql);
			stm=conn.createStatement();
			stm.executeQuery(sql);			
			stm.close();
		} catch (Exception e) {
			Helper.errorLogger(AirCraftProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeStatement(stm);
		}
		
		
	}
	
	public void saveSeatMapMain(String userName,String vaircraftbrand,String vaircrafttype,String vaircraftversion,String vregistername,String vcapacity,String vstatus,String vaircraftcode,int businessLine,String carrierCode){
		Connection 	conn=ConnectionPool.getConnection();
		String 		sql="";
		Statement 	stm=null;
		try {
			
			sql="begin dcs_pkg_02.ins_aircraft_lookup("+Helper.checkNullStringDB(vaircraftbrand)+","+Helper.checkNullStringDB(vaircrafttype)+","+Helper.checkNullStringDB(vaircraftversion)+","+Helper.checkNullStringDB(vregistername)+","+Helper.checkNullStringDB(vcapacity)+","+Helper.checkNullStringDB(vstatus)+","+Helper.checkNullStringDB(vaircraftcode)+","+Helper.checkNullStringDB(userName)+","+businessLine+",'"+carrierCode+"'); end;";
			System.out.println(sql);
			stm=conn.createStatement();
			stm.executeQuery(sql);			
			stm.close();
		} catch (Exception e) {
			Helper.errorLogger(AirCraftProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeStatement(stm);
		}
	}
	
	public void backupSeatMap(String airtype,String userName){
		Connection 	conn=ConnectionPool.getConnection();
		String 		sql="";
		Statement 	stm=null;
		try {
			sql="begin dcs_pkg_02.aircraft_backup("+Helper.checkNullStringDB(airtype)+","+Helper.checkNullStringDB(userName)+"); end;";
			System.out.println(sql);
			stm=conn.createStatement();
			stm.executeQuery(sql);			
			stm.close();
		} catch (Exception e) {
			Helper.errorLogger(AirCraftProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeStatement(stm);
		}
	}
	
	public String upAirCreft(String status,String aircraftcode){
		String statusRet="NOK";
		Connection 	conn=ConnectionPool.getConnection();
		String 		sql="";
		Statement 	stm=null;
		try {
			sql="begin dcs_pkg_02.updateaircraftdetail('"+status+"','"+aircraftcode+"'); end;";
			System.out.println(sql);
			stm=conn.createStatement();
			stm.executeQuery(sql);			
			stm.close();
			statusRet="OK";
		} catch (Exception e) {
			Helper.errorLogger(AirCraftProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeStatement(stm);
		}
		return statusRet;
	}
	
	public String getSeatMap(String aircraftcode){
		 String 			columns = "";
		 Connection 		conn=ConnectionPool.getConnection();
		 StringBuilder 	sb=null;
		 Statement 		stm=null;
		 ResultSet 		rs=null;
		try {
			 sb = new StringBuilder();
            sb.append(" select * from ADSDCS.AIRCRAFT_SEAT_MAP asm ");
            sb.append(" where ASM.AIR_TYPE='" + aircraftcode + "' order by ASM.SALN  ,ASM.SASCH desc ");
            System.out.println("SeatMap Sql"+sb.toString());
            stm=conn.createStatement();
            rs=stm.executeQuery(sb.toString());			
            String column = "";
            String rowClass = "";
            String onClickstate = "";
            String onRemove = "";
            String exit = "";
            String wings="";
            String sa4="";
			while (rs.next()) {
				String zoneColor="";
				wings="";
				sa4=Helper.checkNulls(rs.getString("SA4"), "NOK");
				if(Helper.checkNulls(rs.getString("sa1"), "NOK").equals("A")){
					zoneColor=" zoneA";
				}else if(Helper.checkNulls(rs.getString("sa1"), "NOK").equals("B")){
					zoneColor=" zoneB";
				}else if(Helper.checkNulls(rs.getString("sa1"), "NOK").equals("C")){
					zoneColor=" zoneC";
				}
				
				if (Helper.checkNulls(rs.getString("AIR_TYPE"), "NOK").indexOf("A330") > -1)
               {
					exit = "";
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("1")) { rowClass = " fullH "; }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("3"))
                   {
                       rowClass = " emptyH ";
                   }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("4")) { 
                   		if(sa4.equals("INF")) { 
                   				rowClass = " infBlockH ";
                   		} else if(sa4.equals("UM")){ 
                   			rowClass = " disabledUMH ";
                   		}else if(sa4.equals("WCHR")){
                   			rowClass = " disabledWCHRH ";
                   		}else {
                   			rowClass = " disabledH ";  
                   		}
                   }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("6")) { rowClass = " selectedH "; }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("5")) { rowClass = " eliteH "; }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("0")) { 
                   		
                   		if(sa4.equals("INF")) { 
               				rowClass = " infFreeH ";
	                		} else if(sa4.equals("UM")){ 
	                			rowClass = " freeUMH ";
	                		}else if(sa4.equals("WCHR")){
	                			rowClass = " freeWCHRH ";
	                		}else {
	                			rowClass = " freeH "; 
	                		}
                   	}
                   

                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("A"))
                   {
                       if (Helper.checkNulls(rs.getString("SA3"), "NOK").equals("EX"))
                       {
                       	rowClass+=" ex";
                       }
                       
                   }
                 
                   if(Helper.checkNulls(rs.getString("SA2"), "NOK").equals("AIRF")){
                   	wings=" wingsH "; 
                   }
                   column = " <div class=\" seat " + rowClass +zoneColor + " \" " + onClickstate + " " + onRemove + "  id=\"" + Helper.checkNulls(rs.getString("SASCH"), "NOK") + Helper.checkNulls(rs.getString("SALN"), "NOK") + "\"></div> "+column;
                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("D"))
                   {
                       column = "<div  class=\" seat "+zoneColor+" \">" + Helper.checkNulls(rs.getString("SALN"), "NOK") + "</div>"+column;
                   }
                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("J"))
                   {
                       column = "<div  class=\" seat "+zoneColor+" \">" + Helper.checkNulls(rs.getString("SALN"), "NOK") + "</div>"+column;
                   }
                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("A"))
                   {
                       if (Helper.checkNulls(rs.getString("SA3"), "NOK").equals("EX"))
                       {
                           exit = "<div class=\"sira2Exit \" style=\" width:225px; \"> <div class=\" airColH "+wings+" \" > </div>";
                           exit += "     <div class=\"exitLeftH\"  ></div>";
                           exit += "     <div class=\"exitRightH\"></div> <div class=\" airColH "+wings+" \" > </div>";                               
                           exit += "</div>";

                       }
                       columns += exit + "<div class=\"sira2\"> <div class=\" airColH "+wings+" \" > </div>" + column + " <div class=\"airColH  "+wings+" \" > </div></div>";
                       column = "";
                       exit = "";
                   }
               }
               else
               {
                   exit = "";
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("1")) { rowClass = " fullH "; }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("3"))
                   {
                       rowClass = " emptyH ";
                   }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("4")) { 
	                		if(sa4.equals("INF")) { 
	                				rowClass = " infBlockH ";
	                		} else if(sa4.equals("UM")){ 
	                			rowClass = " disabledUMH ";
	                		}else if(sa4.equals("WCHR")){
	                			rowClass = " disabledWCHRH ";
	                		}else {
	                			rowClass = " disabledH ";  
	                		}
	                }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("6")) { rowClass = " selectedH "; }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("5")) { rowClass = " eliteH "; }
                   if (Helper.checkNulls(rs.getString("SASTAT"), "NOK").equals("0")) {                 		
	                		if(sa4.equals("INF")) { 
	            				rowClass = " infFreeH ";
	                		} else if(sa4.equals("UM")){ 
	                			rowClass = " freeUMH ";
	                		}else if(sa4.equals("WCHR")){
	                			rowClass = " freeWCHRH ";
	                		}else {
	                			rowClass = " freeH "; 
	                		}
	                	}
               
                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("A"))
                   {
                       if (Helper.checkNulls(rs.getString("SA3"), "NOK").equals("EX"))
                       {
                       	rowClass+=" ex";
                       }
                       
                   }
                   if(Helper.checkNulls(rs.getString("SA2"), "NOK").equals("AIRF")){
                   	wings=" wingsH "; 
                   }
                   column = " <div class=\" seat " + rowClass +zoneColor+ " \" " + onClickstate + " " + onRemove + "  id=\"" + Helper.checkNulls(rs.getString("SASCH"), "NOK") + Helper.checkNulls(rs.getString("SALN"), "NOK") + "\"></div> "+column;
                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("D"))
                   {
                       column = "<div  class=\" seat "+zoneColor+" \">" + Helper.checkNulls(rs.getString("SALN"), "NOK") + "</div>"+column;
                   }
                   if (Helper.checkNulls(rs.getString("SASCH"), "NOK").equals("A"))
                   {
                       if (Helper.checkNulls(rs.getString("SA3"), "NOK").equals("EX"))
                       {
                           exit = "<div class=\"sira2Exit \"> <div class=\" airColH "+wings+" \" > </div> ";
                           exit += "     <div class=\"exitLeftH\"></div>";
                           exit += "     <div class=\"exitRightH\"></div> <div class=\" airColH "+wings+" \" > </div>";                               
                           exit += "</div>";

                       }
                       columns += exit + "<div class=\"sira2\"> <div class=\" airColH "+wings+" \" > </div>" + column + " <div class=\"airColH  "+wings+" \" > </div></div>";
                       column = "";
                       exit = "";
                   }
               }
				
			}
			stm.close();
			rs.close();
		} catch (Exception e) {
			Helper.errorLogger(AirCraftProcess.class, e);
		}finally {
			ConnectionPool.closeConnection(conn);
			ConnectionPool.closeStatement(stm);
			ConnectionPool.closeResultSet(rs);
		}
		return columns;
	}
	
}
