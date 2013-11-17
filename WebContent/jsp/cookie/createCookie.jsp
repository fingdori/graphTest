<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create Cookie</title>
<link rel="shortcut icon" href="http://hi-bogo.net/favicon.ico">
</head>
<body>
<h1>쿠키를 만들어 봅시다</h1>
<h3>쿠키는 무조건 더하기 (addCookie)</h3>
<%

Cookie cookie = new Cookie("cookieName", "cookieValue");
response.addCookie(cookie);

%>

쿠키이름 : <%=cookie.getName() %>
</body>
</html>