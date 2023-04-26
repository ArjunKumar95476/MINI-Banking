<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
<style type="text/css">
body{
background-color: #4d7f9e;
padding: 0 200px;
display: flex;

}
.mainclass{
background-color: #2772a1;
height: 100vh;
display: flex;
justify-content: center;
align-items: center;
box-shadow: 1px 0px 1px black,-1px 0px 1px black;
}
.form-conatainer{
display: flex;
flex-direction:column;
justify-content: center;
align-items: center;
}
form{
width: 50%; background: #043654;padding: 10px 20px; box-shadow: 1px 1px 1px black,-1px -1px 1px black;}
.label{font-size: 20px;text-shadow: 1px 1px 1px black;padding-left: 10px; color: white;}
input{width: 100%; padding: 10px 10px;}
.btn1{
border: none;border-radius: 10px;background: blue;color: white;text-shadow: 1px 1px 1px black;
}
</style>
</head>
<body>
<a href="loadingpage.html" style="margin-right: 20px;"><i class="bi bi-box-arrow-left" style="font-size: 25px; margin-left: 10px; color:red; font-weight: 800;"></i></a>
<div class="container-fluid mainclass">
<div class="container form-conatainer">
  <form action="">
  <div class="form-group">
  <label class="label">Admin</label>
  <div class="input-group">
  <input type="text" placeholder="Admin name" name="adminname">
  </div>
  </div>
  <div class="form-group">
  <label class="label">Password</label>
  <div class="input-group">
  <input type="password" placeholder="Password" name="pass" id="pass" >
  </div>
  </div>
  <div class="form-group">
  <div class="input-group">
  <input type="submit" value="login" class="w-25 btn1" style="margin-left: 200px;">
  </div>
  </div>
  </form>
  <%
Connection conn=BankDao.getConnection();
String query="select admin_name,password from admininfo";
PreparedStatement ps=conn.prepareStatement(query);
ResultSet rs=ps.executeQuery();
boolean flag=false;
while(rs.next())
{
	if(rs.getString(1).equals(request.getParameter("adminname"))&&rs.getString(2).equals(request.getParameter("pass")))
	{
		flag=true;
	  RequestDispatcher rs1=request.getRequestDispatcher("adminview.jsp");
	  rs1.forward(request, response);
	}
}
if(!flag)
{
	%>
	<p style="color: red; text-shadow: 1px 1px 1px black;">Login Failed.</p>
	<%	
}
%>
</div>
</div>

</body>
</html>