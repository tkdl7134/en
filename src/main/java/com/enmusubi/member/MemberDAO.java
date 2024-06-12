package com.enmusubi.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.enmusubi.main.DBManager;
import com.google.gson.Gson;

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
			rs = pstmt.executeQuery();
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			if (rs.next()) {
				return createMemberDTOForLogin(rs); // 로그인용 DTO 생성 메소드 호출

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return null;
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
		// 로그인 시에는 주소 정보 불필요
		return dto;
	}

	// 회원가입
	public int registerMemberWithAddress(MemberDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmtMember = null; // Member 테이블용 PreparedStatement
		PreparedStatement pstmtAddress = null; // Address 테이블용 PreparedStatement
		DBManager dbManager = DBManager.getInstance();
		String sqlMember = "INSERT INTO s_Member (m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email, m_regdate, m_img, m_phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sqlAddress = "INSERT INTO s_Address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";

		try {
			con = dbManager.connect();
			con.setAutoCommit(false); // 트랜잭션 시작

			// 디버깅 로그 출력 (m_id 값 확인)
//            System.out.println("MemberDAO - registerMemberWithAddress - m_id: " + dto.getM_id()); // 콘솔에 m_id 값 출력

			// 회원 정보 등록
			pstmtMember = con.prepareStatement(sqlMember);
			pstmtMember.setString(1, dto.getM_id());
			pstmtMember.setString(2, dto.getM_pw());
			pstmtMember.setString(3, dto.getM_name());
			pstmtMember.setString(4, dto.getM_name_kana());
			pstmtMember.setString(5, dto.getM_name_rome());
			pstmtMember.setString(6, dto.getM_birth());
			pstmtMember.setString(7, dto.getM_gender());
			pstmtMember.setString(8, dto.getM_email());
			pstmtMember.setString(9, dto.getM_regdate());
			pstmtMember.setString(10, dto.getM_img());
			pstmtMember.setString(11, dto.getM_phone());
			pstmtMember.executeUpdate();

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

	public int updateMypage(MemberDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "UPDATE s_Member SET m_pw = ?, m_name = ?, m_name_kana = ?, m_name_rome = ?, m_birth = ?, "
				+ "m_gender = ?, m_email = ?, m_img = ?, m_phone = ? WHERE m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_pw());
			pstmt.setString(2, dto.getM_name());
			pstmt.setString(3, dto.getM_name_kana());
			pstmt.setString(4, dto.getM_name_rome());
			pstmt.setString(5, dto.getM_birth());
			pstmt.setString(6, dto.getM_gender());
			pstmt.setString(7, dto.getM_email());
			pstmt.setString(8, dto.getM_img());
			pstmt.setString(9, dto.getM_phone());
			pstmt.setString(10, dto.getM_id());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt, null);
		}
		return 0;
	}

	// 회원탈퇴
	public int deleteMember(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmtAddress = null;
		PreparedStatement pstmtMember = null;
		DBManager dbManager = DBManager.getInstance();
		String sqlAddress = "DELETE FROM s_Address WHERE m_id = ?";
		String sqlMember = "DELETE FROM s_Member WHERE m_id = ?";

		try {
			con = dbManager.connect();
			con.setAutoCommit(false); // 트랜잭션 시작

			// 1. 주소 정보 삭제 (외래 키 제약 조건으로 인해 Member 삭제 전에 처리)
			pstmtAddress = con.prepareStatement(sqlAddress);
			pstmtAddress.setString(1, m_id);
			pstmtAddress.executeUpdate();

			// 2. 회원 정보 삭제
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
			dbManager.close(con, pstmtAddress, null);
			dbManager.close(con, pstmtMember, null);
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
			// TODO: handle exception
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
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return null; // 회원 정보가 없으면 null 반환
	}

	// 회원 정보 업데이트 (이름, 이미지)
	public void updateMember(MemberDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "UPDATE s_Member SET m_name = ?, m_img = ? WHERE m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_name());
			pstmt.setString(2, dto.getM_img());
			pstmt.setString(3, dto.getM_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt, null);
		}
	}

	// 회원 정보 업데이트 (전체 정보)
	public void updateMemberInfo(MemberDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql1 = "UPDATE s_Member SET m_pw = ?, m_name = ?, m_name_kana = ?, m_name_rome = ?, m_birth = ?, m_gender = ?, m_email = ?, m_phone = ? WHERE m_id = ?";
		String sql2 = "UPDATE s_Address SET a_address = ?, a_postcode = ? WHERE m_id = ?";

		try {
			con = dbManager.connect();
			pstmt1 = con.prepareStatement(sql1);
			pstmt2 = con.prepareStatement(sql2);

			// Member 테이블 업데이트
			pstmt1.setString(1, dto.getM_pw());
			pstmt1.setString(2, dto.getM_name());
			pstmt1.setString(3, dto.getM_name_kana());
			pstmt1.setString(4, dto.getM_name_rome());
			pstmt1.setString(5, dto.getM_birth());
			pstmt1.setString(6, dto.getM_gender());
			pstmt1.setString(7, dto.getM_email());
			pstmt1.setString(8, dto.getM_phone());
			pstmt1.setString(9, dto.getM_id());
			pstmt1.executeUpdate();

			// Address 테이블 업데이트
			pstmt2.setString(1, dto.getA_address());
			pstmt2.setString(2, dto.getA_postcode());
			pstmt2.setString(3, dto.getM_id());
			pstmt2.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt1, rs);
			dbManager.close(con, pstmt2, rs);
		}
	}

	// 아이디 중복 확인
	public boolean isMemberIdDuplicate(String m_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT COUNT(*) FROM s_Member WHERE m_id = ?";
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, m_id);
			if (rs.next()) {
				int count = rs.getInt(1); // COUNT(*) 결과 가져오기
				return count > 0; // 중복된 아이디가 있으면 true 반환
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		return false; // 예외 발생 시 false 반환 (중복 확인 실패)
	}

	public static void memberC(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 로그인 정보 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");

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

//				System.out.println("Session m_id: " + session.getAttribute("m_id")); // 로그 출력 (디버깅용)

				// 세션 유효 시간 10분 (600초) 설정
				session.setMaxInactiveInterval(600);

				// 로그인 성공 메시지 설정 (선택 사항)
				request.getRequestDispatcher("main.jsp").forward(request, response); // 메인 페이지로 이동
			} else {
				// 3-2. 로그인 실패
				String errorMessage = "IDまたはPWが一致しません";
				request.setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("MemberC").forward(request, response); // 로그인 페이지로 다시 포워딩
			}
		} catch (SQLException e) {
			// 3-3. 데이터베이스 오류 발생
			e.printStackTrace();
			request.setAttribute("errorMessage", "データベースエラー");
			request.getRequestDispatcher("MemberC").forward(request, response); // 로그인 페이지로 다시 포워딩
		}

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
					response.sendRedirect("main.jsp"); // 메인 페이지로 이동
				} else {
					// 탈퇴 실패 처리 (회원 정보가 없는 경우 등)
					System.out.println("アカウント削除失敗。アカウント情報が存在しません。");
					response.sendRedirect("MemberDetailC"); // 마이 페이지로 이동 (오류 메시지 표시)
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
			request.getRequestDispatcher("/regPage/idCheck.jsp").forward(request, response); // 결과 페이지로 포워딩
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

	public static void MemberLogoutC(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false); // 기존 세션 가져오기 (없으면 null 반환)
		if (session != null) {
			session.invalidate(); // 세션 무효화 (로그아웃)
		}
		response.sendRedirect("main.jsp"); // 메인 페이지로 리다이렉트

	}

	public static void MemberRegC(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// request에서 파라미터 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_name_kana = request.getParameter("m_name_kana");
		String m_name_rome = request.getParameter("m_name_rome");
		String m_birth = request.getParameter("m_birth");
		String m_gender = request.getParameter("m_gender");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
//        String a_address = request.getParameter("a_address");
		String a_prefecture = request.getParameter("a_prefecture");
		String a_city = request.getParameter("a_city");
		String a_street = request.getParameter("a_street");
		String a_building = request.getParameter("a_building");
		String a_postcode = request.getParameter("a_postcode");

		// 디버깅 로그 출력 (m_id 값 확인)
//		System.out.println("MemberRegC - m_id: " + m_id); // 콘솔에 m_id 값 출력

		// 현재 날짜 및 시간 가져오기
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String m_regdate = now.format(formatter);

		// 이미지 처리 (파일 업로드 등 별도 처리 필요)
		String m_img = "default.png"; // 기본 이미지 설정

//      5. 주소 정보 합치기 (구분자 사용)
		String delimiter = ", "; // 구분자 (주소에 포함되지 않을 특수 문자 사용)
		String combinedAddress = a_prefecture + delimiter + a_city + delimiter + a_street + delimiter + a_building;

		MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email,
				m_regdate, m_img, m_phone, combinedAddress, a_postcode);

		// MemberDTO 생성 후 로그 출력
//        System.out.println("MemberRegC - memberDto.getM_id(): " + dto.getM_id());

		MemberDAO dao = new MemberDAO();
		try {
			// 7. 회원 정보 및 주소 정보 등록 (트랜잭션 처리)
			int result = dao.registerMemberWithAddress(dto);
			if (result == 1) {
				// 회원가입 및 주소 등록 성공 처리
				response.sendRedirect("MEmberC");
			} else {
				// 회원가입 실패 처리 (아이디 중복 등)
				System.out.println("アカウント登録失敗");
				request.getRequestDispatcher("MemberRegC").forward(request, response);
			}
		} catch (SQLException e) {
			// SQL 예외 처리
			e.printStackTrace();
			request.getRequestDispatcher("MemberRegC").forward(request, response);
		}
		request.setAttribute("address", combinedAddress); // JSP에서 사용할 수 있도록 설정

	}

	public static void memberDetailCDoGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
//		String m_name = (String) session.getAttribute("m_name");
		String m_id = (String) session.getAttribute("m_id");
//		System.out.println("Session m_id in MemberDetailC: " + m_id); // 로그 출력 (디버깅용)

		if (m_id == null) {
			response.sendRedirect("MemberC"); // 로그인 페이지로 리다이렉트
			return;
		}

		MemberDAO dao = new MemberDAO();
		try {
			MemberDTO dto = dao.getMypage(m_id);
			if (dto != null) {
				// 디버깅 메시지 출력
//                System.out.println("MemberDetailC - 회원 정보 조회 성공: " + dto);

				request.setAttribute("dto", dto); // 회원 정보를 request에 담아 전달
				request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
			} else {
				// 회원 정보가 없을 때 로그인 페이지로 이동하는 대신,
				// 오류 메시지를 표시하거나 다른 처리를 수행할 수도 있습니다.
				// 디버깅 메시지 출력
				System.out.println("MemberDetailC - 회원 정보 조회 실패: m_id = " + m_id);

				request.getRequestDispatcher("main.jsp").forward(request, response); // 메인 페이지로 이동
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// 디버깅 메시지 출력
			System.out.println("MemberDetailC - 데이터베이스 오류: " + e.getMessage());

			request.getRequestDispatcher("main.jsp").forward(request, response); // 메인 페이지로 이동
		}

	}

	public static void memberDetailCDoPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// request에서 수정된 정보 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_name_kana = request.getParameter("m_name_kana");
		String m_name_rome = request.getParameter("m_name_rome");
		String m_birth = request.getParameter("m_birth");
		String m_gender = request.getParameter("m_gender");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
		String a_address = request.getParameter("a_address");
		String a_postcode = request.getParameter("a_postcode");

		// 이미지 처리 (파일 업로드 등 별도 처리 필요)
		String m_img = "default.png"; // 기본 이미지 설정

		MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email, m_email,
				m_img, m_phone, a_address, a_postcode);
		HttpSession session = request.getSession();
		session.setAttribute("a_postcode", dto.getA_postcode());
		session.setAttribute("a_address", dto.getA_address());

		MemberDAO dao = new MemberDAO();
		try {
			int result = dao.updateMypage(dto);
			if (result == 1) {
				// 수정 성공 처리
				response.sendRedirect("/En/MemberDetailC"); // 마이페이지 다시 조회 (새로운 정보 반영)
			} else {
				// 수정 실패 처리
				request.setAttribute("error", "修正失敗");
				request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// 에러 페이지로 이동 등 예외 처리
		}

	}

	public static void memberUpdateC(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// request에서 파라미터 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_name_kana = request.getParameter("m_name_kana");
		String m_name_rome = request.getParameter("m_name_rome");
		String m_birth = request.getParameter("m_birth");
		String m_gender = request.getParameter("m_gender");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
//        String a_address = request.getParameter("a_address");
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

//         5. 주소 정보 합치기 (구분자 사용)
		String delimiter = ", "; // 구분자 (주소에 포함되지 않을 특수 문자 사용)
		String combinedAddress = a_prefecture + delimiter + a_city + delimiter + a_street + delimiter + a_building;

		MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email,
				m_regdate, m_img, m_phone, combinedAddress, a_postcode);

		HttpSession session = request.getSession(); // 세션 얻기 (없으면 생성)
		session.setAttribute("a_postcode", dto.getA_postcode());
		session.setAttribute("a_address", dto.getA_address());

		MemberDAO dao = new MemberDAO();
		try {
			dao.updateMemberInfo(dto);
			response.sendRedirect("MemberDetailC"); // 수정 후 마이페이지로 이동
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("アカウント情報修正エラー");
			request.getRequestDispatcher("myPage/updatePage.jsp").forward(request, response);
		}

	}

	public static void lineLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getParameter("code");
		request.getParameter("state");
		System.out.println(request.getParameter("code"));
		System.out.println(request.getParameter("state"));

	}
}
