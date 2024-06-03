package com.enmusubi.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberMyPageC")
public class MemberMyPageC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mId = (String) session.getAttribute("mId");

		if (mId != null) {
			MemberDAO memberDao = new MemberDAO();
			MemberDTO memberDto = memberDao.getMemberById(mId);
			request.setAttribute("memberDto", memberDto);
			request.getRequestDispatcher("myPage.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
