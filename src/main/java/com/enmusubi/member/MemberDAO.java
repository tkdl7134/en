package com.enmusubi.member;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberDAO {

	// 로그인
	public MemberDTO login(String m_id, String m_pw) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT * FROM s_Member WHERE m_id = ? AND m_pw = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				return createMemberDTOForLogin(rs); // 로그인용 DTO 생성 메소드 호출

			}
		} catch (Exception e) {

		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return null;
	}

	public static void memberC(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 로그인 정보 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");

		System.out.println(m_id);
		System.out.println(m_pw);

		// 2. DAO 객체 생성 및 로그인 처리
		MemberDAO dao = new MemberDAO();
		try {
			MemberDTO dto = dao.login(m_id, m_pw);
			// 3. 로그인 결과에 따른 처리
			if (dto != null) {
				// 3-1. 로그인 성공
				HttpSession session = request.getSession(); // 세션 얻기
				session.setAttribute("m_id", dto.getM_id());
				session.setAttribute("m_name", dto.getM_name());
				session.setAttribute("m_name_kana", dto.getM_name_kana());
				session.setAttribute("m_name_rome", dto.getM_name_rome());
				session.setAttribute("m_gender", dto.getM_gender());
				session.setAttribute("a_postcode", dto.getA_postcode());
				session.setAttribute("a_address", dto.getA_address());
				session.setAttribute("m_email", dto.getM_email());
				session.setAttribute("m_regdate", dto.getM_regdate());
				session.setAttribute("m_phone", dto.getM_phone());
				session.setAttribute("m_img", dto.getM_img());

				// 세션 유효 시간 10분 (600초) 설정
				session.setMaxInactiveInterval(600);
			System.out.println(session.getMaxInactiveInterval());

				// 로그인 성공 메시지 설정 (선택 사항)
				System.out.println("로그인 성공");
				response.getWriter().println("success"); // 성공 메시지를 클라이언트에 보냄

			} else {
				// 3-2. 로그인 실패
				System.out.println("IDまたはPWが一致しません");
				response.getWriter().close();
			}
		} catch (Exception e) {
			// 3-3. 데이터베이스 오류 발생
			e.printStackTrace();
			System.out.println("DB오류");
			response.getWriter().println("サーバーエラーが発生しました。"); // 서버 오류 메시지를 클라이언트에 보냄
		}
		response.getWriter().close(); // 응답 종료
	}

	// ResultSet -> DTO 변환 (로그인 시)
	private MemberDTO createMemberDTOForLogin(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setM_id(rs.getString("m_id"));
		dto.setM_pw(rs.getString("m_pw"));
		dto.setM_name(rs.getString("m_name"));
		dto.setM_name_kana(rs.getString("m_name_kana"));
		dto.setM_name_rome(rs.getString("m_name_rome"));
		dto.setM_birth(rs.getString("m_birth"));
		dto.setM_gender(rs.getString("m_gender"));
		dto.setM_email(rs.getString("m_email"));
		dto.setM_regdate(rs.getString("m_regdate"));
		dto.setM_img(rs.getString("m_img"));
		dto.setM_phone(rs.getString("m_phone"));
		System.out.println("cmd: " + dto);
		// 로그인 시에는 주소 정보 불필요
		return dto;
	}

	// 회원가입
	public int registerMemberWithAddress(MemberDTO dto, HttpServletRequest request) throws SQLException, IOException {
		Connection con = null;
		PreparedStatement pstmtMember = null; // Member 테이블용 PreparedStatement
		PreparedStatement pstmtAddress = null; // Address 테이블용 PreparedStatement
		DBManager dbManager = DBManager.getInstance();
		String sqlMember = "INSERT INTO s_Member (m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email, m_regdate, m_img, m_phone) VALUES (?, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), ?, ?, sysdate, ?, ?)";
		String sqlAddress = "INSERT INTO s_Address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";

		try {
			con = dbManager.connect();
			con.setAutoCommit(false); // 트랜잭션 시작
			System.out.println(dto);
			// 회원 정보 등록
			pstmtMember = con.prepareStatement(sqlMember);
			pstmtMember.setString(1, dto.getM_id());
			pstmtMember.setString(2, dto.getM_pw());
			pstmtMember.setString(3, dto.getM_name());
			pstmtMember.setString(4, dto.getM_name_kana());
			pstmtMember.setString(5, dto.getM_name_rome());
			pstmtMember.setString(6, dto.getM_birth());
//			pstmtMember.setString(6, "1997-03-31");
			System.out.println(dto.getM_birth());
			pstmtMember.setString(7, dto.getM_gender());
			pstmtMember.setString(8, dto.getM_email());
//			pstmtMember.setString(9, dto.getM_regdate());
			pstmtMember.setString(9, dto.getM_img());
			pstmtMember.setString(10, dto.getM_phone());
			
			if(pstmtMember.executeUpdate() == 1) {
				System.out.println("called");
			}

			// 2. 주소 정보 등록
			pstmtAddress = con.prepareStatement(sqlAddress);
			pstmtAddress.setString(1, dto.getM_id());
			pstmtAddress.setString(2, dto.getA_address());
			pstmtAddress.setString(3, dto.getA_postcode());
			pstmtAddress.executeUpdate();

			con.commit(); // 트랜잭션 커밋
			return 1; // 성공
		} catch (SQLException e) {
			if (con != null) {
				con.rollback(); // 트랜잭션 롤백
			}
			throw e;
		} finally {
			dbManager.close(con, pstmtMember, null);
			dbManager.close(con, pstmtAddress, null);
		}

	}

	public static void MemberRegC(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// request에서 파라미터 가져오기
		String path = request.getServletContext().getRealPath("regPage/profileImages");
		MultipartRequest mr;
		mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());

		String m_id = mr.getParameter("m_id");
		String m_pw = mr.getParameter("m_pw");
		String m_name_sei = mr.getParameter("m_name_sei");
		String m_name_mei = mr.getParameter("m_name_mei");
		String m_name_kana_sei = mr.getParameter("m_name_kana_sei");
		String m_name_kana_mei = mr.getParameter("m_name_kana_mei");
		String m_name_rome_mei = mr.getParameter("m_name_rome_mei");
		String m_name_rome_sei = mr.getParameter("m_name_rome_sei");
		String m_gender = mr.getParameter("m_gender");
		String m_email = mr.getParameter("m_email");
		String m_phone = mr.getParameter("m_phone");
		String a_prefecture = mr.getParameter("a_prefecture");
		String a_city = mr.getParameter("a_city");
		String a_street = mr.getParameter("a_street");
		String a_building = mr.getParameter("a_building");
		String a_postcode = mr.getParameter("a_postcode");
		String m_birthY = mr.getParameter("m_birthY");
		String m_birthM = mr.getParameter("m_birthM");
		String m_birthD = mr.getParameter("m_birthD");
		String m_img = mr.getFilesystemName("m_img");
		System.out.println(m_birthM);
		// 현재 날짜 및 시간 가져오기
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String m_regdate = now.format(formatter);
		System.out.println(m_regdate);
//      정보 합치기 (구분자 사용)
		String delimiter = " "; // 구분자 (주소에 포함되지 않을 특수 문자 사용)
		String combinedAddress = a_prefecture + delimiter + a_city + delimiter + a_street + delimiter + a_building;
		m_birthM = String.format("%02d", Integer.parseInt(m_birthM));
		m_birthD = String.format("%02d", Integer.parseInt(m_birthD));
				
		String combinedBirth = m_birthY + "-" + m_birthM + "-" + m_birthD;
		String combinedName = m_name_sei + delimiter + m_name_mei;
		String combinedKana = m_name_kana_sei + delimiter + m_name_kana_mei;
		String combinedRome = m_name_rome_mei + delimiter + m_name_rome_sei;
		
		MemberDTO dto = new MemberDTO(m_id, m_pw, combinedName, combinedKana, combinedRome, combinedBirth, m_gender, m_email,
				m_regdate, m_img, m_phone, combinedAddress, a_postcode);

		MemberDAO dao = new MemberDAO();
		try {
			// 7. 회원 정보 및 주소 정보 등록 (트랜잭션 처리)
			int result = dao.registerMemberWithAddress(dto, request);
			
			if (result == 1) {
				// 회원가입 및 주소 등록 성공 처리
				System.out.println("회원가입 성공");

			} else {
				// 회원가입 실패 처리
				System.out.println("アカウント登録失敗");
				request.getRequestDispatcher("MemberRegC").forward(request, response);
			}
		} catch (SQLException e) {
			// SQL 예외 처리
			e.printStackTrace();
			request.getRequestDispatcher("HSC").forward(request, response);
		}
		// JSP에서 사용할 수 있도록 설정
		request.setAttribute("address", combinedAddress);
		request.setAttribute("birth", combinedBirth);

	}

	// 회원탈퇴
	public int deleteMember(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmtEventFc = null;
		PreparedStatement pstmtEvent = null;
		PreparedStatement pstmtAllergy = null;
		PreparedStatement pstmtParty = null;
		PreparedStatement pstmtPay = null;
		PreparedStatement pstmtGuest = null;
		PreparedStatement pstmtAddress = null;
		PreparedStatement pstmtMember = null;
		DBManager dbManager = DBManager.getInstance();
		String sqlEventFc = "DELETE FROM s_event_func WHERE m_id = ?";
		String sqlEvent = "DELETE FROM s_event WHERE m_id = ?";
		String sqlParty = "DELETE FROM s_party WHERE m_id = ?";
		String sqlAllergy = "DELETE FROM s_allergy WHERE m_id = ?";
		String sqlPay = "DELETE FROM s_pay WHERE m_id = ?";
		String sqlGuest = "DELETE FROM s_guest WHERE m_id = ?";
		String sqlAddress = "DELETE FROM s_Address WHERE m_id = ?";
		String sqlMember = "DELETE FROM s_Member WHERE m_id = ?";

		try {
			con = dbManager.connect();
			con.setAutoCommit(false); // 트랜잭션 시작
			
			deleteEvent(m_id);

			// 주소 정보 삭제 (외래 키 제약 조건으로 인해 Member 삭제 전에 처리)
			pstmtEvent = con.prepareStatement(sqlEventFc);
			pstmtEvent.setString(1, m_id);
			pstmtEvent.executeUpdate();
			
			pstmtEvent = con.prepareStatement(sqlEvent);
			pstmtEvent.setString(1, m_id);
			pstmtEvent.executeUpdate();
			
			pstmtGuest = con.prepareStatement(sqlParty);
			pstmtGuest.setString(1, m_id);
			pstmtGuest.executeUpdate();
			
			pstmtGuest = con.prepareStatement(sqlAllergy);
			pstmtGuest.setString(1, m_id);
			pstmtGuest.executeUpdate();
			
			pstmtGuest = con.prepareStatement(sqlPay);
			pstmtGuest.setString(1, m_id);
			pstmtGuest.executeUpdate();
			
			pstmtGuest = con.prepareStatement(sqlGuest);
			pstmtGuest.setString(1, m_id);
			pstmtGuest.executeUpdate();
			
			pstmtAddress = con.prepareStatement(sqlAddress);
			pstmtAddress.setString(1, m_id);
			pstmtAddress.executeUpdate();

			// 회원 정보 삭제
			pstmtMember = con.prepareStatement(sqlMember);
			pstmtMember.setString(1, m_id);
			int result = pstmtMember.executeUpdate(); // 삭제된 행 수 반환

			con.commit(); // 트랜잭션 커밋
			return result; // 삭제 성공 여부 반환 (1: 성공, 0: 실패)
		} catch (SQLException e) {
			if (con != null) {
				con.rollback(); // 트랜잭션 롤백
			}
			throw e;
		} finally {
			dbManager.close(con, pstmtEventFc, null);
			dbManager.close(con, pstmtEvent, null);
			dbManager.close(con, pstmtParty, null);
			dbManager.close(con, pstmtAllergy, null);
			dbManager.close(con, pstmtPay, null);
			dbManager.close(con, pstmtGuest, null);
			dbManager.close(con, pstmtAddress, null);
			dbManager.close(con, pstmtMember, null);
		}
	}

	public static void deleteEvent(String sessionID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "select e_no from s_event where m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sessionID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				deleteEventChild(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, rs);
		}
	}
	
	public static void deleteEventChild(String eno){
		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sqlR = "delete from s_reception where e_no = ?";
		String sqlW = "delete from s_wedding_info where e_no = ?";
		try {
			con=dbManager.connect();
			pstmt = con.prepareStatement(sqlR);
			pstmt.setString(1, eno);
			if(pstmt.executeUpdate()>0){
				System.out.println("reception delete success!");
			}
			pstmt = con.prepareStatement(sqlW);
			pstmt.setString(1, eno);
			if(pstmt.executeUpdate()>0){
				System.out.println("wedding info delete success!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, null);
		}
	}
	// ResultSet -> DTO 변환 (마이페이지 등)
	private static MemberDTO createMemberDTO(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setM_id(rs.getString("m_id"));
		dto.setM_pw(rs.getString("m_pw"));
		dto.setM_name(rs.getString("m_name"));
		dto.setM_name_kana(rs.getString("m_name_kana"));
		dto.setM_birth(rs.getString("m_birth"));
		dto.setM_gender(rs.getString("m_gender"));
		dto.setM_email(rs.getString("m_email"));
		dto.setM_regdate(rs.getString("m_regdate"));
		dto.setM_img(rs.getString("m_img"));
		dto.setM_phone(rs.getString("m_phone"));
		dto.setA_address(rs.getString("a_address")); // 주소 정보 설정
		dto.setA_postcode(rs.getString("a_postcode")); // 주소 정보 설정
		dto.setM_name_rome(rs.getString("m_name_rome"));

		// Address 정보가 없는 경우 null 처리
		String a_address = rs.getString("a_address");
		String a_postcode = rs.getString("a_postcode");
		dto.setA_address(a_address != null ? a_address : "");
		dto.setA_postcode(a_postcode != null ? a_postcode : "");

		return dto;
	}

	// 웹 사용자 ID로 회원 정보 조회
	public MemberDTO getMemberById(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT * FROM s_Member M LEFT OUTER JOIN s_Address A ON M.m_id = A.m_id WHERE M.m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, m_id);

			if (rs.next()) {
				return createMemberDTO(rs);
			}
		} catch (Exception e) {

		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return null; // 회원 정보가 없으면 null 반환
	}

	// 라인 사용자 ID로 회원 정보 조회
	public static MemberDTO getMemberByLineId(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT * FROM s_Member WHERE m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, m_id);

			if (rs.next()) {
				return createMemberDTO(rs);
			}
		} catch (Exception e) {

		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return null; // 회원 정보가 없으면 null 반환
	}

	// 회원 정보 업데이트 (전체 정보)
	public static void updateMemberInfo(MemberDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql1 = "UPDATE s_Member SET m_pw = ?, m_name = ?, m_name_kana = ?, m_name_rome = ?, m_birth = ?, m_gender = ?, m_email = ?, m_phone = ?, m_img = ? WHERE m_id = ?";
		String sql2 = "UPDATE s_Address SET a_address = ?, a_postcode = ? WHERE m_id = ?";

		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql1);

			// Member 테이블 업데이트
			pstmt.setString(1, dto.getM_pw());
			pstmt.setString(2, dto.getM_name());
			pstmt.setString(3, dto.getM_name_kana());
			pstmt.setString(4, dto.getM_name_rome());
			pstmt.setString(5, dto.getM_birth());
			pstmt.setString(6, dto.getM_gender());
			pstmt.setString(7, dto.getM_email());
			pstmt.setString(8, dto.getM_phone());
			pstmt.setString(9, dto.getM_img());
			pstmt.setString(10, dto.getM_id());

			if (pstmt.executeUpdate() == 1) {
				System.out.println("멤버 수정 성공");
			}

			pstmt = con.prepareStatement(sql2);
			// Address 테이블 업데이트
			pstmt.setString(1, dto.getA_address());
			pstmt.setString(2, dto.getA_postcode());
			pstmt.setString(3, dto.getM_id());

			if (pstmt.executeUpdate() == 1) {
				System.out.println("주소 수정 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
	        System.out.println("업데이트 중 오류 발생: " + e.getMessage());
		} finally {
			dbManager.close(con, pstmt, rs);
		}
	}

	public static void memberUpdateC(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();

		String path = request.getServletContext().getRealPath("regPage/profileImages");
		MultipartRequest mr;
		mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());

		// request에서 파라미터 가져오기
		String m_id = (String) session.getAttribute("m_id");
		String m_pw = mr.getParameter("m_pw");
		String m_name_sei = mr.getParameter("m_name_sei");
		String m_name_mei = mr.getParameter("m_name_mei");
		String m_name_kana_sei = mr.getParameter("m_name_kana_sei");
		String m_name_kana_mei = mr.getParameter("m_name_kana_mei");
		String m_name_rome_mei = mr.getParameter("m_name_rome_mei");
		String m_name_rome_sei = mr.getParameter("m_name_rome_sei");
		String m_gender = mr.getParameter("m_gender");
		String m_email = mr.getParameter("m_email");
		String m_phone = mr.getParameter("m_phone");
		String a_prefecture = mr.getParameter("a_prefecture");
		String a_city = mr.getParameter("a_city");
		String a_street = mr.getParameter("a_street");
		String a_building = mr.getParameter("a_building");
		String a_postcode = mr.getParameter("a_postcode");
		String m_birthY = mr.getParameter("m_birthY");
		String m_birthM = mr.getParameter("m_birthM");
		String m_birthD = mr.getParameter("m_birthD");
		String oldImg = mr.getParameter("oldImg");
		String newImg = mr.getFilesystemName("newImg");

		// 새 이미지가 업로드 되었으면 기존 이미지 덮어쓰기
	    String m_img = oldImg;
	    if (newImg != null) {
	        m_img = newImg;
	        File oldFile = new File(path, oldImg);
	        if (oldFile.exists()) {
	            oldFile.delete(); // 기존 파일 삭제
	        }
	    }

		String m_regdate = request.getParameter("m_regdate");

//      정보 합치기 (구분자 사용)
		String delimiter = " "; // 구분자 (주소에 포함되지 않을 특수 문자 사용)
		String combinedAddress = a_prefecture + delimiter + a_city + delimiter + a_street + delimiter + a_building;
		m_birthM = String.format("%02d", Integer.parseInt(m_birthM));
		m_birthD = String.format("%02d", Integer.parseInt(m_birthD));
		String combinedBirth = m_birthY + "-" + m_birthM + "-" + m_birthD;
		String combinedName = m_name_sei + delimiter + m_name_mei;
		String combinedKana = m_name_kana_sei + delimiter + m_name_kana_mei;
		String combinedRome = m_name_rome_mei + delimiter + m_name_rome_sei;
		
		MemberDTO dto = new MemberDTO(m_id, m_pw, combinedName, combinedKana, combinedRome, combinedBirth, m_gender, m_email,
				m_regdate, m_img, m_phone, combinedAddress, a_postcode);
		
		
		try {
			System.out.println(combinedName);
			updateMemberInfo(dto);
			session.setAttribute("m_name", combinedName);
	        response.sendRedirect("MemberDetailC"); // 수정 후 마이페이지로 이동

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("アカウント情報修正エラー: " + e.getMessage());
			request.getRequestDispatcher("MemberUpdateC").forward(request, response);
		}

	}

	// 아이디 중복 확인
	public boolean isMemberIdDuplicate(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		boolean isDuplicate = false;

		try {
			con = dbManager.connect();
			String sql = "SELECT COUNT(*) FROM s_Member WHERE m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0) {
					isDuplicate = true;
				}
			}
		} catch (Exception e) {

		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return isDuplicate;
	}

	public static void memberDeleteC(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1. 세션에서 로그인 정보 가져오기
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		if (m_id != null) { // 로그인된 상태인 경우에만 탈퇴 처리
			MemberDAO dao = new MemberDAO();
			try {
				int result = dao.deleteMember(m_id);
				if (result == 1) {
					// 탈퇴 성공 처리
					session.invalidate(); // 세션 무효화
					System.out.println("삭제 성공");

				} else {
					// 탈퇴 실패 처리 (회원 정보가 없는 경우 등)
					System.out.println("アカウント削除失敗。アカウント情報が存在しません。");
					response.sendRedirect("MainC");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				// 에러 페이지로 이동 등 예외 처리
			}
		} else {
			// 로그인되지 않은 경우 로그인 페이지로 이동
			response.sendRedirect("MemberC");
		}

	}

	public static void MemberIdCheckCDoGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");

		MemberDAO dao = new MemberDAO();
		try {
			boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
			request.setAttribute("isDuplicate", isDuplicate);
			request.setAttribute("m_id", m_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void MemberIdCheckCDoPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String m_id = request.getParameter("id");
		System.out.println(m_id);
		// 입력값 유효성 검사
		if (m_id == null || m_id.trim().isEmpty()) {
			request.setAttribute("error", "IDを入力してください");
			// 추가 작업이 필요할 수 있음
		} else {
			// 이어서 처리
			MemberDAO dao = new MemberDAO();
			try {
				boolean isDuplicate = dao.isMemberIdDuplicate(m_id);
				System.out.println(isDuplicate);
				String idCheckResult = isDuplicate ? "使用中ID" : "使用可能ID";
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

	public static void MemberLogoutC(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false); // 기존 세션 가져오기 (없으면 null 반환)
		if (session != null) {
			session.invalidate(); // 세션 무효화 (로그아웃)
		}
		response.sendRedirect("MainC"); // 메인 페이지로 리다이렉트

	}

	// 마이페이지 (정보 조회 및 수정)
	public MemberDTO getMypage(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		// LEFT OUTER JOIN 사용하여 Address 테이블에 데이터가 없어도 Member 정보 가져오기
		String sql = "SELECT * FROM s_Member M LEFT OUTER JOIN s_Address A ON M.m_id = A.m_id WHERE M.m_id = ?";

		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return createMemberDTO(rs);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return null; // 회원 정보가 없으면 null 반환
	}

	public static void memberDetailCDoGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		if (m_id == null) {
			response.sendRedirect("MemberC"); // 로그인 페이지로 리다이렉트
			return;
		}

		MemberDAO dao = new MemberDAO();
		try {
			MemberDTO dto = dao.getMypage(m_id);
			System.out.println(dto);
			if (dto != null) {

				request.setAttribute("dto", dto); // 회원 정보를 request에 담아 전달
				request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
			} else {
				response.sendRedirect("HSC"); // 메인 페이지로 이동
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// 디버깅 메시지 출력
			System.out.println("MemberDetailC - 데이터베이스 오류: " + e.getMessage());
			response.sendRedirect("HSC"); // 메인 페이지로 이동
		}

	}

	public static void lineLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getParameter("code");
		request.getParameter("state");
		System.out.println(request.getParameter("code"));
		System.out.println(request.getParameter("state"));

	}

	public static void selectMember(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "select m.m_id, m.m_pw, m.m_name, m.m_name_kana, m.m_name_rome, EXTRACT(YEAR FROM m.m_birth) AS year,EXTRACT(MONTH FROM m.m_birth) AS month,EXTRACT(DAY FROM m.m_birth) AS day, m.m_gender, m.m_email, m.m_regdate, m.m_img, m.m_phone, a.a_address, a.a_postcode from s_member m left outer join s_address a on m.m_id = a.m_id where m.m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, (String)request.getSession().getAttribute("m_id"));
			rs = pstmt.executeQuery();
			MeberSplitDTO dto = new MeberSplitDTO();
			if(rs.next()) {
				System.out.println("select success!");
				dto.setM_id(rs.getString(1));
				dto.setM_pw(rs.getString(2));
				String[] name = rs.getString(3).split(" ");
				dto.setM_name1(name[0]);
				dto.setM_name2(name[1]);
				String[] kana = rs.getString(4).split(" ");
				dto.setM_name_kana1(kana[0]);
				dto.setM_name_kana2(kana[1]);
				String[] roma = rs.getString(5).split(" ");
				dto.setM_name_rome1(roma[0]);
				dto.setM_name_rome2(roma[1]);
				dto.setM_birth_year(rs.getString(6));
				dto.setM_birth_month(rs.getString(7));
				dto.setM_birth_day(rs.getString(8));
				dto.setM_gender(rs.getString(9));
				dto.setM_email(rs.getString(10));
				dto.setM_regdate(rs.getString(11));
				dto.setM_img(rs.getString(12));
				dto.setM_phone(rs.getString(13));
				String address[] = rs.getString(14).split(" ");
				dto.setA_address(address);
				dto.setA_postcode(rs.getString(15));
				request.setAttribute("i", dto);
			}
			System.out.println(dto);
			System.out.println(request.getAttribute("i"));
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt, rs);
		}
	}
}
