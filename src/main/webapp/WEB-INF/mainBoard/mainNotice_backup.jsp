<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<%@include file="/WEB-INF/include/category.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainBoard/mainBoard.css">
<script src="<%=request.getContextPath() %>/js/mainBoard/mainBoardNoticeList.js"></script>

<%
	String searchText = (String)request.getAttribute("searchText");
%>
<!-- ■■■■■■■■■■■■■■■■■■■■ -->
<div class="inner kcy_board">
	<div class="kcy_boardHeader">
		<br><br>
		<span class="bHeader_normal">띹장터 서비스의 </span>
		<span class="bHeader_highlight">신규</span>
		<span class="bHeader_normal"> 및 </span>
		<span class="bHeader_highlight">업데이트</span>
		<span class="bHeader_normal"> 소식을 알려드립니다!</span>
	</div>
	
	<div class="kcy_boardSearch">
		<div class="kcy_serch_box">
			<input type="text" id="searchNoticeText" placeholder="제목/내용으로 검색" style="border:none; width:240px;"/>
			<span class="material-symbols-outlined" id="searchNoticeBtn" style="font-size:27px;cursor:pointer;">search</span>
		</div>
	</div>
	<br><br><hr style="color:#cecece;">
	
	<div class="kcy_boardList_div">
		<ul class="kcy_boardList">
		</ul>
	</div>
	
	<div class="buttons">
	</div>
</div>
<!-- ■■■■■■■■■■■■■■■■■■■■ -->


<script>
let noticeList = {};
let noticeView = "<%=request.getContextPath()%>/main/notice/view.do?noticeNo=";
let memNo = <%=loginInfo.getMem_no() %>;
let access = "OK";
if(memNo==null)
	access = "DENIED";
	
$(function(){

	$.ajax({
		url: "<%=request.getContextPath()%>/main/noticeList.do",
		type: "POST",
		data: {access: access},
		success: function(data){
			noticeList = data;
			
		    numOfContent = noticeList.length; // 전체 상품 갯수 저장
		    maxPage = Math.ceil(numOfContent / maxContent); // 페이지 수 계산
		    
		    renderContent(page); // 시작페이지에 해당하는 상품 리스트 띄우기
		    renderButton(page);
		},
		error: function(xhr){
			console.log(xhr.status);
		}
	});
	
	renderContent(page); // 시작페이지에 해당하는 상품 리스트 띄우기
	renderButton(page);
});

//버튼을 클릭할때 해당 페이지로 이동하고 버튼을 새로 랜더링
$(document).on("click", ".button", function () {
  let page = parseInt($(this).text());

  renderContent(page);
  renderButton(page);
});

/* 1)_ 검색기능 */
$("#searchNoticeBtn").on("click", function(){
	const search_text = $('#searchNoticeText').val();
	if (search_text == "") {
console.log(noticeList);
		$("#searchNoticeText").attr("placeholder", "검색어를 입력하세요..!");
		return false;
	} else {
		location.href = "<%=request.getContextPath()%>/main/notice/search.do?sch="+search_text;
	}
});
</script>


<%@include file="/WEB-INF/include/footer.jsp" %>