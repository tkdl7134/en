package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.main.DBManager;

public class SelectWishiDAO {

	public static void insertWishiLink(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update s_event set e_alink=? where e_no = ?";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			String eno = request.getParameter("eno");
			pstmt.setString(1, request.getParameter("alink"));
			pstmt.setString(2, eno);
			if(pstmt.executeUpdate()==1) {
				System.out.println("insert success!");
			}
			else {
				System.out.println("insert fail...");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, null);
		}
	}

	public static void insertEventFunc(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update s_event_func set ef_send=? where e_no = ?";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			String eno = request.getParameter("eno");
			pstmt.setString(1, request.getParameter("jw-w-radio"));
			pstmt.setString(2, eno);
			if(pstmt.executeUpdate()==1) {
				System.out.println("insert success!");
			}
			else {
				System.out.println("insert fail...");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, null);
		}
	}

	public static void selectEventFunc(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from s_event_func ef LEFT OUTER JOIN s_event se ON ef.E_NO = se.E_NO where ef.e_no = ?";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			String eno = request.getParameter("eno");
			pstmt.setString(1, eno);
			rs=pstmt.executeQuery();
			SelectWishiDTO sdto = new SelectWishiDTO();
			if(rs.next()) {
				sdto.setEno(rs.getString("e_no"));
				sdto.setEf_fund(rs.getString("ef_fund"));
				sdto.setEf_send(rs.getString("ef_send"));
				sdto.setM_id(rs.getString("m_id"));
				sdto.setLink(rs.getString("e_alink"));
			}
			request.setAttribute("sdto", sdto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, null);
		}
		
	}

}
