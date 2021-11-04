function checkValue()             // 회원가입폼에서 미입력한 항목이 있을 경우, 경고메시지를 보여주는 함수
{                                           
	if(newMem.id.value == "")     // if(document.newMem.id.value == "")라고 사용해도 동일함
    {
		alert("ID를 입력해 주세요!");  //  문자열이 포함된 경고창을 실행시킴
		newMem.id.focus();					//  작업의 포커스(커서)를 ID를 입력하는 텍스트필드로 이동시킴  
		return false;                         //  함수의 실행을 종료함 ( "return false; " 라고 사용해도 동일함)
    }

    if(newMem.password.value == "") 
    {
		alert("비밀번호를 입력해 주세요!");
		newMem.password.focus();
		return false;
    }

    if(newMem.name.value == "") 
    {
		alert("성명을 입력해 주세요!");
		newMem.name.focus();
		return false;
    }
	if(newMem.joomin1.value == "") 
    {
		alert("주민등록번호 첫번째 자리를 입력해주세요!");
		newMem.joomin1.focus();
		return false;
    }
	if(newMem.joomin2.value == "") 
    {
		alert("주민등록번호 두번째 자리를 입력해주세요!");
		newMem.joomin2.focus();
		return false;
    }
	if(newMem.joomin1.value.length != 6) 
    {
		alert("주민등록번호 첫번째 자리는 6자리 입니다.");
		newMem.joomin1.focus();
		return false;
    }


	if(newMem.phone1.value == "") 
    {
		alert("휴대폰 앞자리 국번을 입력해 주세요!");
		newMem.phone1.focus();
		return;
    }

    if(newMem.phone2.value == "") 
    {
		alert("휴대폰 중간자리 번호를 입력해 주세요!");
		newMem.phone2.focus();
		return;
    }

    if(newMem.phone3.value == "") 
    {
		alert("휴대폰 끝자리 번호를 입력해 주세요!");
		newMem.phone3.focus();
		return;
    }
	  if(newMem.email.value == "") 
    {
		alert("이메일을 입력해 주세요!");
		newMem.email.focus();
		return;
    }

    newMem.submit();   // 입력한 값들을 모두 서버로 전송함 (전송버튼 클릭하는 것과 같은 효과)
}





function idFocus()        // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{										// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	newMem.id.focus();
	return;
}


function checkID(){
	var id = newMem.id.value;
	
	
	 if (id  == "")				
    {
		alert("ID를 입력해 주세요!"); 
		newMem.id.focus(); 
		return; 
    }
	window.open("checkID.jsp?id="+encodeURI(encodeURIComponent(id)),"check","width=245, height=200, scrollbars=no, resizable=no");
	
}

///////////////////////////join.jsp/////////////////////////

function loginCheck(){
	if(newLog.id.value==""){
		alert("아이디를 입력해주세요!");
		newLog.id.focus();
		return;
	}
	if(newLog.password.value==""){
		alert("비밀번호를 입력해주세요!");
		newLog.password.focus();
		return;
	}
	newLog.submit();
}
function loginCheck2(){
	if(adminLog.id.value==""){
		alert("아이디를 입력해주세요!");
		adminLog.id.focus();
		return;
	}
	if(adminLog.password.value==""){
		alert("비밀번호를 입력해주세요!");
		adminLog.password.focus();
		return;
	}
	adminLog.submit();
}

function idFocus2()        // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{										// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	newLog.id.focus();
	return;
}
function idFocus3()        // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{										// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	newID.name.focus();
	return;
}
function idFocus4()        // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{										// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	adminLog.id.focus();
	return;
}


function findID(){
	if(newID.name.value==""){
		alert("이름을 입력해주세요!");
		newID.name.focus();
		return;
	}
	if(newID.email.value==""){
		alert("이메일을 입력해주세요!");
		newID.email.focus();
		return;
	}
	newID.submit();
}


function findPass(){
	if(newPass.id.value==""){
		alert("아이디를 입력해주세요!");
		newPass.name.focus();
		return;
	}
	if(newPass.phone2.value==""){
		alert("두번째 전화번호를 입력해주세요!");
		newPass.phone2.focus();
		return;
	}
	if(newPass.phone3.value==""){
		alert("세번째 전화번호를 입력해주세요!");
		newPass.phone3.focus();
		return;
	}
	newPass.submit();
}



function onEnterSubmit()     // 로그인버튼을 클릭하지 않고, 엔터키를 입력하더라도 로그인 가능하게 해줌               
{
  	var keyCode = event.keyCode;
   	if(keyCode==13){
	  newLog.submit();    //  "keyCode==13"은 엔터키가 입력됨을 의미함
}
}

function onEnterSubmit1()     // 로그인버튼을 클릭하지 않고, 엔터키를 입력하더라도 로그인 가능하게 해줌               
{
  	var keyCode = event.keyCode;
   	if(keyCode==13){
	  newID.submit();    //  "keyCode==13"은 엔터키가 입력됨을 의미함
}
}
function onEnterSubmit2()     // 로그인버튼을 클릭하지 않고, 엔터키를 입력하더라도 로그인 가능하게 해줌               
{
  	var keyCode = event.keyCode;
   	if(keyCode==13){
	  newPass.submit();    //  "keyCode==13"은 엔터키가 입력됨을 의미함
}
}

function onEnterSubmit3()     // 로그인버튼을 클릭하지 않고, 엔터키를 입력하더라도 로그인 가능하게 해줌               
{
  	var keyCode = event.keyCode;
   	if(keyCode==13){
	  adminLog.submit();    //  "keyCode==13"은 엔터키가 입력됨을 의미함
}
}


////////////////////////login.jsp/////////////////

function checkOne(){
	if(customOne.title.value==""){
		alert("제목을 입력해 주세요!");
		customOne.title.focus();
		return;
	}
	if(customOne.content.value==""){
		alert("내용을 입력해 주세요!");
		customOne.content.focus();
		return;
	}
	customOne.submit();
}

////////////////////CustomFAQ/////////////////////////////

function openFAQ(no){
	
	var target = document.querySelector('#'+no);
		var cImg = document.querySelector('#c'+no);
	console.log(cImg);
		if(target.style.display=='none'){
			target.style.display='table-row';
			cImg.innerHTML="<img src='images/btn-top.png' class='qnaBtn'>";
		}else if(target.style.display=='table-row'){
			target.style.display='none';
			cImg.innerHTML="<img src='images/btn-bottom.png' class='qnaBtn'>";
		}
	}


////////////////////myPageHome/////////////////////////

function openGift(){
	var popupWidth =633;
var popupHeight =521;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

window.open('myPageGiftView.jsp','check', 'status=no, height=521, width=633, left='+ popupX + ', top='+ popupY+'resizable=no');
}



