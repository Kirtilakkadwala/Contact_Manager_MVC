<%@page import="java.util.List"%>
<%@page import="com.jspiders.contact_manager_mvc.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Contact> allContacts = (List<Contact>) request.getAttribute("allContacts");
String deleted = (String) request.getAttribute("deleted");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

.top {
	width: 100%;
	position: fixed;
	top: 0;
	z-index:1;
}

.bottom {
	width: 100%;
}

table {
	margin: 15px auto 15px auto;
	width: auto;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 15px auto 15px auto;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

td:last-child {
	text-align: center;
}

.edit-btn {
	padding: 5px 10px;
	background-color: #4caf50;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s;
	z-index:1;
}

.edit-btn:hover {
	background-color: #45a049;
}

.delete-btn {
	padding: 5px 10px;
	background-color: #ff0000;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s;
	z-index:1;
}

.delete-btn:hover {
	background-color: red;
}

img {
	width: 50px;
	height: 50px;
	border-radius: 25px;
}

.middle {
	position: relative;
	top: 150px;
	height: 100vh;
	z-index: 0;
}
</style>
</head>
<body>
	<%
	if (deleted != null) {
	%>
	<script type="text/javascript">
		alert("Contact removed!");
	</script>
	<%
	}
	%>
	<section class="top">
		<header>
			<h1>Contact Manager</h1>
		</header>
		<nav>
			<a href="./home">Home</a> <a
				href="./add">Add Contact</a>
				<a href="./search">Search Contact</a>
		</nav>
	</section>
	<%if (allContacts != null){ %>
	<section class="middle">
		<table>
			<thead>
				<tr>
					<th>Image</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Mobile Number</th>
					<th>Email Address</th>
					<th>Company Name</th>
					<th>Group</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Contact contact : allContacts) {
				%>
				<tr>
					<td><img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhY11rbwMXian4kyQvYMtQbGVL3wbT9uEhDCVLKFyUo56GyftfxVGh5iW2WmvqPP7HCcY&usqp=CAU"
						alt="Profile Picture"></td>
					<!-- <td><img alt="profile image" src="C:/Users/Dhananjay/Desktop/J2EE Workspaces/JWA-JFFADD-E1/contactmanager_mvc/src/main/resources/images/male.jpg"> </td> -->
					<td><%=contact.getFirstName()%></td>
					<td><%=contact.getLastName()%></td>
					<td><%=contact.getMobileNumber()%></td>
					<td><%=contact.getEmail()%></td>
					<td><%=contact.getCompany()%></td>
					<td><%=contact.getGroup()%></td>
					<td><a class="edit-btn" href="./edit?id=<%=contact.getId()%>">Edit</a>
						<a class="delete-btn" href="./delete?id=<%=contact.getId()%>">Delete</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</section>
	<%} else { %>
		<script type="text/javascript">
			alert("No contacts found");
		</script>
	<%} %>
	<section class="bottom">
		<footer>
			<p>&copy; 2024 Contact Manager</p>
		</footer>
	</section>
</body>
</html>