package com.enmusubi.myPage.statistics;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.finance.funding.fundDAO;
import com.google.gson.JsonArray;

@WebServlet("/receivedSpecificFundingC")
public class receivedSpecificFundingC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	com.enmusubi.finance.funding.fundDAO.selectFundList(request, response);
		response.setCharacterEncoding("utf-8");
		fundDAO.selectFundList(request, response);
		StatisticsDAO.getProductRanking(request);
		StatisticsDAO.getFundData(request , response);
		request.getRequestDispatcher("myPage/statistics/jsp/receivedSpecificFunding.jsp").forward(request, response);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        JsonArray jsonArray = StatisticsDAO.getPrice(request);

        out.print(jsonArray.toString());
	
	}

}
