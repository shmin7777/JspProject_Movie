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
	request.setCharacterEncoding("utf-8");
	PrintWriter script = response.getWriter();
	
	String sid=null;
	
	if((String)session.getAttribute("sid")!=null){
		sid=(String)session.getAttribute("sid");
	}
	if(sid!=null){
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	String id =request.getParameter("id");
	String password = request.getParameter("password");
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		String sql="select password from user where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			if(rs.getString(1).equals(password)){
				session.setAttribute("sid", id);
				script.println("<script>");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다')");
				script.println("history.back()");
				script.println("</script>");
			}
		}else{
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		rs.close();
		pstmt.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>