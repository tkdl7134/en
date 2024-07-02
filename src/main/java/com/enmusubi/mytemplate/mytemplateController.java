package com.enmusubi.mytemplate;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mytemplateController")
public class mytemplateController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("m_name") != null) {
			System.out.println("세션 생존");
			request.setAttribute("mainNav", "mainNavAF.jsp");
		} else {
			System.out.println("세션 죽음");
			request.setAttribute("mainNav", "mainNavBF.jsp");
		}
    	
    	int page = 1;
        int itemsPerPage = 9;
        
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        
        
        mytemplateDAO.getTemplates(request, page, itemsPerPage);
        request.getRequestDispatcher("mytemplate/mytemplate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // POST 요청도 GET 요청과 동일하게 처리
    }
}
