<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
	<%@ page import="com.dao.BankDao,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking Page</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<style type="text/css">
	.button{
	border-radius: 30px; padding: 15px 0; letter-spacing:2px; text-shadow:1px 1px 2px black;
	box-shadow: 1px 1px 1px black;
	}
	</style>
</head>
<body>
<%
String accountholdername="";
String accountnumber="";
int amount=0;
String gender="";
accountholdername=(String)session.getAttribute("accountholdername");
accountnumber=(String)session.getAttribute("accountnumber");
gender=(String)session.getAttribute("gender");

// fetching amount from database
Connection conn1=BankDao.getConnection();
PreparedStatement ps1;
try {
	ps1 = conn1.prepareStatement("select amount from bank_account_create where account_number="+accountnumber);
	ResultSet rs=ps1.executeQuery();
	while(rs.next())
	{
		amount=rs.getInt(1);
	}
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}
session.setAttribute("gender", gender);
session.setAttribute("accountholdername", accountholdername);
session.setAttribute("accountnumber", accountnumber);
session.setAttribute("amount", amount);
%>
	<div class="container text-center my-4">
		<h1 style="text-shadow: 1px 1px 1px black;">Welcome  &#127873; <%=accountholdername%> ! &#129309;</h1>
	</div>

	<div class="container pt-5">
		<a href="checkbalance.jsp" style="text-decoration: none;"><button
				type="button"  class="btn btn-primary btn-lg btn-block my-4  button" ><i class="bi bi-check-square-fill" style="padding: 0 10px;font-size:25px; color: green;"></i>Check
				Balance</button></a>
			    <a href="WithDrawPage.jsp" style="text-decoration: none;"><button
				type="button"  class="btn btn-secondary btn-lg btn-block my-4  button"><i class="bi bi-credit-card" style="padding: 0 10px; font-size:25px; color: lightgreen; "></i>WithDraw
				Money</button></a> 
				<a href="DepostitePage.jsp" style="text-decoration: none;"><button
				type="button" class="btn btn-success btn-lg btn-block my-4 button "><i class="bi bi-piggy-bank-fill" style="padding: 0 10px;font-size:25px; color: orange; " ></i>Deposite
				Money</button></a> 
				<a href="accountdetails.jsp" style="text-decoration: none;"><button
				type="button" class="btn btn-info btn-lg btn-block my-4  button"><i class="bi bi-credit-card-2-back-fill" style="padding: 0 10px; font-size:25px; color: aqua;"></i>Account Details</button></a>
				<a href="transaction_history.jsp" style="text-decoration: none;"><button
				type="button" class="btn btn-warning btn-lg btn-block my-4  button " style="color: white;" ><i class="bi bi-ticket-detailed-fill" style="padding: 0 10px; font-size:25px; color: #690314;"></i>Transaction History</button></a>
		<a href="logout.jsp" style="text-decoration: none;"><button type="button" class="btn btn-danger btn-lg btn-block my-4  button"><i class="bi bi-box-arrow-left" style="padding: 0 10px;font-size:25px; color:blue;"></i>Exit</button></a>
	</div>
</body>
</html>