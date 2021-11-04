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
     <script language="javascript" src="javascript/manage.js"></script>
     <style>
     	td{
     		padding: 15px;
     	}
     </style>
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
    <%
    	request.setCharacterEncoding("UTF-8");
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	String dburl="jdbc:mysql://localhost:3306/movieStore";
    	String dbid="root";
    	String dbpassword="1234";
    	String selected[] = new String[5];
    	try {
    		Class.forName("org.gjt.mm.mysql.Driver");
    		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
    		String sql = "select * from FAQ where no=?";
    		PreparedStatement pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1,no);
    		ResultSet rs = pstmt.executeQuery();
    		if(rs.next()){
    			if(rs.getString(2).equals("영화예매"))selected[0]="selected";
    			else if(rs.getString(2).equals("할인혜택"))selected[1]="selected";
    			else if(rs.getString(2).equals("결제수단"))selected[2]="selected";
    			else if(rs.getString(2).equals("스토어"))selected[3]="selected";
    			else if(rs.getString(2).equals("회원"))selected[4]="selected";
    %>
    	<div style="height: 830px; overflow: auto;">
    		<div class="movieInsert">
        <h1>FAQ 수정</h1>
        <form  method="post" action="manageUpdateFAQAction.jsp">
       
            <table border="1" width="700">
                
      				 <tr>
                	<td>구분</td>
                	<td>
                		<select name="faqCtg" class="select1">
                			<option value="영화예매" <%=selected[0] %>>영화예매</option>
                			<option value="할인혜택" <%=selected[1] %>>할인혜택</option>
                			<option value="결제수단" <%=selected[2] %>>결제수단</option>
                			<option value="스토어" <%=selected[3] %>>스토어</option>
                			<option value="회원" <%=selected[4] %>>회원</option>
                		</select></td>
                </tr>
                <tr>
                	<td>제목</td>
                	<td><input type="text" name="title" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                	<td>내용</td>
                	<td><textarea name="content" maxlength="2048" style="width: 600px;height: 300px;"><%=rs.getString(4) %></textarea></td>
                </tr>
                
              	<tr>
              		<td colspan="2" width="100px">
            	
              		<input type="hidden" name="no1" value="<%=no %>">
              		<input type="submit" value="수정하기" >
              		</td>
              	</tr>
            </table>
             
        </form><br><br><br>
        <input type="button" value="목록" onclick="location.href='manageFAQ.jsp'" style="padding: 13px 75px; text-align: center;">
    </div>
    </div>
    <%			
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