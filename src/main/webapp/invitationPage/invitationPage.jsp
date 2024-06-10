<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초대 관리 페이지</title>
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body>
<form action="InvitationC" method="post">
<div class="hw_container">
    <div class="hw_sidebar left">
       <a href="main.jsp"> <img src="invitationPage/imgFolder/logo.png" alt="로고" class="logo"></a>
        <ul>
            <li><a href=invitationC>초대 관리</a></li>
            <li><a href="#">마이 템플릿</a></li>
            <li><a href="#">정보 관리</a></li>
            <li><a href="#">통계</a></li>
        </ul>
    </div>
    
    <div class="hw_content">
        <c:forEach var="invitations" items="${invitations }">
        <div class="hw_invitation">
        	<div class="hw_invitation_content">
        		<div class="hw_img">
        			<img src="invitationPage/imgFolde/${invitations.w_img }">
        		</div>
        		<div class="hw_title">${invitations.w_groom },${invitations.w_bride }결혼식</div>
        	</div>
    </div>
        </c:forEach>
    </div>
        
    <div class="hw_sidebar right">
        <ul>
            <li><a href="#">연결</a></li>
            <li><a href="#">서비스</a></li>
            <li><a href="#">FAQ</a></li>
        </ul>
    </div>
</div>
</form>

<!-- 모달 추가 -->
<div id="invitationModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        
    	  <h2>참가자</h2>
    <table>
        <thead>
            <tr>
                <th>이름</th>
                <th>번호</th>
                <th>이메일</th>
                <th>참석여부</th>
                <th>초대자</th>
                <th>동반인원</th>
                <th>알러지</th>
            </tr>
        </thead>
        <tbody>
                <c:forEach var="invitation" items="${invitations}">
                <tr>
                    <td>${invitation.m_name}</td>
                    <td>${invitation.m_phone}</td>
                    <td>${invitation.m_email}</td>
                    <td>${invitation.g_attend}</td>
                    <td>${invitation.g_guest_type}</td>
                    <td>${invitation.g_age_type}</td>
                    <td>${invitation.allergy}</td>
                </tr>
                </c:forEach>
            </tbody>
    </table>
     
     <h2>불참자</h2>
    <table>
        <thead>
            <tr>
                <th>이름</th>
                <th>번호</th>
                <th>이메일</th>
                <th>참석여부</th>
            </tr>
        </thead>
        <tbody>
                <c:forEach var="invitation" items="${invitations}">
                <tr>
                    <td>${invitation.m_name}</td>
                    <td>${invitation.m_phone}</td>
                    <td>${invitation.m_email}</td>
                    <td>${invitation.g_attend}</td>
                </tr>
                </c:forEach>
            </tbody>
    </table>
     
    </div>
</div>

</body>
</html>