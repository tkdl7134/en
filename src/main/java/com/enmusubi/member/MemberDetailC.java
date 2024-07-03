package com.enmusubi.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.Interceptor;

@WebServlet("/MemberDetailC")
public class MemberDetailC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("m_name") != null) {
			System.out.println("세션 생존");
			request.setAttribute("mainNav", "../main/mainNavAF.jsp");
		} else {
			System.out.println("세션 죽음");
			request.setAttribute("mainNav", "../main/mainNavBF.jsp");
		}
		
		if (Interceptor.LoginInterceptor(request, response)) {
			MemberDAO.memberDetailCDoGet(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	}
}
