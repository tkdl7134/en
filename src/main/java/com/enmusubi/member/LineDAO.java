package com.enmusubi.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.enmusubi.main.DBManager;

public class LineDAO {
	private static String tok;

	public static void LineApi(HttpServletRequest request) {
		getToken(request);
		requestInfo(request);
	}

	private static void getToken(HttpServletRequest request) {
		try {
			URL url = new URL("https://api.line.me/oauth2/v2.1/token");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setDoOutput(true);

			String data = "grant_type=authorization_code" + "&code=" + request.getParameter("code") + "&redirect_uri="
					+ "http://localhost/En/LineLoginC" + "&client_id=" + "2005476894" + "&client_secret="
					+ "c023cd86708ee211f26c4344ca4347b7";

			try (OutputStream os = conn.getOutputStream()) {
				byte[] input = data.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			int status = conn.getResponseCode();
			if (status == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}

				JSONObject jsonResponse = new JSONObject(response.toString());
				tok = jsonResponse.getString("access_token");
				HttpSession session = request.getSession();
				session.setAttribute("access_token", tok);

				// 디버깅 코드 출력
				System.out.println("Success: " + jsonResponse);
				System.out.println("Access Token: " + tok);

			} else {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				System.err.println("Error: " + response.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void requestInfo(HttpServletRequest request) {
		try {
			URL url = new URL("https://api.line.me/v2/profile");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + tok);

			int status = conn.getResponseCode();
			if (status == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}

				JSONObject jsonResponse = new JSONObject(response.toString());
				String m_id = jsonResponse.getString("userId");
				String m_name = jsonResponse.getString("displayName");

				HttpSession session = request.getSession();
				session.setAttribute("m_id", m_id);
				session.setAttribute("m_name", m_name);

				// 디버깅 코드 출력
//		            System.out.println("Session userId set to: " + m_id);
				System.out.println("Profile Info: " + jsonResponse);

			} else {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}

				System.err.println("Error: " + response.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void LineCheck(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "select m_id from s_member where m_id = ?";
		try {
		    con = dbManager.connect();
		    pstmt = con.prepareStatement(sql);
		    HttpSession session = request.getSession();
		    String sessionId = (String)session.getAttribute("m_id");
		    System.out.println(sessionId);
		    pstmt.setString(1, sessionId);	
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		    	System.out.println("id exist");
		    }
		    else {
		    	System.out.println("id no exist");
		    	String insertLineMember = "insert into s_member(m_id,m_name,m_name_kana,m_name_rome,m_gender,m_email,m_regdate) values(?,?,?,?,?,?,sysdate)";
		    	pstmt = con.prepareStatement(insertLineMember);
		    	pstmt.setString(1, sessionId);
		    	pstmt.setString(2, "no data");
		    	pstmt.setString(3, "no data");
		    	pstmt.setString(4, "no data");
		    	pstmt.setString(5, "no data");
		    	pstmt.setString(6, "no data");
		    	pstmt.executeUpdate();
		    }
		}
		catch (SQLException e) {
		    e.printStackTrace();
		    System.out.println("server err...");
		} finally {
		    dbManager.close(con, pstmt, rs);
		}
	}

}
