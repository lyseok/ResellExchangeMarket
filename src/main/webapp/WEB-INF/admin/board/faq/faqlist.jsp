
<%@page import="rem.admin.board.faq.vo.FAQBoardVO"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/board/notice.css">
<script src="<%=request.getContextPath() %>/js/admin/board/notice.js"></script>


<%

@SuppressWarnings("unchecked")
List<FAQBoardVO> list = (List<FAQBoardVO>)request.getAttribute("fbvo");

System.out.print("VO리스트 : " + list);

%>
<script>
$(function() {
 
  
 
  $('#searchviewbtn').on('click', function() {
	$('.search_form').submit();
  })

})

</script>
  <div id="wrapper">
    <div id="container" class="">
      <h1 id="container_title">글관리>FAQ</h1>
          <label for="faqType">FAQ 유형 선택:</label>
    						<select id="faqType" name="faqType" onchange="location.href='<%=request.getContextPath()%>/admin/faqBoardSelectedView.do?faqType=' + this.value;">
        					
					        <option value="">전체보기</option>
        					<option value="1"<% if ("1".equals(request.getAttribute("selected"))) { %>selected<% } %>>>회원/계정</option>
        					<option value="2"<% if ("2".equals(request.getAttribute("selected"))) { %>selected<% } %>>>운영정책</option>
        					<option value="3"<% if ("3".equals(request.getAttribute("selected"))) { %>selected<% } %>>>안전결재</option>
        					<option value="4"<% if ("4".equals(request.getAttribute("selected"))) { %>selected<% } %>>>거래 및 분쟁</option>
        					<option value="5"<% if ("5".equals(request.getAttribute("selected"))) { %>selected<% } %>>>기타</option>
    				</select>
    				    <script>
        $(document).ready(function() {
            $('#faqType').on('change', function() {
                var selectedType = $(this).val();
                window.location.href = '<%=request.getContextPath()%>/admin/faqBoardSelectedView.do?faqType=' + selectedType;
            });
        });
    </script>



          <div class="tbl_head01 tbl_wrap">
            <table>
              <colgroup>
                <col width="10%">
                <col width="35%">
                <col width="35%">
                <col width="20%">
                
              </colgroup>
              <thead>
                <tr>
                  <th scope="col">번호</th>
                  <th scope="col">유형</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성일</th>
                </tr>
              </thead>
              <tbody id="FAQList">
              <%
              
              for(FAQBoardVO vo : list){
              
              %>
              <tr class="FAQBoard">
              	<td><%=vo.getFaq_no() %></td>
              	<td><%=vo.getFaq_type() %></td>
              	<td><%=vo.getFaq_title() %></td>
              	<td><%=vo.getFaq_at() %></td>
              	</tr>
              <%
               }
              %>
              </tbody>
            </table>
          </div>
           <div class="btn_list03 btn_list">
              <a href="<%=request.getContextPath() %>/admin/faqWritePage.do">FAQ작성</a>
        </section>
      </div>
    </div>
  </div>
</body>

</html>