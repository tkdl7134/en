package com.enmusubi.myPage.statistics;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import com.enmusubi.finance.funding.FundListDTO;
import com.enmusubi.main.DBManager;
import com.enmusubi.member.MemberDTO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import oracle.net.aso.f;

public class StatisticsDAO {

	public static JsonArray getPrice(HttpServletRequest request) {
			// 날짜 2개 사이의 금액 받는 메서드
		
		String startDate = request.getParameter("startDate");
	    String endDate = request.getParameter("endDate");
	    String e_no = request.getParameter("eno");
	    String wl_no= request.getParameter("wlno");
	    System.out.println(startDate);
	    System.out.println(endDate);
	    System.out.println(e_no);
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    DBManager dbManager = DBManager.getInstance();
	    JsonArray jsonArray = new JsonArray();
	    String sql =  "select p_date,(select sum(p_price) total_price from s_pay WHERE p_date BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(? || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS') and e_no=? and p_type='fund' and wl_no=?)total_price from s_pay where (p_date BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')) and e_no=? and p_type='fund' and wl_no=? and rownum <2";		
	    try {
	        con = dbManager.connect();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, startDate);
	        pstmt.setString(2, endDate);
	        pstmt.setString(3, e_no);
	        pstmt.setString(4, wl_no);
	        pstmt.setString(5, startDate);
	        pstmt.setString(6, endDate);
	        pstmt.setString(7, e_no);
	        pstmt.setString(8, wl_no);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            JsonObject jsonObject = new JsonObject();
	            // 여기서 rs.getDate()로 날짜를 가져오고 jsonObject에 추가
	            jsonObject.addProperty("date", rs.getString("p_date"));
	            jsonObject.addProperty("total_price", rs.getDouble("total_price"));
	            jsonArray.add(jsonObject);
	        }
	        
	        Gson gson = new Gson();
	        String jsonResponse = gson.toJson(jsonArray);
	        System.out.println(jsonResponse);
	     String product=   request.getParameter("product");
	     System.out.println(product);
	     request.setAttribute("product", product);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        dbManager.close(con, pstmt, rs);
	    }
	    return jsonArray;
	}

	public static void getProductRanking(HttpServletRequest request) {
		
			
		
		
		// ranking 구하는 메서드
		String wl_no_param = request.getParameter("wlno");
		ArrayList<FundListDTO> flists = (ArrayList<FundListDTO>) request.getAttribute("list");
		String e_no = null;
		String wl_product = null;
		String wl_no = null;
		
		if (flists != null && wl_no_param != null) {
		    for (FundListDTO fldto : flists) {
		        // e_no_param과 현재 객체의 e_no를 비교합니다.
		        if (wl_no_param.equals(fldto.getWl_no())) {
		             e_no = fldto.getE_no();
		             wl_product = fldto.getWl_product();
		             wl_no = fldto.getWl_no();

		            // wl_no, wl_product 값을 출력합니다.
		            System.out.println("e_no: " + e_no);
		            System.out.println("wl_product: " + wl_product);
		            System.out.println(wl_no);
		        }
		    }
		} else {
		    if (flists == null) {
		        System.out.println("No list attribute found in the request.");
		    }
		    if (wl_no_param == null) {
		        System.out.println("No wl_no parameter found in the request.");
		    }
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
		
		
		String sql = " SELECT wl_no, total_price, rank_of_total_price\r\n"
				+ "FROM (\r\n"
				+ "    SELECT wl_no,\r\n"
				+ "           total_price,\r\n"
				+ "           RANK() OVER (ORDER BY total_price DESC) AS rank_of_total_price\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT wl_no,\r\n"
				+ "               SUM(p_price) AS total_price\r\n"
				+ "        FROM s_pay\r\n"
				+ "        WHERE p_type = 'fund' AND e_no = ?\r\n"
				+ "        GROUP BY wl_no\r\n"
				+ "    ) subquery\r\n"
				+ ") ranked_subquery\r\n"
				+ "WHERE wl_no = ?";
		
		String sql2 = "select wl_price from s_wishlist where wl_product=?";
		try {
			
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, e_no);
			pstmt.setString(2, wl_no);
			rs= pstmt.executeQuery();
			String rank = null;
			int price = 0;
			int totalPrice = 0;
			
			if(rs.next()) {
			
				
				rank = rs.getString("rank_of_total_price");
				totalPrice = rs.getInt("total_price");
				
				rs.close();
				pstmt.close();
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, wl_product);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				price = rs.getInt("wl_price");
			}
			
			}
			System.out.println(rank);
			System.out.println(price);
			System.out.println(totalPrice);
			int leftPrice = (int)(((double)(price - totalPrice) / price) * 100);
			System.out.println("leftprice = " + leftPrice);
			String priceStatement = "✿目標金額まで後"+leftPrice+"％です✿";
			if (leftPrice < 0) {
				priceStatement = "✿目標金額に達成しました✿";
			}
			System.out.println(priceStatement);
			request.setAttribute("rank", rank);
			request.setAttribute("priceStatement", priceStatement);
			request.setAttribute("product", wl_product);
			request.setAttribute("wlno", wl_no);
			request.setAttribute("eno", e_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
		}
		
		
		
		
		
		
		
	}

	public static void getFundData(HttpServletRequest request, HttpServletResponse response) {
			
		String wl_no_param = request.getParameter("wlno");
		ArrayList<FundListDTO> flists = (ArrayList<FundListDTO>) request.getAttribute("list");
		String wl_no = null;
		String wl_product = null;
		String e_no = null;
		if (flists != null && wl_no_param != null) {
		    for (FundListDTO fldto : flists) {
		        // e_no_param과 현재 객체의 e_no를 비교합니다.
		        if (wl_no_param.equals(fldto.getWl_no())) {
		             wl_no = fldto.getWl_no();
		             wl_product = fldto.getWl_product();
		             e_no = fldto.getE_no();
		            // wl_no, wl_product 값을 출력합니다.
		            System.out.println("wl_no: " + wl_no);
		            System.out.println("e_no: " + e_no);
		        }
		    }
		} else {
		    if (flists == null) {
		        System.out.println("No list attribute found in the request.");
		    }
		    if (wl_no_param == null) {
		        System.out.println("No wl_no parameter found in the request.");
		    }
		}
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String order = "M";
		String orderParam = request.getParameter("order");
		System.out.println(request.getParameter("order"));
		String sql = null;
		if (orderParam != null && orderParam.equals("D")) {
			order = "D";
		}
		
		
		if (order.equals("M")) {
			sql = "SELECT s_pay.p_price, s_pay.p_date, s_member.m_name\r\n"
					+ "FROM s_pay\r\n"
					+ "INNER JOIN s_member ON s_pay.m_id = s_member.m_id where wl_no=? and e_no=? and p_type='fund' order by p_price desc";
			
		}else if (order.equals("D")) {
			sql = "SELECT s_pay.p_price, s_pay.p_date, s_member.m_name\r\n"
					+ "FROM s_pay\r\n"
					+ "INNER JOIN s_member ON s_pay.m_id = s_member.m_id where wl_no=? and e_no=?　and p_type='fund' order by p_date desc";
			
		}
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wl_no);
			pstmt.setString(2, e_no);
			rs = pstmt.executeQuery();
			ArrayList<payDTO> fundedlists = new ArrayList<payDTO>();
			
			while (rs.next()) {
				payDTO fundlist = new payDTO();
				System.out.println(rs.getInt("p_price"));
				System.out.println(rs.getDate("p_date"));
				System.out.println(rs.getString("m_name"));
				
				
			fundlist.setP_price(rs.getInt("p_price"));	
			fundlist.setP_date(rs.getDate("p_date"));	
			fundlist.setM_name(rs.getString("m_name"));
			
			
			fundedlists.add(fundlist);
			
			}
			System.out.println(fundedlists);
			request.setAttribute("fund", fundedlists);
			request.setAttribute("eno", e_no);
			
			// 날짜 구하는 기능
			   LocalDateTime currentDateTime = LocalDateTime.now();
		        // 포맷 지정
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        // 포맷을 적용하여 문자열로 변환
		        String formattedDateTime = currentDateTime.format(formatter);
		        System.out.println("Formatted Date: " + formattedDateTime);
		        request.setAttribute("todayDate", formattedDateTime);

		        // 7일 전의 날짜 계산
		        LocalDateTime sevenDaysAgoDateTime = currentDateTime.minusDays(7);

		        // 포맷 지정
		        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		        // 포맷을 적용하여 문자열로 변환
		        String formattedDateTime2 = sevenDaysAgoDateTime.format(formatter);

		        System.out.println("7 days ago: " + formattedDateTime2);
		        request.setAttribute("lastWeekDate", formattedDateTime2);
					
		        if (orderParam!=null&&orderParam.equals("M")||orderParam.equals("D")) {
		        	
		        	Gson gson = new GsonBuilder().disableHtmlEscaping().create();
					String json = gson.toJson(fundedlists);
					System.out.println(json);
					response.getWriter().print(json);
		        }else {
		        	
		        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
			
		}
		
		
		
	}

	private static void FundToJson(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		  Gson gson = new Gson();

		    // fund 속성으로부터 ArrayList<payDTO> 객체를 가져옵니다.
		    @SuppressWarnings("unchecked")
		    ArrayList<payDTO> fundedlists = (ArrayList<payDTO>) request.getAttribute("fund");

		    // payDTO 객체들을 JSON으로 변환하는 과정
		    ArrayList<String> jsonList = new ArrayList<>();
		    for (payDTO fundlist : fundedlists) {
		        String json = gson.toJson(fundlist); // 각 payDTO 객체를 JSON 문자열로 변환합니다.
		        jsonList.add(json); // 변환된 JSON 문자열을 리스트에 추가합니다.
		    }

		    // 전체 리스트를 JSON 배열 형태의 문자열로 변환합니다.
		    String jsonArray = gson.toJson(fundedlists);
		    System.out.println("this>>"+jsonArray);
		    response.getWriter().print(jsonArray);
		    // 변환된 JSON 배열을 "fund"라는 이름의 속성으로 HttpServletRequest에 설정합니다.
		    //request.setAttribute("fund", jsonArray);

		    //System.out.println(jsonArray); // JSON 출력 (테스트 용도)
		
		
		
	}

	public static void getAjaxData(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT wl_no,wl_price,WL_PRODUCT,E_NO ,(SELECT sum(p_price) tot FROM s_pay sp WHERE P_TYPE = 'fund' AND WL_NO = sw.WL_NO) payed, FLOOR(((SELECT sum(p_price) tot FROM s_pay sp WHERE P_TYPE = 'fund' AND WL_NO = sw.WL_NO)/WL_PRICE)*100) percent  FROM S_WISHLIST sw WHERE e_NO =? ORDER BY WL_PRICE desc";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			// 이벤트 파라미터 받게되면 활성화
			System.out.println(request.getParameter("eno"));
			pstmt.setString(1, request.getParameter("eno"));
			//pstmt.setString(1, "1");
			rs = pstmt.executeQuery();
			ArrayList<FundListDTO> flists = new ArrayList<FundListDTO>();
			while (rs.next()) {
				FundListDTO fldto = new FundListDTO();
				fldto.setWl_no(rs.getString("wl_no"));
				fldto.setWl_product(rs.getString("wl_product"));
				fldto.setWl_price(rs.getString("wl_price"));
				fldto.setE_no(rs.getString("e_no"));
				fldto.setPayed(rs.getString("payed"));
				fldto.setPercent(rs.getString("percent"));
				flists.add(fldto);
			}
			System.out.println(flists);
			request.setAttribute("list", flists);
			request.setAttribute("eno" , request.getParameter("eno"));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, rs);
		}

	}

	public static void getSentMoney(HttpServletRequest request, HttpServletResponse response) {

		// event no 가져오기
		int eventNo = Integer.parseInt(request.getParameter("eno")) ;
		System.out.println(eventNo);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "SELECT s_member.m_name, s_guest.g_relation , s_pay.p_price\r\n"
				+ "FROM s_guest\r\n"
				+ "JOIN s_member ON s_guest.m_id = s_member.m_id\r\n"
				+ "JOIN s_pay ON s_guest.m_id = s_pay.m_id\r\n"
				+ "WHERE s_guest.e_no = ?\r\n"
				+ "  AND s_pay.p_type = 'send'";
		
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eventNo);
			rs = pstmt.executeQuery();
			
			ArrayList<payDTO> sendlists = new ArrayList<payDTO>();
			
			while (rs.next()) {
				payDTO sendlist = new payDTO();
				sendlist.setM_name(rs.getString("m_name"));
				sendlist.setG_relation(rs.getString("g_relation"));
				sendlist.setE_no(eventNo);
				sendlist.setP_price(rs.getInt("p_price"));
				sendlists.add(sendlist);
				
				
				
			}
			Gson gson = new Gson();
	        String json = gson.toJson(sendlists);

	        // JSON을 HttpServletResponse에 작성
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
			System.out.println(sendlists);
			request.setAttribute("sendlist", sendlists);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
			
		}
		
		
	}

	public static void getSentMoneyData(HttpServletRequest request, HttpServletResponse response) {

		
		int eno = Integer.parseInt(request.getParameter("eno")) ;
		System.out.println(eno);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String order = "N";
		String orderParam = request.getParameter("order");
		System.out.println(request.getParameter("order"));
		String sql = null;
		if (orderParam != null && orderParam.equals("D")) {
			order = "D";
		}else if (orderParam != null && orderParam.equals("M")) {
			order = "M";
		}
		
		
		if (order.equals("M")) {
			sql = "SELECT s_member.m_name, s_pay.p_date , s_pay.p_price\r\n"
					+ "				FROM s_guest\r\n"
					+ "				JOIN s_member ON s_guest.m_id = s_member.m_id\r\n"
					+ "				JOIN s_pay ON s_guest.m_id = s_pay.m_id\r\n"
					+ "				WHERE s_guest.e_no = ?\r\n"
					+ "				  AND s_pay.p_type = 'send'order by p_price desc";
			
		}else if (order.equals("D")) {
			sql = "SELECT s_member.m_name, s_pay.p_date , s_pay.p_price\r\n"
					+ "				FROM s_guest\r\n"
					+ "				JOIN s_member ON s_guest.m_id = s_member.m_id\r\n"
					+ "				JOIN s_pay ON s_guest.m_id = s_pay.m_id\r\n"
					+ "				WHERE s_guest.e_no = ?\r\n"
					+ "				  AND s_pay.p_type = 'send'order by p_date desc";
			
		}else if (order.equals("N")) {
			sql = "SELECT s_member.m_name, s_pay.p_date , s_pay.p_price\r\n"
					+ "				FROM s_guest\r\n"
					+ "				JOIN s_member ON s_guest.m_id = s_member.m_id\r\n"
					+ "				JOIN s_pay ON s_guest.m_id = s_pay.m_id\r\n"
					+ "				WHERE s_guest.e_no = ?\r\n"
					+ "				  AND s_pay.p_type = 'send' order by m_name desc";
		}
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eno);
			rs = pstmt.executeQuery();
			ArrayList<payDTO> fundedlists = new ArrayList<payDTO>();
			
			while (rs.next()) {
				payDTO fundlist = new payDTO();
				System.out.println(rs.getInt("p_price"));
				System.out.println(rs.getDate("p_date"));
				System.out.println(rs.getString("m_name"));
				System.out.println(eno);
				
			fundlist.setP_price(rs.getInt("p_price"));	
			fundlist.setP_date(rs.getDate("p_date"));	
			fundlist.setM_name(rs.getString("m_name"));
			fundlist.setE_no(eno);
			
			fundedlists.add(fundlist);
			
			}
			System.out.println(fundedlists);
			request.setAttribute("fund", fundedlists);
			request.setAttribute("eno", eno);
			
			// 날짜 구하는 기능
			   LocalDateTime currentDateTime = LocalDateTime.now();
		        // 포맷 지정
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        // 포맷을 적용하여 문자열로 변환
		        String formattedDateTime = currentDateTime.format(formatter);
		        System.out.println("Formatted Date: " + formattedDateTime);
		        request.setAttribute("todayDate", formattedDateTime);

		        // 7일 전의 날짜 계산
		        LocalDateTime sevenDaysAgoDateTime = currentDateTime.minusDays(7);

		        // 포맷 지정
		        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		        // 포맷을 적용하여 문자열로 변환
		        String formattedDateTime2 = sevenDaysAgoDateTime.format(formatter);

		        System.out.println("7 days ago: " + formattedDateTime2);
		        request.setAttribute("lastWeekDate", formattedDateTime2);
					
		        if (orderParam!=null&&orderParam.equals("M")||orderParam.equals("D")||orderParam.equals("N")) {
		        	
		        	Gson gson = new GsonBuilder().disableHtmlEscaping().create();
					String json = gson.toJson(fundedlists);
					System.out.println(json);
					response.getWriter().print(json);
		        }else {
		        	
		        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
			
		}
		
	}

	public static void getAmazonLink(HttpServletRequest request) {
		
		// eno 든 id든 받기
		// m_id를 session으로 가져오나? Https Session session = request.getSession()
				
		// session.getAttribute("m_id")
	int eno =Integer.parseInt(request.getParameter ("eno"));
	//	int eno = 1;
		System.out.println(eno);
		
		
		
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		String sql = "select e_alink from s_event where e_no=?";
		
		try {
		con = dbManager.connect();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, eno);
		rs = pstmt.executeQuery();
		payDTO amazon = new payDTO();
		if (rs.next()) {
			System.out.println(rs.getString("e_alink"));
		}
		request.setAttribute("amazon",rs.getString("e_alink") );
		request.setAttribute("eno", eno);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbManager.close(con, pstmt, rs);
		}
		
		
	}

	public static void getTemplatePrev(HttpServletRequest request, int page, int itemsPerPage) {

		// id 받기
		// m_id를 session으로 가져오나? Https Session session = request.getSession()
		// session.getAttribute("m_id")
	HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
	//	String id = "testuser";
		System.out.println(id);
		int offset = (page - 1) * itemsPerPage;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();

		// SQL 쿼리: 총 항목 수를 계산
		String countSql = "SELECT COUNT(*) AS total FROM s_member sm \r\n"
				+ "                 JOIN s_event se ON sm.m_id = se.m_id \r\n"
				+ "                 JOIN s_wedding_info swi ON se.e_no = swi.e_no \r\n"
				+ "                 JOIN s_reception sr ON swi.e_no = sr.e_no \r\n"
				+ "                 JOIN s_template st ON swi.t_pk = st.t_pk \r\n"
				+ "                 WHERE sm.m_id = ?";

		// SQL 쿼리: 페이징 처리된 항목 가져오기
		String sql = "SELECT st.t_preview, sm.m_name, sr.r_time, sr.r_addr, se.e_no\r\n"
				+ "FROM s_member sm\r\n"
				+ "JOIN s_event se ON sm.m_id = se.m_id\r\n"
				+ "JOIN s_wedding_info swi ON se.e_no = swi.e_no\r\n"
				+ "JOIN s_reception sr ON swi.e_no = sr.e_no\r\n"
				+ "JOIN s_template st ON swi.t_pk = st.t_pk\r\n"
				+ "WHERE sm.m_id = ?\r\n"
				+ "order by sr.r_time desc\r\n"
				+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

		try {
		    con = dbManager.connect();

		    // 총 항목 수 계산
		    pstmt = con.prepareStatement(countSql);
		    pstmt.setString(1, id);
		    rs = pstmt.executeQuery();
		    
		    int totalItems = 0;
		    if (rs.next()) {
		        totalItems = rs.getInt("total");
		        
		    }
		    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		    request.setAttribute("totalPage", totalPages);

		    // 페이징 처리된 항목 가져오기
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, id);
		    pstmt.setInt(2, offset);
		    pstmt.setInt(3, itemsPerPage);
		    rs = pstmt.executeQuery();
		    
		    ArrayList<payDTO> previews = new ArrayList<payDTO>();
		    while (rs.next()) {
		        payDTO preview = new payDTO();
		        System.out.println(rs.getString("t_preview"));
		        preview.setT_preview(rs.getString("t_preview"));
		        Date sqlDate = rs.getDate("r_time"); // Assuming rs is your ResultSet

		     // 포맷할 형식 지정
		     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日HH時mm分");

		     // java.sql.Date를 java.util.Date로 변환 (형식 변환은 여기서 하지 않음)
		     java.util.Date utilDate = new java.util.Date(sqlDate.getTime());

		     // 포맷팅된 문자열 얻기
		     String formattedDateStr = dateFormat.format(utilDate);
		       
		     
		     preview.setR_time(formattedDateStr);
		        preview.setR_addr(rs.getString("r_addr"));
		        preview.setM_name(rs.getString("m_name"));
		        previews.add(preview);
		    }
		    System.out.println(previews);
		    System.out.println(totalPages);
		    System.out.println(page);
		    
		    request.setAttribute("previews", previews);
		    
		    request.setAttribute("totalPages", totalPages);
		    request.setAttribute("currentPage", page);
		    System.out.println(totalPages);
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    dbManager.close(con, pstmt, rs);
		}
	
}
	
	public static void selectFundList(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "WITH wish_fund AS (SELECT wl_no, wl_price, wl_product, e_no, (SELECT SUM(p_price) FROM s_pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) AS payed, FLOOR((SELECT SUM(p_price) FROM s_pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) / wl_price * 100) AS percent FROM s_wishlist sw WHERE e_no = ?)"
				+ " SELECT wl_no, wl_price, wl_product, e_no, payed, COALESCE(percent, 0) AS percent FROM wish_fund ORDER BY percent DESC";
		DBManager dbManager = DBManager.getInstance();
		try {
			con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			String eno = request.getParameter("eno");
			pstmt.setString(1, eno);
			rs = pstmt.executeQuery();
			ArrayList<FundListDTO> flists = new ArrayList<FundListDTO>();
			while (rs.next()) {
				FundListDTO fldto = new FundListDTO();
				fldto.setWl_no(rs.getString("wl_no"));
				fldto.setWl_product(rs.getString("wl_product"));
				fldto.setWl_price(rs.getString("wl_price"));
				fldto.setE_no(rs.getString("e_no"));
				fldto.setPayed(rs.getString("payed"));
				fldto.setPercent(rs.getString("percent"));
				flists.add(fldto);
			}
			System.out.println(flists);
			Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			String json = gson.toJson(flists);
			System.out.println(json);
			response.getWriter().print(json);
			request.setAttribute("list", flists);
			request.setAttribute("jsonList", json);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("server err...");
		} finally {
			dbManager.close(con, pstmt, rs);
		}

	}
	
	
}
