package com.enmusubi.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MainC")
public class MainC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 하는 일
		// 로그인 세션 체크
		// 체크한 상태를 jsp에 알려주고
		// 그거에 따라 include 컨텐츠가 달라지고.
		
//		// 세션 가져오기
//        HttpSession session = request.getSession(false);
//        
//        // 로그인 상태 확인
//        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
//        
//        // 로그인 상태에 따라 포워딩할 페이지 결정
//        String page;
//        if (isLoggedIn) {
//            page = "main/mainNavAF.jsp"; // 로그인 후의 페이지
//        } else {
//            page = "main/mainNavBF.jsp"; // 로그인 전의 페이지
//        }
//        
//        // 페이지에 따라 request에 속성 설정
//        request.setAttribute("includeContent", page);
//        
//        // main.jsp로 포워딩
//        request.getRequestDispatcher("main/main.jsp").forward(request, response);
		
      request.getRequestDispatcher("main/main.jsp").forward(request, response);
      

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
