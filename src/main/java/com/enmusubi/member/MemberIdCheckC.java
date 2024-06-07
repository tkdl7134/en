package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/MemberIdCheckC")
public class MemberIdCheckC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");

		MemberDAO dao = new MemberDAO();
		try {
			boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
			request.setAttribute("isDuplicate", isDuplicate);
			request.setAttribute("m_id", m_id);
			request.getRequestDispatcher("/regPage/idCheck.jsp").forward(request, response); // 결과 페이지로 포워딩
		} catch (SQLException e) {
			e.printStackTrace();
			// 오류 처리
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("id");
		System.out.println(m_id);
		// 입력값 유효성 검사
		if (m_id == null || m_id.trim().isEmpty()) {
			request.setAttribute("error", "IDを入力してください");
		} else {
			MemberDAO dao = new MemberDAO();
			try {
				boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
				System.out.println(isDuplicate);
				String idCheckResult = isDuplicate ? "使用中IDです。" : "使用可能IDです。";
				Testajax ta = new Testajax();
				ta.setIdcheck(idCheckResult);
				Gson gson = new Gson();
				String json = gson.toJson(ta);
				System.out.println(json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(json);
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("error", "データベースエラー");
			}
		}

	}
}