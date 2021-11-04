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
request.setCharacterEncoding("utf-8");
String title=request.getParameter("title");
String content = request.getParameter("content");
int no = Integer.parseInt(request.getParameter("no1"));

String dburl="jdbc:mysql://localhost:3306/movieStore";
String dbid="root";
String dbpassword="1234";

Class.forName("org.gjt.mm.mysql.Driver");
Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);

try{
String sql="update noticeList set noticeTitle=?, noticeSubject=? where no=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.setInt(3,no);
pstmt.executeUpdate();


response.sendRedirect("manageNotice.jsp");
}catch(Exception e){
	e.printStackTrace();
}




%>
</body>
</html>