package com.enmusubi.myPage.statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.finance.funding.fundDAO;
@WebServlet("/receivedFundingController")
public class receivedFundingController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	com.enmusubi.finance.funding.fundDAO.selectFundList(request, response);
	
//	fundDAO.selectFundList(request);
	request.getRequestDispatcher("myPage/statistics/jsp/receivedFunding.jsp").forward(request, response);
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
