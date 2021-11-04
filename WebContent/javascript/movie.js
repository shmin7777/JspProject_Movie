function checkGrade(){
	if(movieGrade.gradeContent.value==""){
		alert('관람평을 작성해주세요.');
		movieGrade.gradeContent.focus();
		return;
	}
	movieGrade.submit();
}


function checkPostWrite(){
	if(moviePostWrite.summary.value==""){
		alert("내용을 작성해주세요.");
		moviePostWrite.summary.focus();
		return;
	}
	moviePostWrite.submit();
}

function openPostView(a){
	var popupWidth = 750;
var popupHeight = 800;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

window.open('moviePostDetail.jsp?no='+a, '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

function checkReple(){
	if(repleInsert.repleContent.value=""){
		alert("내용을 작성해주세요.");
		repleInsert.repleContent.focus();
		return;
	}
	repleInsert.submit();
}