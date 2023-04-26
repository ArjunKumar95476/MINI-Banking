<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,com.dao.BankDao"  session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Iogin page//</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style type="text/css">
body{
background-color: rgb(87, 137, 181);

}
.form{margin-top: 150px;
}
label ,p{color:white; text-shadow: 1px 1px 1px black; font-size: 20px;}

</style>
</head>
<body>
<a href="index.html"><i class="bi bi-box-arrow-left" style="font-size: 25px; margin-left: 10px; color:red; font-weight: 800;"></i></a>
<%
String mobilenumber="";
String holdername=""; 
String account_number="";
int amount=0;
String gender="";
mobilenumber=request.getParameter("mobilenumber");
Connection conn=BankDao.getConnection();
PreparedStatement st=conn.prepareStatement("select phonenumber from bank_account_create");
ResultSet rs=st.executeQuery();
while(rs.next())
{
	if(rs.getString(1).equals(mobilenumber))
	{
		Connection conn1=BankDao.getConnection();
		PreparedStatement st1=conn1.prepareStatement("select accountholdername,account_number,gender,amount from bank_account_create  where phonenumber="+mobilenumber);
		ResultSet rs1=st1.executeQuery();
		while(rs1.next())
		{
			
			holdername=rs1.getString(1);
			account_number=rs1.getString(2);
			gender=rs1.getString(3);
			amount=rs1.getInt(4);
			session.setAttribute("accountholdername", holdername);
			session.setAttribute("accountnumber", account_number);
			session.setAttribute("gender", gender);
			session.setAttribute("amount", amount);
			RequestDispatcher rd=request.getRequestDispatcher("mainpage.jsp");
			rd.forward(request, response);
		}
	}
	
}
%>
<div class="container text-center pt-5">
<h1 class="py-2" style="text-decoration: underline; text-shadow: 1px 1px 1px white;">Login In SBI Mini Bank</h1>
<p class="py-2">My Bank will provide you a good services and we will give 100% guarantee for trust.. </p>
<p class="py-2">My service will provide you good security and reliability.</p>
</div>
<div class="container">
<div class="row">
<div class="col-3"></div>
<div class="col-6 form">
<form action="" method="post">
  <div class="form-group">
    <label for="exampleInputText1" style="letter-spacing: 2px;">Mobile Number</label>
    <input type="text" class="form-control" id="exampleInputText1" aria-describedby="textHelp" name="mobilenumber">
  </div>
  <button type="submit" class="btn btn-danger" style="margin-left: 200px; padding: 8px 40px;">Login</button>
</form>

</div>
<div class="col-3"></div>
</div>
</div>
</body>
</html>