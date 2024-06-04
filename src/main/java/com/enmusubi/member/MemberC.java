package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberC")
public class MemberC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("loginPage/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 한글 인코딩 설정

		// 1. 로그인 정보 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");

		// 2. DAO 객체 생성 및 로그인 처리
		MemberDAO dao = new MemberDAO();
		try {
			MemberDTO dto = dao.login(m_id, m_pw);

			// 3. 로그인 결과에 따른 처리
			if (dto != null) {
				// 3-1. 로그인 성공
				HttpSession session = request.getSession(); // 세션 얻기 (없으면 생성)
				session.setAttribute("m_id", dto.getM_id()); // 세션에 사용자 ID 저장
				session.setAttribute("m_name", dto.getM_name()); // 세션에 사용자 이름 저장 (선택 사항)
				System.out.println("Session m_id: " + session.getAttribute("m_id")); // 로그 출력 (디버깅용)

				// 세션 유효 시간 10분 (600초) 설정
				session.setMaxInactiveInterval(600);

				// 로그인 성공 메시지 설정 (선택 사항)
				session.setAttribute("loginMessage", "로그인 성공!");
				request.getRequestDispatcher("main.jsp").forward(request, response); // 메인 페이지로 이동
			} else {
				// 3-2. 로그인 실패
				String errorMessage = "아이디 또는 비밀번호가 일치하지 않습니다.";
				request.setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("loginPage/login.jsp").forward(request, response); // 로그인 페이지로 다시 포워딩
			}
		} catch (SQLException e) {
			// 3-3. 데이터베이스 오류 발생
			e.printStackTrace();
			request.setAttribute("errorMessage", "데이터베이스 오류가 발생했습니다.");
			request.getRequestDispatcher("loginPage/login.jsp").forward(request, response); // 로그인 페이지로 다시 포워딩
		}
	}
}