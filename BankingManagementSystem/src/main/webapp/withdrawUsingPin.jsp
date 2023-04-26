<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WithDraw Using Pin</title>
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
	flex-direction: column; height : 100vh;
	justify-content: center;
	align-items: center;
	background: #0574a1;
	height: 100vh;
}

.form-section {
	background: #045282;
	margin-right: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	padding: 10px;
	box-shadow: 1px 1px 1px black, -1px -1px 1px black;
}

.info-show {
	background: white;
	margin-top: 70px;
	margin-right: 70px;
	height: 14vh;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	box-shadow: 1px 1px 1px black, -1px -1px 1px black;
}

.input::placeholder {
	text-shadow: 1px 1px 1px black;
}

.input {
	border: none;
	border-radius: 5px;
	box-shadow: 1px 1px 1px black;
	text-shadow: 1px 1px 1px black;
}

.btn2 {
	border: none;
	border-radius: 10px;
	box-shadow: 1px 1px 1px black;
	background: #0aa617;
	color: white;
	text-shadow: 1px 1px 1px black;
}

.label {
	text-shadow: 1px 1px 1px black;
	color: white;
}
</style>
</head>
<body>
	<div class="container text-center mb-5">
		<h1 style="padding-bottom: 40px; text-shadow: 1px 1px 1px black;">WithDraw
			Money Using PIN</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col form-section">
				<form action="withDrawUsingPinManagePage.jsp">
					<div class="form-group">
						<label class="label"> Amount</label>
						<div class="input-group">
							<input type="text" name="amount" placeholder="Amount (&#x20B9)"
								class="input px-5 py-2">
						</div>
					</div>
					<div class="form-group">
						<label class="label">PIN</label>
						<div class="input-group">
							<input type="text" name="pin" placeholder=" - - - - "
								class="input px-5 py-2">
						</div>
					</div>
					<div class="form-group d-flex">
						<div class="input-group">
							<a href="historywithdraw.jsp"><button type="submit" class="btn2 px-4 py-2">Commit</button></a>
						</div>
						<div class="input-group">
							<a href="historywithdraw.jsp"><button type="button" class="btn2 px-4 py-2 bg-danger">Exit</button></a>
						</div>
					</div>
				</form>
			</div>
			<div class="col info-show">
				<%
				String account_number = (String) session.getAttribute("account_number");
				String pin = (String)session.getAttribute("pin");
				int amount = (int)session.getAttribute("amount");
				int amountBank = 0;
				String pinBank = "";
	
				
				// take amount from bank
				Connection conn = BankDao.getConnection();
				String query = "select amount from bank_account_create where account_number=" + account_number;
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					amountBank = rs.getInt(1);
				}
				
				//take pin from pintable in bank
				Connection conn1 = BankDao.getConnection();
				String query1 = "select pin from pintable where account_number =" + account_number;
				PreparedStatement ps1 = conn1.prepareStatement(query1);
				ResultSet rs1 = ps1.executeQuery();
				while (rs1.next()) {
					pinBank = rs1.getString(1);
				}
				if (amount > 0) {
					if (amount <= 10000) {
						if (amount < amountBank) {
					if (pinBank.equals(pin)) {
						int remainAmount=amountBank-amount;
						Connection conn2=BankDao.getConnection();
						String query3="UPDATE bank_account_create SET amount=? where account_number="+account_number;
						PreparedStatement ps2=conn2.prepareStatement(query3);
						ps2.setInt(1,remainAmount);
						ps2.executeUpdate();	
				%>
				<h3 style="color: green;">Successfully withdraw <%=amount%>&#x20B9 </h3>
				<%
				} else {
				%>
				<h3 style="color: green;">PIN Wrong</h3>
				<%
				}
				} else {
				%>
				<h3 style="color: green;">Not Enough Amount in Your Bank</h3>
				<%
				}
				} else {
				%>
				<h5 style="color: green;">You can not withdraw more than 10000
					money through pin</h5>
				<%
				}
				} else {
				%>
				<h3 style="color: green;">You can not with draw 0</h3>
				<%
				}
				%>
			</div>
		</div>
		<%
		// for transaction history 
	     String transaction_type="debit";
		 String amountForHistory=""+amount+"";
		 session.setAttribute("account_number", account_number);
		 session.setAttribute("amountwithdraw", amountForHistory);
		 session.setAttribute("transaction_type_credit", transaction_type);
		
		%>
	</div>
</body>
</html>