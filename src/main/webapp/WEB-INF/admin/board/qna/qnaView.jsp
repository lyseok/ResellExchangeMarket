<%@page import="rem.admin.board.qna.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/board/qna.css">
	<!-- <script>
		$(function(){
			$.ajax({
				url:"\${myPath}/admin/qnaViewPage.do",
				contentType:"application/json;charset=utf-8",
				type:"post",
				dataType: "json",
				success: res => {
					console.log(res);
				},
				error: xhr =>{
					alert("오류: " + xhr.status);
				}
			})
		})
	</script> -->
	
	<%
		QnaBoardVO vo = (QnaBoardVO)request.getAttribute("qnaVo");
				out.println(vo);
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
	                    		<div><span>유형</span><b><%=vo.getQna_type() %></b></div>
	                    		<div><span>작성자</span><b><%= vo.getMem_no() %></b></div>
	                    	</div>
	                    	
	                    	<div class="admin_bd_view_cont">
	                    		<%=vo.getQna_cont() %>
	                    	</div>
                    	</div>
                    	
                    	
                    	<div class="admin_status">문의상태</div>
                    	<div class="admin_cont">
                    		
	                    	<div class="admin_bd_view_cont">
	                    		test<%-- <%=vo.getQna_cont() %> --%>
	                    	</div>
	                    	<b>2025.01.01<%-- <%=vo.getQna_title() %> --%></b>
                    	</div>
                    	
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