<%@page import="rem.admin.board.notice.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<%@include file="/WEB-INF/include/category.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainBoard/mainBoard.css">
<script>
	noticeList = <%=new Gson().toJson(request.getAttribute("searchedList")) %>;
	console.log(noticeList);
	noticeSearchText = "<%=request.getAttribute("searchText") %>";
	noticeView = "<%=request.getContextPath()%>/main/notice/view.do?noticeNo=";
</script>
<!-- 2)_ 비동기/ 공지글 리스트 by.검색어 -->
<script defer src="<%=request.getContextPath() %>/js/mainBoard/mainBoardNoticeDefer.js"></script>


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
</div>
<!-- ■■■■■■■■■■■■■■■■■■■■ -->

<script>
/* 1)_ 검색기능 */
$("#searchNoticeBtn").on("click", function(){
	const search_text = $('#searchNoticeText').val();
	if (search_text == "") {
		$("#searchNoticeText").attr("placeholder", "검색어를 입력하세요..!");
		return false;
	} else {
		location.href = "<%=request.getContextPath()%>/main/notice/search.do?sch="+search_text;
	}
});
</script>

<%@include file="/WEB-INF/include/footer.jsp" %>