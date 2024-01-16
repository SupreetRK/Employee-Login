<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    try {
   
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");

        int id = Integer.parseInt(request.getParameter("id"));

        String query = "delete from employee where id=?";
        PreparedStatement  pstmt = con.prepareStatement(query);
       pstmt.setInt(1, id);
       
      pstmt.execute();
      
     RequestDispatcher rd=request.getRequestDispatcher("Display.jsp");
     rd.forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
    } 
    
%>
</body>
</html>