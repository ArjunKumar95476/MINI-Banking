<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WithDraw</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style type="text/css">
body
{
background-color: rgb(87, 137, 181);
display: flex;
flex-direction:column;
justify-content: center;
align-items: center;
}
.mainclass{
padding:30px 10px;
display: flex;
justify-content: center;
align-items: center;
gap:50px;
}
.input::placeholder{color: green; opacity: 0.5}
.input{border-radius:8px;padding: 23px 20px; font-size: 18px;}
.label{text-transform: uppercase; letter-spacing: 2px; text-shadow: 1px 1px 1px black; font-size:18px;}
.form{  padding-top: 30px;}
.info-show{background-color: white; height: 13vh; padding: 30px 20px; border-radius: 10px;}
</style>
</head>
<body>
<div class="conatiner text-center ">
  <h1 class="py-2" style="text-decoration: underline;letter-spacing: 2px;">SBI Mini Bank </h1>
  <h4 style="letter-spacing: 2px; word-spacing: 2px;" class="py-2">Keep Faith On Us </h4><h4 style="letter-spacing: 2px; word-spacing: 2px;">Your Money in Safe Hand We Provide Higher Security!</h4>
 </div>
 <div class=" container mainclass">
 <div class="container form">
 <h4 class="py-2 text-center" style="letter-spacing: 2px; text-transform: uppercase; margin-bottom: 30px;">WithDraw Money</h4>
 <form action="" method="post">
  <div class="form-group">
    <label class="label" for="exampleInputText2" >Account Holder Name</label>
    <input type="text" class="form-control w-100 input" id="exampleInputText1" aria-describedby="textHelp" placeholder="Account Holder Name" name="holdername">
  </div>
  <div class="form-group">
    <label class="label" for="exampleInputText2" >Account Number</label>
    <input type="text" class="form-control w-100 input" id="exampleInputText2" aria-describedby="textHelp" placeholder="Account Number" name="account_number">
  </div>
  <div class="form-group">
    <label class="label" for="exampleInputText3" >Enter Amount</label>
    <input type="text" class="form-control w-100 input" id="exampleInputText3" aria-describedby="textHelp" placeholder="Amount(&#x20B9)" name="money">
  </div>
  <div class="form-group d-flex py-2">
  <a href="historywithdraw.jsp"><button type="submit" class="btn btn-success px-5 " style="margin-left: 100px; box-shadow:1px 1px 1px black,-1px -1px 1px black;   text-shadow: 1px 1px 2px black;">Save</button></a>
  <a href="historywithdraw.jsp"><button type="button" class="btn btn-warning px-4 " style=" box-shadow:1px 1px 1px black,-1px -1px 1px black;  margin-left: 100px; color:white; text-shadow: 1px 1px 2px black;">Exit</button></a>
  </div>
</form>

 </div>
 <div class="container info-show">
 <%
 
//for session
String holdername="";
String account_number="";
int amount=0;

//scan value from session
holdername=(String)session.getAttribute("accountholdername");
account_number=(String)session.getAttribute("accountnumber");
String account_holder_name=request.getParameter("holdername");
String account_number1=request.getParameter("account_number");
String amount1=request.getParameter("money");
 %>
 <%
 
//fetching amount from data base
 Connection conn1=BankDao.getConnection();
	PreparedStatement ps1;
	try {
		ps1 = conn1.prepareStatement("select amount from bank_account_create where account_number="+account_number);
		ResultSet rs=ps1.executeQuery();
		while(rs.next())
		{
			amount=rs.getInt(1);
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
   %>
 
   <%
  // set amount to database after successfully withdraw
  if(holdername.equals(account_holder_name))
  {
  	if(account_number.equals(account_number1))
  	{
  	    if(amount>=Integer.parseInt(amount1))
  	    {
  	    	int result=amount-Integer.parseInt(amount1);
			Connection conn=BankDao.getConnection();
			String query="UPDATE bank_account_create SET amount=? where account_number="+account_number;
			try {
				PreparedStatement ps=conn.prepareStatement(query);
				ps.setInt(1,result);
				ps.executeUpdate();
				amount=result;
				if(Integer.parseInt(amount1)==0)
				{
					%>
					<h5 style="color:red;">You Can Not WithDraw  <span  style="color:green;"> <%=Integer.parseInt(amount1)%> &#x20B9 	&#128546; </span></h5>
					<%	
				}
				else
				{
				%>
				<h4 style="color: green;">You Have Successfully WithDraw <%=Integer.parseInt(amount1)%>&#x20B9  &#129297;</h4>
				<% 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
  	    }
  	    else
  	    {
  	    	%>
  	    	<p style="color: red; font-weight: 700;">You can't withdraw ! Not enough money in your account ! Check Balance  &#128553;</p>
  	    	<%
  	    } 
  	}
  	else
  	{
  		
  		    %>
	    	<p style="color: red; font-weight: 700;"> <span style="color: black;"><%=account_number1%></span> Incorrect ! Enter Correct Account Number !</p>
	    	<%
  		
  	}
  }
  else
  {
  	%>
	<p style="color: red; font-weight: 700;"> <span style="color: black;"><%=account_holder_name%></span> Incorrect ! Enter correct Account Holder Name ...</p>
	<%
  }
  
  %>
  <a href="withdrawUsingPin.jsp"><button type="button" class="btn btn-primary px-5 mt-5 w-100" style=" box-shadow:1px 1px 1px black,-1px -1px 1px black; color: white;text-shadow: 1px 1px 2px black;">WithDraw Using PIN</button></a>
 </div>
 
 <%
 // for transaction history 
     String transaction_type="debit";
	 account_number=(String)session.getAttribute("accountnumber");
		 
	 String amount_for_history=request.getParameter("money");
	 
	 session.setAttribute("account_number", account_number);
	 session.setAttribute("amountwithdraw", amount_for_history);
	 session.setAttribute("transaction_type_credit", transaction_type);
 
 %>
 </div>
 
</body>
</html>