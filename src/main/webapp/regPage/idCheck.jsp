<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>IDチェック</title>
</head>
<body>
    <h2>IDチェック</h2>
    
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
