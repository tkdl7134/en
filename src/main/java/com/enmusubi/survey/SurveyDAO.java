package com.enmusubi.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

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
						
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, null);
		}
		
	}


	// 그 외 설문조사지 입력
	public static void insertSurvey(HttpServletRequest request) throws SQLException {
	
	Connection con = null;
	PreparedStatement pstmtMember = null; // Member 테이블용 PreparedStatement
	PreparedStatement pstmtAddress = null; // Address 테이블용 PreparedStatement
	DBManager dbManager = DBManager.getInstance();
	String sqlAddress = "INSERT INTO s_Address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";
	String sqlGuest = "INSERT INTO s_Guest (e_no, m_id, g_attend, g_guest_type, g_allergy_or, g_message, g_relation)"
			+ " VALUES (?, ?, ?, ?, ? ,? ,?)";
	String sqlAllergy = "INSERT INTO s_Allergy (e_no, m_id, allergy) VALUES (?, ?, ?)";
	String sqlParty = "INSERT INTO s_Party (e_no, m_id, p_age_type, p_number) VALUES (?, ?, ?, ?)";
	
	try {
		con = dbManager.connect();
		

		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbManager.close(con, pstmt, null);
		dbManager.close(con, pstmt, null);
	}

}
}