package com.enmusubi.myPage.statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/receviedSpecificMoneyC")
public class receviedSpecificMoneyC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StatisticsDAO.getAjaxData(request, response);	
		StatisticsDAO.getSentMoneyData(request, response);
			request.getRequestDispatcher("myPage/statistics/jsp/receivedMoneySpecific.jsp").forward(request, response);
			
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
