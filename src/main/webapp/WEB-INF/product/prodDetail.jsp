<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productDetail.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>

<script>
	list = <%=request.getAttribute("imgfile")%>;
	
	pvo = <%=request.getAttribute("productDetail")%>;
	
	countReview = <%=request.getAttribute("countReview")%>;
	
	countWish = <%=request.getAttribute("countWish")%>;
</script>

<div class="inner">
	
	<%@include file="/WEB-INF/include/category.jsp" %>
		<div class="cont">
			<br>
			<div class="innerCont">
				<div class="innerCont text">
									
				</div>
				<div class="innerCont item" id="innerCont item">
					
				</div>		
			</div>
			<div class="innerCont">
				<div class="innerCont text">
									
				</div>
				<div class="innerCont item">
					
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
									
				</div>
				<div class="innerCont item">
					
				</div>		
			</div>
			
			
	</div>
</div>