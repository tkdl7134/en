package com.enmusubi.invitation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Comparator;
import javax.servlet.http.HttpServletRequest;
import com.enmusubi.main.DBManager;

public class InvitationDAO {
	public static ArrayList<InvitationDTO> invitationsYes;
	public static ArrayList<InvitationDTO> invitationsYesMale;
	public static ArrayList<InvitationDTO> invitationsYesFemale;
	public static ArrayList<InvitationDTO> invitationsNo;
	public static ArrayList<InvitationDTO> invitationsNoMale;
	public static ArrayList<InvitationDTO> invitationsNoFemale;

	private static final InvitationDAO IDAO = new InvitationDAO();

	public static InvitationDAO getIdao() {
		return IDAO;
	}

	public InvitationDAO() {
		// Default constructor
	}

	public static void invitations(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * " + "FROM S_GUEST sg " + "LEFT OUTER JOIN S_MEMBER sm ON sg.M_ID = sm.M_ID "
				+ "LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO "
				+ "LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID = sa.M_ID "
				+ "LEFT OUTER JOIN S_ALLERGY sa2 ON sm.M_ID = sa2.M_ID "
				+ "LEFT OUTER JOIN S_WEDDING_INFO swi ON se.E_NO = swi.E_NO "
				+ "LEFT OUTER JOIN S_PARTY sp ON sg.M_ID = sp.M_ID " + "WHERE se.M_ID = 'testuser' AND sg.E_NO = '1'";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			invitationsYes = new ArrayList<>();
			invitationsYesMale = new ArrayList<>();
			invitationsYesFemale = new ArrayList<>();
			invitationsNo = new ArrayList<>();
			invitationsNoMale = new ArrayList<>();
			invitationsNoFemale = new ArrayList<>();
			InvitationDTO i = null;

			while (rs.next()) {
				int e_no = rs.getInt("e_no");

				String w_groom = rs.getString("w_groom");
				String w_bride = rs.getString("w_bride");
				String w_img = rs.getString("w_img");

				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");
				String m_name_kana = rs.getString("m_name_kana");
				String m_name_rome = rs.getString("m_name_rome");
				String m_phone = rs.getString("m_phone");
				String m_email = rs.getString("m_email");

				String g_attend = rs.getString("g_attend");
				String g_guest_type = rs.getString("g_guest_type");
				String g_allergy_or = rs.getString("g_allergy_or");
				String g_message = rs.getString("g_message");
				String g_relation = rs.getString("g_relation");

				String allergy = rs.getString("allergy");

				String p_age_type = rs.getString("p_age_type");
				String p_numberof = rs.getString("p_numberof");

				i = new InvitationDTO(e_no, w_groom, w_bride, w_img, m_id, m_name, m_name_kana, m_name_rome, m_phone,
						m_email, g_attend, g_guest_type, g_allergy_or, g_message, g_relation, allergy, p_age_type,
						p_numberof);

				if ("yes".equalsIgnoreCase(g_attend)) {
					invitationsYes.add(i);
					if ("新郎".equalsIgnoreCase(g_guest_type)) {
						invitationsYesMale.add(i);
					} else if ("新婦".equalsIgnoreCase(g_guest_type)) {
						invitationsYesFemale.add(i);
					}
				} else if ("no".equalsIgnoreCase(g_attend)) {
					invitationsNo.add(i);
					if ("新郎".equalsIgnoreCase(g_guest_type)) {
						invitationsNoMale.add(i);
					} else if ("新婦".equalsIgnoreCase(g_guest_type)) {
						invitationsNoFemale.add(i);
					}
				}
			}

			// 이름순으로 정렬
			invitationsYes.sort(Comparator.comparing(InvitationDTO::getM_name));
			invitationsNo.sort(Comparator.comparing(InvitationDTO::getM_name));

			request.setAttribute("invitationsYes", invitationsYes);
			request.setAttribute("invitationsYesMale", invitationsYesMale);
			request.setAttribute("invitationsYesFemale", invitationsYesFemale);
			request.setAttribute("invitationsNo", invitationsNo);
			request.setAttribute("invitationsNoMale", invitationsNoMale);
			request.setAttribute("invitationsNoFemale", invitationsNoFemale);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

}
