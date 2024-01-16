<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	color: rgb(230, 30, 230);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th {
	border: 1px solid black;
	background-color: #3498db;
	color: #fff;
	font-weight: bold;
	padding: 10px;
	text-align: left;
}

td {
	border: 1px solid black;
	padding: 10px;
}
a,button {

	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
}



form {
 display: flex;
 flex-direction: column;
 max-width: 400px;
 margin: 50px auto;
}

input[type="text"],
input[type="number"] {
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

<script>
function openIframe(id) {
    var overlay = document.createElement('div');
    overlay.style.position = 'fixed';
    overlay.style.top = '25%';
    overlay.style.left = '30%';
    overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
    overlay.style.zIndex = '9999';

  
    var iframe = document.createElement('iframe');
    iframe.src = "update.jsp?id=" + id;
    iframe.width = "600px";
    iframe.height = "400px";
    iframe.style.border = "none";
    iframe.style.overflow = "visible"; 

   
    var closeButton = document.createElement('button');
    closeButton.innerHTML = 'Close';
    closeButton.style.position = 'absolute';
    closeButton.style.top = '355px';
    closeButton.style.right = '42px';
    closeButton.style.zIndex = '10000';
    closeButton.addEventListener('click', function() {
        document.body.removeChild(overlay);
        window.location.href = "Display.jsp";
    });

    overlay.appendChild(iframe);
    overlay.appendChild(closeButton);
    document.body.appendChild(overlay);
}

</script>


	<%
	int id = 0;
	String name = null;
	double salary = 0;
	String place = null;
	Connection con = null;

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<h1>Employee Details</h1>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Salary</th>
				<th>Place</th>
				<th>Opt 1</th>
				<th>Opt2</th>
			</tr>
		</thead>
		<tbody>
			<%
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("select * from employee");
			while (set.next()) {
				id = set.getInt(1);
				name = set.getString(2);
				salary = set.getInt(3);
				place = set.getString(4);
			%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=salary%></td>
				<td><%=place%></td>
				<td><button onclick="openIframe('<%=id%>')">Edit</button>
				<a href="update.jsp?id=<%= id %>" class="edit-btn">Edit2</a></td>
				<td><a href="delete.jsp?idxy=<%= id %>" class="delete-btn">Delete</a>
				</td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>
	<form action="Home.html">
		<button type="submit">Back</button>
	</form>
</body>
</html>