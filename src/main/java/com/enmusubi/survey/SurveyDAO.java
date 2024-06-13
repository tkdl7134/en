package com.enmusubi.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;

public class SurveyDAO {
	
	public static boolean whichLogin(HttpServletRequest request) {
		return false;
		
	}

	// LINE 로그인 시 정보 추가 입력
	public static void updateMember(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sqlmember = "update s_member set m_name=?, m_name_kana=?, m_name_kana=?,"
			    + " m_name_kana=?, m_name_rome=?, m_email=?, m_phone=?,"
				+ " where m_id=?";
	
		try {
			
			con = dbManager.connect();
			pstmt = con.prepareStatement(sqlmember);
						
			HttpSession session = request.getSession();
			session.getAttribute("m_id");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, null);
		}
		
	}


	// 그 외 설문조사지 입력
	public static void insertSurvey(HttpServletRequest request) throws SQLException {
	
	Connection con = null;
	PreparedStatement pstmtGuest = null; 
	PreparedStatement pstmtMember = null; 
	PreparedStatement pstmtAddress = null; 
	PreparedStatement pstmtAllergy = null;
	DBManager dbManager = DBManager.getInstance();
	String sqlAddress = "INSERT INTO s_Address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";
	String sqlGuest = "INSERT INTO s_Guest (e_no, m_id, g_attend, g_guest_type, g_allergy_or, g_message, g_relation)"
			+ " VALUES (?, ?, ?, ?, ? ,? ,?)";
	String sqlAllergy = "INSERT INTO s_Allergy (e_no, m_id, allergy) VALUES (?, ?, ?)";
	String sqlParty = "INSERT INTO s_Party (e_no, m_id, p_age_type, p_number) VALUES (?, ?, ?, ?)";
	
	try {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		
		con = dbManager.connect();
		
		// 일반 정보 입력
		
		
		// 택스쳐 추가조정 (띄어쓰기)
		String note = request.getParameter("special-notes");
		note = note.replace("\r\n", "<br>");
		
		// 회원 개인정보 입력
		pstmtGuest = con.prepareStatement(sqlGuest);
		pstmtGuest.setString(1, "e_no");
		pstmtGuest.setString(2, id);
		pstmtGuest.setString(3, "g_attend");
		pstmtGuest.setString(4, request.getParameter("couple"));
		pstmtGuest.setString(5, request.getParameter("allergy"));
		pstmtGuest.setString(6, note);
		pstmtGuest.setString(7, request.getParameter("relation"));
		
		if (pstmtGuest.executeUpdate() == 1) {
			System.out.println("게스트 등록성공!!");
		}
		
		// 알러지 상세사항 입력
		
		String allergytype = request.getParameter("allergy-type");
		allergytype = allergytype.replace("\r\n", "<br>");
		
		pstmtAllergy = con.prepareStatement(sqlAllergy);
		pstmtAllergy.setString(1, "e_no");
		pstmtAllergy.setString(2, id);
		pstmtAllergy.setString(3, allergytype);

		if (pstmtAllergy.executeUpdate() == 1) {
			System.out.println("알러지 등록성공!!");
		}
		
		// 주소 입력
		
		pstmtAllergy = con.prepareStatement(sqlAllergy);

		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbManager.close(con, pstmtGuest, null);
	}

}
}