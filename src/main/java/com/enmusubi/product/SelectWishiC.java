package com.enmusubi.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.main.Interceptor;

@WebServlet("/SelectWishiC")
public class SelectWishiC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(Interceptor.LoginInterceptor(request, response)) {
		SelectWishiDAO.selectEventFunc(request);
		request.setAttribute("mainNav", "../../main/mainNavAF.jsp");
		request.getRequestDispatcher("product/jsp/selectWishi.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("type").equals("send")) {
			System.out.println("prama is:"+ request.getParameter("type"));
			SelectWishiDAO.insertEventFunc(request,response);
		}
		else {
			SelectWishiDAO.insertWishiLink(request,response);
		}
	}

}
