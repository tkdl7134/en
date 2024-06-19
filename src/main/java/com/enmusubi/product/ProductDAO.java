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
//		PreparedStatement pstmtEventNo = null;
		PreparedStatement pstmtWeddingInfo = null;
		PreparedStatement pstmtReception = null;
		PreparedStatement pstmtReception2 = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
//		create sequence e_no_seq;
		
		String sqlWeddingInfo = "insert into s_wedding_info values(e_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		
		try {
			 con = dbManager.connect();
			 
			 pstmtWeddingInfo = con.prepareStatement(sqlWeddingInfo);
			 
			 
			String path = request.getServletContext().getRealPath("product/imgFile");
			MultipartRequest mr = new MultipartRequest(
										request, path, 1024*1024*20,
										"utf-8", new DefaultFileRenamePolicy());
			
			// s_wedding_info table 삽입
			String groomName_kanji = mr.getParameter("groomKanjiL") + " " + mr.getParameter("groomKanjiF");
			String groomName_kana = mr.getParameter("groomKanaL")+ " " + mr.getParameter("groomKanaF");
			String groomName_roma = mr.getParameter("groomRomaL")+ " " + mr.getParameter("groomRomaF");
			String brideName_kanji = mr.getParameter("brideKanjiL") + " " + mr.getParameter("brideKanjiF");
			String brideName_kana = mr.getParameter("brideKanaL")+ " " + mr.getParameter("brideKanaF");
			String brideName_roma = mr.getParameter("brideRomaL")+ " " + mr.getParameter("brideRomaF");
			String hello = mr.getParameter("helloMessage");
			String bye = mr.getParameter("byeMessage");
			hello = hello.replaceAll("\r\n", "<br>");
			bye = bye.replaceAll("\r\n", "<br>");
			
			pstmtWeddingInfo.setString(2, mr.getParameter("templatePK"));
			pstmtWeddingInfo.setString(3,  groomName_kanji);
			pstmtWeddingInfo.setString(4,  groomName_kana);
			pstmtWeddingInfo.setString(5, groomName_roma);
			pstmtWeddingInfo.setString(6, brideName_kanji);
			pstmtWeddingInfo.setString(7, brideName_kana);
			pstmtWeddingInfo.setString(8, brideName_roma);
			pstmtWeddingInfo.setString(9, hello);
			pstmtWeddingInfo.setString(10, bye);
			pstmtWeddingInfo.setString(11, mr.getFilesystemName("photo1"));
			pstmtWeddingInfo.setString(12, mr.getFilesystemName("photo2"));
			pstmtWeddingInfo.setString(13, mr.getFilesystemName("photo3"));
			pstmtWeddingInfo.setString(14, mr.getFilesystemName("photo4"));
			
			
			String weddingDay = mr.getParameter("weddingDay");
			
			String m_time = mr.getParameter("marriageTime");
			String m_timeA = mr.getParameter("marriageTime_a");
			String m_place = mr.getParameter("marriage_place");
			String m_addr = mr.getParameter("marriage_addr");
			
			String r_time = mr.getParameter("receptionTime");
			String r_timeA = mr.getParameter("receptionTime_a");
			String r_place = mr.getParameter("reception_place");
			String r_addr = mr.getParameter("reception_addr");
			
			pstmt.setString(2, t_pk);
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
