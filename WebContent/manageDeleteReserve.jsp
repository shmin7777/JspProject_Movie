<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	 
	int no = Integer.parseInt(request.getParameter("no"));
	try{
		String sql ="update reservemovie set movieUse=? where no =?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"사용");
		pstmt.setInt(2,no);
		pstmt.executeUpdate();
		%>
			<script>
				alert('발권이 완료 되었습니다.');
				location.href='manageReserve.jsp';
			</script>
		<% 
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>