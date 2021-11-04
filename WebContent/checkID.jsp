<%@page import="java.sql.*"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" src="javascript/user.js"></script>
<style>
	.container{
		text-align:center;
		margin-top:40px;
	}
</style>
<title>ID 중복확인 체크</title>

</head>


<body bgcolor="#ffffff">
<%
request.setCharacterEncoding("UTF-8");
boolean isExist = false;

    	String DB_URL="jdbc:mysql://localhost:3306/movieStore";  
        String DB_ID="root"; 
        String DB_PASSWORD="1234"; 
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
        
	    String id2 = request.getParameter("id");
	    String id= URLDecoder.decode(id2, "UTF-8") ;
		String jsql = "select * from user where id = ?";   
        PreparedStatement  pstmt  = con.prepareStatement(jsql);
	    pstmt.setString(1, id);

	    ResultSet rs = pstmt.executeQuery();  	
        
        if(rs.next())              //   레코드(동일한 ID)가 존재하면
              isExist = true;
        else                          //   레코드(동일한 ID)가 존재하지 않으면  
             isExist = false;
		
        rs.close();
        pstmt.close();
        con.close();
        
 
%>
<div class="container">

<table width="228" border="0" cellspacing="1" cellpadding="3" height="50" style="font-size:10pt;font-family:맑은 고딕">
    <tr>
        <td height="25" align=center >
          ID:  <%=id%>
        </td>
    </tr>
    
    <tr>
        <td height="25" align=center>
  <%  
		   if(isExist)  
                 out.println("이미 존재하는 ID입니다.");
	       else 
                 out.println("사용 가능한 ID입니다. ");
  %>
        </td>
    </tr>

    <tr>
        <td align=center>
            <a href="javascript:window.close()"><img src=".\images\confirm.gif" border=0></a>
        </td>
    </tr>
</table>
</div>
</body>
</html>
