function chageLangSelect(){ 
		    	var x = document.getElementById('movieTitle').selectedIndex;
		    	var y= x+1;
		    	var langSelect = document.getElementById("movieTitle"); 	
		    	var selectValue = langSelect.options[langSelect.selectedIndex].value; // select element에서 선택된 option의 value가 저장된다. 
		    	location.href='reserveMain.jsp?movieID='+y;
		    	} 
		    
function changePrice(){
		var price = document.querySelector('#price');
		var movieTitle = document.getElementById('movieTitle').selectedIndex;
	    var price_btm = document.getElementsByClassName('movieDate1')[5];
		var a1=0;
		var a2=0;
		var a3=0;
		
		
		if(isNaN(reserveMain.adult.value)){
		reserveMain.adult.value="0";
		alert('숫자만 입력해주세요');
		
		}
		if(reserveMain.adult.value<0){
		reserveMain.adult.value="0";
		}
		if(isNaN(reserveMain.student.value)){
		reserveMain.student.value="0";
		alert('숫자만 입력해주세요');
		
		}
		if(reserveMain.student.value<0){
		reserveMain.student.value="0";
		}
		if(isNaN(reserveMain.baby.value)){
		reserveMain.baby.value="0";
		alert('숫자만 입력해주세요');
		
		}
		if(reserveMain.baby.value<0){
		reserveMain.baby.value="0";
		}
			
		var a1_ = document.querySelector('#adult').value;
		if(a1_==null||a1_==""||isNaN(a1_))a1=0;
		else a1=parseInt(a1_);
		
		var a2_ = document.querySelector('#student').value;
		if(a2_==null||a2_==""||isNaN(a2_))a2=0;
		else a2=parseInt(a2_);
		
		var a3_ = document.querySelector('#baby').value;
		if(a3_==null||a3_==""||isNaN(a3_))a3=0;
		else a3=parseInt(a3_);
		
		
		var price1 = a1*12000+a2*10000+a3*6000;
		if(movieTitle==0||movieTitle==2||movieTitle==3||movieTitle==15||movieTitle==16){
			price1=price1*90/100;
			price_btm.innerHTML=price1+"원";
		}
		price.value=price1+"원";
		price_btm.innerHTML=price.value;
}

function checkValue(){
	
	if(reserveMain.adult.value==""||reserveMain.student.value==""||reserveMain.baby.value==""){
		alert('관람객의 숫자를 입력해주세요');
		reserveMain.adult.focus();
		return;
	}
	
	
	if(isNaN(reserveMain.adult.value)){
		reserveMain.adult.value="0";
		alert('숫자만 입력해주세요');
		return;
		
		}
		if(reserveMain.adult.value<0){
		reserveMain.adult.value="0";
		return;
		}
		if(isNaN(reserveMain.student.value)){
		reserveMain.student.value="0";
		alert('숫자만 입력해주세요');
		
		}
		if(reserveMain.student.value<0){
		reserveMain.student.value="0";
		return;
		}
		if(isNaN(reserveMain.baby.value)){
		reserveMain.baby.value="0";
		alert('숫자만 입력해주세요');
		
		return;
		
		}
		if(reserveMain.baby.value<0){
		reserveMain.baby.value="0";
		return;
		}
	if(reserveMain.movieDate.value==""){
		alert("상영하시는 날짜를 입력해주세요");
		reserveMain.movieDate.focus();
		return;
	}
	if(reserveMain.movieTime.value==""){
		alert("관람 시간을 입력해주세요");
		reserveMain.movieTime.focus();
		return;
	}
	
	reserveMain.submit();
}

function checkValue2(a){
	var target=document.querySelectorAll('input[type=checkbox]');
	var count=0;
	for(var i=0;i<target.length;i++){
		if(target[i].checked){
			count++;
		}
	}
	if(count<a){
		alert(a+'명의 좌석을 선택해 주세요.');
		return;
	}
	reserveMain2.submit();
}

function changeDate(){
			var d1 = document.getElementById('movieDate');
			var d2 = document.getElementsByClassName('movieDate1');
			var d3 = document.getElementById('movieTime');
			var price1 = document.getElementById('adult');
			var price2 = document.getElementById('student');
			var price3 = document.getElementById('baby');
			var price= price1.value*12000+price2.value*10000+price3.value*6000;
			
			d2[0].innerHTML = "어른"+price1.value+"명";
			d2[1].innerHTML = "청소년"+price2.value+"명";
			d2[2].innerHTML = "아이"+price3.value+"명";
			d2[3].innerHTML = d1.value;
			d2[4].innerHTML = d3.value;
			/*d2[5].innerHTML = price+"원";*/
			
		}


//////////reserveSeat//////////////

			function selectSeat(a,p){
				
				var check = document.getElementById('td'+a);
				var st="";
				var count=0;
				var seat = document.getElementById('seat'+a);
				var i = document.getElementsByClassName('bottom1_2');
				var target=document.querySelectorAll('input[type=checkbox]')
				
				
				for(var j=0;j<target.length;j++){
						if(target[j].checked){
							if(count>=p){
								alert('좌석선택이 완료되었습니다.');
								seat.checked='';
								check.style.background='white';//명시적으로 red를준다.
								return;
								}
							else{
								if(st==""){
									st+=target[j].value;
									count++;
								}else{
									st=st+" , "+target[j].value;
									count++;
								}
							}
						}
					}
					
				
				
				if(st==""){
					i[0].innerHTML='<div style="font-size: 19px;color:red;">STEP 2</div>&nbsp;좌석선택';
				}else{
					i[0].innerHTML='<span style="font-size:20px;line-height: 150px;height:150px;position: relative;top: 4px;left: -2px;">좌석 : '+st+'</span>';
				}
				
				if(check.style.background=='goldenrod'){
					check.style.background='white';
				}else if(check.style.background=='white'){
					check.style.background='goldenrod';
				}else if(check.style.background=='red'){
					check.style.background='white';
				}
			}
				




			function openBasic(){
				
				window.open('index.jsp','_blank','width=245, height=200, scrollbars=no, resizable=no');
			}








///////////////////reservePay//////////////////////////
				
     			
     			
     			function openCoupon(){
     				var target = document.getElementsByClassName('coupon1');
     				var i=document.querySelector('.open1');
     				var j = document.querySelector('.open2');
     				if(i.style.display=='none'){
     					i.style.display='block';
     					target[0].innerHTML='<img src="images/btn-top.png" width="30" height="23" onclick="openCoupon();">'
     				}else if(i.style.display=='block'){
     					i.style.display='none';
						target[0].innerHTML='<img src="images/btn-bottom.png" width="30" height="23" onclick="openCoupon();">'
     				}
     			}
     			
     			function openPoint(){
					var target = document.getElementsByClassName('coupon1');
     				var i=document.querySelector('.open1');
     				var j = document.querySelector('.open2');
     				if(j.style.display=='none'){
     					j.style.display='block';
     					target[1].innerHTML='<img src="images/btn-top.png" width="30" height="23" onclick="openPoint();">'
     				}else if(j.style.display=='block'){
     					j.style.display='none';
						target[1].innerHTML='<img src="images/btn-bottom.png" width="30" height="23" onclick="openPoint();">'
     				}
     			}

				function openTicket(){
					var target = document.getElementsByClassName('coupon1');
     				var i=document.querySelector('.open1');
     				var j = document.querySelector('.open3');
     				if(j.style.display=='none'){
     					j.style.display='block';
     					target[2].innerHTML='<img src="images/btn-top.png" width="30" height="23" onclick="openTicket();">'
     				}else if(j.style.display=='block'){
     					j.style.display='none';
						target[2].innerHTML='<img src="images/btn-bottom.png" width="30" height="23" onclick="openTicket();">'
     				}
     			}



					function useCoupon(){
             				var mc_ = document.querySelector('#myCoupon');
             				var mc = mc_.value;
             				var c_ = document.querySelector('#coupon');
             				var c = parseInt(c_.innerHTML);
             				var tp_= document.querySelector('#totalPrice');
             				var op_= document.querySelector('#oPrice');
             				var t_ = document.querySelector('#totalMinus');
             				var t = parseInt(t_.innerHTML);
             				var tp =parseInt(tp_.innerHTML);
             				var op =parseInt(op_.innerHTML);
             				
             				if(c==0){
             					alert('쿠폰이 없습니다.');
             				}else{
             					if(tp<0){
             						alert('남은 결제금액이 없습니다.');
             					}else{
             						c_.innerHTML=c-1;
             						tp_.innerHTML=op-5000;
             						t.innerHTML +=mc*5000;
             					}
             				}	
             			}
             			function usePoint(a,b){
							var mc_ = document.querySelector('#myCoupon');
             				var mc = parseInt(mc_.value);
             				var c_ = document.querySelector('#coupon');
             				
             				var i_=document.querySelector('#point');
             				var v_ = document.querySelector('#useP');
             				var t_ = document.querySelector('#totalMinus');
             				var tp_= document.querySelector('#totalPrice');
             				var op_= document.querySelector('#oPrice');
             				
             				var i = parseInt(i_.innerHTML);
             				
             				var t = parseInt(t_.innerHTML);
             				var tp =parseInt(tp_.innerHTML);
             				var op =parseInt(op_.innerHTML);
             				tp_.innerHTML =op;
             				if(isNaN(v_.value)){
             					alert('숫자만 입력해주세요.');
             					v_.value=0;
             					t_.innerHTML = b;
								tp_.innerHTML =op-b;
								mc_.value=0;
 								c_.innerHTML=a;
             					return;
             				}else{
             					var v = parseInt(v_.value);
             				}
             				
             				
             				if(isNaN(v_.value)){
             					alert('숫자만 입력해주세요');
             					v_.value=0;
             					t_.innerHTML = b;
								tp_.innerHTML =op;
								mc_.value=0;
 								c_.innerHTML=a;
             				}else if(v<=0){
             					v_.value=0;
             					t_.innerHTML = b;
								tp_.innerHTML =op-b;
								mc_.value=0;
     							c_.innerHTML=a;
             				}else if(v>i){
             					alert('보유하신 포인트보다 큰 숫자를 입력했습니다. 다시 입력해주세요.');
             					v_.value=0;
             					t_.innerHTML = b;
								tp_.innerHTML =op-b;
								mc_.value=0;
     							c_.innerHTML=a;
             				}else{
             					if((op-(t+v))<0){
             						alert('남은 결제금액보다 큰 숫자입니다. 다시 입력해주세요.');
             						t_.innerHTML =b;
             						v_.value=0;
             						tp_.innerHTML =op-b;
									mc_.value=0;
     								c_.innerHTML=a;
             					}else{
                 					t_.innerHTML = t+v;
                 					tp_.innerHTML = op - parseInt(t_.innerHTML);
                 					v_.readOnly=true;
                 					
             					}
             				}
             			}
             			
             			
             			function restartPoint(a,b){
             				var i_=document.querySelector('#point');
             				var v_ = document.querySelector('#useP');
             				var t_ = document.querySelector('#totalMinus');
             				var tp_= document.querySelector('#totalPrice');
             				var op_= document.querySelector('#oPrice');
             				var mc_ = document.querySelector('#myCoupon');
             				var mc = parseInt(mc_.value);
             				var c_ = document.querySelector('#coupon');
             				
             				var i = parseInt(i_.innerHTML);
             				
             				var t = parseInt(t_.innerHTML);
             				var tp =parseInt(tp_.innerHTML);
             				var op =parseInt(op_.innerHTML);
             				v_.readOnly=false;
             				t_.innerHTML =b;
     						v_.value=0;
     						tp_.innerHTML =op-b;
     						mc_.value=0;
     						c_.innerHTML=a;
     						
             			}




	function plus(){
             				var mc_ = document.querySelector('#myCoupon');
             				var mc = parseInt(mc_.value);
             				var c_ = document.querySelector('#coupon');
             				var c = parseInt(c_.innerHTML);
             				var tp_= document.querySelector('#totalPrice');
             				var op_= document.querySelector('#oPrice');
             				var t_ = document.querySelector('#totalMinus');
             				var t = parseInt(t_.innerHTML);
             				var tp =parseInt(tp_.innerHTML);
             				var op =parseInt(op_.innerHTML);
             				
             				if(c==0){
             					alert('쿠폰이 없습니다.');
             				}else{
             					if(tp<5000){
             						alert('남은 결제 금액이 없습니다.');
             					}else{
             						mc_.value=mc+1;
                 					c_.innerHTML=c-1;
                 					tp_.innerHTML = tp - 5000;
                 					t_.innerHTML = t+5000;
             					}
             					
             				}
             			}
             			function minus(){
             				
             				var mc_ = document.querySelector('#myCoupon');
             				var mc = parseInt(mc_.value);
             				var c_ = document.querySelector('#coupon');
             				var c = parseInt(c_.innerHTML);
             				var tp_= document.querySelector('#totalPrice');
             				var op_= document.querySelector('#oPrice');
             				var t_ = document.querySelector('#totalMinus');
             				var t = parseInt(t_.innerHTML);
             				var tp =parseInt(tp_.innerHTML);
             				var op =parseInt(op_.innerHTML);
             				
             				if(mc==0){
             					alert('더이상 뺄 수 없습니다.')
             				}else{
             					if(t<0){
             						alert('할인금액은 0 보다 작을수 없습니다.');
             					}else{
                 					mc_.value=mc-1;
                 					c_.innerHTML=c+1;
                 					tp_.innerHTML = tp + 5000;
                 					t_.innerHTML = t-5000;
             					}
             					
             				}
             			}




					function checkReserveValue(){
						
						if(reserveSnack.payBank.value == ""&&reserveSnack.payPhone2.value=="")   
						    {
								alert("결제방법을 선택하여주세요"); 					
								return false;                        
						    }
						if(reserveSnack.payBank.value != ""&&reserveSnack.payPhone2.value!="")   
						    {
								alert("결제방법을 한 가지만 선택하여주세요"); 					
								return false;                        
						    }
						if(reserveSnack.payBank.value!=""){
							if(reserveSnack.payCard1.value==""){
								alert("첫번째 카드번호를 입력해주세요");
								reserveSnack.payCard1.focus();
								return;
							}
							if(reserveSnack.payCard2.value==""){
								alert("두번째 카드번호를 입력해주세요");
								reserveSnack.payCard2.focus();
								return;
							}
							if(reserveSnack.payCard3.value==""){
								alert("세번째 카드번호를 입력해주세요");
								reserveSnack.payCard3.focus();
								return;
							}
							if(reserveSnack.payCard4.value==""){
								alert("네번째 카드번호를 입력해주세요");
								reserveSnack.payCard4.focus();
								return;
							}
							if(reserveSnack.payPass.value==""){
								alert("카드 비밀번호를 입력해주세요");
								reserveSnack.payPass.focus();
								return;
							}
							
						}
						
						if(reserveSnack.payPhone2.value!=""){
							if(reserveSnack.payPhone3.value==""){
								alert("전화번호를 입력해주세요");
								reserveSnack.payPhone3.focus();
								return;
							}
						}
						reserveSnack.submit();
						
					}
					
					
					
					function kakao(){
						var popupWidth = 428;
						var popupHeight = 527;
						
						var popupX = (window.screen.width / 2) - (popupWidth / 2);
						// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
						
						var popupY= (window.screen.height / 2) - (popupHeight / 2);
						// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
						var price1 = document.querySelector('#totalPrice');
						var price = price1.innerHTML;
						window.open('reserveKakao.jsp?price='+price,"check",'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
					}
