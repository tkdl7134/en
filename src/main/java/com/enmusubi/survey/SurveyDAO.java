package com.enmusubi.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;

public class SurveyDAO {
	

    // 세션에서 로그인 방식을 기준으로 처리하는 메소드
    public static void processLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        // 다른 패키지에서 설정한 세션 값 가져오기 예시
        String loginType = (String) session.getAttribute("m_id");
        //l_tg
        String type = loginType.substring(0,1);
        if (type.equals("l_")) {
            // LINE 로그인 시
        	request.setAttribute("loginType", "line");
            getMemberLine(request);
        } else {
            // 일반 회원 로그인 
        	request.setAttribute("loginType", "normal");
            getMemberNormal(request);
        }
    }
    

	// LINE 로그인 시 정보 추가 입력
	public static void getMemberLine(HttpServletRequest request) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    DBManager dbManager = DBManager.getInstance();
	    String sqlmember = "UPDATE s_member SET m_name=?, m_name_kana=?, m_name_rome=?, m_email=?, m_phone=? WHERE m_id=?";
	    
	    try {
	        con = dbManager.connect();
	        pstmt = con.prepareStatement(sqlmember);
	                    
	        HttpSession session = request.getSession();
	        String lineUserId = (String) session.getAttribute("m_id");
	        System.out.println("LINE 회원 로그인 세션 아이디는: " + lineUserId);
	        
	        String[] kanziname = request.getParameterValues("kanzi-name");
	        String[] kataname = request.getParameterValues("kata-name");
	        String[] romaname = request.getParameterValues("roma-name");
	        
	        String kanzinames = String.join(" ", kanziname != null ? kanziname : new String[0]);
	        String katanames = String.join(" ", kataname != null ? kataname : new String[0]);
	        String romanames = String.join(" ", romaname != null ? romaname : new String[0]);
	        
	        pstmt.setString(1, kanzinames);
	        pstmt.setString(2, katanames);
	        pstmt.setString(3, romanames);
	        pstmt.setString(4, request.getParameter("email"));
	        pstmt.setString(5, request.getParameter("phonenum"));
	        pstmt.setString(6, lineUserId);
	        
	        if (pstmt.executeUpdate() == 1) {
	            System.out.println("개인정보 수정성공!!");
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        dbManager.close(con, pstmt, null);
	    }
	}
	
	
	public static void getMemberNormal(HttpServletRequest request) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    DBManager dbManager = DBManager.getInstance();
	    ResultSet rs = null;
	    String sql = "SELECT m_name, m_name_kana, m_name_rome, m_email, m_phone FROM s_member WHERE m_id = ?";
	    
	    try {
	        con = dbManager.connect();
	        pstmt = con.prepareStatement(sql);
	        
	        HttpSession session = request.getSession();
	        String normalUserId = (String) session.getAttribute("normalUserId");
	        System.out.println("일반 회원 로그인 세션입니다 아이디는: " + normalUserId);
	        // 추가적인 처리를 수행하세요
	    
	        
	        pstmt.setString(1, normalUserId);
	        rs = pstmt.executeQuery();
	        
	        ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
	        while (rs.next()) {
	        	MemberDTO m = new MemberDTO();
	        	m.setM_name(rs.getString(1));
	        	m.setM_name_kana(rs.getString(2));
	        	m.setM_name_rome(rs.getString(3));
	        	m.setM_phone(rs.getString(4));
	        	m.setM_email(rs.getString(5));
	        	
	        	members.add(m);
	        }
	        System.out.println(members);
	        request.setAttribute("members", members);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        dbManager.close(con, pstmt, rs);
	    }
	}


	// 그 외 설문조사지 입력
	public static void insertSurvey(HttpServletRequest request) throws SQLException {
	
	Connection con = null;
	PreparedStatement pstmtGuest = null; 
	PreparedStatement pstmtMember = null; 
	PreparedStatement pstmtAddress = null; 
	PreparedStatement pstmtAllergy = null;
	PreparedStatement pstmtParty = null;
	DBManager dbManager = DBManager.getInstance();
	String sqlAddress = "INSERT INTO s_Address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";
	String sqlGuest = "INSERT INTO s_Guest (e_no, m_id, g_attend, g_guest_type, g_allergy_or, g_message, g_relation)"
			+ " VALUES (?, ?, ?, ?, ? ,? ,?)";
	String sqlAllergy = "INSERT INTO s_Allergy (e_no, m_id, allergy) VALUES (?, ?, ?)";
	String sqlParty = "INSERT INTO s_Party (e_no, m_id, p_adult, p_child, p_baby) VALUES (?, ?, ?, ?, ?)";
	
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
		pstmtGuest.setString(1, "1");
		pstmtGuest.setString(2, id);
		pstmtGuest.setString(3, request.getParameter("attendance"));
		pstmtGuest.setString(4, request.getParameter("couple"));
		pstmtGuest.setString(5, request.getParameter("allergy"));
		pstmtGuest.setString(6, note);
		pstmtGuest.setString(7, request.getParameter("relation"));
		
		if (pstmtGuest.executeUpdate() == 1) {
			System.out.println("게스트 등록성공!!");
		}
		
		// 동반자 정보 입력
		pstmtParty = con.prepareStatement(sqlParty);
		pstmtParty.setString(1, "1");
		pstmtParty.setString(2, id);
		pstmtParty.setString(3, request.getParameter("adult"));
		pstmtParty.setString(4, request.getParameter("child"));
		pstmtParty.setString(5, request.getParameter("baby"));
		
		if (pstmtParty.executeUpdate() == 1) { 
			System.out.println("동반자 등록성공!!");
		}
		
		// 알러지 상세사항 입력
		
        String gAttend = request.getParameter("g_attend");
        if ("yes".equals(gAttend)) { // 참일때만 알러지 정보 입력
            String allergytype = request.getParameter("allergy-type");
            allergytype = allergytype.replace("\r\n", "<br>");
            
            pstmtAllergy = con.prepareStatement(sqlAllergy);
            pstmtAllergy.setString(1, request.getParameter("e_no"));
            pstmtAllergy.setString(2, id);
            pstmtAllergy.setString(3, allergytype);

            if (pstmtAllergy.executeUpdate() == 1) {
                System.out.println("알러지 등록성공!!");
            }
        }
		
		// 주소 입력
		pstmtAddress = con.prepareStatement(sqlAddress);
		pstmtAddress.setString(1, id);
		pstmtAddress.setString(2, request.getParameter("address"));
		pstmtAddress.setString(3, request.getParameter("postal-code"));
		
		if (pstmtAddress.executeUpdate() == 1) {
			System.out.println("주소 등록성공!!");
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
        dbManager.close(con, pstmtGuest, null);
        dbManager.close(null, pstmtMember, null);
        dbManager.close(null, pstmtAddress, null);
        dbManager.close(null, pstmtAllergy, null);
        dbManager.close(null, pstmtParty, null);
	}

}
}