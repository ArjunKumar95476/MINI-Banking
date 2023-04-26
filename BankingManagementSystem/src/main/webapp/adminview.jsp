<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
<title>Admin</title>
<style type="text/css">

body{
background-color: #4d7f9e;
padding: 0 200px;
display: flex;
}
.mainclass{
background-color: #2772a1;
box-shadow: 1px 0px 1px black,-1px 0px 1px black;
}
</style>
</head>
<body>
<a href="adminpage.jsp" style="padding-right: 20px;"><i class="bi bi-box-arrow-left" style="font-size: 25px; margin-left: 10px; color:red; font-weight: 800;"></i></a>
<div class="container-fluid  mainclass">
<div class="container form-conatainer mt-3 pt-3">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">S.No.</th>
      <th scope="col">Account Holder Name</th>
      <th scope="col">Account Number</th>
      <th scope="col">Amount</th>
    </tr>
  </thead>
  <tbody>
  <%
  Connection conn=BankDao.getConnection();
  String query="select id,accountholdername,account_number,amount from bank_account_create";
  PreparedStatement ps=conn.prepareStatement(query);
  ResultSet rs=ps.executeQuery();
  while(rs.next())
  {
	 %>
	 <tr>
      <th scope="row" style="text-shadow:1px 1px 1px black; color:white"><%=rs.getInt(1) %></th>
      <td style="text-shadow:1px 1px 1px black; color:white"><%=rs.getString(2) %></td>
      <td style="text-shadow:1px 1px 1px black; color:white"><%=rs.getString(3) %></td>
      <td style="text-shadow:1px 1px 1px black; color:white"><%= rs.getInt(4) %> &#8377;</td>
    </tr>
	 <%  
  }
  %>
  </tbody>
</table>
</div>
</div>
</body>
</html>