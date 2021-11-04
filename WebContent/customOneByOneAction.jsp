<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String id= (String)session.getAttribute("sid");
if(id==null){
	id="Guest";
}

//프로젝트내에 만들어질 폴더를 저장할 이름 변수선언
String realfolder="";
//실제 만들어질 폴더명을 설정
String savefolder = "/custom";
//한글설정
String encType="utf-8";
//저장될 파일 사이즈를 설정
int maxSize=1024*1024*5;//5mega

//파일이 저장될 경로값을 읽어오는 객체
ServletContext context = getServletContext();
/* realfolder = context.getRealPath(savefolder); */
realfolder = request.getSession().getServletContext().getRealPath("/");
 String savePath = realfolder + "custom";

try{
	//클라이언트로부터 넘어온 데이터를 저장해주는 객체
	MultipartRequest multi= new MultipartRequest(request,savePath,maxSize,encType,
			new DefaultFileRenamePolicy());//파일이름 변경을 자동으로 해주는 클래스
			
			
	String title=multi.getParameter("title");
	String content=multi.getParameter("content");
	
	String fileImg=multi.getOriginalFileName("fileImg");
	
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String sql2 = "select now()";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	String date = rs2.getString(1).substring(0, 10);
	
	String sql="insert into oneByOne values(null,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setString(4, fileImg);
	pstmt.setString(5, date);
	pstmt.setString(6,null);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	%>
	
	<script>
		alert('등록이 완료되었습니다. 나의 문의 내역에서 확인해주세요.');
		location.href='customNotice.jsp';
	</script>
		
	<%
}catch(Exception e){
	e.printStackTrace();
}

	
	


	
	
%>	
</body>
</html>