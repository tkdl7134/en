package com.enmusubi.product;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
//import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductDAO {

	private static ArrayList<ProductDTO> products;

	// 상품소개 - 모든 템플릿 보여주기
	public static void getAllTemplate(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();

		String sql = "select * from s_template order by t_pk desc";

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

	// 상품 선택 시, 해당 템플릿 보여주기
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

	// 초대장 작성 내용 저장
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
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
					new DefaultFileRenamePolicy());

			// 외래키 유효성 검사

			int templatePK = Integer.parseInt(mr.getParameter("templatePK"));
			if (!isTemplatePKValid(templatePK)) {
				System.out.println("유효 PK 아님");
				return;
			}
			// s_event 삽입
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("m_id");
			pstmtEvent.setString(1, userId);
			pstmtEvent.setString(2, "");

			// s_event_func 삽입
			pstmtEventFunc.setString(1, "yes");
			pstmtEventFunc.setString(2, "yes");

			// s_wedding_info table 삽입

//			System.out.println(mr.getParameter("templatePK"));
			System.out.println(mr.getParameter("groomRomaL"));
			String groomName_kanji = mr.getParameter("groomKanjiL") + " " + mr.getParameter("groomKanjiF");
			String groomName_kana = mr.getParameter("groomKanaL") + " " + mr.getParameter("groomKanaF");
			String groomName_roma = mr.getParameter("groomRomaL") + " " + mr.getParameter("groomRomaF");
			String brideName_kanji = mr.getParameter("brideKanjiL") + " " + mr.getParameter("brideKanjiF");
			String brideName_kana = mr.getParameter("brideKanaL") + " " + mr.getParameter("brideKanaF");
			String brideName_roma = mr.getParameter("brideRomaL") + " " + mr.getParameter("brideRomaF");
			String hello = mr.getParameter("helloMessage");
			String bye = mr.getParameter("byeMessage");
			hello = hello.replaceAll("\r\n", "<br>");
			bye = bye.replaceAll("\r\n", "<br>");

			System.out.println(templatePK + " " + groomName_kanji + " " + groomName_kana + " " + groomName_roma + " "
					+ brideName_kanji + " " + brideName_kana + " " + brideName_roma + " " + " " + hello + " " + bye);

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

			// s_reception 테이블 삽입
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
			pstmtWedding.setTimestamp(1, wedding_time); // weddingday+marriagetime
			pstmtWedding.setString(2, mr.getParameter("marriage_place"));
			pstmtWedding.setString(3, mr.getParameter("marriage_addr"));
			pstmtWedding.setTimestamp(4, wedding_assemble_time);
			pstmtWedding.setString(5, "wedding");

			// 피로연
			pstmtReception.setTimestamp(1, reception_time); // weddingday+marriagetime
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

	// 작성한 초대장 미리보기
	public static void getInvitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();

		String sql = "SELECT e.e_no, w.t_pk,"
				+ " w.w_groom, w.w_bride, w.w_msg_invite, w.w_msg_bye, w.w_img1, w.w_img2, w.w_img3, w.w_img4,"
				+ " t.t_template," + " rw.r_time AS wedding_time," + " rw.r_time_assemble AS wedding_assemble_time,"
				+ " rr.r_time AS reception_time," + " rr.r_time_assemble AS reception_assemble_time,"
				+ " rw.r_place AS wedding_place," + " rw.r_addr AS wedding_addr," + " rr.r_place AS reception_place,"
				+ " rr.r_addr AS reception_addr " + " FROM s_event e" + " JOIN s_wedding_info w ON e.e_no = w.e_no"
				+ " JOIN s_template t ON w.t_pk = t.t_pk"
				+ " JOIN s_reception rw ON e.e_no = rw.e_no AND rw.r_type = 'wedding'"
				+ " JOIN s_reception rr ON e.e_no = rr.e_no AND rr.r_type = 'reception'" + " WHERE e.e_no = ? ";

		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			int intEno= (int)(request.getAttribute("je_eventNo"));
			pstmt.setInt(1, intEno);
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

				String inviteMSG = rs.getString("w_msg_invite");
				String byeMSG = rs.getString("w_msg_bye");
				inviteMSG = inviteMSG.replaceAll("\r\n", "<br>");
				System.out.println(inviteMSG);
				byeMSG = byeMSG.replaceAll("\r\n", "<br>");

				System.out.println(inviteMSG);

				inviteInfo = new invitaitonDTO((int) intEno, rs.getInt("t_pk"),
						rs.getString("t_template"), rs.getString("w_groom"), rs.getString("w_bride"), inviteMSG, byeMSG,
						rs.getString("w_img1"), rs.getString("w_img2"), rs.getString("w_img3"), rs.getString("w_img4"),
						weddingDay, weddingTime, weddingA_Time, receptionTime, receptionA_Time,
						rs.getString("wedding_place"), rs.getString("wedding_addr"), rs.getString("reception_place"),
						rs.getString("reception_addr"));
			}
			request.setAttribute("inviteInfo", inviteInfo);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("invitation 정보뽑아오기 쪽 error");
		} finally {
			dbManager.close(con, pstmt, rs);
		}

	}

	// 초대장 삭제하기
	public static void deleteInvitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		PreparedStatement pstmt5 = null;
		DBManager dbManager = DBManager.getInstance();
		  String sql = "delete from s_reception where e_no = ?";
		  String sql2 = "delete from s_wedding_info where e_no = ?";
		  String sql3 = "delete from s_event_func where e_no = ?";
		  String sql4 = "delete from s_wishlist where e_no = ?";
		  String sql5 = "delete from s_event where e_no = ?";
		  
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("eno")));
			pstmt.executeUpdate();
			
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, Integer.parseInt(request.getParameter("eno")));
			pstmt2.executeUpdate();
			
			pstmt3 = con.prepareStatement(sql3);
			pstmt3.setInt(1, Integer.parseInt(request.getParameter("eno")));
			pstmt3.executeUpdate();
			
			pstmt4 = con.prepareStatement(sql4);
			pstmt4.setInt(1, Integer.parseInt(request.getParameter("eno")));
			pstmt4.executeUpdate();
			
			pstmt5 = con.prepareStatement(sql5);
			pstmt5.setInt(1, Integer.parseInt(request.getParameter("eno")));
//			pstmt5.executeUpdate();
			
			if (pstmt5.executeUpdate() ==1) {
				System.out.println("삭제성공");
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("초대장 삭제 쪽 오류");
		} finally {
			dbManager.close(con, pstmt, null);
			dbManager.close(null, pstmt2, null);
			dbManager.close(null, pstmt3, null);
			dbManager.close(null, pstmt4, null);
			dbManager.close(null, pstmt5, null);
		}
		
	}

	
	public static void getOneInvitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT w.*, t.t_template,"
					+ " rw.r_time AS wedding_time, rw.r_time_assemble AS wedding_assemble_time,"
					+ " rr.r_time AS reception_time, rr.r_time_assemble AS reception_assemble_time,"
					+ " rw.r_place AS wedding_place, rw.r_addr AS wedding_addr, rr.r_place AS reception_place,"
					+ " rr.r_addr AS reception_addr FROM s_wedding_info w"
					+ " JOIN s_template t ON w.t_pk = t.t_pk"
					+ " JOIN s_reception rw ON w.e_no = rw.e_no AND rw.r_type = 'wedding'"
					+ " JOIN s_reception rr ON w.e_no = rr.e_no AND rr.r_type = 'reception' WHERE w.e_no = ?";
		
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("eno")));
			rs = pstmt.executeQuery();
			
			invitationAllInfoDTO inviationAll = null;
			if (rs.next()) {
				String w_groom = rs.getString("w_groom");
				String[] w_groomLF = w_groom.split(" ");
				String w_groomL = w_groomLF[0];
				String w_groomF = w_groomLF[1];
				
				String w_groom_kana = rs.getString("w_groom_kana");
				String[] w_groom_kanaLF = w_groom_kana.split(" ");
				String w_groom_kanaL = w_groom_kanaLF[0];
				String w_groom_kanaF = w_groom_kanaLF[1];
				
				String w_groom_eng = rs.getString("w_groom_eng");
				String[] w_groom_engLF = w_groom_eng.split(" ");
				String w_groom_engL = w_groom_engLF[0];
				String w_groom_engF = w_groom_engLF[1];
				
				String w_bride = rs.getString("w_bride");
				String[] w_brideLF = w_bride.split(" ");
				String w_brideL = w_brideLF[0];
				String w_brideF = w_brideLF[1];
				
				String w_bride_kana = rs.getString("w_bride_kana");
				String[] w_bride_kanaLF = w_bride_kana.split(" ");
				String w_bride_kanaL = w_bride_kanaLF[0];
				String w_bride_kanaF = w_bride_kanaLF[1];
				
				String w_bride_eng = rs.getString("w_bride_eng");
				String[] w_bride_engLF = w_bride_eng.split(" ");
				String w_bride_engL = w_bride_engLF[0];
				String w_bride_engF = w_bride_engLF[1];
				
				Timestamp weddingDT = rs.getTimestamp("wedding_time");
				Timestamp weddingADT = rs.getTimestamp("wedding_assemble_time");
				Timestamp receptionDT = rs.getTimestamp("reception_time");
				Timestamp receptionADT = rs.getTimestamp("reception_assemble_time");
//				if (weddingDT != null || ) {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd E", Locale.JAPANESE);
				SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

				String weddingDay = dateFormat.format(weddingDT);
				String weddingTime = timeFormat.format(weddingDT);
				String weddingA_Time = timeFormat.format(weddingADT);
				String receptionTime = timeFormat.format(receptionDT);
				String receptionA_Time = timeFormat.format(receptionADT);

				String inviteMSG = rs.getString("w_msg_invite");
				String byeMSG = rs.getString("w_msg_bye");
				inviteMSG = inviteMSG.replaceAll("<br>", "\r\n");
				System.out.println(inviteMSG);
				byeMSG = byeMSG.replaceAll("<br>", "\r\n");

				inviationAll = new invitationAllInfoDTO
				(Integer.parseInt(request.getParameter("eno")), rs.getInt("t_pk"), rs.getString("t_template"),
				w_groomL, w_groomF, w_groom_kanaL, w_groom_kanaF, w_groom_engL, w_groom_engF,
				w_brideL, w_brideF, w_bride_kanaL, w_bride_kanaF, w_bride_engL, w_bride_engF,
				inviteMSG, byeMSG, rs.getString("w_img1"),rs.getString("w_img2"), rs.getString("w_img3"), rs.getString("w_img4"),
				weddingDay, weddingTime, weddingA_Time, receptionTime, receptionA_Time,
				rs.getString("wedding_place"),rs.getString("wedding_addr"), 
				rs.getString("reception_place"), rs.getString("reception_addr"));
				
			}
			request.setAttribute("invitationAll", inviationAll);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update 전, 전체 정보 보여주기 쪽 error");
		}finally {
			dbManager.close(con, pstmt, rs);
		}
	}
	
	public static void updateInvitaion(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmtWeddingInfo = null;
		PreparedStatement pstmtWedding = null;
		PreparedStatement pstmtReception = null;

		DBManager dbManager = DBManager.getInstance();
		String sqlWedding = "update s_reception set r_time=?, r_time_assemble=?, r_place=?, r_addr=? where e_no = ? and r_type = 'wedding' ";
		String sqlReception = "update s_reception set r_time=?, r_time_assemble=?, r_place=?, r_addr=? where e_no = ? and r_type = 'reception'";
		
		
		try {
			con = dbManager.connect();
			pstmtWedding = con.prepareStatement(sqlWedding);
			pstmtReception = con.prepareStatement(sqlReception);
			
			String path = request.getServletContext().getRealPath("product/imgFolder");
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
					new DefaultFileRenamePolicy());

			// weddingInfo 수정
			
			String hello = mr.getParameter("new_helloMessage");
			String bye = mr.getParameter("new_byeMessage");
			hello = hello.replaceAll("\r\n", "<br>");
			bye = bye.replaceAll("\r\n", "<br>");
			
			String sqlWeddingInfo = "update s_wedding_info set w_groom=?, w_groom_kana=?, w_groom_eng=?,"
					+ " w_bride=?, w_bride_kana=?, w_bride_eng=?, w_img1=?, w_img2=?, w_img3=?, w_img4=? ";
			if (hello != null) {
				sqlWeddingInfo += ", w_msg_invite=?";
			}
			if (bye != null) {
				sqlWeddingInfo += ", w_msg_bye=?";	
			}
			sqlWeddingInfo += " where e_no = ?";
			
			pstmtWeddingInfo = con.prepareStatement(sqlWeddingInfo); // 전부 다 13개 ~ 11개
			
			String g = mr.getParameter("new_groomL") + " " + mr.getParameter("new_groomF");
			String g_kana = mr.getParameter("new_groomKanaL") + " " + mr.getParameter("new_groomKanaF");
			String g_eng = mr.getParameter("new_groomRomaL") + " " + mr.getParameter("new_groomRomaF");
			String b = mr.getParameter("new_brideL") + " " + mr.getParameter("new_brideF");
			String b_kana = mr.getParameter("new_brideKanaL") + " " + mr.getParameter("new_brideKanaF");
			String b_eng = mr.getParameter("new_brideRomaL") + " " + mr.getParameter("new_brideRomaF");
			
			String old1 = mr.getParameter("oldPhoto1");
			String old2 = mr.getParameter("oldPhoto2");
			String old3 = mr.getParameter("oldPhoto3");
			String old4 = mr.getParameter("oldPhoto4");
			String new1 = mr.getFilesystemName("new_photo1");
			String new2 = mr.getFilesystemName("new_photo2");
			String new3 = mr.getFilesystemName("new_photo3");
			String new4 = mr.getFilesystemName("new_photo4");
			String photo1 = old1;
			String photo2 = old2;
			String photo3 = old3;
			String photo4 = old4;
			if (new1 != null) { photo1 = new1; }
			if (new2 != null) { photo2 = new2; }
			if (new3 != null) { photo3 = new3; }
			if (new4 != null) {	photo4 = new4; }
			
			pstmtWeddingInfo.setString(1, g);
			pstmtWeddingInfo.setString(2, g_kana);
			pstmtWeddingInfo.setString(3, g_eng);
			pstmtWeddingInfo.setString(4, b);
			pstmtWeddingInfo.setString(5, b_kana);
			pstmtWeddingInfo.setString(6, b_eng);
			pstmtWeddingInfo.setString(7, photo1);
			pstmtWeddingInfo.setString(8, photo2);
			pstmtWeddingInfo.setString(9, photo3);
			pstmtWeddingInfo.setString(10, photo4);
			
			if (hello != null && bye != null) {
				pstmtWeddingInfo.setString(11, hello);
				pstmtWeddingInfo.setString(12, bye);
				pstmtWeddingInfo.setInt(13, Integer.parseInt(mr.getParameter("eno")));
			} else if (hello != null && bye == null ) {
				pstmtWeddingInfo.setString(11, hello);
				pstmtWeddingInfo.setInt(12, Integer.parseInt(mr.getParameter("eno")));
			} else if (hello == null && bye != null) {
				pstmtWeddingInfo.setString(11, bye);
				pstmtWeddingInfo.setInt(12, Integer.parseInt(mr.getParameter("eno")));
			} else {
				pstmtWeddingInfo.setInt(11, Integer.parseInt(mr.getParameter("eno")));
			}
			
			if (pstmtWeddingInfo.executeUpdate() == 1) {
				System.out.println("weddingInfo 수정 완료");
			}
			
			// wedding / reception 날짜 및 시간 수정

			String weddingDay = mr.getParameter("new_weddingDay");
			System.out.println(weddingDay);
			System.out.println(weddingDay.charAt(11));

			String day = weddingDay.charAt(11) + ""; // 요일
			String remove = weddingDay.replace(day, "").trim(); // 요일 제거버전
			String m_time = mr.getParameter("new_marriageTime");
			String m_timeA = mr.getParameter("new_marriageTime_a");
			String r_time = mr.getParameter("new_receptionTime");
			String r_timeA = mr.getParameter("new_receptionTime_a");
			String weddingTime = remove + " " + m_time;
			String receptionTime = remove + " " + r_time;
			String weddingAssemleTime = remove + " " + m_timeA;
			String receptionAssembleTime = remove + " " + r_timeA;

			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			Date weddingT = dateTimeFormat.parse(weddingTime);
			Date receptionT = dateTimeFormat.parse(receptionTime);
			Date weddingAT = dateTimeFormat.parse(weddingAssemleTime);
			Date receptionAT = dateTimeFormat.parse(receptionAssembleTime);
			java.sql.Timestamp wedding_time = new java.sql.Timestamp(weddingT.getTime());
			java.sql.Timestamp reception_time = new java.sql.Timestamp(receptionT.getTime());
			java.sql.Timestamp wedding_assemble_time = new java.sql.Timestamp(weddingAT.getTime());
			java.sql.Timestamp reception_assemble_time = new java.sql.Timestamp(receptionAT.getTime());


			// 본식
			pstmtWedding.setTimestamp(1, wedding_time); // weddingday+marriagetime
			pstmtWedding.setTimestamp(2, wedding_assemble_time);
			pstmtWedding.setString(3, mr.getParameter("new_marriage_place"));
			pstmtWedding.setString(4, mr.getParameter("new_marriage_addr"));
			pstmtWedding.setString(5, mr.getParameter("eno"));

			// 피로연
			pstmtReception.setTimestamp(1, reception_time); // weddingday+marriagetime
			pstmtReception.setTimestamp(2, reception_assemble_time);
			pstmtReception.setString(3, mr.getParameter("new_reception_place"));
			pstmtReception.setString(4, mr.getParameter("new_reception_addr"));
			pstmtReception.setString(5, mr.getParameter("eno"));
			
			if (pstmtWedding.executeUpdate() == 1) {
				System.out.println("wedding(본식) 수정 완료");
				
				if (new1 != null) { 
					File f = new File(path + "/" + old1);
					f.delete();
				}
				if (new2 != null) { 
					File f = new File(path + "/" + old2);
					f.delete();
				}
				if (new3 != null) { 
					File f = new File(path + "/" + old3);
					f.delete();
				}
				if (new4 != null) { 
					File f = new File(path + "/" + old4);
					f.delete();
				}
				
			}
			if (pstmtReception.executeUpdate() == 1) {
				System.out.println("reception(피로연) 수정 완료");
			}
			
			request.setAttribute("je_eventNo", Integer.parseInt(mr.getParameter("eno")));
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SERVER ERROR");
		} finally {
			dbManager.close(con, pstmtReception, null);
			dbManager.close(null, pstmtWedding, null);
			dbManager.close(null, pstmtWeddingInfo, null);
		}
		
	}


}


