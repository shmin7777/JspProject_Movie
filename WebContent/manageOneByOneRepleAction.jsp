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
	String reple =request.getParameter("reple");
	int no = Integer.parseInt(request.getParameter("no"));
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	try{
		String sql="update oneByOne set reple=?  where no=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,reple);
		pstmt.setInt(2, no);
		pstmt.executeUpdate();
		
	%>
		<script>
			alert('답변등록이 완료되었습니다.');
			location.href='manageOneByOne.jsp';
		</script>
	<% 
	
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>