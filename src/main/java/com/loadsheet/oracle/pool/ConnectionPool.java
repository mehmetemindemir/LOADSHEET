package com.loadsheet.oracle.pool;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionPool {
    static public Connection[] connections;
    static public int[] used;
    static public long[] timeout;

    public static InitialContext ic = null;
    public static DataSource ds = null;

    public ConnectionPool() {
    }


    public static Connection getConnection() {
        try {
            if (ic == null) ic = new InitialContext();
            if (ds == null) ds = (DataSource) ic.lookup("java:comp/env/jdbc/dcs");
            return ds.getConnection();
        } catch (Exception e) {
            System.out.println("Error in lookup: " + e.getMessage());
        }
        return null;
    }


    public static void closeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }

        } catch (Exception e) {
            System.out.println("Error Close: " + e.getMessage());
        }
    }

    public static void closeConnection(Connection conn, CallableStatement stm, ResultSet rs) {
        try {
            if (conn != null)
                conn.close();
            if (rs != null)
                rs.close();
            if (stm != null)
                stm.close();


        } catch (Exception e) {
            System.out.println("Error Close: " + e.getMessage());
        }
    }

    public static void closeResultSet(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }

    public static void closeStatement(Statement st) {
        try {
            if (st != null && !st.isClosed()) {
                st.close();
            }
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }

}