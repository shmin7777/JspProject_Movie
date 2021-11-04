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

String ctg = request.getParameter("faqCtg");
String title = request.getParameter("title");
String content = request.getParameter("content");

String dburl="jdbc:mysql://localhost:3306/movieStore";
String dbid="root";
String dbpassword="1234";

Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);

try{
	
	String sql2 = "insert into faq values(null,?,?,?)";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1,ctg);
	pstmt2.setString(2, title);
	pstmt2.setString(3,content);
	
	pstmt2.executeUpdate();
	
	pstmt2.close();
	con.close();
	response.sendRedirect("manageHome.jsp");
	
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>