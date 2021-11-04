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
request.setCharacterEncoding("UTF-8");
PrintWriter script = response.getWriter();
String id = (String)session.getAttribute("sid");  
if(id==null){
	id="Guest";
}

if(id.equals("Guest")){
	script.println("<script>");
	script.println("alert('로그인이 필요한 서비스입니다.')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}else{
	 try {
		String dburl="jdbc:mysql://localhost:3306/movieStore";
	 	String dbid="root";
	 	String dbpassword="1234";
 	 
	 	Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);

		String ctNo = session.getId();  
		int snack_no=Integer.parseInt(request.getParameter("snack_no"));
		int snackQty = Integer.parseInt(request.getParameter("snackQty")); 


		
		String jsql = "select * from cart where ctNo = ? and snack_no = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ctNo);
		pstmt.setInt(2, snack_no);
		ResultSet rs = pstmt.executeQuery(); 

	   	if(rs.next())   // 동일 상품이 이미 장바구니에 존재한다면 수량만을 추가시킴.
		{		               
			int sum = rs.getInt(3) + snackQty;  

			String jsql2 = "update cart set snackQty=? where ctNo=? and snack_no=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setInt(3, snack_no);

			pstmt2.executeUpdate();
		}
		else  // 동일 상품이 장바구니에 존재하지 않는다면, 새로운 상품레코드를 장바구니 테이블에 추가시킴
		{
			String jsql3 = "insert into cart (ctNo, snack_no, snackQty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setInt(2,snack_no);
			pstmt3.setInt(3,snackQty);	

			pstmt3.executeUpdate();
		} 
	 } 	catch(Exception e)  {
             out.println(e);
    }  	

      
	    response.sendRedirect("showCart.jsp");  
}                                       
%>
</body>
</html>