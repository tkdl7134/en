package com.enmusubi.myPage.statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.finance.funding.fundDAO;

@WebServlet("/receivedSpecificFundingC")
public class receivedSpecificFundingC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		com.enmusubi.finance.funding.fundDAO.selectFundList(request, response);
		
//		fundDAO.selectFundList(request);
		StatisticsDAO.getProductRanking(request);
		StatisticsDAO.getFundData(request);
		request.getRequestDispatcher("myPage/statistics/jsp/receivedSpecificFunding.jsp").forward(request, response);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
