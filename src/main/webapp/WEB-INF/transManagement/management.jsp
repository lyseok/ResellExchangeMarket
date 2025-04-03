<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/store/store.css">




<style>
	#ajaxview table {
  	font-family: arial, sans-serif;
  	border: 1px solid black;
  	width: 70%;
}

td, th {
  border: 1px solid black;
  text-align: left;
  padding: 8px;
  
}


 .trans-container{
	padding-left: 200px;
}


/* 모달 전체 스타일 */
#trackModal, #trackViewModal, #confrimModal, #confrimCheckModal, #reviewModal, #insertReviewModal {
    display: block;  /* 모달을 화면에 표시 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background-color: white;
    padding: 20px;
    z-index: 1000;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 버튼 스타일 */
.modal-footer button {
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
}

#submitTrackInfo {
    background-color: #4CAF50;
    color: white;
    border: none;
}

.modal-closebtn {
    background-color: #f44336;
    color: white;
    border: none;
}



</style>

<%@include file="/WEB-INF/include/category.jsp" %>





<div class="trans-container">
	  <div id = "manageType">
	 	<input type = "button" value = "상품관리" id ="prodm"> 
	 	<input type = "button" value = "구매관리" id ="buym"> 
	 	<input type = "button" value = "판매관리" id ="sellm">
	  </div>
	  
	  <br><br>
	  
	  <div id ="deliverCon">
	  	<input type = "button" value = "전체" id ="viewAll"> 
	 	<input type = "button" value = "배송중" id ="deliverStatus"> 
	 	<input type = "button" value = "거래중" id ="transStatus"> 
	 	<input type = "button" value = "거래완료" id ="completeStatus">
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


<div id = "modal-container"></div>
<script src="<%=request.getContextPath() %>/js/transaction/transaction.js"></script>
<script>

	
	
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
	
	
	
	

	$('#viewAll').on('click', function () {
		buttonValue = $(this).val();
		
	})
	$('#deliverStatus').on('click', function () {
		buttonValue = $(this).val();
	})
	$('#transStatus').on('click', function () {
		buttonValue = $(this).val();
	})
	$('#completeStatus').on('click', function () {
		buttonValue = $(this).val();
	})
	
</script>



<%@include file="/WEB-INF/include/footer.jsp" %>

