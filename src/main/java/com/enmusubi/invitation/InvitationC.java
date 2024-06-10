package com.enmusubi.invitation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/invitationC")
public class InvitationC extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		InvitationDAO.getIdao().invitations(request);
//		InvitationDAO.getIdao().paging(p, request);
		
		request.setAttribute("hw_content", "invitationPage/invitationPage.jsp");
		request.getRequestDispatcher("invitationPage/invitationPage.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
