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
	int no = Integer.parseInt(request.getParameter("no"));
	int qty = Integer.parseInt(request.getParameter("qty"));
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String sql = "select * from giftValue where reserveSnack_no=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, no);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int snackQty = rs.getInt(4);
	
	int cnt = snackQty- qty;
	
	String sql2 = "update giftValue set snackQty=? where reserveSnack_no=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setInt(1, cnt);
	pstmt2.setInt(2, no);
	pstmt2.executeUpdate();
	
	if(cnt<=0){
		String sql3 = "delete from giftvalue where reserveSnack_no=?";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setInt(1, no);
		pstmt3.executeUpdate();
	}
	
	
	
	
%>
<script>
	alert('<%=qty%>개를 사용하였습니다.');
	location.href='manageGift.jsp';
</script>
</body>
</html>