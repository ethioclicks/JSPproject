<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="css/Style.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
</head>

<body>
	<!-- ======= Navbar ======= -->
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#">SIMS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="RegisterStudent.jsp">Register Student</a></li>
				<li class="nav-item"><a class="nav-link" href="ViewStudent.jsp">View
						Student</a></li>
				<li class="nav-item"><a class="nav-link" href="Search.jsp">Search</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	<!-- End NavBar -->
	<br>
	<br>
	<div class="row" style="float: right; margin-right: 2vh;">
		<img alt="online-icon" src="icons/online.png" width="25" height="25">
		<%
		String uname = (String) session.getAttribute("uname");
		out.print(uname);
		%>
	</div>
	<!-- =======  Section ======= -->
	<div class="container">
	<h1 class="text-center;"><strong>Welcome to Student Information Management System</strong></h1><br>
		<div class="row">
			<br />
			<div class="col text-center">
				<h2>Dashboard</h2>
				<p>Counter</p>
			</div>
		</div>
		<div class="row text-center">
			<div class="col">
				<div class="counter">
					<i class="fa fa-user fa-3x"></i>
					<h2 class="timer count-title count-number">
					<%
				    try {
				        Class.forName("com.mysql.cj.jdbc.Driver");
				        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sims", "root", "484848");
				        Statement st = con.createStatement();
				        String query = "SELECT Count(Id) FROM userinfo";
				        ResultSet rs = st.executeQuery(query);
				        while (rs.next()) {
				            String total = rs.getString("count(Id)");
				            out.print(""+total+"");
				          }
				        }catch (Exception ex) {
				    	    out.print(ex.getMessage());
				    		}
					%>
					</h2>
					<p class="count-text ">Total Users</p>
				</div>
			</div>
			<div class="col">
				<div class="counter">
					<i class="fa fa-users fa-3x"></i>
					<h2 class="timer count-title count-number">
					<%
				    try {
				        Class.forName("com.mysql.cj.jdbc.Driver");
				        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sims", "root", "484848");
				        Statement st = con.createStatement();
				        String query = "SELECT Count(Id) FROM studentinfo";
				        ResultSet rs = st.executeQuery(query);
				        while (rs.next()) {
				            String total = rs.getString("count(Id)");
				            out.print(""+total+"");
				          }
				        }catch (Exception ex) {
				    	    out.print(ex.getMessage());
				    		}
					%>
					</h2>
					<p class="count-text ">Total Students</p>
				</div>
			</div>	
		</div>
		<br>
		<p id="menu">Menu:</p>
		<hr>
		<ul id="ulist">
			<li class="lBtn"><a href="RegisterStudent.jsp">Register Student</a></li>
			<li class="lBtn"><a href="ViewStudent.jsp">View Student</a></li>
			<li class="lBtn"><a href="Search.jsp">Search</a></li>
			<li class="lBtn"><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>
	<br>
	<br>
	<footer style="margin-top: 35vh;"> All Right Reserved </footer>
</body>
</html>