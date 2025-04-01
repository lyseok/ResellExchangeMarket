<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="rem.admin.board.qna.vo.QnaCommentsVO"%>
<%@page import="rem.admin.board.qna.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/board/qna.css">
	
	<%
		QnaBoardVO vo = (QnaBoardVO)request.getAttribute("qnaVo");
	%>
	<script>
		$(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/qnaCommentView.do",
				type:"post",
			    data: {"qnaNo": <%= vo.getQna_no() %>},
				dataType: "json",
				success: res => {
					html = "";
					html += `
                    	<div class="admin_cont ai_fe" id="status_ck">
							<div class="admin_status">답변 완료</div>
						</div>

                    	<div class="admin_cont">
                    		
	                    	<div class="admin_bd_view_cont">
	                    		\${res.cmt_cont}
	                    	</div>
	                    	<b>\${res.cmt_at}</b>
                    	</div>`;
                    $("#qna_cmt_result").html(html);
                    console.log(res.cmt_cont);
                    console.log(res.cmt_at);
				},
				error: xhr =>{
					alert("오류: " + xhr.status);
				}
			})
		})
	</script>
	<%
		QnaCommentsVO qnaCmtvo = (QnaCommentsVO)request.getAttribute("qnaCmt");
	%>
    <div id="wrapper">

        <div id="container">

            <h1 id="container_title">글관리 > 문의</h1>
            <div class="container_wr">
                <section>
                    
                    <div class="local_desc local_desc02"></div>

                    <div class="admin_view_page_wrap">
                    	<div class="user_cont">
	                    	<div class="admin_bd_view_tit">
	                    		<h6><%=vo.getQna_title() %></h6>
	                    		<b><%= vo.getQna_at() %></b>
	                    	</div>
	                    	
	                    	<div class="admin_bd_view_info">
	                    		<div>
	                    			<span>유형</span>
	                    			<b>
		                    			<%
		                    				if(vo.getQna_type()== 0){
		                    					System.out.println("상품문의");
		                    				}
		                    				 
		                    			%>
		                    			여기 값 어떻게 바꿔?
	                    			</b>
	                    		</div>
	                    		<div><span>작성자</span><b><%= vo.getMem_no() %></b></div>
	                    	</div>
	                    	
	                    	<div class="admin_bd_view_cont">
	                    		<%=vo.getQna_cont() %>
	                    	</div>
                    	</div>
                    	
                    	<%
                    		if(vo.getQna_com_status() == 0){
                    	%>
                    	<div class="admin_cont ai_fe" id="status_ck">
							<div class="admin_status">답변 전</div>
													
						    <div class="btn_list03 btn_list">
						      <button id="addComments">답변하기</button>
						    </div>
						</div>
                    	<%
                    		} else {
                    	%>
                    		<div id="qna_cmt_result"></div>
                    	<%
                    		}
                    	%>
                    </div>
                    <div class="listBtn">
                    	<a href="<%=request.getContextPath() %>/admin/qnaPage.do">목록</a>
                    </div>
                </section>
                
            </div>
        </div>

    </div>
</body>

</html>