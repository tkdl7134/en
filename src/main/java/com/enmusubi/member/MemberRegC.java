package com.enmusubi.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.main.DBManager;

@WebServlet("/MemberRegC")
public class MemberRegC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 한글 인코딩 설정

        // request에서 파라미터 가져오기
        String m_id = request.getParameter("m_id");
        String m_pw = request.getParameter("m_pw");
        String m_name = request.getParameter("m_name");
        String m_name_kana = request.getParameter("m_name_kana");
        String m_birth = request.getParameter("m_birth");
        String m_gender = request.getParameter("m_gender");
        String m_email = request.getParameter("m_email");
        String m_phone = request.getParameter("m_phone");
        String a_address = request.getParameter("a_address");
        String a_postcode = request.getParameter("a_postcode");

        // 현재 날짜 및 시간 가져오기
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String m_regdate = now.format(formatter);

        // 이미지 처리 (파일 업로드 등 별도 처리 필요)
        String m_img = "default.png"; // 기본 이미지 설정

        MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, m_regdate, m_img, m_phone, a_address, a_postcode);

        MemberDAO dao = new MemberDAO();
        try {
            int result = dao.register(dto);
            if (result == 1) {
            	 // 회원 가입 성공 후 Address 테이블에 데이터 추가
                String addressSql = "INSERT INTO Address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";
                try (Connection con = DBManager.connect();  PreparedStatement addressPstmt = con.prepareStatement(addressSql)) {
                    addressPstmt.setString(1, dto.getM_id());
                    addressPstmt.setString(2, dto.getA_address());
                    addressPstmt.setString(3, dto.getA_postcode());
                    addressPstmt.executeUpdate();
                }
                // 회원가입 성공 처리
                response.sendRedirect("loginPage/login.jsp"); // 로그인 페이지로 이동
            } else {
                // 회원가입 실패 처리 (아이디 중복 등)
                request.setAttribute("error", "회원가입 실패");
                request.getRequestDispatcher("regPage/reg.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 에러 페이지로 이동 등 예외 처리
            request.setAttribute("error", "데이터베이스 오류");
            request.getRequestDispatcher("regPage/reg.jsp").forward(request, response);
        }
    }
}