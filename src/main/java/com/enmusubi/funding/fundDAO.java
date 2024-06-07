package com.enmusubi.funding;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class fundDAO {

	public static void selectFundList(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from s_wishlist where e_no = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "1");
			rs=pstmt.executeQuery();
			ArrayList<FundListDTO> flists = new ArrayList<FundListDTO>();
			while(rs.next()) {
				FundListDTO fldto = new FundListDTO();
				fldto.setWl_no(rs.getString("wl_no"));
				fldto.setWl_product(rs.getString("wl_product"));
				fldto.setWl_price(rs.getString("wl_price"));
				fldto.setWl_comment(rs.getString("wl_comment"));
				fldto.setE_no(rs.getString("e_no"));
				flists.add(fldto);
			}
			System.out.println(flists);
			Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			String json = gson.toJson(flists);
			System.out.println(json);
			request.setAttribute("list", flists);
			request.setAttribute("jsonList", json);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		}

	}

	public static void insertWishiPick(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO S_PAY values(?,?,?,?,?)";
		//e_no,m_id,p_type,p_price,wl_no
		String eno = request.getParameter("eno");
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("m_id");
		System.out.println(mid);
		String pt = request.getParameter("paytype");
		String price = request.getParameter("price");
		String wlno = request.getParameter("wlno");
		try {
			con=DBManager.connect();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, eno);
			pstmt.setString(2, mid);
			pstmt.setString(3, pt);
			pstmt.setString(4, price);
			pstmt.setString(5, wlno);
			if(pstmt.executeUpdate()==1){
				System.out.println("insert success!!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("server err...");
		}
	}

}
