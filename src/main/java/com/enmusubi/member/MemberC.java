package com.enmusubi.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberC")
public class MemberC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 // ログインチェックを実行します。ユーザーがログインしていない場合は login.jsp にリダイレクトします。
        MemberDAO.loginCheck(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// フォームから送信されたユーザーIDとパスワードを取得します。
        String memberId = request.getParameter("memberId");
        String memberPW = request.getParameter("memberPW");

        // データベースでユーザー認証を行います。
        MemberDTO member = MemberDAO.authenticate(memberId, memberPW);

        // 認証に成功した場合
        if (member != null) {
            // ユーザー情報をセッションに保存します。
            request.getSession().setAttribute("memberDTO", member);
            // main.jsp にリダイレクトします。
            response.sendRedirect("main.jsp");
        } else {
            // 認証に失敗した場合、login.jsp にリダイレクトします。
            response.sendRedirect("loginPage/login.jsp");
        }
    }
}