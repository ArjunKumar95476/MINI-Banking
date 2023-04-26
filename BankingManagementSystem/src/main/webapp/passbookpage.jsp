<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>passbook/download</title>
</head>
<body>
<%

Random r=new Random();
int x=r.nextInt(1000000000);
out.println("x=2023"+x);
%>
</body>
</html>