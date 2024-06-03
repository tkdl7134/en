package com.enmusubi.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberRegC")
public class MemberRegC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // フォームからのデータ取得
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String kana = request.getParameter("kana");
        String gender = request.getParameter("gender");
        String postalCode = request.getParameter("postalCode1") + "-" + request.getParameter("postalCode2");
        String prefecture = request.getParameter("prefecture");
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String building = request.getParameter("building");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthYear") + "-" + request.getParameter("birthMonth") + "-" + request.getParameter("birthDay");

        // Memberオブジェクト作成
        MemberDTO memberDto = new MemberDTO(userId, password, name, kana, birthdate, gender, postalCode, prefecture, city, address, building, email, building, email, phone, birthdate);
        // データベースに登録
        MemberDAO memberDao = new MemberDAO();
        memberDao.regMember(memberDto);

        // メインページにリダイレクト
        response.sendRedirect("main.jsp");
	}

}
