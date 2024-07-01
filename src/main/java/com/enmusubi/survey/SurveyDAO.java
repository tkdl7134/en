package com.enmusubi.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.enmusubi.main.DBManager;

public class SurveyDAO {
	

    // 세션에서 로그인 방식을 기준으로 처리하는 메소드
    public static void processLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        // 다른 패키지에서 설정한 세션 값 가져오기 예시
        String loginType = (String) session.getAttribute("m_id");
        System.out.println(loginType);
        if (loginType != null && loginType.startsWith("LINE_")) {
            // "LINE_"으로 시작하는 경우, LINE 로그인 시
            request.setAttribute("loginType", "line");
            getMemberLine(request);
        } else {
            // 일반 회원 로그인
            request.setAttribute("loginType", "normal");
            getMemberNormal(request);
        }
        
    }

	// LINE 로그인 시 정보 추가 입력
	public static void lineUpdate(HttpServletRequest request) {
		System.out.println("라인없데이트 메소드");
	    Connection con = null;
	    PreparedStatement pstmtLineAddressUpdate = null;
	    PreparedStatement pstmtLineMemberUpdate = null;
	    DBManager dbManager = DBManager.getInstance();
	    
	    String sqlLineAddressUpdate = "INSERT INTO s_address (m_id, a_address, a_postcode) VALUES (?, ?, ?)";	    
	    String sqlLineMemberUpdate = "UPDATE s_member SET m_name=?, m_name_kana=?, m_name_rome=?, m_email=?, m_phone=? WHERE m_id=?";	    

	    
	    try {
	    	
	        con = dbManager.connect();
	        
	        HttpSession session = request.getSession();
	        String lineUserId = (String) session.getAttribute("m_id");
	        System.out.println("LINE 회원 로그인 세션 아이디는: " + lineUserId);
	        
	        // 라인 회원 개인정보 입력
	        pstmtLineMemberUpdate = con.prepareStatement(sqlLineMemberUpdate);

            
            System.out.println("한자값은: " + request.getParameter("name"));
            System.out.println("카타값은: " + request.getParameter("kata-name"));
            System.out.println("로마값은: " + request.getParameter("roma-name"));
            System.out.println("이메일: " + request.getParameter("email"));
            System.out.println("폰번: " + request.getParameter("phonenum"));
            System.out.println("주소번호: " + request.getParameter("postal-code"));
            System.out.println("주소: " + request.getParameter("address"));
            System.out.println("참석: " + request.getParameter("attendance"));
            System.out.println("어디 측: " + request.getParameter("couple"));
            System.out.println("알레르기 여부: " + request.getParameter("allergy"));
            System.out.println("메세지: " + request.getParameter("special-notes"));
            System.out.println("관계: " + request.getParameter("relation"));
            System.out.println("어른: " + request.getParameter("adult"));
            System.out.println("꼬마: " + request.getParameter("child"));
            System.out.println("애기: " + request.getParameter("baby"));
            System.out.println("알레르기 타입: " + request.getParameter("allergy-type"));
            
            String[] normalName = request.getParameterValues("name");
            String[] kataName = request.getParameterValues("kata-name");
            String[] romaName = request.getParameterValues("roma-name");
            
            for (String s : romaName) {
			System.out.println(s);
			}
            
            normalName = normalName != null ? normalName : new String[0];
            kataName = kataName != null ? kataName : new String[0];
            romaName = romaName != null ? romaName : new String[0];

            
            System.out.println(normalName);
            System.out.println(kataName);
            System.out.println(romaName);
            
            
            String normalNames = String.join(" ", normalName);
            String kataNames = String.join(" ", kataName);
            String romaNames = String.join(" ", romaName);

            pstmtLineMemberUpdate.setString(1, normalNames);
            pstmtLineMemberUpdate.setString(2, kataNames);
            pstmtLineMemberUpdate.setString(3, romaNames);
            pstmtLineMemberUpdate.setString(4, request.getParameter("email"));
            pstmtLineMemberUpdate.setString(5, request.getParameter("phonenum"));
            pstmtLineMemberUpdate.setString(6, lineUserId);

            if (pstmtLineMemberUpdate.executeUpdate() == 1) {
                System.out.println("개인정보 수정성공!!");
            }
	          
	        // 라인 회원은 주소가 입력되어 있지 않아 주소 입력 Insert 기능 추가
	        pstmtLineAddressUpdate = con.prepareStatement(sqlLineAddressUpdate);
	        
	        String postcode = request.getParameter("postal-code");
	        String[] address = request.getParameterValues("address");
	        String fulladdr = "";
	        
	        for (String s : address) {
	        	System.out.println(s);
	        	fulladdr += s + " ";
	        }
	        	        
	        pstmtLineAddressUpdate.setString(1, lineUserId);
	        pstmtLineAddressUpdate.setString(2, fulladdr);
	        pstmtLineAddressUpdate.setString(3, postcode);

	        
	        if (pstmtLineAddressUpdate.executeUpdate() == 1) {
	            System.out.println("주소정보 등록성공!!");
	        }
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        dbManager.close(con, pstmtLineAddressUpdate, null);
	        dbManager.close(con, pstmtLineMemberUpdate, null);
	    }
	}
		
	// 일반 회원 가입시 조건
	public static void getMemberNormal(HttpServletRequest request) {
		System.out.println("일반 회원 정보 받아오는 메소드");
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    PreparedStatement pstmtAddress = null;
	    DBManager dbManager = DBManager.getInstance();
	    ResultSet rs = null;
	    ResultSet rsAddress = null;
	    
	    String sql = "SELECT m_name, m_name_kana, m_name_rome, m_email, m_phone FROM s_member WHERE m_id = ?";
	    String sqlAddress = "SELECT a_address, a_postcode FROM s_address WHERE m_id = ?";
	    
	    try {
	        con = dbManager.connect();
	        
	        HttpSession session = request.getSession();
	        String normalUserId = (String) session.getAttribute("m_id");
	        System.out.println("일반 회원 로그인 세션입니다 아이디는: " + normalUserId);
	        // 추가적인 처리를 수행하세요
	    
	        
	        
	        // 일반회원 개인정보
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, normalUserId);
	        rs = pstmt.executeQuery();
	        TMemberDTO m = new TMemberDTO();
	        
	        
	        if (rs.next()) {
	            
	            String fullName = rs.getString(1);
	            String[] nameParts = fullName.split(" ");
	            if (nameParts.length >= 2) {
	                m.setM_first_name(nameParts[0]);
	                m.setM_last_name(nameParts[1]);
	            } else if (nameParts.length == 1) {
	                m.setM_first_name(nameParts[0]);
	                m.setM_last_name(""); // 또는 적절한 기본값 설정
	            } else {
	                m.setM_first_name(""); // 또는 적절한 기본값 설정
	                m.setM_last_name("");  // 또는 적절한 기본값 설정
	            }
	            
	            // m_name_kana 처리
	            String fullNameKana = rs.getString(2);
	            String[] nameParts1 = fullNameKana.split(" ");
	            if (nameParts1.length >= 2) {
	                m.setM_first_name_kana(nameParts1[0]);
	                m.setM_last_name_kana(nameParts1[1]);
	            } else if (nameParts1.length == 1) {
	                m.setM_first_name_kana(nameParts1[0]);
	                m.setM_last_name_kana(""); // 또는 적절한 기본값 설정
	            } else {
	                m.setM_first_name_kana(""); // 또는 적절한 기본값 설정
	                m.setM_last_name_kana("");  // 또는 적절한 기본값 설정
	            }
	            
	            // m_name_rome 처리
	            String fullNameRome = rs.getString(3);
	            String[] nameParts2 = fullNameRome.split(" ");
	            if (nameParts2.length >= 2) {
	            	m.setM_first_name_rome(nameParts2[0]);
	            	m.setM_last_name_rome(nameParts2[1]);
	            } else if (nameParts2.length == 1) {
	            	m.setM_first_name_rome(nameParts2[0]);
	            	m.setM_last_name_rome(""); // 또는 적절한 기본값 설정
	            } else {
	            	m.setM_first_name_rome(""); // 또는 적절한 기본값 설정
	            	m.setM_last_name_rome(""); // 또는 적절한 기본값 설정
	            	}

	            m.setM_email(rs.getString(4));
	            m.setM_phone(rs.getString(5));

	            	            
		        System.out.println(rs.getString(1));
		        System.out.println(rs.getString(2));
		        System.out.println(rs.getString(3));
		        System.out.println(rs.getString(4));
		        System.out.println(rs.getString(5));

	        }
	        
	        // 주소 정보 입력
	        pstmtAddress = con.prepareStatement(sqlAddress);
	        pstmtAddress.setString(1, normalUserId);
	        rsAddress = pstmtAddress.executeQuery();
	        if (rsAddress.next()) {
	            String fullAddress = rsAddress.getString(1);
	            String postcode = rsAddress.getString(2);
	            
	            m.setA_postcode(postcode);
	            
	            // 주소를 나누는 로직
	            String[] addressParts = fullAddress.split(" ", 3);
	            if (addressParts.length >= 3) {
	                m.setA_prefecture(addressParts[0]);
	                m.setA_city(addressParts[1]);
	                m.setA_address(addressParts[2]);
	            } else {
	                m.setA_prefecture("");
	                m.setA_city("");
	                m.setA_address(fullAddress); // 기본값으로 전체 주소 설정
	            }

	            System.out.println(rsAddress.getString(1));
	            System.out.println(rsAddress.getString(2));
	        }
	        
	        System.out.println(m);
	        request.setAttribute("members", m);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	    	dbManager.close(con, pstmtAddress, rsAddress);
	        dbManager.close(con, pstmt, rs);
	    }
	}
	
	// 라인 회원 가입시 조건
	public static void getMemberLine(HttpServletRequest request) {
		System.out.println("라인 회원 정보 받아오는 메소드");
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmtAddress = null;
		DBManager dbManager = DBManager.getInstance();
		ResultSet rs = null;
		ResultSet rsAddress = null;
		
		String sql = "SELECT m_name, m_name_kana, m_name_rome, m_email, m_phone FROM s_member WHERE m_id = ?";
		String sqlAddress = "SELECT a_address, a_postcode FROM s_address WHERE m_id = ?";
		
		try {
			con = dbManager.connect();
			
			HttpSession session = request.getSession();
			String normalUserId = (String) session.getAttribute("m_id");
			System.out.println("라인 회원 로그인 세션입니다 아이디는: " + normalUserId);
			// 추가적인 처리를 수행하세요
			
			
			
			// 일반회원 개인정보
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, normalUserId);
			rs = pstmt.executeQuery();
			TMemberDTO m = new TMemberDTO();
			
			
			if (rs.next()) {
				
				String fullName = rs.getString(1);
				String[] nameParts = fullName.split(" ");
				if (nameParts.length >= 2) {
					m.setM_first_name(nameParts[0]);
					m.setM_last_name(nameParts[1]);
				} else if (nameParts.length == 1) {
					m.setM_first_name(nameParts[0]);
					m.setM_last_name(""); // 또는 적절한 기본값 설정
				} else {
					m.setM_first_name(""); // 또는 적절한 기본값 설정
					m.setM_last_name("");  // 또는 적절한 기본값 설정
				}
				
				// m_name_kana 처리
				String fullNameKana = rs.getString(2);
				String[] nameParts1 = fullNameKana.split(" ");
				if (nameParts1.length >= 2) {
					m.setM_first_name_kana(nameParts1[0]);
					m.setM_last_name_kana(nameParts1[1]);
				} else if (nameParts1.length == 1) {
					m.setM_first_name_kana(nameParts1[0]);
					m.setM_last_name_kana(""); // 또는 적절한 기본값 설정
				} else {
					m.setM_first_name_kana(""); // 또는 적절한 기본값 설정
					m.setM_last_name_kana("");  // 또는 적절한 기본값 설정
				}
				
				// m_name_rome 처리
				String fullNameRome = rs.getString(3);
				String[] nameParts2 = fullNameRome.split(" ");
				if (nameParts2.length >= 2) {
					m.setM_first_name_rome(nameParts2[0]);
					m.setM_last_name_rome(nameParts2[1]);
				} else if (nameParts2.length == 1) {
					m.setM_first_name_rome(nameParts2[0]);
					m.setM_last_name_rome(""); // 또는 적절한 기본값 설정
				} else {
					m.setM_first_name_rome(""); // 또는 적절한 기본값 설정
					m.setM_last_name_rome(""); // 또는 적절한 기본값 설정
				}
				
				m.setM_email(rs.getString(4));
				m.setM_phone(rs.getString(5));
				
				
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
				
			}
			
			// 주소 정보 입력
			pstmtAddress = con.prepareStatement(sqlAddress);
			pstmtAddress.setString(1, normalUserId);
			rsAddress = pstmtAddress.executeQuery();
			if (rsAddress.next()) {
				String fullAddress = rsAddress.getString(1);
				String postcode = rsAddress.getString(2);
				
				m.setA_postcode(postcode);
				
				// 주소를 나누는 로직
				String[] addressParts = fullAddress.split(" ", 3);
				if (addressParts.length >= 3) {
					m.setA_prefecture(addressParts[0]);
					m.setA_city(addressParts[1]);
					m.setA_address(addressParts[2]);
				} else {
					m.setA_prefecture("");
					m.setA_city("");
					m.setA_address(fullAddress); // 기본값으로 전체 주소 설정
				}
				
				System.out.println(rsAddress.getString(1));
				System.out.println(rsAddress.getString(2));
			}
			
			System.out.println(m);
			request.setAttribute("members", m);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbManager.close(con, pstmtAddress, rsAddress);
			dbManager.close(con, pstmt, rs);
		}
	}

	// 그 외 설문조사지 입력
	public static void insertSurvey(HttpServletRequest request) {
	
	Connection con = null;
	PreparedStatement pstmtGuest = null; 
	PreparedStatement pstmtAllergy = null;
	PreparedStatement pstmtParty = null;

	DBManager dbManager = DBManager.getInstance();
	String sqlGuest = "INSERT INTO s_Guest (e_no, m_id, g_attend, g_guest_type, g_allergy_or, g_message, g_relation)"
			+ " VALUES (?, ?, ?, ?, ? ,? ,?)";
	String sqlAllergy = "INSERT INTO s_Allergy (e_no, m_id, allergy) VALUES (?, ?, ?)";
	String sqlParty = "INSERT INTO s_Party (e_no, m_id, p_adult, p_child, p_baby) VALUES (?, ?, ?, ?, ?)";
	
	try {
		
        HttpSession session = request.getSession();
        String Id = (String) session.getAttribute("m_id");
        String eno = (String) session.getAttribute("eno");
        System.out.println("현재 아이디는: " + Id);
        System.out.println("현재 아이디는: " + eno);
        String eventNumber = "";
		con = dbManager.connect();

        // e_no 가져오기

        if (!eno.equals(null)) {
        	eventNumber = eno;
        	request.setAttribute("e_no", eventNumber);
        }
        
        else {
            throw new SQLException("No e_no found for m_id: " + Id);
        }
		
       System.out.println("이벤트 넘버는: " + eventNumber);
		
		
		// 일반 정보 입력
		// 택스쳐 추가조정 (띄어쓰기)
		String note = request.getParameter("special-notes");
		note = note.replace("\r\n", "<br>");
		
		// 회원 개인정보 입력
		pstmtGuest = con.prepareStatement(sqlGuest);
		pstmtGuest.setString(1, eventNumber);
		pstmtGuest.setString(2, Id);
		pstmtGuest.setString(3, request.getParameter("attendance"));
		pstmtGuest.setString(4, request.getParameter("couple"));
		pstmtGuest.setString(5, request.getParameter("allergy"));
		pstmtGuest.setString(6, note);
		pstmtGuest.setString(7, request.getParameter("relation"));
		
		if (pstmtGuest.executeUpdate() == 1) {
			System.out.println("게스트 등록성공!!");
		}
		
		// 동반자 정보 입력
		pstmtParty = con.prepareStatement(sqlParty);
		pstmtParty.setString(1, eventNumber);
		pstmtParty.setString(2, Id);
		pstmtParty.setString(3, request.getParameter("adult"));
		pstmtParty.setString(4, request.getParameter("child"));
		pstmtParty.setString(5, request.getParameter("baby"));
		
		if (pstmtParty.executeUpdate() == 1) { 
			System.out.println("동반자 등록성공!!");
		}
		
		// 알러지 상세사항 입력
        String gAttend = request.getParameter("attendance");
        if ("出席".equals(gAttend)) { // 참일때만 알러지 정보 입력
            String allergytype = request.getParameter("allergy-type");
            allergytype = allergytype.replace("\r\n", "<br>");
            
            pstmtAllergy = con.prepareStatement(sqlAllergy);
            pstmtAllergy.setString(1, eventNumber);
            pstmtAllergy.setString(2, Id);
            pstmtAllergy.setString(3, allergytype);

            if (pstmtAllergy.executeUpdate() == 1) {
                System.out.println("알러지 등록성공!!");
            }
        }
        
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
        dbManager.close(con, pstmtGuest, null);
        dbManager.close(con, pstmtParty, null);
        dbManager.close(con, pstmtAllergy, null);

	}

}
	
	//  d-day날짜 표기 및 제한날짜 표기

	public static void ddaywedding(HttpServletRequest request) {
	    Connection con = null;
	    PreparedStatement pstmtDday = null;
	    ResultSet rs = null;
	    DBManager dbManager = DBManager.getInstance();

	    try {
	        String eventNumber = (String) request.getSession().getAttribute("eno");


	        String sqlSelect = "SELECT r_time FROM s_reception WHERE e_no = ? AND r_type= 'wedding'";

	        con = dbManager.connect();
	        System.out.println(eventNumber);
	        pstmtDday = con.prepareStatement(sqlSelect);
	        pstmtDday.setString(1, eventNumber);
	        rs = pstmtDday.executeQuery();

	        if (rs.next()) {
	            Timestamp weddingDT = rs.getTimestamp("r_time");
	            if (weddingDT == null) {
	                request.setAttribute("minus40Days", "日付 未定");
	                System.out.println("웨딩 날짜는: 날짜 미정");
	            } else {
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年 MM月 dd日");
	                String weddingDay = dateFormat.format(weddingDT);
	                request.setAttribute("weddingDay", weddingDay);

	                // 40일 전 날짜 계산    
	                Calendar calendar = Calendar.getInstance();
	                calendar.setTime(weddingDT);
	                calendar.add(Calendar.DAY_OF_YEAR, -40);
	                Timestamp minus40DaysDT = new Timestamp(calendar.getTime().getTime());
	                String minus40days = dateFormat.format(minus40DaysDT);
	                request.setAttribute("minus40Days", minus40days);

	                System.out.println("웨딩 날짜는: " + weddingDay);
	                System.out.println("40일 전 날짜는: " + minus40days);
	            }
	        } else {
	            request.setAttribute("minus40Days", "日付 未定");
	            System.out.println("ResultSet is empty, 웨딩 날짜는: 날짜 미정");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmtDday != null) pstmtDday.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
}