<%@page import="java.util.List"%>
<%@page import="com.jspiders.contact_manager_mvc.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Contact> allContacts = (List<Contact>) request.getAttribute("allContacts");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Manager</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	background-color: #f4f4f4;
	padding: 0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
}

nav {
	background-color: #666;
	padding: 10px;
	text-align: center;
}

nav a {
	color: #fff;
	text-decoration: none;
	margin: 0 10px;
}

.search-group {
	color: black;
	text-decoration: none;
	margin: 0 10px;
	z-index: 1;
}

.search-group:hover {
	text-decoration: underline;
}

nav a:hover {
	text-decoration: underline;
}

footer {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.form-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.form-container img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-bottom: 20px;
}

.form-container input[type="text"], .form-container input[type="email"],
	.form-container input[type="tel"], .form-container select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.form-container input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 10px
}

.form-container input[type="submit"]:hover {
	background-color: #45a049;
}

.top {
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 1;
}

.middle {
	position: fixed;
	margin-left: 35%;
}

.bottom {
	width: 100%;
}
</style>
</head>
<body>
	<section class="top">
		<header>
			<h1>Contact Manager</h1>
		</header>
		<nav>
			<a href="./home">Home</a> <a
				href="./contacts">Contacts</a>
			<a href="./add">Add
				Contact</a>
		</nav>
	</section>
	<section class="middle">
		<div class="container">
			<div class="form-container">
				<form action="./search" method="post">
					<label>Search By </label> <select name="searchType">
						<option value="firstName">First Name</option>
						<option value="lastName">Last Name</option>
						<option value="mobileNumber">Mobile Number</option>
						<option value="email">Email</option>
						<option value="company">Company</option>
					</select> <br> <label>Enter value </label> <input type="text"
						name="searchValue"> <input type="submit" value="Search"> <br>
					<a class="search-group" href="./searchByGroup">Search by group</a>
				</form>
			</div>
		</div>
	</section>
	<section class="bottom">
		<footer>
			<p>&copy; 2024 Contact Manager</p>
		</footer>
	</section>
</body>
</html>