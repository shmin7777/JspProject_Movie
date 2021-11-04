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

String title = request.getParameter("title");
String content = request.getParameter("content");
String date="";
String dburl="jdbc:mysql://localhost:3306/movieStore";
String dbid="root";
String dbpassword="1234";

Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);

try{
	String sql = "select now()";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	date=rs.getString(1);
	
	String sql2 = "insert into noticeList values(null,?,?,?,?)";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1,title);
	pstmt2.setString(2, content);
	pstmt2.setString(3,date);
	pstmt2.setInt(4,0);
	pstmt2.executeUpdate();
	
	pstmt.close();
	con.close();
	response.sendRedirect("manageHome.jsp");
	
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>