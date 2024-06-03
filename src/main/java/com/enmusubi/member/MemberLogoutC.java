package com.enmusubi.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberLogoutC")
public class MemberLogoutC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false); // 기존 세션 가져오기 (없으면 null 반환)
		if (session != null) {
			session.invalidate(); // 세션 무효화 (로그아웃)
		}
		response.sendRedirect("main.jsp"); // 메인 페이지로 리다이렉트

		doGet(request, response);
	}

}
