<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
         <script language="javascript" src="javascript/user.js"></script>
    </head>
    <body onLoad="idFocus2()">
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
  
  
      <div align=center>
      <h2>배성/편성 기준</h2>
      </div>
      <br>
      <br>
      <div style="width:1000px; line-height:2;margin: auto;">
      <h4>2NE1 프로그램 배정/편성 원칙</h4>
      <br>
      <h4>2NE1은 영화관람객이 원하는 영화를 볼 수 있도록 일정한 기준과 절차에 따라 상영 작품을 배정/편성하고 있습니다.</h4>
      <br>
      <h4>프로그램 배정/편성에 앞서 각 상영 영화에 대한 정보를 다각적으로 수집한 뒤, 그 정보에 근거하여 공정하게 스크린을 배정/편성합니다. 스크린의 배정/편성 이후에는 관객의 수요 변화에 근거하여 스크린을 재조정합니다.</h4>
      <br>
      <h4>이와 같은 일련의 프로그램 배정/편성은 단순히 프로그램 담당자의 개인적인 판단이 아닌, 객관적인 데이터 및 관객의 선호도, 2NE1 내부의 자체 분석 자료 등의 지표를 활용하여 해당 영화를 배급하는 배급사와 사전협의 과정을 거쳐 이뤄집니다.</h4>
      <br>
      <h4>2NE1은 영화 관람객들의 보다 편리한 관람을 위해 프로그램 편성에 관하여 끊임없이 개선하고 있으며, 앞으로도 영화 산업의 질적 성장을 도모하고 공정한 배정/편성을 위해 노력하겠습니다.</h4>
      <br>
      <h4>▷ 프로그램 배정/편성 원칙</h4>
      <br>
      <h4>2NE1은 배정/편성 지표에 부합하는 정보를 수집하고, 각 영화를 아래의 기준에 근거하여 상영관 및 상영 시간을 배정/편성합니다.</h4>
      <br>
      <h4>1.	1. 상영작의 결정</h4>
      <br>
      <h4>1.	2NE1에서 상영되는 모든 영화는 개봉 전에 영상물등급위원회로부터 영화 등급 심의에 맞는 필증이 있어야 합니다.</h4>
      <br>
      <h4>2.	2NE1은 영화의 상영 여부 및 시기를 결정함에 있어 해당 영화배급사와의 사전 협의를 원칙으로 하며, 영화 배급사의 요청을 최대한 반영하기 위해 노력합니다..</h4>
      <br>
      <h4> 3.	작품은 극장 상영에 적합해야하며, 예술성·다양성·흥행성·사업성 등을 총체적으로 고려하여 상영 여부를 결정합니다. 영화 산업 전체의 발전을 고려하고, 2NE1의 내부 기준에 따라 상영작을 결정합니다. 다만, 2NE1의 내부 규정은 관련 시스템 및 영화 산업 환경과 관람객 선호도의 변화 등에 따라 개정될 수 있습니다.</h4>
      <br>
      <h4>2.	2. 개봉 전 프로그램 배정/편성</h4>
      <br>
      <h4>개봉 전 2NE1은 아래의 기준(프로그램 정보, 극장 별 특성, 선호도, 외부 요인 분석 정보)을 토대로 종합적으로 비교 분석하고, 해당 영화 배급사와의 협의를 거쳐서 배정/편성하고 있습니다.</h4>
      <br>
      <h4> 1)	프로그램 자체 정보</h4>
      <br>
      <ul>
      <li style="list-style:none;">① 기본전제 : 기개봉작 중 해당 영화와 유사 작품 비교 분석(장르, 총제작비, 성적 등)</li>
      <li style="list-style:none;">② 감독 : 전작의 흥행 성적, 인지도 등</li>
      <li style="list-style:none;">③ 배우 : 주조연 배우의 인지도, 주연 배우의 흥행 성적(前 작품 등)</li>
      <li style="list-style:none;">④ 상영 등급 및 러닝 타임</li>
      <li style="list-style:none;">⑤ 제작비 규모</li>
      </ul>
      <br>
      <h4>2)	극장 별 특성</h4>
      <br>
      <h4>① 극장 위치와 상권, 보유 좌석 및 스크린 규모, 해당지역 수요 고객 성향 등</h4>
      <br>
      <h4>3)	선호도 분석</h4>
      <br>
      <ul>
      <li style="list-style:none;">① 관객 관심도 : 사전 시사에 대한 관객 설문 결과와 반응</li>
      <li style="list-style:none;">② 온/오프라인 지표 : 포털 사이트 댓글 및 예고편 조회수 등 / </li>
      <li style="list-style:none;">영화 광고 구좌 등의 홍보 현황(참고사항)</li>
      <li style="list-style:none;">③ 전문가 견해 : 배급 시사 후 관계자 및 언론 반응</li>
      <li style="list-style:none;">④ 사전 예매율 : 2NE1 예매율(홈페이지/모바일), 영화진흥위원회 통합전산망</li>
      </ul>
      <br>
      <h4> 4)	외부 요인 분석 정보</h4>
      <br>
      <ul>
      <li style="list-style:none;">① 경쟁작 상황(유사/중복 장르 유무)</li>
      <li style="list-style:none;">② 시즌별 상황(성수기, 비수기, 연휴, 방학 등)</li>
      </ul>
      <br>
      <h4>3.	3. 개봉 후 프로그램 배정/편성</h4>
      <br>
      <h4>개봉 후 2NE1은 작품의 실적과 관람객의 반응 및 트랜드를 고려하여 해당 영화 배급사와의 협의를 거쳐 편성을 조정합니다.</h4>
      <br>
      <h4>1)	개봉 실적</h4>
      <br>
      <ul>
      <li style="list-style:none;">① 해당 작품의 개봉일 및 주말 실적</li>
      <li style="list-style:none;">② 예매율 추이</li>
      <li style="list-style:none;">③ 좌석 점유율</li>
      </ul>
      <br>
      <h4>2)	관객 반응</h4>
      <br>
      <ul>
      <li style="list-style:none;">① 온/오프라인 관람객 평점 및 리뷰 종합</li>
      <li style="list-style:none;">② 당사 내부 시스템 분석 자료</li>
      </ul>
      <br>
      <h4> 3)	경쟁작 상황</h4>
      <br>
      <h4> ① 기존 및 새 개봉작에 따른 조정</h4>
      <br>
      <h4> 4)	시즌별 상황</h4>
      <br>
      <h4>① 시즌에 따른 유사 작품 흥행 실적(흥행 패턴, 흥행 추세 등)</h4>
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