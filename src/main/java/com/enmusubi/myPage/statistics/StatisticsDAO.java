package com.enmusubi.myPage.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;

public class StatisticsDAO {

	public static void showAllList(HttpServletRequest request) {

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from s_wishlist";
			try {
				con = DBManager.connect();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				ArrayList<wishlistDTO> wishlists = new ArrayList<wishlistDTO>();
				
				while (rs.next()) {
					wishlistDTO wl = new wishlistDTO();
					wl.setW_no(rs.getInt(1));
					wl.setW_product(rs.getString(2));
					wl.setW_price(rs.getInt(3));
					wl.setE_no(rs.getInt(4));
					wl.setW_comment(rs.getString(5));
					wishlists.add(wl);
					request.setAttribute("wishlists", wishlists);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, pstmt, rs);
			}
		
	}

	
	
	
}
