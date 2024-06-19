package com.enmusubi.main;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Interceptor {

	public static boolean LoginInterceptor(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Object sessionId = session.getAttribute("m_id");
		if(sessionId == null) {
			response.sendRedirect("MemberC");
			return false;
		}
		else {
			System.out.println("@@@ Current Session ID is : " + sessionId + " @@@");
			return true;
		}
		
	}
	
}
