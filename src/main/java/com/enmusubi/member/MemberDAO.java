package com.enmusubi.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.main.DBManager;

public class MemberDAO {

	// ユーザー認証メソッド
    public static MemberDTO authenticate(String memberId, String memberPW) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // データベース接続を取得します。
            con = DBManager.connect();
            // SQL クエリを準備します。
            String sql = "SELECT * FROM Member WHERE m_id = ? AND m_pw = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberId);
            pstmt.setString(2, memberPW);
            // クエリを実行し、結果セットを取得します。
            rs = pstmt.executeQuery();

            // ユーザーが見つかった場合
            if (rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setmId(rs.getString("m_id"));
                member.setmPw(rs.getString("m_pw"));
                member.setmName(rs.getString("m_name"));
                member.setmNameKana(rs.getString("m_name_kana"));
                member.setmBirth(rs.getString("m_birth"));
                member.setmGender(rs.getString("m_gender"));               
                member.setmEmail(rs.getString("m_email"));
                member.setmBirthdate(rs.getString("m_regdate"));
                member.setmImg(rs.getString("m_img"));
                member.setmPhone(rs.getString("m_phone"));
                return member;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースを閉じます。
            DBManager.close(con, pstmt, rs);
        }

        // ユーザーが見つからなかった場合、null を返します。
        return null;
    }

    // ログインチェックメソッド
    public static void loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDTO memberDto = (MemberDTO) request.getSession().getAttribute("memberDTO");

        // セッションにユーザー情報がない場合は login.jsp にリダイレクトします。
        if (memberDto == null) {
            response.sendRedirect("login.jsp");
        } else {
            // セッションにユーザー情報がある場合は main.jsp にリダイレクトします。
            response.sendRedirect("main.jsp");
        }
    }
    
    public void regMember(MemberDTO memberDto) {
    	Connection con = null;
        PreparedStatement pstmt = null;
    	
    	try {
            String sql = "INSERT INTO members (userId, password, name, kana, gender, postalCode, prefecture, city, address, building, email, phone, birthdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, memberDto.getmId());
            pstmt.setString(2, memberDto.getmPw());
            pstmt.setString(3, memberDto.getmName());
            pstmt.setString(4, memberDto.getmNameKana());
            pstmt.setString(5, memberDto.getmGender());
            pstmt.setString(6, memberDto.getmPostalCode());
            pstmt.setString(7, memberDto.getmPrefecture());
            pstmt.setString(8, memberDto.getmCity());
            pstmt.setString(9, memberDto.getmAddress());
            pstmt.setString(10, memberDto.getmBuilding());
            pstmt.setString(11, memberDto.getmEmail());
            pstmt.setString(12, memberDto.getmPhone());
            pstmt.setString(13, memberDto.getmBirthdate());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public MemberDTO getMemberById(String userId) {
        MemberDTO memberDto = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBManager.connect();
            String sql = "SELECT * FROM members WHERE userId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                memberDto = new MemberDTO();
                    rs.getString("mId");
                    rs.getString("mPw");
                    rs.getString("mName");
                    rs.getString("mNameKana");
                    rs.getString("mBirth");
                    rs.getString("mGender");
                    rs.getString("mPostalCode");
                    rs.getString("mPrefecture");
                    rs.getString("mCity");
                    rs.getString("mAddress");
                    rs.getString("mBuilding");
                    rs.getString("mEmail");
                    rs.getString("mBirthdate");
                    
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return memberDto;
    }
}