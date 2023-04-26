<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dao.BankDao,java.sql.*,java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DebitCard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
<style type="text/css">
body{
background: #08aabf;
}
.content{
display: flex;
justify-content: center;
height: 40vh;
align-items: center;
}
form{ width: 80%;}.label{text-shadow: 1px 1px 1px black;}
h2,p{text-shadow: 1px 1px 1px black;}

</style>
</head>
<body>
<a href="index.html" style="padding-right: 20px;"><i class="bi bi-box-arrow-left" style="font-size: 25px; margin-left: 10px; color:red; font-weight: 800;"></i></a>
<div class="container text-center py-5">
<h2 class="py-5">SBI <span style="color: orange;">Mini</span> Banking</h2>
<p>Login with verified , which is used at the time of account creation</p>
</div>
<div class="container content">
<form>
  <div class="form-group">
    <label for="exampleInputText" class="label">Fill Verified Number</label>
    <input type="text"class="form-control w-100" id="exampleInputText" aria-describedby="textHelp" name="textNumber" placeholder="1234567890">
  </div>
  <button type="submit" class="btn btn-danger w-100">Continue</button>
</form>
</div>
<div class="container">
<div class="row">
<div class="col-2"></div>
<div class="col-8 " style="background: white; height: 18vh;">
<%
String phoneNumber=request.getParameter("textNumber");
String phonenumber="",accountNumber="";
 Connection conn=null,conn1=null;
 conn=BankDao.getConnection();
 conn1=BankDao.getConnection();
 boolean flag=false;
 String query="select phonenumber,account_number from bank_account_create";
 String query1="select mobile_number from pintable";
 PreparedStatement ps1,ps;
 ResultSet rs,rs1;
 ps=conn.prepareStatement(query);
 ps1=conn1.prepareStatement(query1);
 rs=ps.executeQuery();
 rs1=ps1.executeQuery();
 while(rs.next())
 {
	 if(rs.getString(1).equals(phoneNumber))
	 {
		 flag=true;
		 boolean flag1=true;
		 phonenumber=rs.getString(1);
		 accountNumber=rs.getString(2);
		 session.setAttribute("phonenumber", phonenumber);
		 session.setAttribute("accountNumber", accountNumber);
		 while(rs1.next())
		 {
			 if(phonenumber.equals(rs1.getString(1)))
			 {
				 flag1 =false;
				 %>
				 <a href="Card.jsp"><button type="button" class="btn btn-primary btn-lg w-25 mt-5 ml-5 pl-5">View Card</button></a>
				 <a href="#pinchange.html"><button type="button" class="btn btn-secondary btn-lg w-25 mt-5 ml-5 pl-5">Change Pin</button></a>
				 <%
			 }
		 }
		 if(flag1)
		 {
		 %>
		 <a href="pinpage.html"><button type="button" class="btn btn-outline-success w-100  mt-5">Create ATM PIN</button></a>
		 <%
		 }
	 }
 }
 if(!flag)
 {
 %> 
 <p>Cause: </p>
 <p >You Have Enter Non-Verified Number.</p>  
 <p >You do not have an account , please create first your account..</p>  
 
 
 
 <%
 
 }
%>
</div>
<div class="col-2"></div>
</div>
</div>
</body>
</html>