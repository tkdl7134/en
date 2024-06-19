package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.naming.java.javaURLContextFactory;

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
		PreparedStatement pstmtWedding = null;
		PreparedStatement pstmtReception = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
//		create sequence e_no_seq;
																//	e_no
		String sqlWeddingInfo = "insert into s_wedding_info values(e_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sqlWedding = "insert into s_reception values(s_reception_seq.nextval, e_no_seq.currval, ?, ?, ?, ?, ?)";
		String sqlReception = "insert into s_reception values(s_reception_seq.nextval, e_no_seq.currval, ?, ?, ?, ?, ?)";
		
		try {
			 con = dbManager.connect();
			 
			 pstmtWeddingInfo = con.prepareStatement(sqlWeddingInfo);
			 pstmtWedding = con.prepareStatement(sqlWedding);
			 pstmtReception = con.prepareStatement(sqlReception);
			 
			 
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
			
			pstmtWeddingInfo.setString(1, mr.getParameter("templatePK"));
			pstmtWeddingInfo.setString(2,  groomName_kanji);
			pstmtWeddingInfo.setString(3,  groomName_kana);
			pstmtWeddingInfo.setString(4, groomName_roma);
			pstmtWeddingInfo.setString(5, brideName_kanji);
			pstmtWeddingInfo.setString(6, brideName_kana);
			pstmtWeddingInfo.setString(7, brideName_roma);
			pstmtWeddingInfo.setString(8, hello);
			pstmtWeddingInfo.setString(9, bye);
			pstmtWeddingInfo.setString(10, mr.getFilesystemName("photo1"));
			pstmtWeddingInfo.setString(11, mr.getFilesystemName("photo2"));
			pstmtWeddingInfo.setString(12, mr.getFilesystemName("photo3"));
			pstmtWeddingInfo.setString(13, mr.getFilesystemName("photo4"));
			
			
			
			//s_reception 테이블 삽입 
			String weddingDay = mr.getParameter("weddingDay");
			String m_time = mr.getParameter("marriageTime");
			String wedding = weddingDay + " " + m_time;
			
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:dd");
			Date weddingDateTime = dateTimeFormat.parse(wedding);
			System.out.println(weddingDateTime);
			java.sql.Date weddingDT = new java.sql.Date(weddingDateTime.getTime());
			
			String m_timeA = mr.getParameter("marriageTime_a");
			String r_time = mr.getParameter("receptionTime");
			String r_timeA = mr.getParameter("receptionTime_a");
			
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
			Date weddingAssemble = timeFormat.parse(m_timeA);
			Date receptionT = timeFormat.parse(r_time);
			Date receptionAssemble = timeFormat.parse(r_timeA);
			
			java.sql.Date weddingA = new java.sql.Date(weddingAssemble.getTime());
			java.sql.Date receptionTime = new java.sql.Date(receptionT.getTime());
			java.sql.Date receptionA = new java.sql.Date(receptionAssemble.getTime());
//			
//			SimpleDateFormat TimeFormat = new SimpleDateFormat("HH:mm");
//			java.sql.Timestamp weddingTimeA = new java.sql.Timestamp(TimeFormat.parse(m_timeA).getTime());
//			java.sql.Timestamp receptionTimeA = new java.sql.Timestamp(TimeFormat.parse(r_timeA).getTime());
			
			
			// 본식
			pstmtWedding.setDate(1, weddingDT);   // weddingday+marriagetime
			pstmtWedding.setString(2, mr.getParameter("marriage_place"));
			pstmtWedding.setString(3, mr.getParameter("marriage_addr"));
			pstmtWedding.setDate(4, weddingA);
			pstmtWedding.setString(5, "wedding");
			
			// 본식
			pstmtWedding.setDate(1, receptionTime);   // weddingday+marriagetime
			pstmtWedding.setString(2, mr.getParameter("reception_place"));
			pstmtWedding.setString(3, mr.getParameter("reception_addr"));
			pstmtWedding.setDate(4, receptionA);
			pstmtWedding.setString(5, "reception");
						
			
			
		} catch (Exception e) {
		    e.printStackTrace();
		    System.out.println("server err...");
		} finally {
		    dbManager.close(con, pstmtWeddingInfo, rs);
		}
		
	}


}
