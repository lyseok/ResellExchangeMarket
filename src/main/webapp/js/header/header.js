/**
 * 
 */

$(function(){
	document.getElementById('top_btn').addEventListener('click', function () {
	  //창의 스크롤을 본문 최상단으로 부드럽게 이동시킵니다.
	  window.scroll({
	  	top: 0,
	    behavior: 'smooth',
	  });
	}, { once: false });
})
