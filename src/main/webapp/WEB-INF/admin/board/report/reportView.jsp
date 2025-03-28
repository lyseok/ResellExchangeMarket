<%@page import="rem.admin.board.report.vo.ReportBoardVO"%>
<%@page import="rem.admin.board.qna.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/board/report.css">

	
<%
	ReportBoardVO board = (ReportBoardVO)request.getAttribute("board");
%>
<script>

$(function(){
	const rpt_type_val = <%=board.getRpt_type()%>;
	console.log(rpt_type_val);
	if(rpt_type_val == 0){
		$('#rpt_type').text('사용자');
	} else {
		$('#rpt_type').text('상품');		
	}
	
	
	$('#addComments').on('click', function(){
		code = /* html */`
							<form action="" id="report_comments">
								<input type="hidden" name="rpt_mem_no" value="<%=board.getRpt_no() %>">
								<div id="rpt_comments_form">
									<textarea name="commentsText" cols="120" rows="7"></textarea>
									<button id="reportCommentsBtn">등록하기</button>
								</div>
							</form>`;
		$('#commentsArea').html(code);
	});

	$(document).on('click','#reportCommentsBtn' , function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/insertReportComments.do",
			type: "post",
			data: $('#report_comments').serialize(),
			success: function(data){
				console.log(data);
			},
			error: function(xhr){
				console.log(xhr.status);
			},
			dataType: "json"
		});
	
});

</script>
	
	<div id="wrapper">

		<div id="container">

			<h1 id="container_title">글관리 > 신고</h1>
			<div class="container_wr">
				<section>
						
					<div class="local_desc local_desc02"></div>

					<div class="admin_view_page_wrap">
						<div class="user_cont">
							<div class="admin_bd_view_tit">
								<h6><%=board.getRpt_title() %></h6>
								<b><%=board.getRpt_time() %></b>
							</div>
							
							<div class="admin_bd_view_info">
								<div><span>유형</span><b id="rpt_type"></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>번호</span><b><%=board.getRpt_idx_no() %></b></div>							
								<div><span>작성자</span><b><%=board.getMem_no() %></b></div>
							</div>
							
							<div class="admin_bd_view_cont">
								<%=board.getRpt_text() %>
							</div>
						</div>

						<div class="admin_cont ai_c">
							<div class="admin_status" id="rpt_status">답변 전</div>
							<div class="btn_list03 btn_list">
								<button id="addComments">답변하기</button>
							</div>
						</div>						
						
						<div class="admin_cont" id="commentsArea">
							<!-- <form action="" id="report_comments">
								<input type="hidden" name="rpt_mem_no" value="<%=board.getRpt_no() %>">
								<div id="rpt_comments_form">
									<textarea name="commentsText" cols="120" rows="7"></textarea>
									<button id="reportCommentsBtn">등록하기</button>
								</div>
							</form> -->
							<div class="admin_bd_view_cont">
								test<%-- <%=vo.getQna_cont() %> --%>
							</div>
							<b>2025.01.01<%-- <%=vo.getQna_title() %> --%></b> 


						</div>
						
					</div>
					<div class="listBtn">
						<a href="<%=request.getContextPath() %>/admin/reportBoardPage.do">목록</a>
					</div>
				</section>
					
			</div>
		</div>

	</div>
</body>

</html>