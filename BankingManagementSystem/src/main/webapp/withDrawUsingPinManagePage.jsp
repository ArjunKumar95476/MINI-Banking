<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String pin = request.getParameter("pin");
String amount = request.getParameter("amount");
int amount1=Integer.parseInt(amount);
session.setAttribute("pin", pin);
session.setAttribute("amount", amount1);
RequestDispatcher rs=request.getRequestDispatcher("withdrawUsingPin.jsp");
rs.forward(request, response);
%>
</body>
</html>