package com.enmusubi.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FundingSettingC")
public class FundingSettingC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		FundingSettingDAO.getfundingInfo(request);
		request.getRequestDispatcher("product/jsp/fundingSetting.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (true ) { //no가 기존에 없을 때
			FundingSettingDAO.regFundingInfo(request);
		} else {
			FundingSettingDAO.updateFundingInfo(request);
		}
		
		
	}

}
