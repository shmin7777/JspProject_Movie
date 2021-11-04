<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
         <script language="javascript" src="javascript/user.js"></script>
         <link rel="stylesheet" type="text/css" href="css/snack.css">
         <link rel="stylesheet" type="text/css" href="css/customer.css">
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body >
         <%
        	
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
        	}
        	
        	if(id.equals("Guest")){
        		PrintWriter script = response.getWriter();
        		script.println("<script>");
        		script.println("alert('로그인이 필요한 서비스입니다.')");
        		script.println("location.href='login.jsp'");
        		script.println("</script>");
        	}
        	
        %>
        <div class="hsall">
                <div class="header">
       <div class="nav_area">
            <div class="sc_nav">
                 <ul class="sc_g_left">
                     <li></li>
                 </ul>
                 <ul class="sc_g_right">
                     <li>
                         <a href="myPageHome.jsp">마이페이지</a>
                     </li>
                     <li>
                         <a href="showCart.jsp">장바구니</a>
                     </li>
                     <li>
                         <a href="customNotice.jsp">고객센터</a>
                     </li>
                 </ul>
           </div>
           <div class="m_nav">
                <h1 class="logo">
                     <a href="index.jsp">
                     	<img src="images/logo.png" width="150px">
                    </a>
                </h1>
                <div class="m_gnb_area">
                     <ul class="m_gnb_list">
                         <li class>
                             <a href="movieAll.jsp">
                             <span>영화</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="movieAll.jsp">현재 상영작</a>
                                 </li>
                                 <li>
                                     <a href="movieAfter.jsp">상영 예정작</a>
                                 </li>
                                 <li>
                                     <a href="moviePost.jsp">무비 포스트</a>
                                 </li>                                                                  
                             </ul>
                         </li>
                         <li class>
                             <a href="reserveMain.jsp">
                             <span>예매</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="reserveMain.jsp">빠른 예매</a>
                                 </li>
                                 <li>
                                     <a href="movieTime.jsp">상영 시간표</a>
                                 </li>
                                 <li>
                                     <a href="reserveInfo.jsp">할인 안내</a>
                                 </li>                                                                  
                             </ul>                         
                         </li>
                         <li class>
                             <a href="eventMain.jsp">
                             <span>이벤트</span>
                             </a>
                         </li>
                         <li class>
                             <a href="snackStore.jsp">
                             <span>스토어</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="snackStore.jsp#No5">관람권</a>
                                 </li>
                                 <li>
                                     <a href="snackStore.jsp#No1">스낵/음료</a>
                                 </li>	                                                                 
                             </ul>                           
                         </li>
                     </ul>
                </div>
                <div class="aside_rnb eve_parent">
                     <ul class="as_rng_list">
                         <li>
	                       <div class="movieSearch">
							 	<form method="post" action="movieAll.jsp">
				                <input type="text" placeholder="영화명 검색" name="searchMovie" style="padding: 1px 0; width: 78px;"> 
						       <input type="image" src="images/btnSearch.png" class="movieSearchImg">
				          </form>
		           		 </div>
                             <!-- <a href="#" class="as_btn btn_st btn_search_on eve_side_menu">검색</a> -->
                         </li>
                         <%
              	    		if(id.equals("Guest")){
                    	%>
                        <li><a href="login.jsp" class="as_btn btn_my eve_quick">로그인</a></li>
                        <li><a href="join.jsp" class="as_btn btn_quick_on eve_side_menu">회원가입</a></li>
                        <%}else{ %>
                        <li><a href="myPageHome.jsp" class="as_btn btn_my eve_quick"><%=id %>님 </a></li>
                        <li><a href="logout.jsp" class="as_btn btn_quick_on eve_side_menu">로그아웃</a></li>
                        <%} %>                                               
                     </ul>
                </div>
                
                <button class="menu_b"></button>
                
           </div>
           
      </div>
      
      <div class="all_menu">
      <button class="close_b"></button>
      <ul>
      <li>
          <a href="#movieAll.jsp" class="eng">영화</a>
          <ul class="sub_m" style="display: block;">
            <li><a href="movieAll.jsp" class="eng">현재 상영작</a></li>
            <li><a href="movieAfter.jsp" class="eng">상영 예정작</a></li>
            <li><a href="moviePost.jsp" class="eng">무비 포스트</a></li>
          </ul>
      </li>
      <li>
          <a href="#reserveMain.jsp" class="eng">예매</a>
          <ul class="sub_m">
            <li><a href="reserveMain.jsp" class="eng">빠른 예매</a></li>
            <li><a href="movieTime.jsp" class="eng">상영 시간표</a></li>
            <li><a href="reserveInfo.jsp" class="eng">할인 안내</a></li>
          </ul>
      </li>
      <li>
          <a href="eventMain.jsp" class="eng">이벤트</a>
          <!-- <ul class="sub_m">
            <li><a href="/vision/3r.html" class="eng">3R</a></li>
            <li><a href="/vision/professionalism.html" class="eng">Professionalism</a></li>
          </ul> -->
      </li>
      <li>
          <a href="#snackStore.jsp" class="eng">스토어</a>
          <ul class="sub_m">
            <li><a href="snackStore.jsp#No5" class="eng">관람권</a></li>
            <li><a href="snackStore.jsp#No1" class="eng">스낵/음료</a></li>
          </ul>
      </li>
      <!-- <li>
          <a href="/contact/form.html" class="eng">검색</a>
      </li> -->
      <%
		if(id.equals("Guest")){
 	%>
     <li><a href="login.jsp" class="eng">로그인</a></li>
     <li><a href="join.jsp" class="eng">회원가입</a></li>
     <%}else{ %>
     <li><a href="myPageHome.jsp" class="eng"><%=id %>님 </a></li>
     <li><a href="logout.jsp" class="eng">로그아웃</a></li>
     <%} %>   
  </ul>
</div>

    		<div style="clear: both;"></div>
<script>
  $(document).ready(function(){
      $('.all_menu > ul > li > a').click(function(){
        $(this).next().fadeToggle(0);
      });

      $('.menu_b').click(function(){
        $('.all_menu').addClass('on');
      });

      $('.close_b').click(function(){
        $('.all_menu').removeClass('on');
      });
  });
</script>
     
      
     </div>
     
  </div><!--hsall끝  -->
  
  
	<%
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
	%>
      
      <div class="notice03">
	      <h2 class="rhror">고객센터</h2>
	      </div>
	      
	      	                    <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="customNotice.jsp">
							고객센터
						</a>

						
					</div>
				</div>
			</div>
      <div class="container06">
      <hr style="border: solid 1px lightgray;"><br>
      		
      		
      		<ul class="tab_wrap">
      			<a href="customNotice.jsp"><li ><img class="noti" src="images/notice1.png">공지사항</li></a>
      			<a href="customFAQ.jsp"><li><img class="noti" src="images/faq.png">FAQ</li></a>
      			<a href="customOneByOne.jsp"><li style="color: #000;border-bottom:2px solid #111;"><img class="noti" src="images/obo.png">1:1문의</li></a>
      			<a href="customMyQuestion.jsp"><li><img class="noti" src="images/myq.png">나의 문의 내역</li></a>
      		</ul>
      		<br><br><br>
      		<div class="con_top">
      			<div class="ico_list_txt qus">
      				FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.
      				<ul class="list_txt">
      					<li>1:1 문의글 답변 운영시간 10:00 ~ 19:00</li>
      					<li>접수 후 48시간 안에 답변 드리겠습니다.</li>
      				</ul>
      			</div>
      			
      		</div>
      		<dl class="contxt_type1">
      				<dt class="tit">
      					고객님의 문의에 <span style="color:#ff7787">답변하는 직원은 고객 여러분의 가족 중 한 사람</span>일 수 있습니다.
      				</dt>
      				<dd class="desc">
      				고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 직원을 보호하기 위해 관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.
      				</dd>
      		</dl>
      		<div class="con_tit ty2">
      			<h4 style="display: inline-block;">문의 내용</h4>
      			<div class="group_right">
      				<span class="txt_req">
      					
      					*필수입력
      				</span>
      			</div>
      		</div>
      		<form enctype="multipart/form-data" method="post" action="customOneByOneAction.jsp" name="customOne">
      		<table class="tbl_form" cellspacing="0" width="100%">
      			<tr>
      				<td style="width:20%;">제목&nbsp;&nbsp;<span class="txt_req">*</span></td>
      				<td style="width:80%;"><input type="text" placeholder="제목을 입력해주세요." name="title" style="width: 100%;background-color: #F8F8F8;border-color: #DDD; padding: 10px 0"></td>
      			</tr>
      			<tr>
      				<td>내용&nbsp;&nbsp;<span class="txt_req">*</span></td>
      				<td style="line-height: 5px;height: 5px;">
      				<textarea placeholder="내용을 입력해주세요." name="content" maxlength="2048" style="height: 350px;width: 100%;background-color: #F8F8F8;border-color:#DDD;"></textarea> 
      				</td>
      			</tr>
      			<tr>
      				<td>첨부파일</td>
      				<td style="text-align: left;">
      					<div class="bx_file">
      						<input type="file" name="fileImg" id="file">
      						<!-- <label class for="file">파일선택</label> -->
      					</div>
      				</td>
      			</tr>	
      			
		   </table>
		   
		   	<div class="btn_wrap">
		   	<input type="reset" class="btn_col3" value="취소"></a>
      		<input type="button" value="확인" class="btn_col2" onclick="checkOne();" >
      		</div>
		   </form>
		      		
      		
      	
      </div>
     
      


      <section class="footer">
                <div class="wrapper" style="width: 1000px;margin: auto;">
                  <div style="display:flex;line-height: 79px; height: 60px;color: #888;">
                  <div style="margin-right:2%;">
                  <a href="index.jsp"><img src="images/logo.png" height="60px" ></a>
                  </div>
                   <a href="mainInfo1.jsp"><h4>회사소개</h4></a>&nbsp;&nbsp;·
                   &nbsp;&nbsp;<a href="mainInfo2.jsp"><h4>제휴문의</h4></a>&nbsp;&nbsp;·
                   &nbsp;&nbsp;<a href="mainInfo3.jsp"><h4>배성/편성기준</h4></a> &nbsp;&nbsp;·
                   &nbsp;&nbsp;<a href="manageLogin.jsp"><h4>관리자 로그인</h4></a>
                  </div>
                   <div style="margin-top:3%;">
                   <ul style="white-space:nowrap;">
                   <li style="list-style:none;"><span>주소</span>&nbsp;&nbsp;충청남도 천안시 서북구 성환읍 대학로 91, 3층(공학관 3층)  <span>ARS</span>&nbsp;&nbsp;1544-6416</li>
                   <li style="list-style:none;"><span>대표자명</span>&nbsp;&nbsp;민석홍 <span>개인정보보호책임자</span>&nbsp;&nbsp;민석홍 <span>사업자등록번호</span>&nbsp;&nbsp;411-82-17852 &nbsp;<span>통신판매업신고번호 제 8호</span></li>
                   <li style="list-style:none;"><span>COPYRIGHT © MovieStoreJoongAng, Inc. All rights reserved</span></li>
                   </ul>
                   </div>
                  </div>
                </div>    
            </section>
    
    </body>
</html>