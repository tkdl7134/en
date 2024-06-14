package com.enmusubi.mytemplate;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TemplateC")
public class TemplateC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
	}
	
	private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TemplateDAO templateDAO = TemplateDAO.getIdao();
		List<TemplateDTO> templates = templateDAO.getTemplateDetails(request);
		request.setAttribute("templates", templates);
		request.getRequestDispatcher("mytemplatePage/mytemplate.jsp").forward(request, response);
	}
}
