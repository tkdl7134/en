<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>아이디 중복 확인</title>
</head>
<body>
    <h2>아이디 중복 확인</h2>
    <%
        String m_id = (String) request.getAttribute("m_id");
        boolean isDuplicate = (boolean) request.getAttribute("isDuplicate");
        if (isDuplicate) {
    %>
            <p><%= m_id %>는 이미 사용 중인 아이디입니다.</p>
    <%
        } else {
    %>
            <p><%= m_id %>는 사용 가능한 아이디입니다.</p>
            <button onclick="useId('<%= m_id %>')">사용하기</button>
    <%
        }
    %>

    <script>
        function useId(m_id) {
            // opener는 register.jsp를 가리킴
            opener.document.getElementById('m_id').value = m_id;
            opener.document.getElementById('idCheck').value = 'true'; // 중복 확인 완료 표시
            window.close(); // 현재 창 닫기
        }
    </script>
</body>
</html>
