package com.enmusubi.invitation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import com.enmusubi.main.DBManager;

public class InvitationDAO {
    public static ArrayList<InvitationDTO> invitations;

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

        String sql = "SELECT * " +
                     "FROM S_GUEST sg " +
                     "LEFT OUTER JOIN S_MEMBER sm ON sg.M_ID = sm.M_ID " +
                     "LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO " +
                     "LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID = sa.M_ID " +
                     "LEFT OUTER JOIN S_ALLERGY sa2 ON sm.M_ID = sa2.M_ID " +
                     "LEFT OUTER JOIN S_WEDDING_INFO swi ON se.E_NO = swi.E_NO " +
                     "WHERE se.M_ID = 'testuser' AND sg.E_NO = '1'";
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            invitations = new ArrayList<>();
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
                String g_age_type = rs.getString("g_age_type");
                String allergy = rs.getString("allergy");
                
                i = new InvitationDTO();
                
                i.setE_no(e_no);
                
                i.setW_groom(w_groom);
                i.setW_bride(w_bride);
                i.setW_img(w_img);
                
                i.setM_id(m_id);
                i.setM_name(m_name);
                i.setM_name_kana(m_name_kana);
                i.setM_name_rome(m_name_rome);
                i.setM_phone(m_phone);
                i.setM_email(m_email);
                
                i.setG_attend(g_attend);
                i.setG_guest_type(g_guest_type);
                i.setG_age_type(g_age_type);
                
                i.setAllergy(allergy);
                invitations.add(i);
            }

            request.setAttribute("invitations", invitations);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }
}
