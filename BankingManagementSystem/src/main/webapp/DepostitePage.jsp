
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
	<%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit Money</title>
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
<style type="text/css">
body {
	background-color: rgb(87, 137, 181);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap:50px;
}
.main_check_page{
    display: flex;
	justify-content: center;
	align-items: center;
	gap:50px;
}
.info_show{background-color: white; height: 15vh; border-radius: 15px; padding: 40px 30px; margin-bottom:50px;}
.label{text-transform: uppercase; letter-spacing: 2px; text-shadow: 1px 1px 1px black; font-size:18px;}
.input{border-radius:8px;padding: 23px 20px; font-size: 18px;}
.input::placeholder{color: green; opacity: 0.5}
</style>
</head>
<body>

	<div class="container text-center py-5">
		<h1 style="text-decoration: underline; letter-spacing: 2px; word-spacing: 2px;">SBI Mini Bank</h1>
		<h4 style="letter-spacing: 2px; word-spacing: 2px;">Your Money Will be Safe.</h4>
		<h2 style="word-spacing: 2px; letter-spacing: 2px;">Deposit Your Amount(&#x20B9)</h2>
	</div>
	<div class="container main_check_page">
	 
	<div class="container form">
		<form action="" method="get">
			<div class="form-group">
				<label class="label" for="exampleInputText1" >Account Holder Name</label> <input
					type="text 
    " class="form-control w-100 input" id="exampleInputText1"
					aria-describedby="textHelp" name="account_holder_name" placeholder="Account Holder Name"  >
			</div>
			<div class="form-group">
				<label class="label" for="exampleInputText1" >Account Number</label> <input
					type="text 
    " class="form-control w-100 input" id="exampleInputText1"
					aria-describedby="textHelp" name="account_number" placeholder="Account Number" >
			</div>
			<div class="form-group">
				<label class="label" for="exampleInputText1" >Amount(&#x20B9)</label> <input
					type="text 
    " class="form-control w-100 input" id="exampleInputText1"
					aria-describedby="textHelp" name="amount" placeholder="Amount(&#x20B9)"  >
			</div>
			<div class="form-group d-flex py-2">
  <button type="submit" class="btn btn-success px-5 " style="margin-left: 100px; box-shadow:1px 1px 1px black,-1px -1px 1px black;   text-shadow: 1px 1px 2px black;">Save Amount</button>
  <a href="historydeposite.jsp"><button type="button" class="btn btn-warning px-4 " style=" box-shadow:1px 1px 1px black,-1px -1px 1px black;  margin-left: 100px; color:white; text-shadow: 1px 1px 2px black;">Exit</button></a>
  </div>
		</form>
	</div>
	<div class="container info_show w-75">
	  <%!
       String account_number="";
       String account_holder_name="";
       int amount=0;
      %>
	  <%
	  account_number=(String)session.getAttribute("accountnumber");
	  amount=(int)session.getAttribute("amount");
	  account_holder_name=(String)session.getAttribute("accountholdername");
	  String accountHolderName=request.getParameter("account_holder_name");
	  String accountNumber=request.getParameter("account_number");
	  String amountUser=request.getParameter("amount");
	  if(account_holder_name.equals(accountHolderName))
	  {
		  if(account_number.equals(accountNumber))
		  {
			    int result = Integer.parseInt(amountUser)+amount;
				Connection conn=BankDao.getConnection();
				String query="UPDATE bank_account_create SET amount=? where account_number="+account_number;
				try {
					PreparedStatement ps=conn.prepareStatement(query);
					ps.setInt(1,result);
					ps.executeUpdate();
					amount=result;
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(Integer.parseInt(amountUser)==0)
				{
					%>
					  <h5 style="color: red;">You Can Not Deposit <%=(amountUser)%> &#x20B9 &#128546;</h5>
					  <%
				}
				else
				{
					  %>
					  <h4 style="color: green;">You Have Successfully Deposit <%=(amountUser)%> &#x20B9  &#129297;</h4>
					  <%	
				}
			  
		  }  
		  else
		  {
			  %>
			  <p style="color: red;font-weight: 700;">Error in Account Number</p>
			  <%  
		  }
	  }
	  else
	  {
		  %>
		  <p style="color: red;font-weight: 700;">Error in Account Holder Name</p>
		  <%  
	  }
	  
	  %>
	   <a href="depositUsingPin.jsp"><button type="button" class="btn btn-primary px-5 mt-5 w-100" style=" box-shadow:1px 1px 1px black,-1px -1px 1px black; color: white;text-shadow: 1px 1px 2px black;">Deposit Using PIN</button></a>
	 </div>
	 
	 <%
	 // this is for transaction history....................
	 String transaction_type="credit";
	 account_number=(String)session.getAttribute("accountnumber");
	 String amount_for_history=request.getParameter("amount");
	
	 session.setAttribute("account_number", account_number);
	 session.setAttribute("amountdeposit", amount_for_history);
	 session.setAttribute("transaction_type_debit", transaction_type);
	 %>
  </div>
</body>
</html>