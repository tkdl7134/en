package com.enmusubi.member;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberDAO {

	// ログイン状態をチェックするメソッド
	public static boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			request.setAttribute("login", "member/login.jsp");
			return false;
		} else {
			request.setAttribute("login", "member/loginOK.jsp");
			return true;
		}
	}

	public static void login(HttpServletRequest request) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where m_id = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String result = "";

			if (rs.next()) {
				String dbPW = rs.getString("m_pw");
				if (pw.equals(dbPW)) {
					result = "ログイン成功";
					System.out.println("ログイン成功");

					MemberDTO memberDTO = new MemberDTO();
					memberDTO.setId(rs.getString("m_id"));
					memberDTO.setPassword(rs.getString("m_pw"));
					memberDTO.setName(rs.getString("m_name"));
					memberDTO.setNameKana(rs.getString("m_name_kana"));
					memberDTO.setBirth(rs.getString("m_birth"));
					memberDTO.setGender(rs.getString("m_gender"));
					memberDTO.setEmail(rs.getString("m_email"));
					memberDTO.setRegdate(rs.getDate("m_regdate"));
					memberDTO.setImg(rs.getString("m_img"));
					memberDTO.setPhone(rs.getString("m_phone"));

					HttpSession session = request.getSession();
					session.setAttribute("member", memberDTO);
					session.setMaxInactiveInterval(600); // 10 minutes

				} else {
					result = "パスワードが間違っています";
					System.out.println("パスワードが間違っています");
				}
			} else {
				result = "存在しない会員です";
				System.out.println("存在しない会員です");
			}
			request.setAttribute("result", result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	// 新規メンバー登録処理
	public static void regMember(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO Member (m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, m_regdate, m_img, m_phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			String path = request.getServletContext().getRealPath("uploads");
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 10, "UTF-8",
					new DefaultFileRenamePolicy());

			String id = mr.getParameter("id");
			String password = mr.getParameter("password");
			String name = mr.getParameter("name");
			String nameKana = mr.getParameter("nameKana");
			String birth = mr.getParameter("birth");
			String gender = mr.getParameter("gender");
			String email = mr.getParameter("email");
			String phone = mr.getParameter("phone");
			File imgFile = mr.getFile("img");

			byte[] img = null;
			if (imgFile != null) {
				try (FileInputStream fis = new FileInputStream(imgFile)) {
					img = fis.readAllBytes();
				}
			}

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, nameKana);
			pstmt.setDate(5, Date.valueOf(birth));
			pstmt.setString(6, gender);
			pstmt.setString(7, email);
			pstmt.setDate(8, new Date(System.currentTimeMillis()));
			pstmt.setBytes(9, img);
			pstmt.setString(10, phone);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				request.setAttribute("result", "会員登録が成功しました。");
			} else {
				request.setAttribute("result", "会員登録に失敗しました。");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "データベースエラーが発生しました。");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	// ログアウト処理
	public static void logout(HttpServletRequest request) {
		// セッションを取得
		HttpSession session = request.getSession(false);
		if (session != null) {
			// セッションからメンバー情報を削除
			session.removeAttribute("member");
			// セッションを無効化
			session.invalidate();
		}

		// ログイン状態を確認
		loginCheck(request);
	}

	public static void idCheck(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("id"));
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM Member WHERE m_id = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			rs = pstmt.executeQuery();

			MemberDTO member = new MemberDTO();
			if (rs.next()) {
				System.out.println("--");
			} else {
				System.out.println("-----");
			}
			System.out.println(member.toJSON());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void idCheck2(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("id"));
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM Member WHERE m_id = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			rs = pstmt.executeQuery();

			int result = 0;
			if (rs.next()) {
				// レコードが存在する場合は1を返す
				result = 1;
			} else {
				// レコードが存在しない場合は0を返す
			}

			response.getWriter().print(result);

		} catch (Exception e) {
			e.printStackTrace();
			// エラー時は何も返さない
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void idCheck3(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("id"));
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM Member WHERE m_id = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("id"));
			rs = pstmt.executeQuery();

			rs.next();
			response.getWriter().print(rs.getInt(1));

		} catch (Exception e) {
			e.printStackTrace();
			// エラー時は何も返さない
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void updateMember(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE Member SET m_pw=?, m_name=?, m_name_kana=?, m_birth=?, m_email=?, m_img=?, m_phone=? WHERE m_id=?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			// 既存のMultipartRequestオブジェクトを取得
			MultipartRequest mr = (MultipartRequest) request.getAttribute("multipartRequest");

			String id = mr.getParameter("id");
			String pw = mr.getParameter("pw");
			String name = mr.getParameter("name");
			String nameKana = mr.getParameter("nameKana");
			String birth = mr.getParameter("birth");
			String email = mr.getParameter("email");

			String oldImg = mr.getParameter("oldImg");
			String newImg = mr.getFilesystemName("newImg");

			String phone = mr.getParameter("phone");

			String img = oldImg;
			if (newImg != null) {
				img = newImg;
			}

			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, nameKana);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.setString(6, img);
			pstmt.setString(7, phone);
			pstmt.setString(8, id);

			int rowsAffected = pstmt.executeUpdate();

			if (rowsAffected == 1) {
				System.out.println("更新成功");

				// 新しい画像がアップロードされた場合、古い画像を削除
				if (newImg != null) {
					String path = request.getServletContext().getRealPath("myPage/imgFolder");
					File f = new File(path + "/" + oldImg);
					f.delete();
				}

				// セッションに格納されている会員情報を更新
				HttpSession session = request.getSession();
				MemberDTO member = (MemberDTO) session.getAttribute("member");
				member.setPassword(pw);
				member.setName(name);
				member.setNameKana(nameKana);
				member.setBirth(birth);
				member.setEmail(email);
				member.setImg(img);
				member.setPhone(phone);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void deleteMember(HttpServletRequest request) {
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
		if (member == null) {
			// セッションにメンバーオブジェクトが存在しない場合の処理
			// 例外処理やエラーメッセージを追加するなど
			return;
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM member WHERE m_id = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected == 1) {
				// 削除成功時の処理
				System.out.println("削除成功");
				// ログアウト処理を実行
				logout(request);
			} else {
				// 削除失敗時の処理
				// 例外処理やエラーメッセージを追加するなど
			}
		} catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		} finally {
			// リソースの解放
			DBManager.close(con, pstmt, null);
		}
	}
}