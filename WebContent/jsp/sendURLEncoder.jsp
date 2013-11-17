<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.net.*" %>

<%
String parameter = URLEncoder.encode("테스트파라메터", "UTF-8");
//String parameter = "테스트파라메터";
//String parameter = "abcdefg";
System.out.println("================================================");
System.out.println("parameter : " + parameter);
System.out.println("================================================");
String url = "recvRedirect.jsp?param1=" + parameter;
System.out.println("url : " + url);
response.setCharacterEncoding("UTF-8");
response.sendRedirect(url);
%>

</body>
</html>