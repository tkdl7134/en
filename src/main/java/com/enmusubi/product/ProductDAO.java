package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;


public class ProductDAO {
	
	private static ArrayList<ProductDTO> products;

	public static void getAllTemplate(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from s_template";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			products = new ArrayList<ProductDTO>();
			ProductDTO p = null;
			while (rs.next()) {
				p = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				products.add(p);
				System.out.println(rs.getInt(1));
			}
			request.setAttribute("products", products);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SERVER ERROR - get all template");
		}
		
	}

}
