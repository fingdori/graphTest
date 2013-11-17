<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="sendURLEncoder.jsp">
	<button onclick="">다시 보내줘</button>
</a>
<BR>
<%@ page import="java.net.URLDecoder" %>


	<%
	request.setCharacterEncoding("UTF-8");
	String param1 = request.getParameter("param1");
	
	System.out.println("===========================\n\n\n" + "param1 recv : " + param1);
	System.out.println("param1 recv URLDecoder.decode : " + URLDecoder.decode(param1, "UTF-8"));
	System.out.println("request.getCharacterEncoding : " + request.getCharacterEncoding());
	%>

	param1 :
	<%=param1 %>

	URLDecoder.decode(param1) :
	<%=URLDecoder.decode(param1, "UTF-8") %>


</body>
</html>