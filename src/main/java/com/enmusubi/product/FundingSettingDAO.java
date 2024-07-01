package com.enmusubi.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;
import com.google.gson.Gson;

public class FundingSettingDAO {
	public static void getfundingInfo(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "select sw.wl_no, sw.wl_product, sw.wl_price from s_wishlist sw, s_event se"
				+ " where sw.e_no = se.e_no and se.e_no = ?";
		try {
			int eno = 1;
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eno);
			rs = pstmt.executeQuery();
			
			
			ArrayList<WishListDTO> fundings = new ArrayList<WishListDTO>();
			ArrayList<String> basicNames = new ArrayList<>();
			String[] basic 
			= {"ソファー", "冷蔵庫", "洗濯機", "テレビジョン", "机", "ベット", "テーブル"};
			for (String string : basic) {
				basicNames.add(string);
			}

			while (rs.next()) {
				WishListDTO wlDTO= new WishListDTO();
				String productName = rs.getString("wl_product");
				if (basicNames.contains(productName)) {
					basicNames.remove(productName);
				}
				
				wlDTO.setWl_no(rs.getInt("wl_no"));
				wlDTO.setWl_product(productName);
				wlDTO.setWl_price(rs.getInt("wl_price"));
				wlDTO.setE_no(eno);
				fundings.add(wlDTO);
			}
			System.out.println(fundings);
			System.out.println(basicNames);
			request.setAttribute("fundings", fundings);
			request.setAttribute("basicNames", basicNames);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, rs);
		}

	}

	public static void regFundingInfo(HttpServletRequest request) throws IOException {

		int eno = 1;
		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "insert into s_wishlist values(s_wishlist_seq.nextval, ?, ?, ?)";
		
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("product_name"));
			pstmt.setInt(2, Integer.parseInt(request.getParameter("product_price")));
			pstmt.setInt(3, eno);

			
			if (pstmt.executeUpdate() > 0) {
				System.out.println("성공?");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("펀딩 등록 실패!");
		}finally {
			dbManager.close(con, pstmt, null);
		}
		
	}

	public static void updateFundingInfo(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "update s_wishlist set wl_price = ? where wl_no = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("wl_up_price")));
			pstmt.setInt(2, Integer.parseInt(request.getParameter("wl_no")));
			
			if (pstmt.executeUpdate() > 0) {
				System.out.println("수정 성공!!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("펀딩 수정 실패!");
		}finally {
			dbManager.close(con, pstmt, null);
		}
		
	}

	public static void deleteFundingInfo(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		DBManager dbManager = DBManager.getInstance();		
		String sql = "delete s_pay where wl_no = ?";
		String sql2 = "delete s_wishlist where wl_no = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt2 = con.prepareStatement(sql2);
			
			pstmt.setInt(1, Integer.parseInt(request.getParameter("wl_no")));
			pstmt2.setInt(1, Integer.parseInt(request.getParameter("wl_no")));
			System.out.println(request.getParameter("wl_no"));
			
			if (pstmt.executeUpdate() > 0 || pstmt2.executeUpdate() > 0) {
				System.out.println("삭제성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("펀딩 삭제 실패!");
		}finally {
			dbManager.close(con, pstmt, null);
		}
		
	}
}
