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
	                    <td>`;
	                    
		                    if(v.qna_type == 0){
		                    	html += "상품문의";
		                    } else{
		                    	html += "1:1문의";
		                    }
		                    
	                    html += `</td>
	                    <td><a href="\${adminPath}/admin/qnaViewPage.do?qnaNo=\${v.qna_no}">\${v.qna_title}</a></td>
	                    <td>\${v.mem_no}</td>
	                    <td>`;
	                    
		                    if(v.qna_status == 0){
		                    	html += "답변전";
		                    } else if(v.qna_status == 1){
		                    	html += "답변완료";
		                    }
		                    
	                    html +=  
	                    	`</td>
		                    <td>\${v.qna_at}</td>
		                    <td><button type="button" data-qnano='\${v.qna_no}' id="deleteBtn" class="adm_del_btn">삭제</button></td>
	                </tr>`;
					});
					console.log(res);
					$("#tBody").html(html);
				},
				error: xhr => {
					alert("오류: " + xhr.status);					
				},
			})
			
			$("#tBody").on("click", "#deleteBtn", function(){
				const qnaNo = $(this).data("qnano");
				$.ajax({
					url: "<%=request.getContextPath()%>/admin/qnaDelete.do",
					data : "qnaNo=" + qnaNo,
					type: "get",
					success: res =>{
						location.reload();
					},
					error: xhr => {
						alert("오류: " + xhr.status);		
					}
				})
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
                    
                    <div class="local_desc local_desc03 jc_fe ">
                    	<form action="" class="search_form mt0">
			              <select name="searchNotice" id="searchNotice">
			                <option value="notice_no">번호</option>
			                <option value="notice_title">제목</option>
			              </select>
			              <div>
			                <input type="text" id="searchText" placeholder="검색어를 입력하세요.">
			                <span class="material-symbols-outlined" id="searchNoticeBtn">search</span>
			              </div>
			            </form>
                    </div>

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