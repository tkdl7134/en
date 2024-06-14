package com.enmusubi.mytemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.enmusubi.main.DBManager;

public class TemplateDAO {
    private static final TemplateDAO TDAO = new TemplateDAO();

    public static TemplateDAO getIdao() {
        return TDAO;
    }

    private TemplateDAO() {
        // 기본 생성자
    }

    public List<TemplateDTO> getTemplateDetails(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<TemplateDTO> templates = new ArrayList<>();

        String sql = 
                "SELECT se.e_no, swi.w_groom, swi.w_bride, swi.w_img, sr.r_no, sr.r_time, st.t_pk, st.t_preview, st.t_template " +
                "FROM S_EVENT se " +
                "LEFT OUTER JOIN S_WEDDING_INFO swi ON se.e_no = swi.e_no " + 
                "LEFT OUTER JOIN S_RECEPTION sr ON se.e_no = sr.e_no " + 
                "LEFT OUTER JOIN S_TEMPLATE st ON se.e_no = st.t_e_no " + 
                "WHERE st.t_pk = '1' AND se.e_no = '1'";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int e_no = rs.getInt("e_no");
                String w_groom = rs.getString("w_groom");
                String w_bride = rs.getString("w_bride");
                String w_img = rs.getString("w_img");
                int r_no = rs.getInt("r_no");
                String r_time = rs.getString("r_time");
                int t_pk = rs.getInt("t_pk");
                String t_preview = rs.getString("t_preview");
                String t_template = rs.getString("t_template");

                TemplateDTO template = new TemplateDTO(e_no, w_groom, w_bride, w_img, r_no, r_time, t_pk, t_preview, t_template);
                templates.add(template);
            }

            request.setAttribute("templates", templates);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
        return templates;
    }
}
