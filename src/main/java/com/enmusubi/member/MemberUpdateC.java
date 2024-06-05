package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/MemberUpdateC")
public class MemberUpdateC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// request에서 파라미터 가져오기
				String m_id = request.getParameter("m_id");
		        String m_pw = request.getParameter("m_pw");
		        String m_name = request.getParameter("m_name");
		        String m_name_kana = request.getParameter("m_name_kana");
		        String m_birth = request.getParameter("m_birth");
		        String m_gender = request.getParameter("m_gender");
		        String m_email = request.getParameter("m_email");
		        String m_phone = request.getParameter("m_phone");
//		        String a_address = request.getParameter("a_address");
		        String a_prefecture = request.getParameter("a_prefecture");
		        String a_city = request.getParameter("a_city");
		        String a_street = request.getParameter("a_street");
		        String a_building = request.getParameter("a_building");
		        String a_postcode = request.getParameter("a_postcode");
		        
		        // 디버깅 로그 출력 (m_id 값 확인)
		        System.out.println("MemberRegC - m_id: " + m_id); // 콘솔에 m_id 값 출력
		        
		        // 현재 날짜 및 시간 가져오기
		        LocalDateTime now = LocalDateTime.now();
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        String m_regdate = now.format(formatter);

		        // 이미지 처리 (파일 업로드 등 별도 처리 필요)
		        String m_img = "default.png"; // 기본 이미지 설정
		        
//		         5. 주소 정보 합치기 (구분자 사용)
		        String delimiter = ", "; // 구분자 (주소에 포함되지 않을 특수 문자 사용)
		        String combinedAddress = a_prefecture + delimiter + a_city + delimiter + a_street + delimiter + a_building;

		        MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, m_regdate, m_img, m_phone, combinedAddress, a_postcode);

		        HttpSession session = request.getSession(); // 세션 얻기 (없으면 생성)
		        session.setAttribute("a_postcode", dto.getA_postcode());
		        session.setAttribute("a_address", dto.getA_address());
		        
	        MemberDAO dao = new MemberDAO();
	        try {
	            dao.updateMemberInfo(dto);
	            response.sendRedirect("MemberDetailC"); // 수정 후 마이페이지로 이동
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "アカウント情報修正エラー");
			request.getRequestDispatcher("myPage/updatePage.jsp").forward(request, response);
		}

		doGet(request, response);
	}

}
