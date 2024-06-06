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
		request.getRequestDispatcher("regPage/reg.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 한글 인코딩 설정

        // request에서 파라미터 가져오기
		String m_id = request.getParameter("m_id");
        String m_pw = request.getParameter("m_pw");
        String m_name = request.getParameter("m_name");
        String m_name_kana = request.getParameter("m_name_kana");
        String m_name_rome = request.getParameter("m_name_rome");
        String m_birth = request.getParameter("m_birth");
        String m_gender = request.getParameter("m_gender");
        String m_email = request.getParameter("m_email");
        String m_phone = request.getParameter("m_phone");
//        String a_address = request.getParameter("a_address");
        String a_prefecture = request.getParameter("a_prefecture");
        String a_city = request.getParameter("a_city");
        String a_street = request.getParameter("a_street");
        String a_building = request.getParameter("a_building");
        String a_postcode = request.getParameter("a_postcode");
        
        // 디버깅 로그 출력 (m_id 값 확인)
        System.out.println("MemberRegC - m_id: " + m_id); // 콘솔에 m_id 값 출력
        
        // 현재 날짜 및 시간 가져오기
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String m_regdate = now.format(formatter);

        // 이미지 처리 (파일 업로드 등 별도 처리 필요)
        String m_img = "default.png"; // 기본 이미지 설정
        
//         5. 주소 정보 합치기 (구분자 사용)
        String delimiter = ", "; // 구분자 (주소에 포함되지 않을 특수 문자 사용)
        String combinedAddress = a_prefecture + delimiter + a_city + delimiter + a_street + delimiter + a_building;

        MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email, m_regdate, m_img, m_phone, combinedAddress, a_postcode);

        // MemberDTO 생성 후 로그 출력
//        System.out.println("MemberRegC - memberDto.getM_id(): " + dto.getM_id());
        
        MemberDAO dao = new MemberDAO();
        try {
            // 7. 회원 정보 및 주소 정보 등록 (트랜잭션 처리)
            int result = dao.registerMemberWithAddress(dto);
            if (result == 1) {
                // 회원가입 및 주소 등록 성공 처리
                response.sendRedirect("loginPage/login.jsp");
            } else {
                // 회원가입 실패 처리 (아이디 중복 등)
                request.setAttribute("error", "アカウント登録失敗");
                request.getRequestDispatcher("regPage/reg.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            // SQL 예외 처리
            e.printStackTrace();
            request.setAttribute("error", "データベースエラー");
            request.getRequestDispatcher("regPage/reg.jsp").forward(request, response);
        }
        request.setAttribute("address", combinedAddress); // JSP에서 사용할 수 있도록 설정
    }
}