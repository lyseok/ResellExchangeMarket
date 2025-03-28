<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

	<%@include file="/WEB-INF/include/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main/main.css">

	
	<!-- 메인 컨텐츠 시작 -->
	<div id="main">
		<!-- 카테고리 시작 -->
		
		<!-- // 카테고리 end -->
		<%@include file="/WEB-INF/include/category.jsp" %>
		
		<!-- 메인 슬라이드 시작 -->
		<div class="main_slide">메인 슬라이드(full 영역)</div>
		<!-- // 메인 슬라이드 end -->
		
		<!-- 상품리스트 시작 -->
		<div class="list_wrap inner">
			<h1>오늘의 상품 추천</h1>
			
			<div class="inner list_cont">
				<!-- 상품리스트 내용 삽입 -->
				<p>상품 리스트 삽입</p>
				<a href="<%= request.getContextPath() %>/detail.do">[ 클릭 시 상품상세 이동 ]</a>
				<a href="<%= request.getContextPath() %>/storeView.do">[ 클릭 시 상점 상세 페이지로 이동 ]</a>
				<a href="<%= request.getContextPath() %>/accessChk.do">[ 권한확인 페이지 ]</a>
			</div>
		</div>
		<!-- // 상품리스트 end -->
		
	</div>
	<!-- // 메인 컨텐츠 end -->
	
<%@include file="/WEB-INF/include/footer.jsp" %>