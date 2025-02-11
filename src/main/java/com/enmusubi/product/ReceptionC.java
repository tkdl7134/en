package com.enmusubi.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReceptionC")
public class ReceptionC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String eno = request.getParameter("e_no");
		if(!eno.equals(null)) {
			request.setAttribute("je_eventNo", eno);
			ProductDAO.getReception(request);
			request.getRequestDispatcher("product/jsp/reception.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("MainC");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String eno = request.getParameter("eno");
		session.setAttribute("eno", eno);
		if (session.getAttribute("m_id")!=null) {
			System.out.println("==============");
			System.out.println(session.getAttribute("eno"));
			System.out.println("==============");
			response.sendRedirect("SurveyC");
		} else {
			response.sendRedirect("MemberC?reception=yes");
		}
	}

}
