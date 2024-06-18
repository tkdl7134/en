package com.enmusubi.mytemplate;

public class ProductDTO {

    private int e_no;
    private int t_pk;
    private String m_id; // m_id를 int에서 String으로 변경
    
    private String t_title;
    private String t_preview;
    private String t_example;
    private String t_template;

    public ProductDTO() {
        // Default constructor
    }

    public ProductDTO(String m_id, int e_no, int t_pk, String t_title, String t_preview, String t_example, String t_template) {
        super();
        this.m_id = m_id;
        this.e_no = e_no;
        this.t_pk = t_pk;
        this.t_title = t_title;
        this.t_preview = t_preview;
        this.t_example = t_example;
        this.t_template = t_template;
    }

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public int getE_no() {
        return e_no;
    }

    public void setE_no(int e_no) {
        this.e_no = e_no;
    }

    public int getT_pk() {
        return t_pk;
    }

    public void setT_pk(int t_pk) {
        this.t_pk = t_pk;
    }

    public String getT_title() {
        return t_title;
    }

    public void setT_title(String t_title) {
        this.t_title = t_title;
    }

    public String getT_preview() {
        return t_preview;
    }

    public void setT_preview(String t_preview) {
        this.t_preview = t_preview;
    }

    public String getT_example() {
        return t_example;
    }

    public void setT_example(String t_example) {
        this.t_example = t_example;
    }

    public String getT_template() {
        return t_template;
    }

    public void setT_template(String t_template) {
        this.t_template = t_template;
    }

    @Override
    public String toString() {
        return "ProductDTO [m_id=" + m_id + ", e_no=" + e_no + ", t_pk=" + t_pk + ", t_title=" + t_title
                + ", t_preview=" + t_preview + ", t_example=" + t_example + ", t_template=" + t_template + "]";
    }
}
