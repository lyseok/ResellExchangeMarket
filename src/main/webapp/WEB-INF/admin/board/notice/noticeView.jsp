<%@page import="rem.admin.board.notice.vo.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/board/qna.css">

	
	<%
		NoticeBoardVO vo = (NoticeBoardVO)request.getAttribute("board");
			out.println(vo);
	%>

<script>
$(function(){
	
// 수정 버튼을 클릭하면 textarea로admin_bd_view_cont의 내용을 가져와서 textarea에 넣어준다.
// 확인 버튼을 클릭하면 textarea의 내용을 가져와서 ajax로 보내준다.
// 취소 버튼을 클릭하면 textarea의 내용을 초기화한다.
	$('#updateBtn').on('click', function(){
		// 수정 버튼을 클릭하면 textarea로admin_bd_view_cont의 내용을 가져와서 textarea에 넣어준다.
		var cont = $('.admin_bd_view_cont').text().replaceAll(/<br>/g, "\n");
var code=`<textarea id="notice_cont" class="input" placeholder="내용을 입력하세요">\${cont}</textarea>
			<div class="btn_list03 btn_list">
				<button id="confirmBtn">확인</button>
				<button id="cancelBtn">취소</button>
			</div>`;
$('.admin_bd_view_cont').html(code);
	});
	
	$(document).on('click', '#confirmBtn', function(){
		// 확인 버튼을 클릭하면 textarea의 내용을 가져와서 ajax로 보내준다.
		var cont = $('#notice_cont').val().replaceAll(/\n/g, "<br>");
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/updateNotice.do",
			type: "post",
			data: {notice_no: <%=vo.getNotice_no()%>, notice_cont: cont},
			success: function(data){
				console.log(data);
				$('.admin_bd_view_cont').html(cont);
			},
			error: function(xhr){
				console.log(xhr.status);
			},
			dataType: "json"
		});
	});
	
	$(document).on('click', '#cancelBtn', function(){
		// 취소 버튼을 클릭하면 textarea의 내용을 초기화한다.
		var cont = $('.admin_bd_view_cont').text().replaceAll(/\n/g, "<br>");
		$('.admin_bd_view_cont').html(cont);
	});


});

</script>
	
    <div id="wrapper">

        <div id="container">

            <h1 id="container_title">글관리 > 문의</h1>
            <div class="container_wr">
                <section>
                    
                    <div class="local_desc local_desc02"></div>

                    <div class="admin_view_page_wrap">
                    	<div class="user_cont">
	                    	<div class="admin_bd_view_tit">
	                    		<h6><%=vo.getNotice_title() %></h6>
	                    		<b><%= vo.getNotice_at() %></b>
	                    	</div>
	                    	
	                    	
	                    	
	                    	<div class="admin_bd_view_cont"><%=vo.getNotice_cont() %></div></div>
                    	
							<div class="btn_list03 btn_list">
								<button id="updateBtn">수정</button>
							</div>
                    	
                    </div>
                    <div class="listBtn">
                    	<a href="<%=request.getContextPath() %>/admin/noticePage.do">목록</a>
                    </div>
                </section>
                
            </div>
        </div>

    </div>
</body>

</html>