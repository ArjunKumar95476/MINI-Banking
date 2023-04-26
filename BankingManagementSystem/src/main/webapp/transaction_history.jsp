<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,com.dao.BankDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>//Transaction History//</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style type="text/css">
body{ background-color: #636ba6;}
.history_data{display: flex;justify-content: space-around; background-color: white; margin: 8px 0; padding: 10px 0;box-shadow: 1px 1px 1px black,-1px -1px 1px black; border-radius: 5px; }
.history_data span{text-shadow: 1px 1px 1px black; text-transform: uppercase;}
h1{color: white;text-shadow: 1px 1px 1px black;}
</style>
</head>
<body>
<a href="mainpage.jsp"><i class="bi bi-box-arrow-left" style="font-size: 25px; margin-left: 10px; color:red; font-weight: 800;"></i></a>
<div class="container mt-2 text-center">

<h1 class="mb-5">Transaction History</h1>
<div class="row">
<div class="col-1 "></div>
<div class="col-10 history"> 
<%
// get account number from session
String account_number=(String)session.getAttribute("accountnumber");
Connection conn=BankDao.getConnection();
String query="select transaction_type,amount,time,date from transaction_history where account_number="+account_number;
PreparedStatement ps=conn.prepareStatement(query);
ResultSet rs=ps.executeQuery();
while(rs.next())
{   if(rs.getString(1).equals("credit"))
   {
	%>
	<div class="history_data"> 
	<span><%=rs.getString(1)%></span>
	<span style="color: red;">-<%=rs.getString(2)%></span>
	<span><%=rs.getString(3)%></span>
	<span><%=rs.getString(4)%></span>
	</div>
	<%
   }
else{
	%>
	<div class="history_data"> 
	<span><%=rs.getString(1)%></span>
	<span style="color: #0cfa00;">+<%=rs.getString(2)%></span>
	<span><%=rs.getString(3)%></span>
	<span><%=rs.getString(4)%></span>
	</div>
	<%
}
	
}

%>

</div>
<div class="col-1 "></div>

</div>

</div>
</body>
</html>