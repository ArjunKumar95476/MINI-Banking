<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.dao.BankDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>//PinCreate</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style type="text/css">
body{
display: flex;
height: 100vh;
justify-content: center;
align-items: center;
background: #275b8a;
}
.content{
 width: 50%;
 background: white;
 padding: 40px 20px;
 border-radius: 10px;
 box-shadow: 1px 1px 1px white,-1px -1px 1px white;
 }
 .content p{
 font-size: 20px; text-shadow: 1px 1px 1px black;
 }
</style>
</head>
<body>
	<!-- java code will be here -->  	
	 	<%
	int min = 1000;
	int max = 9000;
	int num1 = (int) (Math.random() * (max - min + 1) + min);
	int num2 = (int) (Math.random() * (max - min + 1) + min);
	int num3 = (int) (Math.random() * (max - min + 1) + min);
	int num4 = (int) (Math.random() * (max - min + 1) + min);
	String debitnum=num1+" "+num2+" "+num3+" "+num4;
	LocalDateTime localdatetime = LocalDateTime.now();
	int year = localdatetime.getYear();
	int mon_th = localdatetime.getMonthValue();
	int expireyear = year + 10;
	int expiremonth = mon_th + 10;
	if (expiremonth > 12) {
		expiremonth = expiremonth - 12;
	}
	String AccountNum = (String) session.getAttribute("accountNumber");
	String phoneNum = (String) session.getAttribute("phonenumber");
	session.setAttribute("mobilenumber", phoneNum);
	session.setAttribute("accountnumber", AccountNum);
	String AccountNumUser = request.getParameter("account_number");
	String pin = request.getParameter("pin");
	String confirmpin = request.getParameter("confirm");
	if (AccountNum.equals(AccountNumUser)) {
          
			Connection conn=BankDao.getConnection();
            String query="insert into pintable (account_number,mobile_number,yea_r,mont_h,expire_year,expire_month,pin,debitNumber)values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, AccountNum);
            ps.setString(2, phoneNum);
            ps.setInt(3, year);
            ps.setInt(4, mon_th);
            ps.setInt(5, expireyear);
            ps.setInt(6, expiremonth);
            ps.setString(7,pin );
            ps.setString(8, debitnum);
           int i= ps.executeUpdate();
           if(i>0)
           {
            %>
    		<div class="container content">
    		<a href="Card.jsp"><button type="button" class="btn btn-success btn-lg w-100">View DEBIT Card</button> </a>
    		</div>
    	   <% 
           }
           else{
        	   out.print("Not Submmited data");
           }
            
        }
	else{
		%>
		<div class="container content">
		<p>Account Number is Wrong , Please Fill correct Account Number..</p>
		<a href="pinpage.html"><button type="button" class="btn btn-danger btn-lg w-100" style="text-decoration: none;">Go Back</button></a>
		</div>
	   <% 
	}
	%>	 
	 
</body>
</html>