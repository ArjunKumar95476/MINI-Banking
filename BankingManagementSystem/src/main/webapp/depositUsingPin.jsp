<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit Using Pin</title>
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
	flex-direction: column;
	height: 100vh;
	justify-content: center;
	align-items: center;
	background: #0574a1;
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
		<h1 style="padding-bottom: 40px; text-shadow: 1px 1px 1px black;">Deposit
			Money Using PIN</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col form-section">
				<form action="DepositUsingPinManagePage.jsp">
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
							<button type="submit"  class="btn2 px-4 py-2">Commit</button>
						</div>
						<div class="input-group">
							<a href="historydeposite.jsp"><button type="button" class="btn2 px-4 py-2 bg-danger">Exit</button></a>
						</div>
					</div>
				</form>
			</div>
			<div class="col info-show">
				<%
				int bankAmount=0;
				String pinBank=null;
				int amountUser=(int)session.getAttribute("amount");
				String pinUser=(String)session.getAttribute("pin");
				String account_number=(String)session.getAttribute("account_number");
				// amount getting from account_create_table
				Connection conn=BankDao.getConnection();
				String query="select amount from bank_account_create where account_number="+account_number;
				PreparedStatement ps=conn.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					bankAmount=rs.getInt(1);
				}
				//pin getting from pintable
				Connection conn1=BankDao.getConnection();
				String query1="select pin from pintable where account_number="+account_number;
				PreparedStatement ps1=conn.prepareStatement(query1);
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					pinBank=rs1.getString(1);
				}
				//out.println(" Amount User : "+amountUser+" Pin User "+pinUser+"Account Number "+account_number);
			//	out.println("Bank Amount : "+bankAmount);
				//out.println("Bank Pin : "+pinBank);
				if(amountUser>0)
				{
					if(amountUser<=10000)
					{
						if(pinBank.equals(pinUser))
						{
							int remainAmount=bankAmount+amountUser;
							Connection conn2=BankDao.getConnection();
							String query2="UPDATE bank_account_create SET amount=? where account_number="+account_number;
							PreparedStatement ps2=conn2.prepareStatement(query2);
							ps2.setInt(1,remainAmount);
							ps2.executeUpdate();
							%>
							<p style="color: green;"> Successfully Deposit <%=amountUser %>&#x20B9 </p>
							<%
						}
						else{
							// wrong pin
							%>
							<p style="color: red;"> wrong pin</p>
							<%
						}
					}
					else
					{
						// you can only sent less than 10000 through pin
						%>
						<p > you can only sent less than 10000 through pin</p>
						<%
					}
				}
				else
				{
					// can not send 0 rupee..
					%>
					<p style="color: red;"> can not send 0 rupee..</p>
					<%
				}
				%>
			</div>
		</div>
	</div>
	<%
	//String accountNumber=(String)session.getAttribute("account_number");
	//out.println("Account Number : "+accountNumber);
	     String transaction_type="credit";
	     String amountforhistory=""+amountUser+"";
		 session.setAttribute("account_number", account_number);
		 session.setAttribute("amountdeposit", amountforhistory);
		 session.setAttribute("transaction_type_credit", transaction_type);
	%>
</body>
</html>