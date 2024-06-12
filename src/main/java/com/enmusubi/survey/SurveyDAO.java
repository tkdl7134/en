package com.enmusubi.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;

public class SurveyDAO {

	public static void summit(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = 
		
		
		try {
			
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, null);
		}
		
	}

}
