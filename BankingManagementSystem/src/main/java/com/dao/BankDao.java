package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class BankDao {

	private static String dburl="jdbc:mysql://localhost:3306/bank";
	private static String dbusername="root";
	private static String dbpassword="arjun";
	private static String dbdriver="com.mysql.jdbc.Driver";
	
	//connection function
	public static Connection getConnection()
	{
		Connection conn=null;
		try
		{
			//load driver
			Class.forName(dbdriver);
			// create connection
			conn=DriverManager.getConnection(dburl,dbusername,dbpassword);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return conn;
	}
}
