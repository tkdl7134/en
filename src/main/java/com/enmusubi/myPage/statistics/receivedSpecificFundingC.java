package com.enmusubi.myPage.statistics;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enmusubi.finance.funding.fundDAO;
import com.google.gson.JsonArray;

@WebServlet("/receivedSpecificFundingC")
public class receivedSpecificFundingC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	com.enmusubi.finance.funding.fundDAO.selectFundList(request, response);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		StatisticsDAO.getAjaxData(request, response);
		StatisticsDAO.getProductRanking(request);
		StatisticsDAO.getFundData(request , response);
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("m_name") != null) {
			System.out.println("세션 생존");
			request.setAttribute("mainNav", "main/mainNavAF.jsp");
		} else {
			System.out.println("세션 죽음");
			request.setAttribute("mainNav", "main/mainNavBF.jsp");
		}

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
