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

.radio-options {
	text-align: center;
}

.label {
	text-align: center;
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

.form-container input[type="text"] {
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
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 160px;
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
				<form action="./searchByGroup" method="post">
					<div class="label">
						<label> <h2>Select group</h2> </label>
					</div>
					<div class="radio-options">
						<label>Friends <input type="radio" name="group"
							value="Friends">
						</label> <label>Family <input type="radio" name="group"
							value="Family">
						</label> <label>Colleague <input type="radio" name="group"
							value="Colleague">
						</label> <label>None <input type="radio" name="group" value="None">
						</label>
					</div>
					<div class="search-btn">
						<input type="submit" value="Search">
					</div>
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