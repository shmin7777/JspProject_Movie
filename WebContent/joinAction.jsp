<%@page import="java.io.PrintWriter"%>
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
	PrintWriter script = response.getWriter();
	request.setCharacterEncoding("UTF-8");
	
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
	
	
	String id= request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	String email = request.getParameter("email");
	String joomin1 =request.getParameter("joomin1");
	String joomin2 =request.getParameter("joomin2");
	String joomin=joomin1+"-"+joomin2;
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	boolean idcheck =false;
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		String sql="insert into user values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2,password);
		pstmt.setString(3,name);
		pstmt.setString(4,gender);
		pstmt.setString(5,phone);
		pstmt.setString(6,email);
		pstmt.setString(7,joomin);
		pstmt.executeUpdate();
		idcheck = true;
		
		pstmt.close();
		con.close();
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	if(idcheck){
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
			String sql="insert into userGrade values(?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "일반");
			pstmt.setInt(3, 0);
			pstmt.setInt(4,0);
			pstmt.setInt(5, 0);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("alert('존재하는 아이디 입니다')");
		script.println("history.go(-1)");
		script.println("</script>");
	}
%>
</body>
</html>