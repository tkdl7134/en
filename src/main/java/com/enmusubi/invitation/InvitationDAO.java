package com.enmusubi.invitation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.enmusubi.main.DBManager;
	


public class InvitationDAO {
	
	private static ArrayList<InvitationDTO> invitations(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM S_GUEST sg LEFT OUTER JOIN S_MEMBER sm  ON sg.M_ID = sm.M_ID LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID =sa.M_ID LEFT OUTER JOIN S_ALLERGY sa2 on sm.M_ID =sa2.M_ID WHERE se.m_id = 'testuser' AND sg.E_NO ='1'";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<InvitationDTO> invitations = new ArrayList<InvitationDTO>();
			InvitationDAO i = null;
			
			while (rs.next()) {
			i = new InvitationDAO();
			i.getM_name("i_name");
			i.get
					
			
			invitations.add(i);
			}
			
			System.out.println(invitations);
			
			request.setAttribute("invitation", invitations);
			
		} catch (Exception e) {
			e.printStackTrace();
			}
		finally {
			DBManager.close(con, pstmt, rs);
		}
		return null;
	}
	
	private void getM_name(String string) {
		// TODO Auto-generated method stub
		
	}

	private static final InvitationDAO IDAO = new InvitationDAO();
			
	public static InvitationDAO getMDao() {
		return IDAO;
	}
	
		private InvitationDAO() {
			
		}
		
	public static void Invitation(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM S_GUEST sg LEFT OUTER JOIN S_MEMBER sm  ON sg.M_ID = sm.M_ID LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID =sa.M_ID LEFT OUTER JOIN S_ALLERGY sa2 on sm.M_ID =sa2.M_ID WHERE se.m_id = 'testuser' AND sg.E_NO ='1'";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			invitations = new ArrayList<InvitationDTO>();
			InvitationDTO i = null;
			
			while (rs.next()) {
			i = new InvitationDTO();
			
					
			
			invitations.add(i);
			}
			
			System.out.println(invitations);
			
			request.setAttribute("invitation", invitations);
			
		} catch (Exception e) {
			e.printStackTrace();
			}
		finally {
			DBManager.close(con, pstmt, rs);
		}
		return null;
	}

}
