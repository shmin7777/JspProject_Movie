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
         <script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		 <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
         <script>
         
         $(function(){
          var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
          sBtn.find("button").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
           sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
           $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
          })
         })
         
       
         </script>
        
    </head>
    <body>
     
         <%
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
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
		
		String FAQctg = request.getParameter("ctg");
		String ctgActive[] = new String[5];
		if(FAQctg==null){
			FAQctg="영화예매";
			ctgActive[0] = "class=active";
		}
		if(FAQctg.equals("1")){
			FAQctg="영화예매";
			ctgActive[0] = "class=active";
		}else if(FAQctg.equals("2")){
			FAQctg="할인혜택";
			ctgActive[1] = "class=active";
		}else if(FAQctg.equals("3")){
			FAQctg="결제수단";
			ctgActive[2] = "class=active";
		}else if(FAQctg.equals("4")){
			FAQctg="스토어";
			ctgActive[3] = "class=active";
		}else if(FAQctg.equals("5")){
			FAQctg="회원";
			ctgActive[4] = "class=active";
		}
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		String group_index;
		int list_index;

		group_index = request.getParameter("group_index");
		//첫 페이지는 group_index 값이 0
		   
		if (group_index != null) 	
				list_index = Integer.parseInt(group_index);  
		else 
				list_index = 0;     //현재 페이지 수 

		//board 테이블에 있는 총 자료의 수(글의 개수) 알아 오기
		String jsql = "select count(*) from faq where ctg=?";
		PreparedStatement pstmt1 = con.prepareStatement(jsql);
		pstmt1.setString(1, FAQctg);
		ResultSet cntRs = pstmt1.executeQuery();	

		cntRs.next();
		int cnt = cntRs.getInt(1);//글의 총 개수

		//한 페이지에 10개의 글 출력하기 위해
		//글의 개수를 10으로 나누어 페이지 계산
		int cntList = cnt/10; // 페이지 수 계산하기 위한 변수 
		int remainder = cnt%10; //나머지
		int cntList_1;//총페이지 수
			
		//1(11, 21, 31, 41, ...)번째 글이 올라올 때 총 페이지 수 1 증가
		if (cntList != 0) //글이 10개이상이면
		{
			   if (remainder == 0)	 //10으로 나눈 나머지가 없으면		
				  cntList_1 = cntList;  //몫이 페이지 수          
			   else                    //나머지가 있으면
				   cntList_1 = cntList + 1; //몫에 1 더한 값이 총페이지 수		  
		 } 
		 else 		 
			  cntList_1 = cntList + 1; //총페이지 수		
			   
		cntRs.close();
		
		String jsql2 = "select * from faq where ctg=?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, FAQctg);
		ResultSet rs = pstmt2.executeQuery();
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
      			<a href="customNotice.jsp"><li><img class="noti" src="images/notice1.png">공지사항</li></a>
      			<a href="customFAQ.jsp"><li style="color: #000;border-bottom:2px solid #111;"><img class="noti" src="images/faq.png">FAQ</li></a>
      			<a href="customOneByOne.jsp"><li><img class="noti" src="images/obo.png">1:1문의</li></a>
      			<a href="customMyQuestion.jsp"><li><img class="noti" src="images/myq.png">나의 문의 내역</li></a>
      		</ul>
      		<br><br><br>
      		<div class="faq_icon">
      			<ul>
      			<li <%=ctgActive[0]  %>><a href="customFAQ.jsp?ctg=1"><button class="ico_01">영화/예매</button></a></li>
      			<li <%=ctgActive[1]  %>><a href="customFAQ.jsp?ctg=2"><button class="ico_02" >할인혜택</button></a></li>
      			<li <%=ctgActive[2]  %>><a href="customFAQ.jsp?ctg=3"><button class="ico_03">결제 수단</button></a></li>
      			<li <%=ctgActive[3]  %>><a href="customFAQ.jsp?ctg=4"><button class="ico_04">스토어</button></a></li>
      			<li <%=ctgActive[4]  %>><a href="customFAQ.jsp?ctg=5"><button class="ico_05">회원</button></a></li>
      			</ul>
      		</div>
      		<table class="faqTable" cellspacing="0">
      			<thead>
	      			<tr>
	      				<th style="width: 20%;">구분</th><th>질문</th>
	      			</tr>	
      			</thead>
      		<%
	if (!rs.wasNull()) 
	{
	   for(int i = 0; i < list_index * 10; i++) 
	      rs.next();

       int cursor = 0;
       int i=0;
       while (rs.next()) 
	   {
            
              int no = rs.getInt("no");
              String ctg = rs.getString("ctg");
			  String title = rs.getString("title");
              String content = rs.getString("content");
           
    %> 	   
    <tr>
 	      <td>
 	         <div align="center"><%=ctg%></div>
 	      </td>
 	      <td style="width:80%;" class="icq">
 	         <div id="<%=no %>" style="cursor: pointer;" onclick="openFAQ('c<%=no %>');"><strong class="qna">Q</strong><span style="margin-left: 5px;"><%=title %></span> <span id="cc<%=no%>"><img src="images/btn-bottom.png" class="qnaBtn"></span></div>
 	      </td> 	      
 	      
 	   </tr>  
 	   <tr style="display: table-row" class="hidden" id="c<%=no %>">
 	   	<td colspan="2">
 	   		<div style="margin-left: 280px; ">
 	   			<strong class="ana">A</strong>
 	   			<div style="display: inline-table;margin-left: 5px;font-family: sans-serif;"> <%=content %></div>
 	   		</div>
 	   	</td>
 	   </tr>	   

   <%
	   //while 문이 반복 수행될 때마다 cursor를 1씩 증가
		 cursor ++;
   		 i++;
         if (cursor >= 10) break; 
         
        }   // while문의 끝
    }  //  if문의 끝
   %>
   </table>
   	<table style="margin: auto;margin-top: 56px;">
   		<tr>
             <td colspan="4">        
                <div align="center">
		<%
			//첫페이지 (group_index 값이 0)로 이동할 수 있게끔 링크
		%>
        <%= "["%><a href="customFAQ.jsp?group_index=0"><font size=2>처음</font></a><%="]" %>
        &nbsp;&nbsp;&nbsp;
                
   <% 
   //페이지 번호를 출력 및 링크시키기 위한 변수들을 선언
       int startpage=1;
       int maxpage = cntList_1;
       int endpage = startpage + maxpage -1;

	//보여줄 페이지가 속한 그룹의 첫번째 페이지부터 마지막 페이지까지의 링크를 추가
       for (int j=startpage; j<=endpage; j++) 
	   {
           if(j == list_index+1) 
		   {
   %>
               <%= j %>
   <%
            } 
            else 
			{
   %>
        <a href="customFAQ.jsp?group_index=<%= j - 1 %>"><%= j %></a>
   <%
            }
       }
   %>
    
      &nbsp;&nbsp;&nbsp;
	  <%
			//마지막 페이지로 이동할 수 있게끔 링크
	   %>
      <%= "["%><a href="customFAQ.jsp?group_index=<%= cntList_1 - 1 %>"><font size=2>끝</font></a><%="]" %>
    			</div>
             </td>
          </tr>
    </table>
      		
      </div>
    
      <script>
         var target =document.getElementsByClassName("hidden");
         for(var i=0;i<target.length;i++){
        	 target[i].style.display='none';
         }
         
         
         
     </script>
 <%
     	String rq_no=request.getParameter("no");
     	if(rq_no!=null){
     %>
     	<script>
     	 var target =document.getElementById("c"+<%=rq_no%>);
     	var cImg = document.querySelector('#cc'+<%=rq_no%>);
     	 target.style.display='table-row';
     	document.getElementById('c'+<%=rq_no%>).scrollIntoView();
     	cImg.innerHTML="<img src='images/btn-top.png' class='qnaBtn'>";
     	</script>
     <% 		
     	}
     %> 

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