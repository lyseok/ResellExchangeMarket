<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reset.css">
<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/uploadProd/uploadProd.css">
<%@include file="/WEB-INF/include/category.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>

<script>
$(function(){
	
	$.ajax({
		
		url:'<%=request.getContextPath()%>/getMainCate.do',
		type:'post',
		contentType : 'application/json; charset=utf-8',
		success : res=>{
			console.log(res)
		},
		error : xhr=>{
			alert(xhr.status)
		},
		dataType : 'json'
	})
})
</script>

<hr>
<div class="inner">
	<h1>상품정보</h1>
	<hr>
	<form action="<%=request.getContextPath()%>/product/insertProduct.do" method="post" id="formData">
		<div class="cont">
			<br>
			<div class="innerCont">
				<div class="innerCont text">
					<h3>상품이미지(0/5)</h3>					
				</div>
				<div class="innerCont item">
					<div class="img">
						<input type="file">
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>상품명</h3>					
				</div>
				<div class="innerCont item">
					<div class="name">
						<input type="text" id="prod_name" name="prod_name" placeholder="상품명을 입력해 주세요.">0/20
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>카테고리</h3>					
				</div>
				<div class="innerCont item">
					<div class="cate">
						<select name="cate_main_id" multiple="multiple">
							
						</select>
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>상품상태</h3>					
				</div>
				<div class="innerCont item">
					<div class="stat">
						<input type="radio" class="radio" name="prod_condition">새상품(미사용)<br>
						<input type="radio" class="radio" name="prod_condition">사용감 없음<br>
						<input type="radio" class="radio" name="prod_condition">사용감 적음<br>
						<input type="radio" class="radio" name="prod_condition">사용감 잦음<br>
						<input type="radio" class="radio" name="prod_condition">고장/파손 상품
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>설명</h3>					
				</div>
				<div class="innerCont item">
					<div class="intro">
						<textarea id="prod_content" name="prod_content" rows="8" cols="130"
						placeholder="브랜드, 모델명, 구매시기, 하자 유무 등 상품 설명을 최대한 자세히 적어주세요 전화번호,&#13;&#10;SNS계정 등 개인정보 입력은 제한될 수 있습니다."></textarea><br> 0/500
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>가격</h3>					
				</div>
				<div class="innerCont item">
					<div class="price">
						<input type="number" id="prod_price" name="prod_price" placeholder="가격을 입력해 주세요.">원
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
									
				</div>
				<div class="innerCont item">
					<div class="enuri">
						<input type="checkbox" name="price_offer">가격 제안받기
					</div> 
				</div>		
			</div>
			<br>
			<div class="innerCont">
				<div class="innerCont text">
					<h3>거래방식</h3>					
				</div>
				<div class="innerCont item">
					<div class="method">
						<input type="radio" class="radio" name="prod_tr_status">택배거래(선불)<br>
						<input type="radio" class="radio" name="prod_tr_status">택배거래(착불)<br>
						<input type="radio" class="radio" name="prod_tr_status">직거래<br>
					</div> 
				</div>		
			</div>
		</div>
	</form>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>