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
	request.setCharacterEncoding("UTF-8");
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
	}else if(sid==null||sid.equals("Guest")){
	
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		String id=request.getParameter("id");
		String pass=request.getParameter("password");

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
			String sql="select password from manageUser where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				if(pass.equals(rs.getString(1))){
					session.setAttribute("m_id", id);
					response.sendRedirect("manageHome.jsp");
				}else{
					script.println("<script>");
					script.println("alert('비밀번호가 다릅니다. 다시한번 확인해 주세요')");
					script.println("history.back()");
					script.println("</script>");
		
				}
			}else{
				script.println("<script>");
				script.println("alert('일치하는 아이디가 없습니다.')");
				script.println("history.back()");
				script.println("</script>");
	
				
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>