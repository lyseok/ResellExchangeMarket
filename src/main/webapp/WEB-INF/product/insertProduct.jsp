<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reset.css">
<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/uploadProd/uploadProd.css">
<%@include file="/WEB-INF/include/category.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>

<script>

$(function(){
	
	$.ajax({
		
		url:'<%=request.getContextPath()%>/product/getCateMain.do',
		type:'post',
		contentType : 'application/json; charset=utf-8',
		success : res=>{
			console.log(res)
			code = '';
			subcode = `
					   <li data-value="1">중분류 선택</li>
					  `;
			$.each(res, function(i,v){
				code += `<li data-value="${v.cate_main_id}">${v.cate_main_name}</li>`
			})
			
			$('#cate_main_id').html(code);
			$('#cate_sub_id').html(subcode);
		},
		error : xhr=>{
			alert(xhr.status)
		},
		dataType : 'json'
	})
	
	$('#cate_main_id').on('click','li', function(){
		
		$('#cate_main_id li').removeClass('active');
		
		$(this).addClass('active');
		
		idValue = $(this).data('value');
		console.log(idValue);
		
		$.ajax({
			
			url:'<%=request.getContextPath()%>/product/getCateSub.do',
			type : 'post',
			contendType : 'application/x-www-form-urlencoded',
			data : {cate_main_id : idValue},
			success : res=>{
				console.log(res)
				code='';
				
					$.each(res, function(i,v){
						
						code += `<li data-value="${v.cate_sub_id}">${v.cate_sub_name}</li>`
					})
				$('#cate_sub_id').html(code);
			},
			error : xhr=>{
				alert(xhr.status)
			},
			dataType : 'json'
		})
	})
	
	$('#cate_sub_id').on('click', 'li', function(){
		
		$('#cate_sub_id li').removeClass('active');
		$(this).addClass('active');
	})
	
	$('#photo').on('change', function(){
	
		const files = $('#photo')[0].files;
		
		$.each(files, function(i,v){
			
			const img = $('<img>').attr('src', URL.createObjectURL(v));
			$('div[id="innerCont item"]').append(img);
		})
	})
	
	$('#insert').on('click', function(){
		fdata = $('#fData');
		files = $('#photo')[0].files;
		jsonData = fdata.serializeJSON();
		
		jsonData.photos = [];
		$.each(files, function(i,v){
			
			jsonData.photos.push(v);
		});
		
		formData = new FormData();
		formData.append('jsonData', JSON.stringify(jsonData))
		
		$.each(files, function(i,v){
			formData.append('photos[]', v);
		})
		console.log(formData)
		
		$.ajax({
			
			url:'<%=request.getContextPath()%>/product/insertProduct.do',
			type : 'post',
			data : formData,
			contentType : false,
			processData : false,
			dataType : 'json',
			success =>res{
				
			},
			error => xhr{
				alert(xhr.status)
			}
		})
	})
	
})
</script>

<hr>
<div class="inner">
	<h1>상품정보</h1>
	<hr>
	<form id="fData" name="fData">
		<div class="cont">
			<br>
			<div class="innerCont">
				<div class="innerCont text">
					<h3>상품이미지(0/5)</h3>					
				</div>
				<div class="innerCont item" id="innerCont item">
					<div class="photo">
						<input type="file" id="photo" name="photo" multiple>
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
						<ul id="cate_main_id" name="cate_main_id" class="category">
						
						</ul>
							
						<ul id="cate_sub_id" name="cate_sub_id" class="category">
							
						</ul>
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>상품상태</h3>					
				</div>
				<div class="innerCont item">
					<div class="stat">
						<input type="radio" class="radio" name="prod_condition" value="1">새상품(미사용)<br>
						<input type="radio" class="radio" name="prod_condition" value="2">사용감 없음<br>
						<input type="radio" class="radio" name="prod_condition" value="3">사용감 적음<br>
						<input type="radio" class="radio" name="prod_condition" value="4">사용감 잦음<br>
						<input type="radio" class="radio" name="prod_condition" value="5">고장/파손 상품
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
					<h3>설명</h3>					
				</div>
				<div class="innerCont item">
					<div class="intro">
						<textarea id="prod_content" name="prod_content" 
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
						<input type="number" id="prod_price" name="prod_price" placeholder="가격을 입력해 주세요.">원<br>
						<input type="checkbox" id="price_offer" name="price_offer" value="1">가격 제안받기
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
						<input type="radio" class="radio" name="prod_tr_status" value="1">택배거래(선불)<br>
						<input type="radio" class="radio" name="prod_tr_status" value="2">택배거래(착불)<br>
						<input type="radio" class="radio" name="prod_tr_status" value="0">직거래<br>
					</div> 
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont button">
					<div class="insert">
						<input type="button" value="등록하기" id="insert">
					</div> 
				</div>		
			</div>
		</div>
	</form>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>