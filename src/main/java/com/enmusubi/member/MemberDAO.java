package com.enmusubi.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.main.DBManager;

public class MemberDAO {

	// 로그인
	public MemberDTO login(String m_id, String m_pw) throws SQLException {
		String sql = "SELECT * FROM Member WHERE m_id = ? AND m_pw = ?";
		try (Connection conn = DBManager.connect(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return createMemberDTOForLogin(rs); // 로그인용 DTO 생성 메소드 호출
				}
			}
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
	public int register(MemberDTO dto) throws SQLException {
		String sql = "INSERT INTO Member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DBManager.connect(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getM_pw());
			pstmt.setString(3, dto.getM_name());
			pstmt.setString(4, dto.getM_name_kana());
			pstmt.setString(5, dto.getM_birth());
			pstmt.setString(6, dto.getM_gender());
			pstmt.setString(7, dto.getM_email());
			pstmt.setString(8, dto.getM_regdate());
			pstmt.setString(9, dto.getM_img());
			pstmt.setString(10, dto.getM_phone());
			return pstmt.executeUpdate();
		}
	}

	// 마이페이지 (정보 조회 및 수정)
	public MemberDTO getMypage(String m_id) throws SQLException {
		// LEFT OUTER JOIN 사용하여 Address 테이블에 데이터가 없어도 Member 정보 가져오기
		String sql = "SELECT * FROM Member M LEFT OUTER JOIN Address A ON M.m_id = A.m_id WHERE M.m_id = ?";

		try (Connection conn = DBManager.connect(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, m_id);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return createMemberDTO(rs);
				}
			}
		}
		return null; // 회원 정보가 없으면 null 반환
	}

	public int updateMypage(MemberDTO dto) throws SQLException {
		String sql = "UPDATE Member SET m_pw = ?, m_name = ?, m_name_kana = ?, m_birth = ?, "
				+ "m_gender = ?, m_email = ?, m_img = ?, m_phone = ? WHERE m_id = ?";
		try (Connection conn = DBManager.connect(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dto.getM_pw());
			pstmt.setString(2, dto.getM_name());
			pstmt.setString(3, dto.getM_name_kana());
			pstmt.setString(4, dto.getM_birth());
			pstmt.setString(5, dto.getM_gender());
			pstmt.setString(6, dto.getM_email());
			pstmt.setString(7, dto.getM_img());
			pstmt.setString(8, dto.getM_phone());
			pstmt.setString(9, dto.getM_id());
			return pstmt.executeUpdate();
		}
	}

	// 회원탈퇴
	public int deleteMember(String m_id) throws SQLException {
		String deleteAddressSql = "DELETE FROM Address WHERE m_id = ?";
		String deleteMemberSql = "DELETE FROM Member WHERE m_id = ?";
		try (Connection conn = DBManager.connect();
				PreparedStatement pstmt1 = conn.prepareStatement(deleteAddressSql);
				PreparedStatement pstmt2 = conn.prepareStatement(deleteMemberSql)) {
			pstmt1.setString(1, m_id);
			pstmt1.executeUpdate();
			pstmt2.setString(1, m_id);
			return pstmt2.executeUpdate();
		}
	}

	// ResultSet -> DTO 변환 (마이페이지 등)
	private MemberDTO createMemberDTO(ResultSet rs) throws SQLException {
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

		// Address 정보가 없는 경우 null 처리
		String a_address = rs.getString("a_address");
		String a_postcode = rs.getString("a_postcode");
		dto.setA_address(a_address != null ? a_address : "");
		dto.setA_postcode(a_postcode != null ? a_postcode : "");

		return dto;
	}

	// 사용자 ID로 회원 정보 조회
	public MemberDTO getMemberById(String m_id) throws SQLException {
		String sql = "SELECT * FROM Member M LEFT OUTER JOIN Address A ON M.m_id = A.m_id WHERE M.m_id = ?";
		try (Connection conn = DBManager.connect(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, m_id);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return createMemberDTO(rs);
				}
			}
		}
		return null; // 회원 정보가 없으면 null 반환
	}

	// 회원 정보 업데이트 (이름, 이미지)
	public void updateMember(MemberDTO dto) throws SQLException {
		String sql = "UPDATE Member SET m_name = ?, m_img = ? WHERE m_id = ?";
		try (Connection conn = DBManager.connect(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dto.getM_name());
			pstmt.setString(2, dto.getM_img());
			pstmt.setString(3, dto.getM_id());
			pstmt.executeUpdate();
		}
	}

	// 회원 정보 업데이트 (전체 정보)
	public void updateMemberInfo(MemberDTO dto) throws SQLException {
		String sql1 = "UPDATE Member SET m_pw = ?, m_name = ?, m_name_kana = ?, m_birth = ?, m_gender = ?, m_email = ?, m_phone = ? WHERE m_id = ?";
		String sql2 = "UPDATE Address SET a_address = ?, a_postcode = ? WHERE m_id = ?";

		try (Connection conn = DBManager.connect();
				PreparedStatement pstmt1 = conn.prepareStatement(sql1);
				PreparedStatement pstmt2 = conn.prepareStatement(sql2)) {

			// Member 테이블 업데이트
			pstmt1.setString(1, dto.getM_pw());
			pstmt1.setString(2, dto.getM_name());
			pstmt1.setString(3, dto.getM_name_kana());
			pstmt1.setString(4, dto.getM_birth());
			pstmt1.setString(5, dto.getM_gender());
			pstmt1.setString(6, dto.getM_email());
			pstmt1.setString(7, dto.getM_phone());
			pstmt1.setString(8, dto.getM_id());
			pstmt1.executeUpdate();

			// Address 테이블 업데이트
			pstmt2.setString(1, dto.getA_address());
			pstmt2.setString(2, dto.getA_postcode());
			pstmt2.setString(3, dto.getM_id());
			pstmt2.executeUpdate();
		}
	}
	
	// 아이디 중복 확인
    public boolean isMemberIdDuplicate(String m_id) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Member WHERE m_id = ?";
        try (Connection conn = DBManager.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, m_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // 중복된 아이디가 있으면 true 반환
                }
            }
        }
        return false; // 중복된 아이디가 없으면 false 반환
    }
}
