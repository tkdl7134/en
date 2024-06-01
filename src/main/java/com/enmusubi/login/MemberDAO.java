package com.enmusubi.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;

public class MemberDAO {

	public static void login(HttpServletRequest request) {
		String id = request.getParameter("userId");
        String pw = request.getParameter("password");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM member WHERE m_id = ?";
        String dbPW = "";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dbPW = rs.getString("m_pw");
                if (pw.equals(dbPW)) {
                    System.out.println("로그인 성공");
                    MemberDTO memberDTO = new MemberDTO();
                    memberDTO.setUserId(rs.getString("m_id"));
                    memberDTO.setName(rs.getString("m_name"));
                    memberDTO.setKana(rs.getString("m_kana"));
                    memberDTO.setBirthdate(rs.getString("m_birthdate"));
                    memberDTO.setGender(rs.getString("m_gender"));
                    memberDTO.setEmail(rs.getString("m_email"));
                    memberDTO.setPhone(rs.getString("m_phone"));
                    memberDTO.setNewsletter(rs.getBoolean("m_newsletter"));

                    // セッションにユーザー情報を保存
                    HttpSession session = request.getSession();
                    session.setAttribute("loggedInUser", memberDTO);
                } else {
                    System.out.println("パスワードが一致しません");
                    request.setAttribute("loginError", "ユーザーIDまたはパスワードが正しくありません");
                }
            } else {
                System.out.println("ユーザーIDが存在しません");
                request.setAttribute("loginError", "ユーザーIDまたはパスワードが正しくありません");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("loginError", "データベースエラーが発生しました");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


	public static boolean loginCheck(HttpServletRequest request) {
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
		if (member == null) {
			request.setAttribute("loginPage", "loginPage/loginPage.jsp");
			return false;
		} else {
			request.setAttribute("loginPage", "loginPage/loginPageOK.jsp");
			return true;
		}
	}

	public static void logout(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	public static void logoutCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}
	
}
