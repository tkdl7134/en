package com.enmusubi.finance.send;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.finance.funding.fundDAO;

@WebServlet("/SendC")
public class SendC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "送金");
		request.setAttribute("page", "send/sending.jsp");
		request.getRequestDispatcher("finance/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(fundDAO.financeCheck(request)) {
			fundDAO.insertWishiPick(request);
			response.sendRedirect("ResultC");
			}
			else {
				response.sendRedirect("ResultC?done=done");
			}
	}

}