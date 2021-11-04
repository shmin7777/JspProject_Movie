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
     <script language="javascript" src="javascript/manage.js"></script>
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

    <div class="movieInsert">
        <h1>영화등록</h1>
        <form enctype="multipart/form-data" method="post" action="manageInsertMovieAction.jsp" name="insertMovie">
            <table border="1" width="700">
                <tr>
                	<td>영화제목</td>
                	<td><input type="text" name="movieTitle"></td>
                </tr>
                <tr>
                	<td>영화감독</td>
                	<td><input type="text" name="director"></td>
                </tr>
                <tr>
                	<td>프로듀서</td>
                	<td><input type="text" name="producer"></td>
                </tr>
                <tr>
                	<td>배우</td>
                	<td><input type="text" name="actor"></td>
                </tr>
                <tr>
                	<td>장르</td>
                	<td>
                		<select name="genre" class="select1">
                			<option value="액션">액션</option>
                			<option value="SF">SF</option>
                			<option value="드라마">드라마</option>
                			<option value="코미디">코미디</option>
                			<option value="공포">공포</option>
                		</select>
                	</td>
                </tr>
                <tr>
                	<td>기본</td>
                	<td><input type="text" name="basic"></td>
                </tr>
                <tr>
                	<td>개봉날짜</td>
                	<td><input type="text" name="premiere"></td>
                </tr>
                <tr>
                	<td>영화사진</td>
                	<td><input type="file" name="img"></td>
                </tr>
                <tr>
                	<td>스틸컷1</td>
                	<td><input type="file" name="steel1"></td>
                </tr>
                <tr>
                	<td>스틸컷2</td>
                	<td><input type="file" name="steel2"></td>
                </tr>
                <tr>
                	<td>스틸컷3</td>
                	<td><input type="file" name="steel3"></td>
                </tr>
                <tr>
                	<td>줄거리</td>
                	<td><textarea rows="20" cols="60" name="summary"></textarea></td>
                </tr>
                <tr>
                	<td>예고편경로</td>
                	<td><input type="text" name="iframe"></td>
                </tr>	
              	<tr>
              		<td colspan="2" width="100px"><input type="button" value="등록" onclick="insertMovieCheck()"></td>
            </table>
        </form>
    </div>
</body>
</html>