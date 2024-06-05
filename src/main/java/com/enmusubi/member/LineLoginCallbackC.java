package com.enmusubi.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.stream.Collectors;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LineLoginCallbackC")
public class LineLoginCallbackC extends HttpServlet {

	private static final String CLIENT_ID = "2005476894";
	private static final String CLIENT_SECRET = "c023cd86708ee211f26c4344ca4347b7";
	// 로컬 환경에서 테스트하는 경우 ngrok 등을 사용하여 HTTPS URL을 생성하고 설정해야 합니다.
	private static final String REDIRECT_URI = "http://localhost/En/LineLoginCallbackC";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String state = request.getParameter("state"); // CSRF 방지를 위한 state 파라미터 검증 (생략)

		try {
			// 1. Access Token 얻기
			String accessToken = getAccessToken(code);

			// 2. 사용자 정보 가져오기
			String userProfileString = getUserProfile(accessToken);

			// 3. 문자열 처리를 통해 사용자 정보 추출
			String userId = extractValueFromJsonString(userProfileString, "userId");
			String displayName = extractValueFromJsonString(userProfileString, "displayName");
			String pictureUrl = extractValueFromJsonString(userProfileString, "pictureUrl");
			String email = extractValueFromJsonString(userProfileString, "email");

			// 4. DB에서 회원 정보 조회 또는 생성
			MemberDAO dao = new MemberDAO();
			MemberDTO member = dao.getMemberById(userId);

			if (member == null) {
				// 회원 가입
				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String m_regdate = now.format(formatter);

				member = new MemberDTO();
				member.setM_id(userId);
				member.setM_pw(""); // 비밀번호는 빈 문자열로 설정 (LINE 로그인 시 필요 없음)
				member.setM_name(displayName);
				member.setM_img(pictureUrl);
				member.setM_email(email);
				member.setM_regdate(m_regdate);
				// 나머지 필드는 기본값 또는 필요에 따라 설정

				dao.register(member);
			} else {
				// 기존 회원일 경우 이름과 이미지 업데이트
				member.setM_name(displayName);
				member.setM_img(pictureUrl);
				dao.updateMember(member);
			}

			// 5. 세션에 사용자 정보 저장 및 메인 페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("m_id", member.getM_id());
			session.setAttribute("m_name", member.getM_name());
			session.setMaxInactiveInterval(600); // 세션 유효 시간 10분 설정

			request.getRequestDispatcher("main.jsp").forward(request, response); 
		} catch (Exception e) {
			e.printStackTrace();
			// 에러 처리 (예: 에러 페이지로 이동)
			request.setAttribute("errorMessage", "로그인 중 오류가 발생했습니다.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	private String getAccessToken(String code) throws IOException {
		URL url = new URL("https://api.line.me/oauth2/v2.1/token");
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setDoOutput(true);

		String requestBody = "grant_type=authorization_code" + "&code=" + code + "&redirect_uri="
				+ URLEncoder.encode(REDIRECT_URI, StandardCharsets.UTF_8) + "&client_id=" + CLIENT_ID
				+ "&client_secret=" + CLIENT_SECRET;

		try (OutputStream os = conn.getOutputStream()) {
			byte[] input = requestBody.getBytes(StandardCharsets.UTF_8);
			os.write(input, 0, input.length);
		}

		int responseCode = conn.getResponseCode();
		if (responseCode == HttpsURLConnection.HTTP_OK) {
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
				String response = br.lines().collect(Collectors.joining());
				int startIndex = response.indexOf("access_token") + 15; // "access_token":" 뒤부터
				int endIndex = response.indexOf("\"", startIndex);
				return response.substring(startIndex, endIndex);
			}
		} else {
			throw new IOException("Failed to get access token. Response code: " + responseCode);
		}
	}

	private String getUserProfile(String accessToken) throws IOException {
		URL url = new URL("https://api.line.me/v2/profile");
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", "Bearer " + accessToken);

		int responseCode = conn.getResponseCode();
		if (responseCode == HttpsURLConnection.HTTP_OK) {
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
				return br.lines().collect(Collectors.joining());
			}
		} else {
			throw new IOException("Failed to get user profile. Response code: " + responseCode);
		}
	}

	private String extractValueFromJsonString(String jsonString, String key) {
		int startIndex = jsonString.indexOf("\"" + key + "\":") + key.length() + 3; // 따옴표와 콜론 포함
		int endIndex = jsonString.indexOf(",", startIndex);
		if (endIndex == -1) {
			endIndex = jsonString.indexOf("}", startIndex);
		}
		String value = jsonString.substring(startIndex, endIndex).replaceAll("\"", ""); // 따옴표 제거
		return value.equals("null") ? "" : value; // null 값 처리
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
