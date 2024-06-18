package com.enmusubi.mytemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import com.enmusubi.main.DBManager;

public class ProductDAO {

    private static ArrayList<ProductDTO> products;

    // 모든 템플릿을 가져오는 메서드
    public static void getAllTemplate(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM S_EVENT se LEFT OUTER JOIN S_TEMPLATE st ON se.E_NO = st.E_NO WHERE se.M_ID ='testuser'";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            products = new ArrayList<ProductDTO>();
            while (rs.next()) {
            	String m_id = rs.getString("m_id");
                int e_no = rs.getInt("e_no");
                int t_pk = rs.getInt("t_pk");
                String t_title = rs.getString("t_title");
                String t_preview = rs.getString("t_preview");
                String t_example = rs.getString("t_example");
                String t_template = rs.getString("t_template");

                System.out.println("Preview URL: " + t_preview); // 로그 출력

                ProductDTO p = new ProductDTO(m_id, e_no, t_pk, t_title, t_preview, t_example, t_template);
                products.add(p);
            }
            System.out.println("hererVVVV");
            System.out.println(products);
            request.setAttribute("products", products);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("SERVER ERROR - get all template");
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    // 페이지네이션을 사용하여 템플릿을 가져오는 메서드
    public static void getTemplates(HttpServletRequest request, int page, int itemsPerPage) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int offset = (page - 1) * itemsPerPage;
        int end = page * itemsPerPage;

        String sql = "SELECT * FROM ( "
                   + "SELECT st.e_no, st.t_pk, st.t_title, st.t_preview, st.t_example, st.t_template, se.m_id, "
                   + "ROW_NUMBER() OVER (ORDER BY st.t_pk) AS rnum "
                   + "FROM s_template st "
                   + "JOIN s_event se ON st.e_no = se.e_no "
                   + "WHERE se.m_id = 'testuser' AND st.e_no = 1 "
                   + ") WHERE rnum BETWEEN ? AND ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, offset);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            products = new ArrayList<ProductDTO>();
            while (rs.next()) {
            	String m_id = rs.getString("m_id");
                int e_no = rs.getInt("e_no");
                int t_pk = rs.getInt("t_pk");
                String t_title = rs.getString("t_title");
                String t_preview = rs.getString("t_preview");
                String t_example = rs.getString("t_example");
                String t_template = rs.getString("t_template");

                System.out.println("Preview URL: " + t_preview); // 로그 출력

                ProductDTO p = new ProductDTO(m_id, e_no, t_pk, t_title, t_preview, t_example, t_template);
                products.add(p);
            }
            request.setAttribute("products", products);

            // 페이지네이션을 위한 총 항목 수 가져오기
            sql = "SELECT COUNT(*) "
                + "FROM s_template st "
                + "JOIN s_event se ON st.e_no = se.e_no "
                + "WHERE se.m_id = 'testuser' AND st.e_no = 1";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int totalItems = rs.getInt(1);
                int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", page);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("SERVER ERROR - get templates with pagination");
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }
}
