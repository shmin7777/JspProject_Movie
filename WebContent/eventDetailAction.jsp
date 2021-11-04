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
	String id= (String)session.getAttribute("sid");
	if(id==null){
		id="Guest";
	}
	if(id.equals("Guest")){
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		String e_name=request.getParameter("e_name");
		
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		try{
			String sql = "select * from event where e_name=? and id =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,e_name);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){ //전체 쿠폰DB에 쿠폰이 있을 경우
				script.println("<script>");
				script.println("alert('이미 쿠폰을 받으셨습니다.')");
				script.println("history.back()");
				script.println("</script>");
				
			}else{//쿠폰이 없을 경우
				if(e_name.equals("birth")){/////////////쿠폰이름이 birth인경우
					String sql2 = "select joomin from user where id=?";
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					pstmt2.setString(1,id);
					ResultSet rs2 = pstmt2.executeQuery();
					rs2.next();
					String joomin2 = rs2.getString(1);
					int joomin=Integer.parseInt(joomin2.substring(2, 4));
					
					if(joomin>=3&&joomin<=6){//쿠폰 받을 조건이 충족되는 경우
						String sql3 = "insert into event values(null,?,?)";
						PreparedStatement pstmt3 = con.prepareStatement(sql3);
						pstmt3.setString(1, e_name);
						pstmt3.setString(2, id);
						pstmt3.executeUpdate();
						
						String sql4 = "select coupon from usergrade where id=?";
						PreparedStatement pstmt4 = con.prepareStatement(sql4);
						pstmt4.setString(1, id);
						ResultSet rs4 = pstmt4.executeQuery();
						rs4.next();
						int coupon = rs4.getInt(1)+1;
						
						String sql5 = "update usergrade set coupon=? where id=?";
						PreparedStatement pstmt5 = con.prepareStatement(sql5);
						pstmt5.setInt(1,coupon);
						pstmt5.setString(2, id);
						pstmt5.executeUpdate();
						
						
						script.println("<script>");
						script.println("alert('쿠폰이 발급 되었습니다.')");
						script.println("history.back()");
						script.println("</script>");
					
					}else{
						script.println("<script>");
						script.println("alert('생일이 3~6월생이 아닙니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
				}////////////birth인 쿠폰이름 if문 끝
				else if(e_name.equals("grade")){/////////////////e_name이 grade인 경우
					String sql6 = "select userGrade from usergrade where id=?";
					PreparedStatement pstmt6 = con.prepareStatement(sql6);
					pstmt6.setString(1, id);
					ResultSet rs6 = pstmt6.executeQuery();
					rs6.next();
					String userGrade= rs6.getString(1).toLowerCase();
					
					if((userGrade.toLowerCase()).equals("silver")||(userGrade.toLowerCase()).equals("gold")||userGrade.equals("플래티넘")){////쿠폰받을 조건이 충족되는경우
						String sql3 = "insert into event values(null,?,?)";
						PreparedStatement pstmt3 = con.prepareStatement(sql3);
						pstmt3.setString(1, e_name);
						pstmt3.setString(2, id);
						pstmt3.executeUpdate();
						
						String sql4 = "select coupon from usergrade where id=?";
						PreparedStatement pstmt4 = con.prepareStatement(sql4);
						pstmt4.setString(1, id);
						ResultSet rs4 = pstmt4.executeQuery();
						rs4.next();
						int coupon = rs4.getInt(1)+1;
						
						String sql5 = "update usergrade set coupon=? where id=?";
						PreparedStatement pstmt5 = con.prepareStatement(sql5);
						pstmt5.setInt(1,coupon);
						pstmt5.setString(2, id);
						pstmt5.executeUpdate();
						
						
						script.println("<script>");
						script.println("alert('쿠폰이 발급 되었습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						script.println("<script>");
						script.println("alert('유저등급이 일반입니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
		
%>
</body>
</html>