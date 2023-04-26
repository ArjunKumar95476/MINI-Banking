<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.dao.BankDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Using Pin</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
	background: #08aabf;
}
.info-show {
	background: white;
	margin-right: 70px;
	height: 14vh;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
}

.form-section {
	background: #085985;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 5px 0;
	margin-right: 40px;
	border-radius: 10px;
}
.input{
border-radius: 10px;}
.label {
	font-size: 20px;
	text-shadow: 1px 1px 1px black;
	color: white;
}

.btn1 {
    font-size: 18px;
	padding: 4px 30px;
	text-shadow: 1px 1px 1px black;
	border-radius: 5px;
	background: #07ad5a;
	border: none;
	border-radius: 10px;
	color: white;
	box-shadow: 1px 1px 1px black;
}
</style>
</head>
<body>
	<%
	String accountNumber = (String) session.getAttribute("accountNumber");
	String pin = null;
	int amount = 0;
	String query = "select pin from pintable where account_number=" + accountNumber;
	Connection conn = BankDao.getConnection();
	PreparedStatement ps = conn.prepareStatement(query);
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		pin = rs.getString(1);
	}
	String query1 = "select amount from bank_account_create where account_number = "+accountNumber;
	Connection conn1 = BankDao.getConnection();
	PreparedStatement ps1 = conn1.prepareStatement(query1);
	ResultSet rs1 = ps1.executeQuery();
	while (rs1.next()) {
		amount = rs1.getInt(1);
		
	}
	//out.println("Pin = " + pin);
	//out.println("Account Number : " + accountNumber);
	//out.println("Amount : " + amount);
	%>
	<div class="container">
		<div class="row">
			<div class="col form-section ">
				<form action="">
					<div class="form-group">
						<label class="label">Enter Pin</label>
						<div class="input-group">
							<input type="text" placeholder="- - - -" name="pin"
								class=" py-2 px-5 mb-3 input">
						</div>
					</div>
					<div class="form-group d-flex">

						<div class="input-group">
							<input type="submit" value="View" class="btn1">
						</div>
						<div class="input-group">
							<a  href="mainpage.jsp"><button type="button"  class="btn btn-primary px-5" style="box-shadow: 1px 1px 1px black;">Exit</button></a>
						</div>
					</div>
				</form>
			</div>
			<div class="col info-show">
			<%
			String userPin=request.getParameter("pin");
			if(pin.equals(userPin))
			{
				%>
				<h3 style="font-family:monospace;"><%=amount %> &#x20B9</h3>
				<%
			}else{
				%>
				<h3 style="color: red;">Wrong Pin</h3>
				<%
			}
			
			%>
			
				
			</div>
		</div>
	</div>

</body>
</html>