package com.enmusubi.finance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.finance.funding.fundDAO;

@WebServlet("/ResultC")
public class ResultC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("loginType",fundDAO.IDTypeCheck(request));
		request.setAttribute("page", "financeresult.jsp");
		request.getRequestDispatcher("finance/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
