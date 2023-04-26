<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.BankDao,java.sql.*,java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AccountCreate</title>
</head>
<body>
	<%!
	String account_number="";
	String holdername = "";
	String fathername = "";
	String gender="";
	String mothername = "";
	String nomineename = "";
	String aadhar = "";
	String phonenumber = "";
	String email = "";
	String password = "";
	String date = "";
	String address = "";
	int amount = 0;
	Random r=new Random();
	%>
	<%
	account_number="2023"+r.nextInt(90000000);
	out.println("Account Number : "+account_number);
	holdername = request.getParameter("holdername");
	gender = request.getParameter("customRadioInline");
	fathername = request.getParameter("fathername");
	mothername = request.getParameter("mothername");
	nomineename = request.getParameter("nomineename");
	aadhar = request.getParameter("aadhar");
	phonenumber = request.getParameter("phonenumber");
	email = request.getParameter("email");
	password = request.getParameter("password");
	date = request.getParameter("date");
	address = request.getParameter("address");
	amount = Integer.parseInt(request.getParameter("amount"));
	out.println(" Gender : "+gender);
 
    if (holdername == "" || fathername == "" || mothername == "" || nomineename == "" || aadhar == "" || phonenumber == ""
			|| email == "" || password == "" || date == "" || address == "" || amount == 0||account_number==""||gender=="") {
		out.println("Fill each Field...........its manadatory.");

	} else {

		if (amount >= 1000) {
			Connection conn = BankDao.getConnection();
			PreparedStatement st = conn.prepareStatement(
			"insert into bank_account_create (accountholdername,fathername,mothername,gender,nomineename,aadhar,phonenumber,email,password,date,address,account_number,amount)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, holdername);
			st.setString(2, fathername);
			st.setString(3, mothername);
			st.setString(4, gender);
			st.setString(5, nomineename);
			st.setString(6, aadhar);
			st.setString(7, phonenumber);
			st.setString(8, email); 
			st.setString(9, password);
			st.setString(10, date);
			st.setString(11, address);
			st.setString(12, account_number);
			st.setInt(13,amount);
			int result = st.executeUpdate();
			if (result > 0) {
		      RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		      rd.forward(request,response);
			} else {
				RequestDispatcher rd1=request.getRequestDispatcher("accountcreatepage.jsp");
			      rd1.forward(request,response);
			}
		} else {
			out.println("<p style='color:red;'>Remember Amount less than 1000 is not acceptable.</p>");
	}
	}
	holdername = "";
	fathername = "";
	mothername = "";
	nomineename = "";
	aadhar = "";
	phonenumber = "";
	email = "";
	password = "";
	date = "";
	address = "";
	amount = 0;
	account_number="";
	gender="";
	%>
</body>
</html>