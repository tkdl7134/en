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
        // 기본 생성자
    }

    public static void invitations(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT se.e_no, sm.m_id, sm.m_name, sm.m_phone, sm.m_email, "
                + "sg.g_attend, sg.g_guest_type, sg.g_message, sg.g_relation, "
                + "sa.allergy, sp.p_adult, sp.p_child, sp.p_baby "
                + "FROM s_guest sg "
                + "LEFT JOIN s_member sm ON sg.m_id = sm.m_id "
                + "LEFT JOIN s_event se ON sg.e_no = se.e_no "
                + "LEFT JOIN s_party sp ON sg.m_id = sp.m_id "
                + "LEFT JOIN s_allergy sa ON sg.m_id = sa.m_id "
                + "WHERE se.m_id = 'testuser' AND sg.e_no = '1'";

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

                String m_id = rs.getString("m_id");
                String m_name = rs.getString("m_name");
                String m_phone = rs.getString("m_phone");
                String m_email = rs.getString("m_email");

                String g_attend = rs.getString("g_attend");
                String g_guest_type = rs.getString("g_guest_type");
                String g_message = rs.getString("g_message");
                String g_relation = rs.getString("g_relation");

                String allergy = rs.getString("allergy");

                int p_adult = rs.getInt("p_adult");
                int p_child = rs.getInt("p_child");
                int p_baby = rs.getInt("p_baby");

                i = new InvitationDTO(e_no, m_id, m_name, m_phone, m_email, g_attend,
                        g_guest_type, g_message, g_relation, allergy, p_adult, p_child, p_baby);

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
