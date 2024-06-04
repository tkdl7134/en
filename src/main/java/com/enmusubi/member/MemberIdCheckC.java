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

        MemberDAO dao = new MemberDAO();
        try {
            boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
            if (isDuplicate) {
                response.getWriter().write("duplicate"); // 중복된 아이디
            } else {
                response.getWriter().write("available"); // 사용 가능한 아이디
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("error"); // 에러 발생
        }
    }
}