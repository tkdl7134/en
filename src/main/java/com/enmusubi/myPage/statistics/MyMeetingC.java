package com.enmusubi.myPage.statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyMeetingC")
public class MyMeetingC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int page = 1;
        int itemsPerPage = 9;
        
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
		
		StatisticsDAO.getTemplatePrev(request, page , itemsPerPage);
		
		HttpSession session = request.getSession();

		if (session != null && session.getAttribute("m_id") != null) {
			System.out.println("세션 생존");
			request.setAttribute("mainNav", "../../../main/mainNavAF.jsp");
		} else {
			System.out.println("세션 죽음");
			request.setAttribute("mainNav", "../../../main/mainNavBF.jsp");
		}

		
		
		
		request.getRequestDispatcher("myPage/statistics/jsp/sendMain.jsp").forward(request, response);	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	
	
	}

}
