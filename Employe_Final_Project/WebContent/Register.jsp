<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-bottom: 8px;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
}

button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<form action="Register.jsp">
		<label for="id">ID:</label> <input type="text" id="id" name="id"
			required> <label for="name">Name:</label> <input type="text"
			id="name" name="name" required> <label for="salary">Salary:</label>
		<input type="text" id="salary" name="salary" required> <label
			for="place">Place:</label> <input type="text" id="place" name="place"
			required>

		<button type="submit">Submit</button>
		<br>
	</form>
	<form action="Home.html">
		<button type="submit">Back</button>
	</form>



</body>
<%
int id = 0;
String name = null;
double salary = 0;
String place = null;
Connection con = null;

try {

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");

	String id1 = request.getParameter("id");
	int idx = Integer.parseInt(id1);
	String name1 = request.getParameter("name");
	String salary1 = request.getParameter("salary");
	double salaryx = Double.parseDouble(salary1);
	String place1 = request.getParameter("place");

	CallableStatement csmt = con.prepareCall("insert into employee values (?,?,?,?)");
	csmt.setInt(1, idx);
	csmt.setString(2, name1);
	csmt.setDouble(3, salaryx);
	csmt.setString(4, place1);
	csmt.execute();

} catch (Exception e) {
	e.printStackTrace();
}
%>

</html>