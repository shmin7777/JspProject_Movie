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
    <form method="post" action="manageGift.jsp">
<div style="height: 830px; overflow: auto;">
<table width="1000" class="selectCurMovie" >
<tr height="100" >
	<td align="center" colspan="4">
		<font size="8" color="gray"> <a href="manageGift.jsp">선물함 관리</a> </font>
	</td>
	<td>
		<input type="text" name="lookID" placeholder="받은ID" size="10">&nbsp;&nbsp;<input type="submit" value="검색">
	</td>
</tr>
<tr bgcolor="pink">
	<td width="30%">선물 정보</td><td>수량</td><td>보낸ID</td><td>받은ID</td><td width="20%">사용하기</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
/* String search= request.getParameter("search"); */
String dburl="jdbc:mysql://localhost:3306/movieStore";
String dbid="root";
String dbpassword="1234";
int count=0;
String lookID = request.getParameter("lookID");
try {
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	PreparedStatement pstmt=null;
	if(lookID==null){
		String sql = "select * from giftValue as a  join gift as b on a.reserveSnack_no= b.reservesnackNo and b.useGift=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "미사용");
	}else{
		String sql = "select * from giftValue as a  join gift as b on a.reserveSnack_no= b.reservesnackNo and b.useGift=? and b.giver=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "미사용");
		pstmt.setString(2, lookID);
	}
	
	ResultSet rs = pstmt.executeQuery();
	boolean plag= true;
	
	while(rs.next()){
	int snackNo = rs.getInt(3);
	String sql2 = "select * from snack where snack_no=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setInt(1, snackNo);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	String snackName= rs2.getString(2);
	plag = false;
	if(!snackName.equals("영화관람권")){
%>		
	<tr>
		<td><%=snackName %></td><td><span id="snackQty<%=rs.getInt(1) %>"><%=rs.getInt(4) %></span></td>
		<td><%=rs.getString(7) %></td><td><%=rs.getString(8) %></td>
		<td><input type="text" id="no<%=rs.getInt(1) %>" size=4>개
		<input type="hidden" name="no" value="<%=rs.getInt(1) %>">
		<input type="button" value="사용하기" style="padding:8px 20px;" onclick="goUse('<%=rs.getInt(1) %>');"></td>
	</tr>
<%
	}


	}///while끝
	if(plag){
		%>
			<tr>
				<td colspan="5" style="text-align: center;">찾으신 정보가 없습니다.</td>
			</tr>	
		<%	
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}%>

</table>

</div>
</form>
<script>
	function goUse(a){
		var snackQty_  = document.getElementById("snackQty"+a);
		var snackQty = parseInt(snackQty_.innerHTML);
		
		var id="no"+a;
		var target_ = document.getElementById(id);
		var target = target_.value;
		
		if(snackQty<target){
			alert('선물의 수량보다 많습니다.');
		}else{
			location.href='manageGiftAction.jsp?no='+a+'&qty='+target;
		}
		
	}
</script>

</body>
</html>