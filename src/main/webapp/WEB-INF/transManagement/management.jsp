<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/store/store.css">

<style>
#ajaxview table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

 .trans-container{
	padding-left 500px;
}

#deliberCon{
	margin-auto;
}




</style>


<%@include file="/WEB-INF/include/category.jsp" %>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



<div class="trans-container">
  <div id = "manageType">
 	<input type = "button" value = "상품관리" id ="prodm"> 
 	<input type = "button" value = "구매관리" id ="buym"> 
 	<input type = "button" value = "판매관리" id ="sellm">
  </div>
  
  <br><br>
  
  <div id ="deliverCon">
  	<input type = "button" value = "전체" id ="all"> 
 	<input type = "button" value = "배송중" id ="deliver"> 
 	<input type = "button" value = "거래중" id ="deal"> 
 	<input type = "button" value = "거래완료" id ="complete">
  </div>
  
  <br><br>
<div id = ajaxview>
	
	<table>
  		<tr>
	    <th>사진</th>
	    <th>판매상태</th>
	    <th>상태</th>
	    <th>상품명</th>
	    <th>가격</th>
	    <th>끌어 올린 시간</th>
	    <th>기능</th>
	  </tr>
  		
</table>
	
</div>

 
  
</div>

	
	<script>
	
		$(function () {
		
		function loadTransactionData(category){
		
		$.ajax({
		
			url: "<%=request.getContextPath()%>/getTransactionData.do",
			
			data: {category:category},
			
			contentType : 'application/json;charset=UTF-8',
			
			success : res =>{
			
			console.log(res);
			
			updateTable(res, category);
			
			},
			
			dataType: 'json'
			
			});
		
	}
	
	loadTransactionData('상품관리');
		
		$('#prodm').on('click', function() {
		
		loadTransactionData('상품관리');
	
	});
	
	$('#buym').on('click', function() {
	
		loadTransactionData('구매관리');
	
	});
	
	$('#sellm').on('click', function() {
	
		loadTransactionData('판매관리');
	
	});
	console.log("Data for Table:", data);
	
	
	
	function updateTable(data, category){
	
		let tableCode = "";
		
		if (category == '상품관리') {
		
		tableCode +=
		
		`<tr>
		
		<th>사진</th>
		
		<th>판매상태</th>
		
		<th>상태</th>
		
		<th>상품명</th>
		
		<th>가격</th>
		
		<th>끌어 올린 시간</th>
		
		<th>기능</th>
		
		</tr>`;
	
	}
	
	else if (category == '구매관리') {
	
		tableCode +=
		
		`<tr>
		
		<th>사진</th>
		
		<th>거래유형</th>
		
		<th>상태</th>
		
		<th>상품명</th>
		
		<th>가격</th>
		
		<th>구입일</th>
		
		<th>기능</th>
		
		</tr>`;
	
	}
	
	else if(category == '판매관리'){
	
	tableCode +=
	
		`<tr>
		
		<th>사진</th>
		
		<th>거래유형</th>
		
		<th>상태</th>
		
		<th>상품명</th>
		
		<th>가격</th>
		
		<th>판매일</th>
		
		<th>기능</th>
		
		</tr>`;
	
	}
	
	$.each(data, function(i, v) {
	
	tableCode += `
	
		<tr>
		
		<td>사진</td>
		
		<td>${v.prod_status}</td>
		
		<td>${v.prod_name}</td>
		
		<td>${v.prod_price}</td>
		
		<td>${v.prod_at}</td>
		
		<td>${v.prod_newing}</td>
		
		<td>수정</td>
		
		</tr>`;
	
	});
	
		$('#ajaxview').html("<table>" + tableCode + "</table>");
	
	}
	
	})
	</script>



<%@include file="/WEB-INF/include/footer.jsp" %>

