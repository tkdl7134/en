package com.enmusubi.myPage.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;

public class StatisticsDAO {

	public static void getPrice(HttpServletRequest request) {
			// 날짜 2개 사이의 금액 받는 메서드
		String startDate =	request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			 String sql = "SELECT p_date, SUM(p_price) AS total_price\r\n"
			 		+ "FROM s_pay\r\n"
			 		+ "WHERE p_date BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')\r\n"
			 		+ "GROUP BY p_date\r\n"
			 		+ "ORDER BY p_date";			
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

	public static void getProductRanking(HttpServletRequest request) {
		
		// ranking 구하는 메서드
	String no = request.getParameter("no");
	String product = request.getParameter("product");	
		System.out.println(no);
		System.out.println(product);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT wl_no,\r\n"
				+ "       total_price,\r\n"
				+ "       RANK() OVER (ORDER BY total_price DESC) AS rank_of_total_price\r\n"
				+ "FROM (\r\n"
				+ "    SELECT wl_no,\r\n"
				+ "           SUM(p_price) AS total_price\r\n"
				+ "    FROM s_pay\r\n"
				+ "    GROUP BY wl_no\r\n"
				+ ") subquery\r\n"
				+ "WHERE wl_no = ?";
		
		String sql2 = "select wl_price from s_wishlist where wl_product=?";
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs= pstmt.executeQuery();
			String rank = null;
			int price = 0;
			int totalPrice = 0;
			if(rs.next()) {
			
				
				rank = rs.getString("rank_of_total_price");
				totalPrice = rs.getInt("total_price");
				
				rs.close();
				pstmt.close();
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, product);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				price = rs.getInt("wl_price");
			}
			
			}
			System.out.println(rank);
			System.out.println(price);
			System.out.println(totalPrice);
			int leftPrice = (int)(((double)(price - totalPrice) / price) * 100);
			System.out.println(leftPrice);
			request.setAttribute("rank", rank);
			request.setAttribute("leftPrice", leftPrice);
			request.setAttribute("product", product);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
		}
		
		
		
		
		
		
		
	}

	public static void getFundData(HttpServletRequest request) {
			
	String wlno=	request.getParameter("no");
	String eno = request.getParameter("eno");
	
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT s_pay.p_price, s_pay.p_date, s_member.m_name\r\n"
				+ "FROM s_pay\r\n"
				+ "INNER JOIN s_member ON s_pay.m_id = s_member.m_id where wl_no=? and e_no=?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wlno);
			pstmt.setString(2, eno);
			rs = pstmt.executeQuery();
			ArrayList<payDTO> fundedlists = new ArrayList<payDTO>();
			payDTO fundlist = new payDTO();
			MemberDTO member = new MemberDTO();
			
			while (rs.next()) {
				
			fundlist.setP_price(rs.getInt("p_price"));	
			fundlist.setP_date(rs.getDate("p_date"));	
			fundlist.setM_name(rs.getString("m_name"));
			fundedlists.add(fundlist);
			
			}
			System.out.println(fundedlists);
			request.setAttribute("fund", fundedlists);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(con, pstmt, rs);
			
		}
		
		
		
	}
	
	
}
