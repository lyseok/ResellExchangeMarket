<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<%@include file="/WEB-INF/include/category.jsp" %>
<%@ page isELIgnored="false" %>
<%-- <script defer src="<%=request.getContextPath() %>/js/mainBoard/mainBoardQnaList.js"></script> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainBoard/mainBoard.css">

<!-- ■■■■■■■■■■■■■■■■■■■■ -->
<div class="inner kcy_board">
	<div class="kcy_boardHeader">
		<br><br>
		<span class="bHeader_normal">문의 내역</span>
	</div>
	
	<div class="kcy_boardSearch">
		<div class="kcy_serch_box">
			<input type="text" id="searchingWord" placeholder="제목/내용으로 검색" style="border:none; width:240px;"/>
			<span class="material-symbols-outlined" id="searchingBtn" style="font-size:27px;cursor:pointer;">search</span>
		</div>
	</div>
	<br><br><hr style="color:#cecece;">
	
	<div class="kcy_boardTable_div">
		<table class="kcy_boardTable" border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시간</th>
				<th>답변여부</th>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
			</tr>
		</table>
	</div>
	<div class="buttons">
	</div>
</div>
<!-- ■■■■■■■■■■■■■■■■■■■■ -->


<script>
const board = "<%=request.getAttribute("board")%>";
const urlContextPath = "<%=request.getContextPath()%>";

articleList = <%=new Gson().toJson(request.getAttribute("searchedList")) %>;
console.log(articleList);
articleSearchText = "<%=request.getAttribute("searchText") %>";
console.log(articleSearchText);
urlView = `<%=request.getContextPath()%>/main/${board}/view.do?${board}No=`;
/* 1)_ 검색기능 */
$("#searchingBtn").on("click", function(){
	const search_text = $('#searchingWord').val();
	if (search_text == "") {
		$("#searchingWord").attr("placeholder", "검색어를 입력하세요..!");
		return false;
	} else {
		location.href = `/REMProject/main/${board}/search.do?sch=\${search_text}`;
	}
});
</script>

<%@include file="/WEB-INF/include/footer.jsp" %>