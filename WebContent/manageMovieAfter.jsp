<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" type="text/css" href="css/manage.css">
</head>
<body>
<%
	Date date=new Date();
	String cur=date.toLocaleString();
%>
    <div class="header">
        <div class="head">
            <div class="log">
                <ul>
                    
                    <li>
                        <a href="logout.jsp"> 로그아웃</a>
                    </li>
                    <li>
                        <a href="manageHome.jsp">Home</a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </div>

    <div class="nav">
        <div class="box">
            <div class="admin">
                <div class="text">
                    관리자님<br>
                    접속시간 : <%=cur %>
                    <br>
                    <button onclick="location.href='logout.jsp'">로그아웃</button>
                 </div>
                
            </div>
            <div class="menu">
                <div class="text1">
                    정보관리
                </div>
                 <div class="menu1">
                    <div class="manage">
                       <ul>
                            <a href="manageUser.jsp"><li>회원관리</li></a>
                            <a href="manageMovie.jsp"><li>영화관리</li></a>
                            <a href="manageReserve.jsp"><li>영화관람정보</li></a>
                            <a href="manageMovieAfter.jsp"><li>상영예정작정보</li></a>
                            <a href="manageSnack.jsp"><li>스낵관리</li></a>
                            <a href="manageReserveSnack.jsp"><li>스낵사용정보</li></a>
                            <a href="manageGift.jsp"><li>선물사용관리</li></a>
                        </ul>
                    </div>
                </div><br>
                <div class="text1">
                    정보등록<br>
                </div><br>
                <div class="menu2">
                    <div class="manage">
                        <ul>
                            <a href="manageInsertMovie.jsp"><li>영화등록</li></a>
                            <a href="manageInsertSnack.jsp"><li>스낵등록</li></a>
                            <a href="manageInsertNotice.jsp"><li>공지사항등록</li></a>
                            <a href="manageInsertFAQ.jsp"><li>FAQ등록</li></a>
                            <a href="manageInsertMovieAfter.jsp"><li>상영예정작등록</li></a>
                        </ul>
                    </div>
                </div><br>
                <div class="text1">
                    고객센터<br>
                </div><br>
                <div class="menu1" style="height: 140px;">
                    <div class="manage">
                        <ul>
                            <a href="manageNotice.jsp"><li>공지사항</li></a>
                            <a href="manageFAQ.jsp"><li>FAQ</li></a>
                            <a href="manageOneByOne.jsp"><li>1대1문의</li></a>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div style="height: 830px; overflow: auto;">
<table width="1000" class="selectCurMovie" >
<tr height="100" >
	<td align="center" colspan="6">
		<font size="8" color="gray"> <a href="#">전체 영화보기</a> </font>
	</td>
</tr>
<tr bgcolor="pink">
	<td>번호</td><td>영화제목</td><td>장르</td><td>평점</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
/* String search= request.getParameter("search"); */
String dburl="jdbc:mysql://localhost:3306/movieStore";
String dbid="root";
String dbpassword="1234";
int count=0;
try {
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	String sql2="select count(*) from movieafter";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = pstmt2.executeQuery();
	if(rs2.next()){
		count=rs2.getInt(1);
	}


	
	String sql="select * from movieafter";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
	
%>
<tr>
	<td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(6) %></td>
	<td><%if(rs.getString(15).length()<=3){out.println(rs.getString(15));}
	      else {out.println(rs.getString(15).substring(0, 3));}%></td><td><a href="manageUpdateMovieAfter.jsp?movieID=<%=rs.getInt(1)%>">YES</a></td><td><a href="#">YES</a></td>
</tr>
<%		}
	}catch(Exception e){
		e.printStackTrace();
	}%>
<tr>
	<td colspan="4"></td>
	<td>총 영화수</td><td><%=count %></td>
</tr>	

</table>
</div>
</body>
</html>