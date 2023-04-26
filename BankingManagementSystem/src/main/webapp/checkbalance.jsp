<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance Check</title>
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
	gap: 50px;
}

.main_check_page {
	
	display: flex;
}

.info_show {
	background-color: white;
	height: 12vh;
	border-radius: 15px;
	padding: 25px 30px;
	margin-top: 27px;
}
</style>
</head>
<body>

	<div class="container text-center py-5">
		<h1 style="text-decoration: underline; letter-spacing: 2px;" class="py-1">SBI Mini Bank</h1>
		<h4 style="letter-spacing: 2px; word-spacing: 2px;" class="py-1">Your Money Will be Safe.</h4>
		<h2 style="letter-spacing: 2px; word-spacing: 2px;" class="py-1">Check Your Balance(&#x20B9)</h2>
	</div>
	<div class="container main_check_page ">
	
		<div class="container form ">
			<form action="checkbalance.jsp" method="get">
				<div class="form-group">
					<label for="exampleInputText1"
						style="text-shadow: 1px 1px 1px black; font-size: 20px;">Enter
						Your Account Number</label> <input type="text 
    "
						class="form-control w-75" id="exampleInputText1"
						aria-describedby="textHelp" name="accountnum"
						placeholder="Account Number"
						style="border-radius: 15px; padding: 38px 50px; font-size: 22px;">
				</div>
				<div class="form-group d-flex py-2">
  <button type="submit" class="btn btn-success px-5 " style="margin-left: 100px; box-shadow:1px 1px 1px black,-1px -1px 1px black;   text-shadow: 1px 1px 2px black;">View</button>
  <a href="mainpage.jsp"><button type="button" class="btn btn-warning px-4 " style=" box-shadow:1px 1px 1px black,-1px -1px 1px black;  margin-left: 100px; color:white; text-shadow: 1px 1px 2px black;">Exit</button></a>
  </div>
			</form>
		</div>
		<div class="container info_show w-50">
			<%!
			String account_number = "";
	         int amount = 0;
	%>
			<%
			account_number = (String) session.getAttribute("accountnumber");
			amount = (int) session.getAttribute("amount");
			String account_number1 = request.getParameter("accountnum");
			if (account_number.equals(account_number1)) {
			%>
			<h3>
				Balance :
				<%=amount%>
				&#x20B9
			</h3>
			<%
			}else
			{
				%>
				<h5 style="color: red;">Wrong Account Number..</h5>
				<%
			}
			%>
			<%
			amount = 0;
			session.setAttribute("accountNumber", account_number);
			%>
			<a href="checkUsingPin.jsp"><button type="button" class="btn btn-primary px-5 mt-5 w-100" style=" box-shadow:1px 1px 1px black,-1px -1px 1px black; color: white;text-shadow: 1px 1px 2px black;">Using PIN</button></a>
		</div>
	</div>
</body>
</html>