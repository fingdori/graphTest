<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.net.*" %>
<%
String encodedValue = URLEncoder.encode("한글" , "UTF-8");
//String encodedValue = URLEncoder.encode("한글", "euc-kr");


  response.setContentType("text/xml;charset=utf-8");


System.out.println("Encoded data : " + encodedValue);
System.out.println("Decoded data : " + URLDecoder.decode(encodedValue, "UTF-8"));
response.sendRedirect("redirect.jsp?encodedValue1=" + encodedValue);
%>
</body>
</html>