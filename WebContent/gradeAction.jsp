<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
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
	PrintWriter script = response.getWriter();
	request.setCharacterEncoding("utf-8");
	int grade=Integer.parseInt(request.getParameter("grade"));
	String gradeContent = request.getParameter("gradeContent");
	String id=(String)session.getAttribute("sid");
	String date="";
	if(id==null){
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	String movieTitle= request.getParameter("movieTitle");
	String movieID=request.getParameter("movieID");
	
	double gradeAvg=0;
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		String sql2="select now()";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		ResultSet rs = pstmt2.executeQuery();
		if(rs.next())
			date=rs.getString(1);
		

		
		String sql="insert into movieGrade values(null,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, movieTitle);
		pstmt.setInt(2, grade);
		pstmt.setString(3, id);
		pstmt.setString(4, date);
		pstmt.setString(5, gradeContent);
		pstmt.executeUpdate();
		
		
		String sql3="select avg(grade) from movieGrade where movieTitle=?";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setString(1, movieTitle);
		ResultSet rs3 = pstmt3.executeQuery();
		if(rs3.next()){
			gradeAvg=rs3.getDouble(1);
		}
		
		String sql4="update movie set grade=? where movieID=?";
		PreparedStatement pstmt4 = con.prepareStatement(sql4);
		pstmt4.setDouble(1, gradeAvg);
		pstmt4.setString(2, movieID);
		pstmt4.executeUpdate();
		
		rs.close();
		pstmt.close();
		con.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	location.href='movieDetail.jsp?movieID=<%=movieID%>';
</script>
</body>
</html>