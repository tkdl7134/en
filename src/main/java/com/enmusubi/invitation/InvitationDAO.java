package com.enmusubi.invitation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Comparator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
        DBManager dbManager = DBManager.getInstance();

        // 세션에서 m_id와 e_no 값을 가져옴
        HttpSession session = request.getSession();
        String m_id = (String) session.getAttribute("m_id");
        String e_no = (String) session.getAttribute("e_no");

        String sql = "SELECT se.e_no, sm.m_id, sm.m_name, sm.m_phone, sm.m_email, "
                + "sg.g_attend, sg.g_guest_type, sg.g_message, sg.g_relation, "
                + "sa.allergy, sp.p_adult, sp.p_child, sp.p_baby "
                + "FROM s_guest sg "
                + "LEFT JOIN s_member sm ON sg.m_id = sm.m_id "
                + "LEFT JOIN s_event se ON sg.e_no = se.e_no "
                + "LEFT JOIN s_party sp ON sg.m_id = sp.m_id "
                + "LEFT JOIN s_allergy sa ON sg.m_id = sa.m_id "
                + "WHERE se.m_id = ? AND sg.e_no = ?";

        try {
            con = dbManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, m_id);
            pstmt.setString(2, e_no);
            rs = pstmt.executeQuery();

            invitationsYes = new ArrayList<>();
            invitationsYesMale = new ArrayList<>();
            invitationsYesFemale = new ArrayList<>();
            invitationsNo = new ArrayList<>();
            invitationsNoMale = new ArrayList<>();
            invitationsNoFemale = new ArrayList<>();
            InvitationDTO i = null;

            while (rs.next()) {
                int eventNo = rs.getInt("e_no");
                String memberId = rs.getString("m_id");
                String mName = rs.getString("m_name");
                String mPhone = rs.getString("m_phone");
                String mEmail = rs.getString("m_email");

                String gAttend = rs.getString("g_attend");
                String gGuestType = rs.getString("g_guest_type");
                String gMessage = rs.getString("g_message");
                String gRelation = rs.getString("g_relation");

                String allergy = rs.getString("allergy");

                int pAdult = rs.getInt("p_adult");
                int pChild = rs.getInt("p_child");
                int pBaby = rs.getInt("p_baby");

                i = new InvitationDTO(eventNo, memberId, mName, mPhone, mEmail, gAttend,
                        gGuestType, gMessage, gRelation, allergy, pAdult, pChild, pBaby);

                if ("yes".equalsIgnoreCase(gAttend)) {
                    invitationsYes.add(i);
                    if ("新郎".equalsIgnoreCase(gGuestType)) {
                        invitationsYesMale.add(i);
                    } else if ("新婦".equalsIgnoreCase(gGuestType)) {
                        invitationsYesFemale.add(i);
                    }
                } else if ("no".equalsIgnoreCase(gAttend)) {
                    invitationsNo.add(i);
                    if ("新郎".equalsIgnoreCase(gGuestType)) {
                        invitationsNoMale.add(i);
                    } else if ("新婦".equalsIgnoreCase(gGuestType)) {
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
            dbManager.close(con, pstmt, rs);
        }
    }

}
