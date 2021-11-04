function directOrd()        //  "구매하기" 버튼을 클릭시 호출
{
	var frm = document.snackForm;
	frm.action = "reserveDirectSnackPay.jsp";
	frm.submit();
}


function inCart()              //  "장바구니담기" 버튼을 클릭시 호출
{
	var frm = document.snackForm;
	frm.action = "inCart.jsp";
	frm.submit();
}
function cartBuy(){
	var frm = document.cartForm;
	frm.action = "reserveSnackPay.jsp";
	frm.submit();
}
function Gift(){
	var frm = document.snackForm;
	frm.action = "reserveSnackGift.jsp";
	frm.submit();
}
function cartGift(){
	var frm = document.cartForm;
	frm.action = "reserveSnackGift.jsp";
	frm.submit();
}

function amountPlus(a)         //   주문수량을 1 증가 시킴
{
	var target=document.querySelector('#realPrice');
	obj=document.snackForm.snackQty;
	obj.value=parseInt(obj.value) + 1;
	target.innerHTML=obj.value*a+'원';
}


function amountMinus(a)        //   주문수량을 1 감소 시킴
{
	var target=document.querySelector('#realPrice');
	obj=document.snackForm.snackQty;
	if(parseInt(obj.value)  > 1)
	{
		obj.value=parseInt(obj.value) - 1;
		target.innerHTML=obj.value*a+'원';
	}
	else
	{
		alert('더이상 줄일수가 없습니다');
		return;
	}
}

function checkID(){
	var giftName = reserveSnackGift.giftName.value;
	var giftPhone = reserveSnackGift.giftPhone.value;
	
	var popupWidth = 245;
	var popupHeight = 200;
	
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	 if (giftName  == "")				
    {
		alert("받는분의 이름을 입력해 주세요!"); 
		reserveSnackGift.giftName.focus(); 
		return; 
    }
 if (giftPhone  == "")				
    {
		alert("받는분의 휴대전화 번호를 입력해 주세요!"); 
		reserveSnackGift.giftPhone.focus(); 
		return; 
    }
	window.open("checkGiftName.jsp?giftName="+encodeURI(encodeURIComponent(giftName))+'&giftPhone='+encodeURI(encodeURIComponent(giftPhone)),"check","status=no,width=245, height=200, left="+ popupX + ", top="+ popupY);
	
	
}
function checkGiftForm(){
	if(reserveSnackGift.giftName.value==""){
		alert("받는분의 이름을 입력해 주세요!");
		reserveSnackGift.giftName.focus();
		return;
	}
	if(reserveSnackGift.giftPhone.value==""){
		alert("받는분의 휴대전화 번호를 입력해 주세요!");
		reserveSnackGift.giftPhone.focus();
		return;
	}
	reserveSnackGift.submit();
}
