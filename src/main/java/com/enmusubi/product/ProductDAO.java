package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
//import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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

	public static void getTemplateForm(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
		String sql = "select t_template from s_template where t_pk = ?";
		
		try {
		    con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("templatePK"));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("템플릿 겟또!");
				request.setAttribute("templateForm", rs.getString("t_template"));
				request.setAttribute("t_pk", request.getParameter("templatePK"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("서버 에-러");
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		
	}
	
	public static void regIvitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmtEvent = null;
		PreparedStatement pstmtEventFunc = null;
		PreparedStatement pstmtWeddingInfo = null;
		PreparedStatement pstmtWedding = null;
		PreparedStatement pstmtReception = null;
		
		PreparedStatement pstmtEventNo = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
//		create sequence e_no_seq;
		
		String sqlEvent = "insert into s_event values(e_no_seq.nextval, ?, ?)";
		String sqlEventFunc = "insert into s_event_func values(e_no_seq.currval, ?, ?)";
		String sqlWeddingInfo = "insert into s_wedding_info values(e_no_seq.currval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sqlWedding = "insert into s_reception values(s_reception_seq.nextval, e_no_seq.currval, ?, ?, ?, ?, ?)";
		String sqlReception = "insert into s_reception values(s_reception_seq.nextval, e_no_seq.currval, ?, ?, ?, ?, ?)";
		
		try {
			 con = dbManager.connect();
			 
			 pstmtEvent = con.prepareStatement(sqlEvent);
			 pstmtEventFunc = con.prepareStatement(sqlEventFunc);
			 pstmtWeddingInfo = con.prepareStatement(sqlWeddingInfo);
			 pstmtWedding = con.prepareStatement(sqlWedding);
			 pstmtReception = con.prepareStatement(sqlReception);
			 
			 
			String path = request.getServletContext().getRealPath("product/imgFolder");
			MultipartRequest mr = new MultipartRequest(
										request, path, 1024*1024*20,
										"utf-8", new DefaultFileRenamePolicy());
			
			// 외래키 유효성 검사 
			
			int templatePK = Integer.parseInt(mr.getParameter("templatePK"));
			if (!isTemplatePKValid(templatePK)) {
				System.out.println("유효 PK 아님");
				return;
			}
			
			
			// s_event 삽입
			pstmtEvent.setString(1, "testuser11");
			pstmtEvent.setString(2, "");
			
			// s_event_func 삽입
			pstmtEventFunc.setString(1, "yes");
			pstmtEventFunc.setString(2, "yes");
			
			// s_wedding_info table 삽입
			
//			System.out.println(mr.getParameter("templatePK"));
			System.out.println(mr.getParameter("groomRomaL"));
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
			
			System.out.println(templatePK + " " + groomName_kanji+ " " + groomName_kana + " " + groomName_roma + " " +
					brideName_kanji + " " + brideName_kana + " " + brideName_roma + " " + " " + hello + " "+ bye);
			
			
			pstmtWeddingInfo.setInt(1, templatePK);
			pstmtWeddingInfo.setString(2, groomName_kanji);
			pstmtWeddingInfo.setString(3, groomName_kana);
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
			System.out.println(weddingDay);
			System.out.println(weddingDay.charAt(11));
			
			String day = weddingDay.charAt(11) + ""; // 요일
			String remove = weddingDay.replace(day, "").trim(); // 요일 제거버전
			
			String m_time = mr.getParameter("marriageTime");
			String m_timeA = mr.getParameter("marriageTime_a");
			String r_time = mr.getParameter("receptionTime");
			String r_timeA = mr.getParameter("receptionTime_a");
//			System.out.println(m_time);
			String weddingTime = remove + " " + m_time;
			String receptionTime = remove + " " + r_time;
			String weddingAssemleTime = remove + " " + m_timeA;
			String receptionAssembleTime = remove + " " + r_timeA;
			System.out.println(weddingTime);
			
			
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			Date weddingT = dateTimeFormat.parse(weddingTime);
			Date receptionT = dateTimeFormat.parse(receptionTime);
			Date weddingAT = dateTimeFormat.parse(weddingAssemleTime);
			Date receptionAT = dateTimeFormat.parse(receptionAssembleTime);
			java.sql.Timestamp wedding_time = new java.sql.Timestamp(weddingT.getTime());
			java.sql.Timestamp reception_time = new java.sql.Timestamp(receptionT.getTime());
			java.sql.Timestamp wedding_assemble_time = new java.sql.Timestamp(weddingAT.getTime());
			java.sql.Timestamp reception_assemble_time = new java.sql.Timestamp(receptionAT.getTime());
			System.out.println(wedding_time);
			
			
//			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
//			Date weddingAT = timeFormat.parse(m_timeA);
//			Date receptionAT = timeFormat.parse(r_timeA);
			System.out.println(wedding_assemble_time);

			
					
//			System.out.println("m_time : " + m_timeA);
//			
//			Date weddingAssemble = timeFormat.parse(m_timeA);
//			java.sql.Date weddingA = new java.sql.Date(weddingAssemble.getTime());

			
			
			// 본식
			pstmtWedding.setTimestamp(1, wedding_time);   // weddingday+marriagetime
			pstmtWedding.setString(2, mr.getParameter("marriage_place"));
			pstmtWedding.setString(3, mr.getParameter("marriage_addr"));
			pstmtWedding.setTimestamp(4, wedding_assemble_time);
			pstmtWedding.setString(5, "wedding");
			
			// 본식
			pstmtReception.setTimestamp(1, reception_time);   // weddingday+marriagetime
			pstmtReception.setString(2, mr.getParameter("reception_place"));
			pstmtReception.setString(3, mr.getParameter("reception_addr"));
			pstmtReception.setTimestamp(4, reception_assemble_time);
			pstmtReception.setString(5, "reception");
						
			if (pstmtEvent.executeUpdate() == 1) {
				System.out.println("Event - 성공");
				
				String sql = "select e_no_seq.currval from dual";
				pstmtEventNo = con.prepareCall(sql);
				rs = pstmtEventNo.executeQuery();
				int eventNo = 0;
				if (rs.next()) {
					System.out.println("이벤트번호 겟또");
					eventNo = rs.getInt(1);
					System.out.println(eventNo);					
				}
				request.setAttribute("je_eventNo", eventNo);
			}
			
			if (pstmtEventFunc.executeUpdate() == 1) {
				System.out.println("eventfunc - 성공");
			}
			if (pstmtWeddingInfo.executeUpdate() == 1) {
				System.out.println("weddinginfo - 성공");
			}
			if (pstmtWedding.executeUpdate() == 1) {
				System.out.println("wedding - 성공");
			}
			if (pstmtReception.executeUpdate() == 1) {
				System.out.println("reception - 성공");
			}
			
			
			
			
		} catch (Exception e) {
		    e.printStackTrace();
		    System.out.println("server err...");
		} finally {
		   dbManager.close(null, pstmtReception, null);
		   dbManager.close(null, pstmtWedding, null);
		   dbManager.close(con, pstmtWeddingInfo, rs);
		   
		}
		
	}

	private static boolean isTemplatePKValid(int templatePK) {
    	return true; // 항상 유효
    }

	public static void getInvitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
		String sql = "SELECT e.e_no, w.t_pk,"
						+ " w.w_groom, w.w_bride, w.w_msg_invite, w.w_msg_bye, w.w_img1, w.w_img2, w.w_img3, w.w_img4,"
						+ " t.t_template,"
						+ " rw.r_time AS wedding_time,"
						+ " rw.r_time_assemble AS wedding_assemble_time,"
						+ " rr.r_time AS reception_time,"
						+ " rr.r_time_assemble AS reception_assemble_time,"
						+ " rw.r_place AS wedding_place,"
						+ " rw.r_addr AS wedding_addr,"
						+ " rr.r_place AS reception_place,"
						+ " rr.r_addr AS reception_addr "
					+ " FROM s_event e"
					+ " JOIN s_wedding_info w ON e.e_no = w.e_no" 
					+ " JOIN s_template t ON w.t_pk = t.t_pk"
					+ " JOIN s_reception rw ON e.e_no = rw.e_no AND rw.r_type = 'wedding'"
					+ " JOIN s_reception rr ON e.e_no = rr.e_no AND rr.r_type = 'reception'"
					+ " WHERE e.e_no = ? ";
		
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (int)request.getAttribute("je_eventNo"));
			System.out.println(request.getAttribute("je_eventNo"));
			rs = pstmt.executeQuery();
			
			invitaitonDTO inviteInfo = null;
			if (rs.next()) {
				Timestamp weddingDT = rs.getTimestamp("wedding_time");
				Timestamp weddingADT = rs.getTimestamp("wedding_assemble_time");
				Timestamp receptionDT = rs.getTimestamp("reception_time");
				Timestamp receptionADT = rs.getTimestamp("reception_assemble_time");
//				if (weddingDT != null || ) {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd E", Locale.JAPANESE);
				SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
				SimpleDateFormat timeFormat2 = new SimpleDateFormat("集合  " + "HH:mm");
					
				String weddingDay = dateFormat.format(weddingDT);
				String weddingTime = timeFormat.format(weddingDT);
				String weddingA_Time = timeFormat2.format(weddingADT);
				String receptionTime = timeFormat.format(receptionDT);
				String receptionA_Time = timeFormat2.format(receptionADT);
				
				String inviteMSG = rs.getString("w_msg_invite").replace("<br>", "\r\n");
				String byeMSG = rs.getString("w_msg_bye").replace("<br>", "\r\n");
				
				inviteInfo
				= new invitaitonDTO(
						(int)request.getAttribute("je_eventNo"), 
						rs.getInt("t_pk"), rs.getString("t_template"),
						rs.getString("w_groom"), rs.getString("w_bride"),
						inviteMSG, byeMSG,
						rs.getString("w_img1"),rs.getString("w_img2"),rs.getString("w_img3"),rs.getString("w_img4"),
						weddingDay, weddingTime, weddingA_Time, receptionTime, receptionA_Time,
						rs.getString("wedding_place"), rs.getString("wedding_addr"),rs.getString("reception_place"),rs.getString("reception_addr"));
			}
			request.setAttribute("inviteInfo", inviteInfo);
			
		} catch (Exception e) {
		    e.printStackTrace();
		    System.out.println("invitation 정보뽑아오기 쪽 error");
		} finally {
		    dbManager.close(con, pstmt, rs);
		}
	

		
	}


}
