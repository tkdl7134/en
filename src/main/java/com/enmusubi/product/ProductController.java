package com.enmusubi.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("m_name") != null) {
			System.out.println("세션 생존");
			request.setAttribute("mainNav", "../main/mainNavAF.jsp");
		} else {
			System.out.println("세션 죽음");
			request.setAttribute("mainNav", "../main/mainNavBF.jsp");
		}
		
		ProductDAO.getAllTemplate(request);
		request.setAttribute("settingPage", "jsp/productMain.jsp");
		request.getRequestDispatcher("product/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
