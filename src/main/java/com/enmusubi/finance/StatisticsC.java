package com.enmusubi.finance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.finance.funding.fundDAO;

@WebServlet("/StatisticsC")
public class StatisticsC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(fundDAO.financeCheck(request)) {
		fundDAO.insertWishiPick(request);
		request.setAttribute("title", "ファンディング");
		request.setAttribute("page", "fund/fundstatistic.jsp");
		request.getRequestDispatcher("finance/index.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("ResultC?done=done");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
