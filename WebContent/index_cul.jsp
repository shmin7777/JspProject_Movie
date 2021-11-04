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
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	int numMovie=Integer.parseInt(request.getParameter("numMovie"));
	
	String selectSnack = request.getParameter("selectSnack");
	
	int myGrade= Integer.parseInt(request.getParameter("myGrade"));	
	
	String  checkSale[] = request.getParameterValues("checkSale");
	
	int moviePrice= numMovie*12000; //영화가격
	
	int snackPrice=0;  //스낵가격
	if(!selectSnack.equals("0")){
		String sql = "select * from snack where snack_no=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, selectSnack);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		snackPrice=rs.getInt(6);
	}
	
	
	
	
	double total =0;
	if(checkSale!=null){
		if(checkSale.length==2){
			total = (int)(moviePrice*0.9+snackPrice)*((100-(myGrade+5))/100.0);
		}else if(checkSale.length==1){
			if(checkSale[0].equals("10")){
				total = (int)(moviePrice*0.9+snackPrice)*((100-myGrade)/100.0);
			}else{
				total = (moviePrice+snackPrice)*((100-(myGrade+5))/100.0);
			}
		}
	}else{
		total = (moviePrice+snackPrice)*((double)((100-myGrade)/100.0));
	}
	
	int price = (int)(total);
	%>
	<script>
		location.href="index.jsp?snack_no=<%=selectSnack%>&&total=<%=price%>#changeSnack";
	</script>
</body>
</html>