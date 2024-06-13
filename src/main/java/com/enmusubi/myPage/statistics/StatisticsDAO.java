package com.enmusubi.myPage.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.finance.funding.FundListDTO;
import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class StatisticsDAO {

	public static JsonArray getPrice(HttpServletRequest request) {
			// 날짜 2개 사이의 금액 받는 메서드
		
		String startDate = request.getParameter("startDate");
	    String endDate = request.getParameter("endDate");
	    System.out.println(startDate);
	    System.out.println(endDate);
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    DBManager dbManager = DBManager.getInstance();
	    JsonArray jsonArray = new JsonArray();
	    String sql = "SELECT p_date, SUM(p_price) AS total_price " +
	                 "FROM s_pay " +
	                 "WHERE p_date BETWEEN ? AND ? " +
	                 "GROUP BY p_date " +
	                 "ORDER BY p_date";		
	    try {
	        con = dbManager.connect();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, startDate);
	        pstmt.setString(2, endDate);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            JsonObject jsonObject = new JsonObject();
	            // 여기서 rs.getDate()로 날짜를 가져오고 jsonObject에 추가
	            jsonObject.addProperty("date", rs.getString("p_date"));
	            jsonObject.addProperty("total_price", rs.getDouble("total_price"));
	            jsonArray.add(jsonObject);
	        }
	        
	        Gson gson = new Gson();
	        String jsonResponse = gson.toJson(jsonArray);
	        System.out.println(jsonResponse);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        dbManager.close(con, pstmt, rs);
	    }
	    return jsonArray;
	}

	public static void getProductRanking(HttpServletRequest request) {
		
		// ranking 구하는 메서드
		String wl_no_param = request.getParameter("wlno");
		ArrayList<FundListDTO> flists = (ArrayList<FundListDTO>) request.getAttribute("list");
		String wl_no = null;
		String wl_product = null;
		
		if (flists != null && wl_no_param != null) {
		    for (FundListDTO fldto : flists) {
		        // e_no_param과 현재 객체의 e_no를 비교합니다.
		        if (wl_no_param.equals(fldto.getWl_no())) {
		             wl_no = fldto.getWl_no();
		             wl_product = fldto.getWl_product();

		            // wl_no, wl_product 값을 출력합니다.
		            System.out.println("wl_no: " + wl_no);
		            System.out.println("wl_product: " + wl_product);
		        }
		    }
		} else {
		    if (flists == null) {
		        System.out.println("No list attribute found in the request.");
		    }
		    if (wl_no_param == null) {
		        System.out.println("No wl_no parameter found in the request.");
		    }
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
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
			
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wl_no);
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
			pstmt.setString(1, wl_product);
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
			request.setAttribute("product", wl_product);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
		}
		
		
		
		
		
		
		
	}

	public static void getFundData(HttpServletRequest request) {
			
		String wl_no_param = request.getParameter("wlno");
		ArrayList<FundListDTO> flists = (ArrayList<FundListDTO>) request.getAttribute("list");
		String wl_no = null;
		String wl_product = null;
		String e_no = null;
		if (flists != null && wl_no_param != null) {
		    for (FundListDTO fldto : flists) {
		        // e_no_param과 현재 객체의 e_no를 비교합니다.
		        if (wl_no_param.equals(fldto.getWl_no())) {
		             wl_no = fldto.getWl_no();
		             wl_product = fldto.getWl_product();
		             e_no = fldto.getE_no();
		            // wl_no, wl_product 값을 출력합니다.
		            System.out.println("wl_no: " + wl_no);
		            System.out.println("wl_product: " + wl_product);
		        }
		    }
		} else {
		    if (flists == null) {
		        System.out.println("No list attribute found in the request.");
		    }
		    if (wl_no_param == null) {
		        System.out.println("No wl_no parameter found in the request.");
		    }
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT s_pay.p_price, s_pay.p_date, s_member.m_name\r\n"
				+ "FROM s_pay\r\n"
				+ "INNER JOIN s_member ON s_pay.m_id = s_member.m_id where wl_no=? and e_no=?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wl_no);
			pstmt.setString(2, e_no);
			rs = pstmt.executeQuery();
			ArrayList<payDTO> fundedlists = new ArrayList<payDTO>();
			payDTO fundlist = new payDTO();
			
			while (rs.next()) {
				
			fundlist.setP_price(rs.getInt("p_price"));	
			fundlist.setP_date(rs.getDate("p_date"));	
			fundlist.setM_name(rs.getString("m_name"));
			fundedlists.add(fundlist);
			
			}
			System.out.println(fundedlists);
			request.setAttribute("fund", fundedlists);
				
			
			// 날짜 구하는 기능
			   LocalDateTime currentDateTime = LocalDateTime.now();
		        // 포맷 지정
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        // 포맷을 적용하여 문자열로 변환
		        String formattedDateTime = currentDateTime.format(formatter);
		        System.out.println("Formatted Date: " + formattedDateTime);
		        request.setAttribute("todayDate", formattedDateTime);

		        // 7일 전의 날짜 계산
		        LocalDateTime sevenDaysAgoDateTime = currentDateTime.minusDays(7);

		        // 포맷 지정
		        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		        // 포맷을 적용하여 문자열로 변환
		        String formattedDateTime2 = sevenDaysAgoDateTime.format(formatter);

		        System.out.println("7 days ago: " + formattedDateTime2);
		        request.setAttribute("lastWeekDate", formattedDateTime2);
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
			
		}
		
		
		
	}
	
	
}
