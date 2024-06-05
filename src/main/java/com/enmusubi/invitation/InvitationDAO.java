package com.enmusubi.invitation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;
	

public class InvitationDAO {
		
	public static void Invitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from s_member";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			finally {
				DBManager.close(con, pstmt, rs);
			}
		}
	}

}
