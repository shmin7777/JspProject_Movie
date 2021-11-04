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
	

//프로젝트내에 만들어질 폴더를 저장할 이름 변수선언
String realfolder="";
//실제 만들어질 폴더명을 설정
String savefolder = "/images";
//한글설정
String encType="utf-8";
//저장될 파일 사이즈를 설정
int maxSize=1024*1024*5;//5mega

//파일이 저장될 경로값을 읽어오는 객체
ServletContext context = getServletContext();
realfolder = request.getSession().getServletContext().getRealPath("/");
String savePath = realfolder + "movieAfterImages";

try{
	//클라이언트로부터 넘어온 데이터를 저장해주는 객체
	MultipartRequest multi= new MultipartRequest(request,savePath,maxSize,encType,
			new DefaultFileRenamePolicy());//파일이름 변경을 자동으로 해주는 클래스
			
	int movieID =Integer.parseInt(multi.getParameter("movieID"));		
	String movieTitle=multi.getParameter("movieTitle");
	String director=multi.getParameter("director");
	String producer=multi.getParameter("producer");
	String actor=multi.getParameter("actor");	
	String genre=multi.getParameter("genre");	
	String basic=multi.getParameter("basic");	
	String premiere=multi.getParameter("premiere");	
	String img=multi.getOriginalFileName("img");
	String steel1=multi.getOriginalFileName("steel1");
	String steel2=multi.getOriginalFileName("steel2");
	String steel3=multi.getOriginalFileName("steel3");
	String summary=multi.getParameter("summary");
	String iframe = multi.getParameter("iframe");
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	String sql="update movie set movieTitle=?, director=?, producer=?, actor=?, genre=?, basic=?, premiere=?, img=?,"+ 
				"steel1=?, steel2=?, steel3=?, summary=?, iframe=? where movieID=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, movieTitle);
	pstmt.setString(2, director);
	pstmt.setString(3, producer);
	pstmt.setString(4, actor);
	pstmt.setString(5, genre);
	pstmt.setString(6, basic);
	pstmt.setString(7, premiere);
	pstmt.setString(8, img);
	pstmt.setString(9, steel1);
	pstmt.setString(10, steel2);
	pstmt.setString(11, steel3);
	pstmt.setString(12, summary);
	pstmt.setString(13, iframe);
	pstmt.setInt(14,movieID);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	response.sendRedirect("manageHome.jsp");
	
	
}catch(Exception e){
	e.printStackTrace();
}

	
	


	
	
%>	
</body>
</html>