package com.enmusubi.myPage.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;

public class StatisticsDAO {

	public static void showAllList(HttpServletRequest request) {

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from s_wishlist";
			String sql2 = "select * from s_member";
			try {
				con = DBManager.connect();
				System.out.println("연결 성공");
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				ArrayList<wishlistDTO> wishlists = new ArrayList<wishlistDTO>();
				ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
				while (rs.next()) {
					wishlistDTO wl = new wishlistDTO();
					wl.setW_no(rs.getInt(1));
					wl.setW_product(rs.getString(2));
					wl.setW_price(rs.getInt(3));
					wl.setE_no(rs.getInt(4));
					wl.setW_comment(rs.getString(5));
					wl.setW_date(rs.getDate(6));
					wishlists.add(wl);
					System.out.println(wishlists);
					request.setAttribute("wishlists", wishlists);
					pstmt = con.prepareStatement(sql2);
					while (rs.next()) {
						MemberDTO member = new MemberDTO();
						member.setM_name(rs.getString(3));
						members.add(member);
						System.out.println(members);
						request.setAttribute("members", members);
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(con, pstmt, rs);
			}
		
	}

	
	
	
	
	
	
}
