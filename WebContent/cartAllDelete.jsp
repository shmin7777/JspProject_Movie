<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String ctNo =request.getParameter("ctNo");
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	try{
		String sql="delete from cart where ctNo=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, ctNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
		response.sendRedirect("showCart.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>