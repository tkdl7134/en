package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberDetailC")
public class MemberDetailC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
	    String m_id = (String) session.getAttribute("m_id");
	    System.out.println("Session m_id in MemberDetailC: " + m_id); // 로그 출력 (디버깅용)


        if (m_id == null) {
            response.sendRedirect("loginPage/login.jsp");
            return;
        }

        MemberDAO dao = new MemberDAO();
        try {
            MemberDTO dto = dao.getMypage(m_id);
            if (dto != null) {
                request.setAttribute("dto", dto); // 회원 정보를 request에 담아 전달
                request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
            } else {
            	// 회원 정보가 없을 때 로그인 페이지로 이동하는 대신,
                // 오류 메시지를 표시하거나 다른 처리를 수행할 수도 있습니다.
                request.setAttribute("errorMessage", "회원 정보가 없습니다.");
                request.getRequestDispatcher("main.jsp").forward(request, response); // 메인 페이지로 이동
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "데이터베이스 오류가 발생했습니다.");
            request.getRequestDispatcher("main.jsp").forward(request, response); // 메인 페이지로 이동
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// request에서 수정된 정보 가져오기
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

		// 이미지 처리 (파일 업로드 등 별도 처리 필요)
		String m_img = "default.png"; // 기본 이미지 설정

		MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, null, m_img, m_phone,
				a_address, a_postcode); // m_regdate는 null로 설정

		MemberDAO dao = new MemberDAO();
		try {
			int result = dao.updateMypage(dto);
			if (result == 1) {
				// 수정 성공 처리
				response.sendRedirect("/En/MemberDetailC"); // 마이페이지 다시 조회 (새로운 정보 반영)
			} else {
				// 수정 실패 처리
				request.setAttribute("error", "수정 실패");
				request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// 에러 페이지로 이동 등 예외 처리
		}

		doGet(request, response);
	}
}
