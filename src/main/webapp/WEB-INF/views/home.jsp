<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Manager</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

header {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
}

h1 {
	margin: 0;
}

nav {
	background-color: #4c5517;
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

section {
	text-align: center;
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

.top {
	left: 0;
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 1;
}

.middle {
	margin-top: 300px;
	width: auto;
}

.bottom {
	left: 0;
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
			<a href="./contacts">Contacts</a>
			<a href="./add">Add Contact</a>
			<a href="./search">Search Contact</a>
		</nav>
	</section>
	<section class="middle">
		<h1>Welcome to Contact Manager</h1>
		<p>This is a simple contact manager application.</p>
		<p>You can use it to manage your contacts, add new contacts, edit
			existing ones, and delete contacts as needed.</p>
	</section>
	<section class="bottom">
		<footer>
			<p>&copy; 2024 Contact Manager</p>
		</footer>
	</section>

</body>
</html>