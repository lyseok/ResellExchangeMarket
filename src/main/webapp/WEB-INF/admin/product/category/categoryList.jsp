<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin/product/category.css">
	<script>
		$(function(){
			$("").on("click", function(){
				
			})
			$.ajax({
				url: "<%=request.getContextPath()%>/admin/categoryPage.do",
				type: "post",
				success: res =>{
					console.log(res);
				},
				error: xhr => {
					alert("오류: " + xhr.status);
				},
				dataType: "json"
			})
		})
	</script>
    <div id="wrapper">

        <div id="container">

            <h1 id="container_title">상품관리 > 카테고리</h1>
            <div class="container_wr">
            
                <section class="dp_f gap60">
                    <div class="tbl_head01 tbl_wrap">
                    	<div class="cate_tit_cont">
                    		<h3>대분류</h3>
                    		<a href="" id="mainAddBtn">추가</a>
                    	</div>
                        <table>
                            <caption class="dp_n">대분류</caption>
                            <colgroup>
                            	<col width="15%">
                            	<col width="45%">
                            	<col width="30%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>코드</th>
                                    <th>대분류명</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody id="tBodyMain"></tbody>
                        </table>
                    </div>
                    
                    <div class="tbl_head01 tbl_wrap">
                    	<div class="cate_tit_cont">
                    		<h3>중분류</h3>
                    		<a href="" id="subAddBtn">추가</a>
                    	</div>
                        <table>
                            <caption class="dp_n">중분류</caption>
                            <colgroup>
                            	<col width="15%">
                            	<col width="45%">
                            	<col width="30%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>코드</th>
                                    <th>중분류명</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody id="tBodySub"></tbody>
                        </table>
                    </div>
                </section>
                
            </div>
        </div>

    </div>
</body>
</html>