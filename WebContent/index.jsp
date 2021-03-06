	<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/layout.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/_module/js/common.js"></script>
<meta charset="UTF-8">
<title>2NE1</title>
<script>
        $(document).ready(function(){
            $('.slider').bxSlider({
          		touchEnabled : false,
          		auto: true, speed: 500, pause: 5000, autoControls: true, pager:true

            });
            
          });
        
</script>
</head>
<body>
		<%
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
        	}
        	
			String dburl="jdbc:mysql://localhost:3306/movieStore";
			String dbid="root";
			String dbpassword="1234";
			int i=1;
			
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
			/* String sql="select movieID,movieTitle from movie order by click desc limit 10";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); */
		
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
                         <a href="myPageHome.jsp">???????????????</a>
                     </li>
                     <li>
                         <a href="showCart.jsp">????????????</a>
                     </li>
                     <li>
                         <a href="customNotice.jsp">????????????</a>
                     </li>
                 </ul>
           </div>
           <div class="m_nav">
                <h1 class="logo">
                     <a href="index.jsp"><img src="images/logo.png" width="150px">
                    </a>
                </h1>
                <div class="m_gnb_area">
                     <ul class="m_gnb_list">
                         <li class>
                             <a href="movieAll.jsp">
                             <span>??????</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="movieAll.jsp">?????? ?????????</a>
                                 </li>
                                 <li>
                                     <a href="movieAfter.jsp">?????? ?????????</a>
                                 </li>
                                 <li>
                                     <a href="moviePost.jsp">?????? ?????????</a>
                                 </li>                                                                  
                             </ul>
                         </li>
                         <li class>
                             <a href="reserveMain.jsp">
                             <span>??????</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="reserveMain.jsp">?????? ??????</a>
                                 </li>
                                 <li>
                                     <a href="movieTime.jsp">?????? ?????????</a>
                                 </li>
                                 <li>
                                     <a href="reserveInfo.jsp">?????? ??????</a>
                                 </li>                                                                  
                             </ul>                         
                         </li>
                         <li class>
                             <a href="eventMain.jsp">
                             <span>?????????</span>
                             </a>
                         </li>
                         <li class>
                             <a href="snackStore.jsp">
                             <span>?????????</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="snackStore.jsp#No5">?????????</a>
                                 </li>
                                 <li>
                                     <a href="snackStore.jsp#No1">??????/??????</a>
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
				                <input type="text" placeholder="????????? ??????" name="searchMovie" style="padding: 1px 0; width: 78px;"> 
						       <input type="image" src="images/btnSearch.png" class="movieSearchImg">
				          </form>
		           		 </div>
                             <!-- <a href="#" class="as_btn btn_st btn_search_on eve_side_menu">??????</a> -->
                         </li>
                         <%
              	    		if(id.equals("Guest")){
                    	%>
                        <li><a href="login.jsp" class="as_btn btn_my eve_quick">?????????</a></li>
                        <li><a href="join.jsp" class="as_btn btn_quick_on eve_side_menu">????????????</a></li>
                        <%}else{ %>
                        <li><a href="myPageHome.jsp" class="as_btn btn_my eve_quick"><%=id %>??? </a></li>
                        <li><a href="logout.jsp" class="as_btn btn_quick_on eve_side_menu">????????????</a></li>
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
          <a href="#movieAll.jsp" class="eng">??????</a>
          <ul class="sub_m" style="display: block;">
            <li><a href="movieAll.jsp" class="eng">?????? ?????????</a></li>
            <li><a href="movieAfter.jsp" class="eng">?????? ?????????</a></li>
            <li><a href="moviePost.jsp" class="eng">?????? ?????????</a></li>
          </ul>
      </li>
      <li>
          <a href="#reserveMain.jsp" class="eng">??????</a>
          <ul class="sub_m">
            <li><a href="reserveMain.jsp" class="eng">?????? ??????</a></li>
            <li><a href="movieTime.jsp" class="eng">?????? ?????????</a></li>
            <li><a href="reserveInfo.jsp" class="eng">?????? ??????</a></li>
          </ul>
      </li>
      <li>
          <a href="eventMain.jsp" class="eng">?????????</a>
          <!-- <ul class="sub_m">
            <li><a href="/vision/3r.html" class="eng">3R</a></li>
            <li><a href="/vision/professionalism.html" class="eng">Professionalism</a></li>
          </ul> -->
      </li>
      <li>
          <a href="#snackStore.jsp" class="eng">?????????</a>
          <ul class="sub_m">
            <li><a href="snackStore.jsp#No5" class="eng">?????????</a></li>
            <li><a href="snackStore.jsp#No1" class="eng">??????/??????</a></li>
          </ul>
      </li>
      <!-- <li>
          <a href="/contact/form.html" class="eng">??????</a>
      </li> -->
      <%
		if(id.equals("Guest")){
 	%>
     <li><a href="login.jsp" class="eng">?????????</a></li>
     <li><a href="join.jsp" class="eng">????????????</a></li>
     <%}else{ %>
     <li><a href="myPageHome.jsp" class="eng"><%=id %>??? </a></li>
     <li><a href="logout.jsp" class="eng">????????????</a></li>
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
     
  </div><!--hsall???  -->
  
  <%
  String ba_title[] = new String[5];
  String reserveRate3[]= new String[5];
  %>  
  <div class="backgroundWraper">	
  <div id="backgroundWrap"></div>
  </div>
    	<div class="todayPrice"> 
            <%
            	int movieID=1;
            	String movieTitle="";
            	String img="";
            	String steelImg="";
            	int q=0;
            	
					/* String sql20="select * from movie left join reserveRate on movie.movieTitle=reserveRate.movieTitle order by count desc"; */
					String sql20 ="select * from indexmovie";
					PreparedStatement pstmt20 = con.prepareStatement(sql20);
					ResultSet rs20 = pstmt20.executeQuery();
					while(rs20.next()){
						
						
						
						movieTitle=rs20.getString(2);
						img=rs20.getString(3);
						steelImg = rs20.getString(4);
						
						
						String sql30="select count(*) from reservemovie";
						PreparedStatement pstmt30 = con.prepareStatement(sql30);
						ResultSet rs30 = pstmt30.executeQuery();
						rs30.next();
						double cnt = rs30.getDouble(1);
						
						String sql40= "select count(*) from reservemovie where movieTitle=?";
						PreparedStatement pstmt40 = con.prepareStatement(sql40);
						pstmt40.setString(1, rs20.getString(2));
						ResultSet rs40 = pstmt40.executeQuery();
						rs40.next();
						double cnt2 = rs40.getDouble(1);
						
						double reserveRate1 = cnt2/cnt*100;
						String reserveRate2=String.format("%.1f", reserveRate1);
						if(q<5){
							ba_title[q]=movieTitle;
							reserveRate3[q]=reserveRate2;
            %>
            	
            		
         		<div class="movie hidden">
	            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=q %>','<%=steelImg %>','<%=movieTitle %>','<%=reserveRate2 %>');" onmouseout="outEvent('<%=q %>')">
	            			<a href="#" class="top5Btn">
	            			<p class="lank"><%=q+1 %></p>
	            			</a>
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="????????????"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="????????????"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord m_opc" alt="" src="movieImages/<%=img%>" width="179px" height="auto">
	            			</a>
	            		</div>
	            		
	            	</div>
            <% 			
    				}q++;}
   				%>
   					
   				
  			</div>
  			
  			<div class="onTitle" >
  					<!-- <p class="onTitle_p"><span>2???</span>????????? <span>1???</span> ??????!</p>
            		
            		<p>????????? <span>10%</span> ????????????</p> -->
            		<%-- <div class="onTitle_p">
            		<p id="ba_title"><%=ba_title[0]%></p>
            		<p id="ba_rate">????????? : <%=reserveRate3[0] %>%</p>
            		</div> --%>
            </div>
   <!-- <div class="slider">
   		<div><a href="reserveInfo.jsp#No1"><img src="images/banner1.png"/></a></div>
        <div><a href="reserveInfo.jsp#No1"><img src="images/banner2.png"/></a></div>
        <div><a href="reserveInfo.jsp#No5"><img src="images/banner3.png"/></a></div>
    </div> -->
    <div>
    	<p class="mod">????????? 10% ?????? ??????(~2021-04-08) </p>
    </div>
     <div class=section>
     <div class="section03">
      	<!-- <div style="text-align: center;font-size: 40px;margin-top: 50px;">
      		 ?????? ?????? ??????
      	</div> -->
      	<div class="saleWrap">
      		<div class="saleList">
      			
      		</div>
      		<div class="snackImg">
      			<%
      				String ssql="select * from snack";
      				PreparedStatement spstmt = con.prepareStatement(ssql);
      				ResultSet srs = spstmt.executeQuery();
      				
      				String snack_no="0";
      				if(request.getParameter("snack_no")!=null){
      					snack_no=request.getParameter("snack_no");
      				}
      				
      				String ssql2= "select * from snack where snack_no=?";
      				PreparedStatement spstmt2 = con.prepareStatement(ssql2);
      				spstmt2.setString(1, snack_no);
      				ResultSet srs2 = spstmt2.executeQuery();
      				
      				String snackImg="xx1.png";
      				String snackName="????????????";
      				int snackPrice=0;
      				if(srs2.next()){
      					snackImg = srs2.getString(3);
          				snackName= srs2.getString(2);
          				snackPrice = srs2.getInt(6);
      				}
      				
      				String snackSelected[] = new String[16];
      				for(int h=0;h<snackSelected.length;h++){
      					 if(Integer.parseInt(snack_no)==h+1){
      						snackSelected[h]="selected";
      					}
      				}
      				int total=0;
      				if( request.getParameter("total")!=null){
      					total= Integer.parseInt(request.getParameter("total"));
      				}
      				
      			%>
      			<form method="post" action="index_cul.jsp">
      			<div>
      				<div class="di1">
      				<div style="display:flex;flex-direction: column;justify-content: center;line-height:3; margin-bottom: 28px;">
      				<div>
      						<span class="dlrj" style="font-size: 22px;color: white;">?????? ?????? ??????
      								<select name="myGrade" style="font-size: 22px;" id="myGrade">
      									<option value="0">??????</option>
      									<option value="5">SILVER</option>
      									<option value="7">GOLD</option>
      									<option value="10">PLATINUM</option>
      								</select>
      						</span>
      					</div>
      					<div class="m1">
      						<input type="checkbox" name="checkSale" value="10" id="check1"><span class="stext">????????? ???????????? 10%</span>
      					</div>
      					<div class="m1">
      						<input type="checkbox" name="checkSale" value="5" id="check3"><span class="stext">??????????????? ?????? 5%</span>
      					</div>
      					</div>
      					      					<div class="m2">
		      				<img class="mi" src="images/plus.png">
	      				</div>
      					<div class="m3">
      						<img  class="ms" alt="" src="snackImages/movieTicket.png" style="width: 250px;">
      						<div class="mm2" style="text-align: center;">
      							<select name="numMovie" style="font-size: 18px;" id="numMovie">
      								<option value="1">?????? ?????? ????????? 1???(12000???)</option>
      								<option value="2">?????? ?????? ????????? 2???(24000???)</option>
      								<option value="3">?????? ?????? ????????? 3???(36000???)</option>
      								<option value="4">?????? ?????? ????????? 4???(48000???)</option>
      								<option value="5">?????? ?????? ????????? 5???(60000???)</option>
      							</select>
      						</div>
      					</div>
      					<div class="m2">
		      				<img class="mi" src="images/plus.png">
	      				</div>
		      			<div class="m3">
			      			<div class="mm" >
			      				<%-- <div style="text-align: center;font-size: 20px;"><%=snackName %></div> --%>
				      			<div id="changeSnack"><img src="snackImages/<%=snackImg %>" style="width: 250px;"></div>
				      			
				      			<div style="text-align: center;">
					      			<select name="selectSnack" style="font-size:18px;width: 233px;" id="selectSnack">
					      				<%
					      					int k=0;
					      				%>
					      			
					      				<option value="0"  selected>????????????</option>
					      				<% 
					      					while(srs.next()){
					      						
					      				%>		
					      					<option value="<%=srs.getString(1)%>" <%=snackSelected[k] %>><%=srs.getString(2) %>&nbsp;(<%=srs.getInt(6) %>???)</option>
					      				<% 
					      					k++;}
					      				%>
					      				
					      				
					      			</select>
				      			</div>
			      			</div>
		      			</div>
		      			<div class="m2">
		      				<img class="mi" src="images/equals.png"  >
		      			</div>
		      			<div class="mb">
		      				<%
		      					if(total!=0){
		      				%>
		      					<div class="won_hid">
		      					<span  style="font-size: 24px;font-weight: bold;" id="total_price">
		      						<%=total %>???
		      					</span>
		      					<div>
			      					<input type="button" value="????????????" class="showResult1" onclick="location.href='index.jsp?snack_no=<%=snack_no %>#changeSnack';" >
			      				</div>
			      				</div>
		      				<%		
		      					}else{
		      				%>
		      					<div class="won_hid">
			      				<span  style="font-size: 24px;font-weight: bold;" id="total_price">
			      					<span id="snackPrice">
			      					<%-- <%=12000+snackPrice %> --%>
			      					<img class="m03" src="images/equals2.png" width="250px">
			      					</span>
			      				</span>
			      				<div >
			      					<input type="button" value="????????????" class="showResult" onclick="main_cul('<%=snackPrice%>');">
			      				</div>
		      				</div>
		      				<%		
		      					}
		      				%>
		      				
		      			</div>
		      		</div>
		      		
		      		
		      		
		      			
      			</div>
      			
      			
      			
      			</form>
      		</div>
      	</div>
      </div><!--  section02??? -->
      
      
      <script>
      	function main_cul(s_s){
      		 var n_m = document.getElementById("numMovie");
      	    var numMovie = n_m.options[n_m.selectedIndex].value; //????????? ???
      	    
      	 	 var snackPrice=s_s; //?????? ??????
      	 	 
      	 	var m_g = document.getElementById("myGrade");
      	    var myGrade = m_g.options[m_g.selectedIndex].value; //?????? ??????
      	    
      	    var todaySale =  0;
      	    var kakao = 0;
      	    if($('input:checkbox[id="check1"]').is(":checked") == true){
      	    	todaySale=10;
      	    }
      	  if($('input:checkbox[id="check3"]').is(":checked") == true){
    	    	kakao = 5;
    	    }
      	  
      	 
      	  //????????????
      	  var onePrice= parseInt(12000*numMovie)+parseInt(snackPrice);
      	  
      	  //????????? 1?????????
      	  var one_ticket = 12000*((100-todaySale)/100);
      	  //???????????? ??????
      	  var ticket = one_ticket*numMovie;
      	  
      	  //??? ??????
      	  var total = parseInt(ticket)+parseInt(snackPrice);
      	  //????????????
      	 
      	  var salePrice = total*((100-kakao-myGrade)/100);
      	 
			console.log(parseInt(parseInt(onePrice)-parseInt(salePrice)));
		  var snackPrice = document.getElementById('snackPrice');
		  snackPrice.innerHTML ="<div style='margin:100px 0;color:white;' >"+ salePrice+'???<div style=font-size:15px;color:red;>'+parseInt(parseInt(onePrice)-parseInt(salePrice))+'??? ??????</div></div>';
      		
      	}
      	
    
      </script>
      
      
      <div class="section01">
       <div class="main_area main_event motion">
            <div class="main_title"><img class="et" src="images/mainImgBack2.png" alt=""></div>
            <div class="lay_inner">
                <div class="event_area" id="eventArea">
                   <div class="eve_img_box big">
                       <a href="reserveInfo.jsp" target="_self"><img src="images/mainImg1.png" alt="??????"></a>
                   </div>
                   <div class="eve_img_box big">
                       <a href="myPageHome.jsp" target="_self"><img src="images/mainImg2.png" alt="??????"></a>
                   </div>
                   <div class="eve_img_box">
                       <a href="reserveInfo.jsp#userGrade" target="_self"><img src="images/mainImg3.png" alt="?????????"></a>
                   </div>
                   <div class="eve_img_box">
                       <a href="eventDetail04.jsp" target="_self"><img src="images/mainImg4.png" alt="????????????"></a>
                   </div>
                   <div class="eve_img_box">
                       <a href="eventMain.jsp" target="_self"><img src="images/mainImg5.png" alt="????????????"></a>
                   </div>

                </div>
            </div>
        </div>
      </div>
      
      
      <script>
      $("#selectSnack").on( "change", function() {
    	 var target= $("#selectSnack option:selected").val();
			 if(target!=0){
				location.href='index.jsp?snack_no='+target+'#changeSnack';
			}else{
				location.href='index.jsp#changeSnack';
			} 
    	 /* location.href='index.jsp?snack_no='+target+'#changeSnack'; */
      });
     
      
    /*   $(document).ready(function(){
    	    $("#check1").change(function(){
    	        var target= document.getElementById('snackPrice');
    	    	if($("#check1").is(":checked")){
    	            target.innerHTML=parseInt(12000*(0.9)+parseInt(target.innerHTML)-12000);
    	        }else{
    	        	target.innerHTML=parseInt(parseInt(target.innerHTML)+12000*0.1);
    	        }
    	    });
    	});

      $(document).ready(function(){
  	    $("#check2").change(function(){
  	        var target= document.getElementById('snackPrice');
  	    	if($("#check2").is(":checked")){
  	            target.innerHTML=parseInt(parseInt(target.innerHTML)*90/100);
  	        }else{
  	        	target.innerHTML=parseInt(parseInt(target.innerHTML)*100/90);
  	        }
  	    });
  	});
      
      $(document).ready(function(){
  	    $("#check3").change(function(){
  	        var target= document.getElementById('snackPrice');
  	    	if($("#check3").is(":checked")){
  	            target.innerHTML=parseInt(parseInt(target.innerHTML)*0.95);
  	        }else{
  	        	target.innerHTML=parseInt(parseInt(target.innerHTML)*100/95);
  	        }
  	    });
  	});
 */
      
      </script>
      
     <div class="section02">
     <%
    	String tit="1";
     	if(request.getParameter("tit")!=null){
     		tit=request.getParameter("tit");
     	}
     	String active[] = new String[3];
     	
     	if(tit.equals("1")){
     		active[0]="class=active";
     	}else if(tit.equals("2")){
     		active[1]="class=active";
     	}else if(tit.equals("3")){
     		active[2]="class=active";
     	}
     	
     %>
     	<div id="movieTit">
     		<a href="index.jsp?tit=1#movieTit"><span <%=active[0] %>>????????????</span></a>
     		<a href="index.jsp?tit=2#movieTit"><span <%=active[1] %>>????????????</span></a>
     		<a href="index.jsp?tit=3#movieTit"><span <%=active[2] %>>???????????????</span></a>
     	</div>	
   		 <div style="position: relative;">
      				
      				<div class="swiper-container">
      				  <div class="swiper-wrapper">
      				<%
	      				try{
	      					int p=0;
	      					String sql2="";
	      					if(tit.equals("1")){
	      						sql2="select * from movie left join reserveRate on movie.movieTitle=reserveRate.movieTitle order by count desc";
	      			     	}else if(tit.equals("2")){
	      			     		sql2="select * from movie order by grade desc";
	      			     	}else if(tit.equals("3")){
	      			     		sql2="select * from movieAfter";
	      			     	}
	      					
	      					PreparedStatement pstmt2 = con.prepareStatement(sql2);
	      					ResultSet rs2 = pstmt2.executeQuery();
	      					while(rs2.next()){
	      						
	      						
	      						
	      						String grade=rs2.getString(15);
	      						
	      						String sql3="select count(*) from reservemovie";
	      						PreparedStatement pstmt3 = con.prepareStatement(sql3);
	      						ResultSet rs3 = pstmt3.executeQuery();
	      						rs3.next();
	      						double cnt = rs3.getDouble(1);
	      						
	      						String sql4 = "select count(*) from reservemovie where movieTitle=?";
	      						PreparedStatement pstmt4 = con.prepareStatement(sql4);
	      						pstmt4.setString(1, rs2.getString(2));
	      						ResultSet rs4 = pstmt4.executeQuery();
	      						rs4.next();
	      						double cnt2 = rs4.getDouble(1);
	      						
	      						double reserveRate1 = cnt2/cnt*100;
	      						String reserveRate2=String.format("%.1f", reserveRate1);
	      						if(p<20){
	      			%>
	      					<div class="swiper-slide">
	      						<%
	      							if(tit.equals("3")){
	      						%>
	      							<img src="movieAfterImages/<%=rs2.getString(9)%>" width="250px" height="356px" class="swiperImg" style="border-radius: 2%;" />
	      							<%-- <div style="text-align: center;font-size: 13px;margin-top: 10px 0;">
		      						
			      					<%=rs2.getString(2) %>
			      					
			      					</div> --%>
	      						<% 		
	      							}else{
	      						%>		
	      							<a href="movieDetail.jsp?movieID=<%=rs2.getInt(1)%>">
	      							<img src="movieImages/<%=rs2.getString(9)%>" width="250px" height="auto" class="swiperImg" style="border-radius: 2%;" />
	      							<div style="text-align: center;font-size: 13px;margin-top: 10px 0;">
		      					
			      					<%=rs2.getString(2) %><br>
			      					<span style="font-family: sans-serif;"> ????????? : <%=reserveRate2 %> %&nbsp;|&nbsp;
			      					 <img src="images/icon02.png" width="15" height="15" class="icon02" />&nbsp;
			      					 <%if(grade.length()<=3)out.println(grade);
	            						else out.println(grade.substring(0, 3));%>
			      					</span>	
			      					</div>
			      					
			      					</a>
	      						<%
	      							}
	      						%>
		      					
		      					
		      					
	      					</div>
	      					
	      			<% 			
	      						}p++;}
	      					
	      					
	      					
	      					
	      				}catch(Exception e){
	      					e.printStackTrace();
	      				}
      				%>
	                </div>
	               <!--  <div class="swiper-pagination"></div> -->
	                <div class="swiper-button-prev"></div> 
					<div class="swiper-button-next"></div> 
					
                	</div>
                	
                	
                	<div>
					<%
						if(tit.equals("3")){
					%>		
						<div class="tit_text"><a href="movieAfter.jsp">?????? ????????? ??? ????????????+</a></div>
						
					<% 
						}else{
					%>		
						<div class="tit_text"><a href="movieAll.jsp">??????????????? ??? ????????????+</a></div>
					<% 
						}
					%>
					</div>
	<!-- Swiper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
      slidesPerView: 5,
      spaceBetween: 15,
      // init: false,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      breakpoints: {
        640: {
          slidesPerView: 1,
          spaceBetween: 20,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 20,
        },
        1024: {
          slidesPerView: 5,
          spaceBetween: 30,
        },
      }
    });
	</script>
	
	
	</div><!-- ??????????????? ??? -->
    
    <%
    	String s_sql="select movieID,movieTitle,steel1,click from movie order by click desc limit 4";
    	PreparedStatement s_pstmt = con.prepareStatement(s_sql);
    	ResultSet s_rs = s_pstmt.executeQuery();
    	
    %>
    
    
    
    
    <div style="margin: 100px 0;" class="main_wrap">
    	<div class="main_title">
    		BEST PLAY
    	</div>
    	<div style="text-align: center;margin: 10px 0;">
    		?????? ??????????????? ?????? ?????? ??????????????? ???????????????.
    	</div>
    	<div class="best_down_area">
    		<div class="bd_thumb">
    			<%
    				s_rs.next();
    				String movieImages=s_rs.getString(3);
    				String movieTitle2=s_rs.getString(2);
    				String movieID2=s_rs.getString(1);
    				int click= s_rs.getInt(4);
    			%>
    			<a href="movieDetail.jsp?movieID=<%=movieID2 %>" target="_blank">
    				<img src="movieImages/<%=movieImages%>" >
    			</a>
    		<div class="txt_box">
    			<!-- <div class="bd_type">
    				<span>????????????</span>
    			</div> -->
    			<div class="bd_tit">
    				<%=movieTitle2 %>
    			</div>
    			<div class="bd_tit2">
    				????????? <%=click %>???
    			</div>
    		</div>	
    		</div>
    		
    		<div class="bd_down_list" id="vodList">
    			<%
    				s_rs.next();
    				movieImages=s_rs.getString(3);
    				movieTitle2=s_rs.getString(2);
    				movieID2=s_rs.getString(1);
    				click= s_rs.getInt(4);
    			%>
    			<a href="movieDetail.jsp?movieID=<%=movieID2 %>" target="_blank">
    				<div class="bd_down_box"  target="_black">
    				<img src="movieImages/<%=movieImages%>" >
    					<div class="bd_info_box">
    						<div class="bd_info_tit">
    							<div class="dot_st"><%=movieTitle2 %></div>
    							<div class="bd_info_down">
    								<button type="button" class="btn_down_s"></button>
    							</div>
    							<div class="bd_tit3">
				    				????????? <%=click %>???
				    			</div>
    						</div>
    					</div>
    				</div>
    			</a>
    			
    			<%
    				s_rs.next();
    				movieImages=s_rs.getString(3);
    				movieTitle2=s_rs.getString(2);
    				movieID2=s_rs.getString(1);
    				click= s_rs.getInt(4);
    			%>
    			<a href="movieDetail.jsp?movieID=<%=movieID2 %>" target="_blank">
    				<div class="bd_down_box"  target="_black">
    				<img src="movieImages/<%=movieImages%>" >
    					<div class="bd_info_box">
    						<div class="bd_info_tit">
    							<div class="dot_st"><%=movieTitle2 %></div>
    							<div class="bd_info_down">
    								<button type="button" class="btn_down_s"></button>
    							</div>
    							<div class="bd_tit3">
				    				????????? <%=click %>???
				    			</div>
    						</div>
    					</div>
    				</div>
    			</a>
    			
    			<%
    				s_rs.next();
    				movieImages=s_rs.getString(3);
    				movieTitle2=s_rs.getString(2);
    				movieID2=s_rs.getString(1);
    				click= s_rs.getInt(4);
    			%>
    			<a href="movieDetail.jsp?movieID=<%=movieID2 %>" target="_blank">
    				<div class="bd_down_box"  target="_black">
    				<img src="movieImages/<%=movieImages%>" >
    					<div class="bd_info_box">
    						<div class="bd_info_tit">
    							<div class="dot_st"><%=movieTitle2 %></div>
    							<div class="bd_info_down">
    								<button type="button" class="btn_down_s"></button>
    							</div>
    							<div class="bd_tit3">
				    				????????? <%=click %>???
				    			</div>
    						</div>
    					</div>
    				</div>
    			</a>
    			
    			
    		</div>
    		
    	</div>
    </div>
    
    
 		
  	
    	<br><Br><Br>
    	
    	
    	<%
                	String sql2 = "select * from noticelist limit 4";
                	PreparedStatement pstmt2 = con.prepareStatement(sql2);
                	ResultSet rs2 =  pstmt2.executeQuery();
                	
                	String sql3 = "select * from faq limit 4";
                	PreparedStatement pstmt3 =con.prepareStatement(sql3);
                	ResultSet rs3 = pstmt3.executeQuery();
                	rs2.next();
                	
                	String notice_date = rs2.getString(4);
                	
                %>
                
                
                
                <div style="margin: auto;">
					<div class="mainNotice">
						<span class="notice_tit">????????????</span>
						<span class="notice_tit2"><a href="customNoticeView.jsp?no=<%=rs2.getInt(1)%>"><%=rs2.getString(2) %></a></span>
						<span style="margin-left:30px;"><%=notice_date.substring(0, 11) %></span>
						<a class="notice_tit3" href="customNotice.jsp">?????????</a>	
					</div>
				</div>
                
             <div style="clear: both;"></div>
    </div>
  </div><!-- section ??? -->
  <div style="clear: both;"></div>
  <script>
            
     		var target = document.getElementsByClassName('post-count');
     		var backWrap = document.getElementById("backgroundWrap");
     		var title = document.getElementById("ba_title");
     		var rate = document.getElementById("ba_rate");
     		function overEvent(a,img,c,r){
     			target[a].style.display='block'
     			target[a].style.opacity='1';
     			/* backWrap.style.background='url(movieImages/'+img+')';
     			backWrap.style.backgroundSize='cover';
     			title.innerText=c;
     			rate.innerText="????????? : "+ r+'%'; */
     		}
     		function outEvent(a){
     			target[a].style.display='none';
     			target[a].style.opacity='0';
     			
     		}
     		
     		
     		
             </script>
  
  
  <div class="footer">
  	<div class="wrapper">
       <div style="display:flex;line-height: 79px; height: 60px;color: #888;" class="footerLogoWrap">
         <div style="margin-right:2%;" class="footerLogo">
           <a href="index.jsp"><img src="images/logo.png" height="80px" ></a>
         </div>
         <a href="mainInfo1.jsp"><h4>????????????</h4></a>&nbsp;&nbsp;??
          &nbsp;&nbsp;<a href="mainInfo2.jsp"><h4>????????????</h4></a>&nbsp;&nbsp;??
          &nbsp;&nbsp;<a href="mainInfo3.jsp"><h4>??????/????????????</h4></a> &nbsp;&nbsp;??
          &nbsp;&nbsp;<a href="manageLogin.jsp"><h4>????????? ?????????</h4></a>
       </div>
        <div class="footerb" style="margin-top:3%;">
        <ul style="white-space:nowrap;">
        <li style="list-style:none;"><span>??????</span>&nbsp;&nbsp;???????????? ????????? ????????? ????????? ????????? 91, 3???(????????? 3???)  <span>ARS</span>&nbsp;&nbsp;1544-6416</li>
        <li style="list-style:none;"><span>????????????</span>&nbsp;&nbsp;????????? <span>???????????????????????????</span>&nbsp;&nbsp;????????? <span>?????????????????????</span>&nbsp;&nbsp;411-82-17852 &nbsp;</li>
        <li style="list-style:none;"><span>COPYRIGHT ?? MovieStoreJoongAng, Inc. All rights reserved</span></li>
        </ul>
        </div>
      </div>
  </div>
 

</body>
</html>