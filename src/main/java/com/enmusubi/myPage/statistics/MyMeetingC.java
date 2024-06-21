package com.enmusubi.myPage.statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyMeetingC")
public class MyMeetingC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int page = 1;
        int itemsPerPage = 9;
        
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
		
		StatisticsDAO.getTemplatePrev(request, page , itemsPerPage);
		
		request.getRequestDispatcher("myPage/statistics/jsp/sendMain.jsp").forward(request, response);	
		
		e
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	
	
	}

}
