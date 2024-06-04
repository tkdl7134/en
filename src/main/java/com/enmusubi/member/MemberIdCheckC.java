package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberIdCheckC")
public class MemberIdCheckC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");

		MemberDAO dao = new MemberDAO();
		try {
			boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
			request.setAttribute("isDuplicate", isDuplicate);
			request.setAttribute("m_id", m_id);
			request.getRequestDispatcher("/regPage/idCheck.jsp").forward(request, response); // 결과 페이지로 포워딩
		} catch (SQLException e) {
			e.printStackTrace();
			// 오류 처리
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");

        // 입력값 유효성 검사
        if (m_id == null || m_id.trim().isEmpty()) {
            request.setAttribute("error", "아이디를 입력하세요.");
        } else {
            MemberDAO dao = new MemberDAO();
            try {
                boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
                request.setAttribute("idCheckResult", isDuplicate ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다.");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "데이터베이스 오류가 발생했습니다.");
            }
        }
        
        // 다시 register.jsp로 포워딩
        request.getRequestDispatcher("regPage/reg.jsp").forward(request, response); 
    }
}