<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나는야 제목6</title>
</head>
<body>
<%@ page import="java.util.Enumeration" %>
	<%
Enumeration  headerNames = request.getHeaderNames();
while(headerNames.hasMoreElements()){
	String headerName = (String)headerNames.nextElement();
	String headerValue = request.getHeader(headerName);	
	%>
	
	<h3>headerName : <%= headerName%></h3>
	<h3>headerValue : <%= headerValue%></h3>
	<BR>
	<%
}

response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.addHeader("Cache-Control", "no-store");

response.setDateHeader("Expires", 1L);
%>
</body>
</html>