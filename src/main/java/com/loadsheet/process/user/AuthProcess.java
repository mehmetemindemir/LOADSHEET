package com.loadsheet.process.user;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.loadsheet.bean.data.user.PageData;
import com.loadsheet.oracle.pool.ConnectionPool;
import com.loadsheet.util.Helper;

import oracle.jdbc.OracleTypes;


public class AuthProcess {
	
	public void addUserPages(HttpServletRequest request){
		Connection 	conn	= ConnectionPool.getConnection();
		String[] 	pagesId	= request.getParameterValues("pages");
		int 		addUser	= Helper.request2int(request, "addUser");
		int 		user	= Helper.request2int(request, "user");
		String		sqlStr	= "";
		Statement 	stm		= null;
		try {
			sqlStr="delete from wghtandblnc.users_pages where   user_id="+user;
			stm=conn.createStatement();
			stm.execute(sqlStr);
			for (String page:pagesId){
				//insert into users_pages values(page_id,user_id,status,add_date,add_user);				
				sqlStr="insert into wghtandblnc.users_pages values("+page+","+user+")";
				System.out.println("Insert Page :"+sqlStr);
				stm.execute(sqlStr);
			}		
			stm.close();
		} catch (Exception e) {
			Helper.errorLogger(AuthProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn);
		}
	}
	public List<PageData> getMainPagesList(int userId, int isShow ){
		return getMainPagesList(userId,isShow,0);
	}
	
	public List<PageData> getMainPagesList(int userId, int isShow, int userType){
		List<PageData> 		pgList		= new ArrayList<PageData>();
		Connection 			conn	 	= ConnectionPool.getConnection();
		String 				sqlString 	= "";
		CallableStatement 	sqlStmt		= null;
		ResultSet 			sqlRslt 	= null;
		try{
			PageData pg=null;
			sqlString = "{?=call wghtandblnc.USER_PROCESS_PKG.getUserPageList("+userId+",0,"+isShow+","+userType+")}";
			System.out.println(sqlString);
			sqlStmt = conn.prepareCall(sqlString);
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			sqlRslt = (ResultSet) sqlStmt.getObject(1);
			while(sqlRslt.next()){
				pg=new PageData();
				pg.setOrderBy(Helper.checkNulls(sqlRslt.getString("order_by"), ""));
				pg.setPageDesc(Helper.checkNulls(sqlRslt.getString("page_desc"), ""));
				pg.setPageID(Helper.checkNulls(sqlRslt.getString("page_id"), ""));
				pg.setPageStatus(Helper.checkNulls(sqlRslt.getString("page_status"), ""));
				pg.setPageSubId(Helper.checkNulls(sqlRslt.getString("page_sub_id"), ""));
				pg.setPageTitle(Helper.checkNulls(sqlRslt.getString("page_title"), ""));
				pg.setPageType(Helper.checkNulls(sqlRslt.getString("page_type"), ""));
				pg.setPageUrl(Helper.checkNulls(sqlRslt.getString("page_url"), ""));
				pg.setIsSelect(sqlRslt.getInt("isSelect"));
				pg.setIsSelectForUserType(sqlRslt.getInt("isSelect2"));
				//pg.setPageName(Helper.checkNulls(sqlRslt.getString("page_name"), ""));
				pg.setPageName(Helper.checkNulls(sqlRslt.getString("subPage"), ""));
				pgList.add(pg);				
				
			}
			sqlRslt.close();
			sqlStmt.close();
		}catch(Exception e){
			Helper.errorLogger(AuthProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn,sqlStmt,sqlRslt);
		}
		return pgList;
	}
	
	public List<PageData> getSubPagesList(String pageId,int userId,int isShow){
		return getSubPagesList(pageId,userId,isShow,0);
	}
	public List<PageData> getSubPagesList(String pageId,int userId,int isShow,int userType){
		List<PageData> 		pgList	= new ArrayList<PageData>();
		Connection 			conn	= ConnectionPool.getConnection();
		StringBuilder 		sb		= null;
		CallableStatement 	sqlStmt = null;
		ResultSet 			rs 		= null;
		try {
			sb=new StringBuilder();
			sb.append("{?=call wghtandblnc.USER_PROCESS_PKG.getUserPageList("+userId+","+pageId+","+isShow+","+userType+")}");
			System.out.println("Sql : "+sb.toString());
			sqlStmt = conn.prepareCall(sb.toString());
			sqlStmt.registerOutParameter(1, OracleTypes.CURSOR);
			sqlStmt.execute();
			rs = (ResultSet) sqlStmt.getObject(1);
			PageData pg=null;
			while (rs.next()) {
				pg=new PageData();
				pg.setOrderBy(Helper.checkNulls(rs.getString("order_by"), ""));
				pg.setPageDesc(Helper.checkNulls(rs.getString("page_desc"), ""));
				pg.setPageID(Helper.checkNulls(rs.getString("page_id"), ""));
				pg.setPageStatus(Helper.checkNulls(rs.getString("page_status"), ""));
				pg.setPageSubId(Helper.checkNulls(rs.getString("page_sub_id"), ""));
				pg.setPageTitle(Helper.checkNulls(rs.getString("page_title"), ""));
				pg.setPageType(Helper.checkNulls(rs.getString("page_type"), ""));
				pg.setPageUrl(Helper.checkNulls(rs.getString("page_url"), ""));
				pg.setIsSelect(rs.getInt("isSelect"));
				pg.setIsSelectForUserType(rs.getInt("isSelect2"));
				//pg.setPageName(Helper.checkNulls(rs.getString("page_name"), ""));
				pg.setPageName(Helper.checkNulls(rs.getString("subPage"), ""));
				pgList.add(pg);
			}
		rs.close();
		sqlStmt.close();
		} catch (Exception e) {
			Helper.errorLogger(AuthProcess.class, e);
		}finally{
			ConnectionPool.closeConnection(conn,sqlStmt,rs);
		}
		return pgList;
	}
}
