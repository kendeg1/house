<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="login.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
  <title>Create User</title>
</head>
 <body class="bg-info">
 <div class="container">
  	<form method="post" action="createAttempt.jsp">
  	<b>Username</b>
    <input type="text" name = "newUser" placeholder="Enter Username">

   	<b>Password</b>
    <input type="password" name = "newPw" placeholder="Enter Password">

    <button class="btn btn-block btn-primary active" type="submit" value="submit">Create Account</button>
  	</form>
  </div>
</body> 
</html>