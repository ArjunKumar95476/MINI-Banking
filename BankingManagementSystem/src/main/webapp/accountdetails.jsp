<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="java.sql.*,com.dao.BankDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>/Account_Details/....</title>
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
	body
	{
	background: rgb(245, 250, 255)}
	td{
	padding: 8px 40px;}
	</style>
</head>
<body> 
	<%
	String accountholdername = (String) session.getAttribute("accountholdername");
	String accountnumber = (String) session.getAttribute("accountnumber");
	String gender= (String) session.getAttribute("gender");
	%>
	<%
	Connection conn = BankDao.getConnection();
	PreparedStatement st = conn.prepareStatement("select accountholdername,fathername,mothername,gender,nomineename,aadhar,phonenumber,email,date,address,account_number,amount from bank_account_create where  account_number = " + accountnumber);
	ResultSet rs = st.executeQuery();
	while (rs.next()) {
	%>
	<div class="container ">
	<table >
		<tbody>
		   <tr>
		   <td colspan="2" style="padding-left: 160px;">
		   <%
		   if(gender.equals("male")) 
			   
		   {
			   %> 
			   <img alt="" src="image/maleAvatar.jpg" height="170px" width="170px" style="border-radius: 90px;">
			   <%  
		   }else
		   {
			   %> 
			   <img alt="" src="image/avatarfemale.jpg" height="170px" width="170px" style="border-radius: 90px;">
			   <%  
		   }
		  %>
		   </td>
		   </tr>
			<tr>
				<td style="font-weight: 800;">Account Holder Name </td>
				<td><%=rs.getString(1)%></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Father Name </td>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Mother Name</td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Gender</td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Nominee Name </td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Aadhar No.</td>
				<td><%=rs.getString(6) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Phone Number</td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Email Id </td>
				<td><%=rs.getString(8) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Account Open Date </td>
				<td><%=rs.getString(9) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Address</td>
				<td><%=rs.getString(10) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Account Number </td>
				<td><%=rs.getString(11) %></td>
			</tr>
			<tr>
				<td style="font-weight: 800;">Balance </td>
				<td><%=rs.getInt(12) %> &#x20B9</td>
			</tr>
		</tbody>
	</table>
   </div>
	<%
	}
	%>
	<div class="form-group d-flex py-2">
  <button type="submit" class="btn btn-success px-5 " style="margin-left: 240px; box-shadow:1px 1px 1px black,-1px -1px 1px black;   text-shadow: 1px 1px 2px black;" onclick="window.print()">Print</button>
  <a href="mainpage.jsp"><button type="button" class="btn btn-warning px-4 " style=" box-shadow:1px 1px 1px black,-1px -1px 1px black;  margin-left: 100px; color:white; text-shadow: 1px 1px 2px black;">Exit</button></a>
  </div>
</body>
</html>