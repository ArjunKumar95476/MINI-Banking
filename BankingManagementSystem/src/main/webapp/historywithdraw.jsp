<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dao.BankDao,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>//Historywithdraw//</title>
</head>
<body>
<%

 String account_number=(String)session.getAttribute("account_number");
 String transaction_type=(String)session.getAttribute("transaction_type_credit");
 String amount=(String)session.getAttribute("amountwithdraw");
LocalDateTime localdatetime=LocalDateTime.now();
LocalDate localdate=localdatetime.toLocalDate();
String date=localdate.toString();
String ampm="AM";
int hour=localdatetime.getHour();
int minute=localdatetime.getMinute();
int second=localdatetime.getSecond();
if(hour>12)
{
	 hour=hour-12;
	 ampm="PM";
	 
}
 String time=hour+":"+minute+":"+second+" "+ampm;
 out.println(date+" "+time);
 out.println("Amount :"+amount+" transactiontype: "+transaction_type+" Account Number : "+account_number);

 if(account_number!=null&&transaction_type!=null&&amount!=null&&date!=null&&time!=null)
 {
	 Connection conn1=BankDao.getConnection();
		String query1="insert into transaction_history(account_number,transaction_type,amount,time,date) values(?,?,?,?,?)";
		PreparedStatement ps1=conn1.prepareStatement(query1);
		ps1.setString(1, account_number);
		ps1.setString(2,transaction_type);
		ps1.setString(3, amount);
		ps1.setString(4,time);
		ps1.setString(5, date);
	    int status=ps1.executeUpdate();
	    if(status!=0)
	    {
	    	RequestDispatcher rs=request.getRequestDispatcher("mainpage.jsp");
	    	rs.forward(request, response);
	    } 
 }
 else
 {
	 RequestDispatcher rs=request.getRequestDispatcher("mainpage.jsp");
 	rs.forward(request, response);
 }
%>
</body>
</html>