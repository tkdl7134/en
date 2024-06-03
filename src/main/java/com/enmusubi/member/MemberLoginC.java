package com.enmusubi.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberLoginC")
public class MemberLoginC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mId = request.getParameter("userId");
        String mPW = request.getParameter("password");

        MemberDAO memberDao = new MemberDAO();
        MemberDTO memberDto = memberDao.getMemberById(mId);

        if (memberDto != null && memberDto.getmPw().equals(mPW)) {
            HttpSession session = request.getSession();
            session.setAttribute("mId", mId);
            response.sendRedirect("MyPageC");
        } else {
            response.sendRedirect("loginPage/login.jsp");
        }
    }
}