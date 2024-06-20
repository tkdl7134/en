package com.enmusubi.finance.funding;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enmusubi.main.Interceptor;

@WebServlet("/FundC")
public class FundC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            if(Interceptor.LoginInterceptor(request, response)) {
                request.setAttribute("page", "fund/funding.jsp");
                request.getRequestDispatcher("finance/index.jsp").forward(request, response);
            }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=UTF-8");
        fundDAO.selectFundList(request, response);
    }

}