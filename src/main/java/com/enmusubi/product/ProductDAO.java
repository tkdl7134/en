package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class ProductDAO {
	
	private static ArrayList<ProductDTO> products;

	public static void getAllTemplate(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
		String sql = "select * from s_template";
		
		try {
		    con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			products = new ArrayList<ProductDTO>();
			ProductDTO p = null;
			while (rs.next()) {
				p = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				products.add(p);
				System.out.println(rs.getInt(1));
			}
			request.setAttribute("products", products);
			
		} catch (Exception e) {
			    e.printStackTrace();
			    System.out.println("server err...");
			} finally {
			    dbManager.close(con, pstmt, rs);
			}
		
	}

	
	public static void regIvitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmtWeddingInfo = null;
		PreparedStatement pstmtReception1 = null;
		PreparedStatement pstmtReception2 = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		

		
		try {
			 con = dbManager.connect();
//			 pstmt = con.prepareStatement(sql);
			 
			String path = request.getServletContext().getRealPath("product/imgFile");
			MultipartRequest mr = new MultipartRequest(
										request, path, 1024*1024*20,
										"utf-8", new DefaultFileRenamePolicy());
			
			String template = mr.getParameter("t_pk");
			
			String groomName_kanji = mr.getParameter("groomKanjiL") + " " + mr.getParameter("groomKanjiF");
			String groomName_kana = mr.getParameter("groomKanaL")+ " " + mr.getParameter("groomKanaF");
			String groomName_roma = mr.getParameter("groomRomaL")+ " " + mr.getParameter("groomRomaF");
			String brideName_kanji = mr.getParameter("brideKanjiL") + " " + mr.getParameter("brideKanjiF");
			String brideName_kana = mr.getParameter("brideKanaL")+ " " + mr.getParameter("brideKanaF");
			String brideName_roma = mr.getParameter("brideRomaL")+ " " + mr.getParameter("brideRomaF");
			
			String weddingDay = mr.getParameter("weddingDay");
			
			String m_time = mr.getParameter("marriageTime");
			String m_timeA = mr.getParameter("marriageTime_a");
			String m_place = mr.getParameter("marriage_place");
			String m_addr = mr.getParameter("marriage_addr");
			
			String r_time = mr.getParameter("receptionTime");
			String r_timeA = mr.getParameter("receptionTime_a");
			String r_place = mr.getParameter("reception_place");
			String r_addr = mr.getParameter("reception_addr");
			
			String hello = mr.getParameter("helloMessage");
			String bye = mr.getParameter("byeMessage");
			
			hello = hello.replaceAll("\r\n", "<br>");
			bye = bye.replaceAll("\r\n", "<br>");
			
			String photo1 = mr.getFilesystemName("photo1");
			String photo2 = mr.getFilesystemName("photo2");
			String photo3 = mr.getFilesystemName("photo3");
			String photo4 = mr.getFilesystemName("photo4");
			
			
			
			pstmt.setString(2, template);
			pstmt.setString(3, groomName_kanji);
			pstmt.setString(4, groomName_kana);
			pstmt.setString(5, groomName_roma);
			pstmt.setString(6, brideName_kanji);
			pstmt.setString(7, brideName_kana);
			pstmt.setString(8, brideName_roma);
			pstmt.setString(9, hello);
			pstmt.setString(10, bye);
			pstmt.setString(11, photo1);
			pstmt.setString(12, photo2);
			pstmt.setString(13, photo3);
//			pstmt.setString(14, photo4);
			
			pstmt.setString(2, e_no);
			pstmt.setString(3, m_time);
			pstmt.setString(4, m_timeA);
			pstmt.setString(5, m_place);
			pstmt.setString(6, m_addr);
			
			
			
			
		} catch (Exception e) {
		    e.printStackTrace();
		    System.out.println("server err...");
		} finally {
		    dbManager.close(con, pstmt, rs);
		}
		
	}


}
