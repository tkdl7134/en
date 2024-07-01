package com.enmusubi.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/InvitationC")
public class InvitationC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("m_name") != null) {
			System.out.println("세션 생존");
			request.setAttribute("mainNav", "../main/mainNavAF.jsp");
			
			ProductDAO.regIvitation(request);
			
			ProductDAO.getInvitation(request);
			request.setAttribute("settingPage", "jsp/invitationPreview.jsp");
			request.getRequestDispatcher("product/index.jsp").forward(request, response);
		
		} else {
			System.out.println("세션 죽음");
			request.setAttribute("mainNav", "../main/mainNavBF.jsp");
			response.sendRedirect("ProductController");
		}
		
		
	}

}
