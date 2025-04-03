/**
 * 
 */

document.getElementById('top_btn').addEventListener('click', function () {
  //창의 스크롤을 본문 최상단으로 부드럽게 이동시킵니다.
  window.scroll({
  	top: 0,
    behavior: 'smooth',
  });
}, { once: false });

$('#searchBtn').on('click', function() {
	search();
});

$('#searchText').on('keydown', function(e){
	if(e.keyCode == 13){
		search();
	}
});

$.ajax({
	url: `${mypath}/wishlist/countWishlist.do`,
	type: "post",
	success: function(data) {
		$('#countWishlist').text(data);
	},
	error: xhr => {
		console.log(xhr.status);
	},
	dataType: "json"
});





const search = () => {
	let searchKeyword = $('.search_box input').val();
	if(searchKeyword == "") {
		alert("검색어를 입력하세요.");
		return false;
	} else {
		location.href = `${mypath}/searchPage.do?searchText=${searchKeyword}`;
	}
}