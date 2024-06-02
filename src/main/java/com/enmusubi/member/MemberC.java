package com.enmusubi.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberC")
public class MemberC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDAO.logout(request);

		response.sendRedirect("HomeController");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDAO.login(request);

		MemberDAO.loginCheck(request);
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

}
