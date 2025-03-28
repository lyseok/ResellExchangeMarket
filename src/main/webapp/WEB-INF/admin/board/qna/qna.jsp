<%@page import="rem.admin.board.qna.vo.QnaBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>
	<script>
		$(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/admin/qnaPage.do",
				contentType:"application/json;charset=utf-8",
				type: "post",
				dataType: "json",
				/* data: {
					"qna_no": 
				}, */
				success: res => {
					let html = ``;
					res.map(function(v,i){
						html += `
						 <tr>
	                    <td>\${v.qna_no}</td>
	                    <td>\${v.qna_type}</td>
	                    <td><a href="\${adminPath}/admin/qnaViewPage.do?qnaNo=\${v.qna_no}">\${v.qna_title}</a></td>
	                    <td>\${v.mem_no}</td>
	                    <td></td>
	                    <td>\${v.qna_at}</td>
	                    <td>삭제</td>
	                </tr>`;
					});
					console.log(res);
					$("#tBody").html(html);
				},
				error: xhr => {
					alert("오류: " + xhr.status);					
				},
			})
		})
	</script>
	
	<%
		List<QnaBoardVO> list = (List<QnaBoardVO>)request.getAttribute("qnalist");
	%>
    <div id="wrapper">

        <div id="container">

            <h1 id="container_title">글관리 > 문의</h1>
            <div class="container_wr">
                <section>
                    
                    <div class="local_desc local_desc02"></div>

                    <div class="tbl_head01 tbl_wrap">
                        <table>
                            <caption class="dp_n">문의 게시판</caption>
                            <colgroup>
                            	<col width="10%">
                            	<col width="10%">
                            	<col width="10%">
                            	<col width="30%">
                            	<col width="10%">
                            	<col width="15%">
                            	<col width="8%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">유형</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">답변여부</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody id="tBody"></tbody>
                        </table>
                    </div>

                </section>
                
            </div>
        </div>

    </div>
</body>

</html>