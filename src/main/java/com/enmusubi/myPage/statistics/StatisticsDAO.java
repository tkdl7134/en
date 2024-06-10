package com.enmusubi.myPage.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;

public class StatisticsDAO {

	public static void getPrice(HttpServletRequest request) {
			// 날짜 2개 사이의 금액 받는 메서드
		String startDate =	request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			 String sql = "SELECT w_date, SUM(w_price) AS total_price\r\n"
			 		+ "FROM s_wishlist\r\n"
			 		+ "WHERE w_date BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')\r\n"
			 		+ "GROUP BY w_date\r\n"
			 		+ "ORDER BY w_date;";			
			 try {
				con = DBManager.connect();
				pstmt = con.prepareStatement(sql);
				 pstmt.setString(1, startDate);
		            pstmt.setString(2, endDate);
				rs = pstmt.executeQuery();
				ArrayList<wishlistDTO> prices = new ArrayList<wishlistDTO>();
				while (rs.next()) {
					wishlistDTO price = new wishlistDTO();
					price.setW_date(rs.getDate("w_date"));
					price.setTotal_price(rs.getInt("total_price"));
					prices.add(price);
					System.out.println(prices);
				}
				request.setAttribute("prices", prices);
				//  이걸 받아서 chart js data에 넣어주면 될거같음
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, pstmt, rs);
			}
		
	}

	
	
	
}
