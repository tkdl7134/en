package com.enmusubi.finance.funding;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class fundDAO {

	public static void selectFundList(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "WITH wish_fund AS (SELECT wl_no, wl_price, wl_product, e_no, (SELECT SUM(p_price) FROM s_pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) AS payed, FLOOR((SELECT SUM(p_price) FROM s_pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) / wl_price * 100) AS percent FROM s_wishlist sw WHERE e_no = ?)"
				+ " SELECT wl_no, wl_price, wl_product, e_no, payed, COALESCE(percent, 0) AS percent FROM wish_fund ORDER BY percent DESC";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			HttpSession session = request.getSession();
			String eno = (String)session.getAttribute("eno");
			pstmt.setString(1, eno);
			rs = pstmt.executeQuery();
			ArrayList<FundListDTO> flists = new ArrayList<FundListDTO>();
			while (rs.next()) {
				FundListDTO fldto = new FundListDTO();
				fldto.setWl_no(rs.getString("wl_no"));
				fldto.setWl_product(rs.getString("wl_product"));
				fldto.setWl_price(rs.getString("wl_price"));
				fldto.setE_no(rs.getString("e_no"));
				fldto.setPayed(rs.getString("payed"));
				fldto.setPercent(rs.getString("percent"));
				flists.add(fldto);
			}
			Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			String json = gson.toJson(flists);
			response.getWriter().print(json);
			request.setAttribute("list", flists);
			request.setAttribute("jsonList", json);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, rs);
		}

	}

	public static void insertWishiPick(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO S_PAY values(?,?,?,?,?,sysdate)";
		// e_no,m_id,p_type,p_price,wl_no
		String eno = request.getParameter("eno");
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("m_id");
		
		String pt = request.getParameter("paytype");
		String price = request.getParameter("price");
		String wlno;
		if(request.getParameter("wlno").equals("nodata")) {
			wlno = null;
		}
		else {
			wlno = request.getParameter("wlno");
		}

		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eno);
			pstmt.setString(2, mid);
			pstmt.setString(3, pt);
			pstmt.setString(4, price);
			pstmt.setString(5, wlno);
			if (pstmt.executeUpdate() == 1) {
				System.out.println("insert success!!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, null);
		}
	}

	public static boolean financeCheck(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from s_pay where m_id = ? and e_no = ?";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			HttpSession session = request.getSession();
			if (session.getAttribute("m_id").equals(null)) {
				return false;
			}
			pstmt.setString(1, (String) session.getAttribute("m_id"));
			pstmt.setString(2, request.getParameter("eno"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return false;

	}

	public static String IDTypeCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String SessionID = (String)session.getAttribute("m_id");
		String judgeString = SessionID.substring(0,5);
		if(judgeString.equals("LINE_")) {
			return "line";
		}
		else {
			return "normal";
		}
		
	}
}
