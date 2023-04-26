<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%
if(session!=null)
{
	session.invalidate();
	request.getRequestDispatcher("/login.jsp").forward(request,response);
}


%>
</body>
</html>