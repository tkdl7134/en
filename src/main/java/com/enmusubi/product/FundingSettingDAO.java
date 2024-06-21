package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;

public class FundingSettingDAO {
	public static void getfundingInfo(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "select sw.wl_product, sw.wl_price from s_wishlist sw, s_event se"
				+ " where sw.e_no = se.e_no and se.e_no = 1";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, request.getParameter("eno"));
			rs = pstmt.executeQuery();
			
			ArrayList<WishListDTO> fundings = new ArrayList<>();
			WishListDTO wlDTO= null;
			
//			for (int i = 0; i < 7; i++) {
//				wlDTO = new WishListDTO(rs.getString(1), rs.getInt(2));
//				fundings.add(wlDTO);
//			}
			while (rs.next()) {
//				wlDTO = new WishListDTO(rs.getInt(1));
				fundings.add(wlDTO);
			}
			request.setAttribute("fundings", fundings);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, rs);
		}

	}

	public static void regFundingInfo(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "insert into s_wishlist values(wl_no_seq.nextval, ?, ?)";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			
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
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("펀딩 수정 실패!");
		}finally {
			dbManager.close(con, pstmt, null);
		}
		
	}
}
