<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<%@include file="/WEB-INF/include/category.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainBoard/mainBoard.css">

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

/* 2)_ 비동기/ 공지글 리스트 */
$(function(){
	let memNo = <%=loginInfo.getMem_no() %>;
	let access = "OK";
	if(memNo==null)
		access = "DENIED";
	$.ajax({
		url: "<%=request.getContextPath()%>/main/noticeList.do",
		type: "POST",
		data: {access: access},
		dataType: "json",
		success: function(data){
			code = "<ul class='kcy_boardList'>";
			let noticeView = "<%=request.getContextPath()%>/main/notice/view.do?noticeNo=";
			data.forEach(vo => {
				let noticeTitle = vo.notice_title;
				let noticeAt = vo.notice_at;
				let noticeNo = vo.notice_no;
				let noticeView_url = noticeView + noticeNo;
				code +="<li><span id='noticeTitle' style='float:left;'><a href='"+noticeView_url+"'>"+noticeTitle+"</a></span><span id='noticeAt' style='float:right;max-height:fit-content;'>"+noticeAt+"</span></li>";
			});
			
			code +="</ul>";
			$(".kcy_boardList_div").html(code);
		},
		error: function(xhr){
			console.log("상태: " +xhr.status);
		}
			
	});
});
</script>


<%@include file="/WEB-INF/include/footer.jsp" %>