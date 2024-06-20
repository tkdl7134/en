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
		ResultSet rs = null;
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
		}
	}

}
