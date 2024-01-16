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
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
}

form {
	display: flex;
	flex-direction: column;
	max-width: 400px;
	margin: 50px auto;
}

input[type="text"], input[type="number"] {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	
	
	<form action="update.jsp">

		<label for="name">ID:</label><br> <input type="text" name="idy"><br>

		<label for="name">Name:</label><br> <input type="text"
			name="namey"><br> <label for="salary">Salary:</label><br>
		<input type="text" name="salaryy"><br> <label for="place">Place:</label><br>
		<input type="text" name="placey"><br>
		<br> <input type="submit" value="Submit">
	</form>

	<%
	
	Connection con;

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");
		
		String id1=request.getParameter("idy");
		int idx=Integer.parseInt(id1);
		
		
		String name1=request.getParameter("namey");
		String salary1=request.getParameter("salaryy");
		double salaryx=Double.parseDouble(salary1);
		String place1=request.getParameter("placey");
		
		CallableStatement csmt=con.prepareCall("update employee set Name=?,Salary=?,Place=? where ID=?");
		
		csmt.setString(1,name1);
		csmt.setDouble(2, salaryx);
		csmt.setString(3, place1);
		csmt.setInt(4, idx);
		csmt.executeUpdate();	

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
	
</body>
</html>