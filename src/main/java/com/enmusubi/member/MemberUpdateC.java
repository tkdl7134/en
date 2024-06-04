package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberUpdateC")
public class MemberUpdateC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// request에서 수정된 정보 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_name_kana = request.getParameter("m_name_kana");
		String m_birth = request.getParameter("m_birth");
		String m_gender = request.getParameter("m_gender");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
		String a_address = request.getParameter("a_address");
		String a_postcode = request.getParameter("a_postcode");

		MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, null, null, m_phone,
				a_address, a_postcode);

		MemberDAO dao = new MemberDAO();
		try {
			dao.updateMemberInfo(dto); // MemberDAO의 updateMemberInfo 메소드 호출
			response.sendRedirect("MemberDetailC"); // 수정 후 마이페이지로 이동
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "회원 정보 수정 중 오류가 발생했습니다.");
			request.getRequestDispatcher("updatePage.jsp").forward(request, response);
		}

		doGet(request, response);
	}

}
