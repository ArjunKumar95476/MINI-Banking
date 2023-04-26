<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.dao.BankDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Debit Card</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
<style type="text/css">
body {
	display: flex;
	height: 100vh;
	flex-direction:column;
	justify-content: center;
	align-items: center;
	background: #085985;
}

.content {
	height: 37vh;
	width: 35%;
	background: #d17206;
	border-radius: 5px;
	box-shadow: 1px 1px 1px #f0ebe6, -1px -1px 1px #f0ebe6;
	border: 1px solid #f0ebe6;
}

.smartchip {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.cardNumber p {
	font-size: 25px;
}

.cardholdername {
	display: flex;
	justify-content: space-around;
}

.date p {
	text-shadow: 1px 1px 1px black;
}

.cardholdername p {
	font-size: 18px;
}
</style>
</head>
<body>
	<%
	String cardholdername = "", debitNumber = "", pin = "";
	int year = 0, exyear = 0, month = 0, exmonth = 0;
	String accountnumber = (String) session.getAttribute("accountNumber");
	String mobilenumber = (String) session.getAttribute("phonenumber");
	Connection conn = BankDao.getConnection();
	Connection con1 = BankDao.getConnection();
	String query = "select accountholdername from bank_account_create where phonenumber =" + mobilenumber;
	String query1 = " select yea_r,mont_h,expire_year,expire_month,debitNumber,pin from pintable where mobile_number=" + mobilenumber;
	PreparedStatement st = conn.prepareStatement(query);
	PreparedStatement st1 = conn.prepareStatement(query1);
	ResultSet rs=null, rs1=null;
	rs = st.executeQuery();
	rs1 = st1.executeQuery();
	while (rs.next()) {
		cardholdername = rs.getString(1);
	}
	while (rs1.next()) {
		year = rs1.getInt(1);
		month = rs1.getInt(2);
		exyear = rs1.getInt(3);
		exmonth = rs1.getInt(4);
		debitNumber = rs1.getString(5);
		pin = rs1.getString(6);
	}
	%>
	<div class="container content">
		<div class="bank_name pl-3 text-center pt-1">
			<h3>Mini SBI Bank</h3>
		</div>
		<div class="smartchip pl-5">
			<p>
				<i class="bi bi-sd-card-fill"
					style="font-size: 45px; color: silver;"></i>
			</p>
			<img alt="image" src="image/cardimage.png" height="40px;"
				style="border-radius: 20px; margin-right: 10px;">
		</div>
		<div class="cardNumber text-center">
			<p><%=debitNumber%></p>
		</div>
		<div class="date text-center">
			<p>
				From&nbsp; <span><%=month%>/<%=year%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Up to &nbsp;<span><%=exmonth%>/<%=exyear%></span>
			</p>
		</div>
		<div class="cardholdername">
			<p><%=cardholdername%></p>
			<img alt="Image" src="image/paylogoo.png" height="25px;">
		</div>
	</div>
	<a href="mainpage.jsp"><button type="button" class="btn btn-primary btn-lg mt-3">Perform Operation Using Pin</button></a>
	<a href="index.html"><button type="button" class="btn btn-danger btn-lg mt-2">Cancel</button></a>
	<%
	session.setAttribute("accountholdername", cardholdername);
	session.setAttribute("accountnumber", accountnumber);
	%>

</body>
</html>