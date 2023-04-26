<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String name=request.getParameter("name");
String contact=request.getParameter("contactus");
String query=request.getParameter("query");
String check=request.getParameter("check");
out.println(name);
out.println(contact);
out.println(query);
out.println(check);



%>
</body>
</html>