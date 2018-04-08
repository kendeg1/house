<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! //session
	String dbUsername;
	String dbPassword;
%>
<%
	try {

		//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336projectlogindb.cocvlvd1pff0.us-east-1.rds.amazonaws.com/cs336ProjectLoginDb?" +
				                                   "user=monkeyGroup&password=monkey123");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//help from https://www.roseindia.net/jsp/jsp-login-form-with-mysql-database-connection-and-back-end-validation.shtml
		
		
		String username = request.getParameter("newUser");
		String pw = request.getParameter("newPw");
		//will add more test cases later
		if(pw.equals("")||username.equals("")||pw.equals(null)||username.equals(null)){
			response.sendRedirect("invalidUser.jsp");
			con.close();
		}
		String str = String.format("SELECT * FROM user WHERE username='%s'",username);
		out.println(str);
		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
		
		//if sql returns data, the username is already in use
		if(result.next()){
			response.sendRedirect("invalidUser.jsp");
			con.close();
		} else {
			
			//jsp string template
			String insert = "INSERT INTO user(username, pw)"
					+ "VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, pw);
			//Run the query against the DB
			ps.executeUpdate();
			response.sendRedirect("login.jsp");
			out.print("insert succeeded");
			con.close();
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>