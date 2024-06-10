package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LineLoginC")
public class LineLoginC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDAO.LineApi(request);

		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		try {
			MemberDTO member = MemberDAO.getMemberByLineId(m_id);
			if (member == null) {
				// 회원 정보가 없으면 회원가입 페이지로 리다이렉트
				response.sendRedirect("MemberRegC");
			} else {
				// 회원 정보가 있으면 메인 페이지로 리다이렉트
				session.setAttribute("member", member);
				response.sendRedirect("main.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("main.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
