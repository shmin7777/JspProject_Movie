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
	int no = Integer.parseInt(request.getParameter("no"));
	int movieID=Integer.parseInt(request.getParameter("movieID"));
	String movieTitle="";
	System.out.println(movieTitle);
	double gradeAvg=0;
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String sql="delete from movieGrade where no=?";
	
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setInt(1, no);
	pstmt.executeUpdate();
	
	String sql2 = "select movieTitle from movie where movieID=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setInt(1, movieID);
	ResultSet rs2 = pstmt2.executeQuery();
	if(rs2.next()){
		movieTitle=rs2.getString(1);
	}
	
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
	pstmt4.setInt(2, movieID);
	pstmt4.executeUpdate();
	
	pstmt.close();
	con.close();
	
%>
<script>
	location.href='movieDetail.jsp?movieID=<%=movieID%>';
</script>
</body>
</html>