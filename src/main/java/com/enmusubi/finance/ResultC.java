package com.enmusubi.finance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResultC")
public class ResultC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("page", "financeresult.jsp");
		if(request.getParameter("done")==null) {
			request.setAttribute("msg", "お会いできるのを<br>楽しみにしております。");
		}
		else {
			request.setAttribute("msg", "すでにもらいました<br>気持ちだありがたくいただきます。");
		}
		request.getRequestDispatcher("finance/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
