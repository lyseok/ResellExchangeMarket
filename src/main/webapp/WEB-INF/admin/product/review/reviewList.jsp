<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/modal/modal.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin/product/review.css">
	
	<script>
		$(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/reviewList.do",
				type: "post",
				contentType:"application/json;charset=utf-8",
				success: res => {
					console.log(res);
					code = "";
					$.each(res, function(i, v){
						code += 
							`
							<tr>
								<td>\${v.txn_no}</td>
								<td>\${v.prod_name}</td>
								<td>\${v.mem_name}</td>
								<td>\${v.review_timestamp}</td>
								<td>
								  <div class="modal-btn-box">
								 	 <button type="button" class="modal-open" data-idx="\${v.txn_no}">리뷰확인</button>  
								  </div>
								</td>
								<td><button type="button" data-qnano='\${v.txn_no}' id="deleteBtn" class="adm_del_btn"  data-idx="\${v.txn_no}">삭제</button></td>
							</tr>
							`;
						})
					$("#tBody").html(code);
				},
				error: xhr => {
					alert("오류: " + xhr.status);
				},
				dataType: "json"
			})

		  $(".confirm").on("click", function(){
			  $(".popup-wrap").fadeOut();
		  });
			
		  $("#tBody").on("click", ".modal-open", function(){
			  const txn = $(this).data("idx");
			  console.log(txn);
			  $.ajax({
				url: "<%=request.getContextPath()%>/admin/reviewModal.do",
				type: "post",
				data: {
					"txn" : txn
				},
				success: res =>{
					$("#img_box img").attr({
						src: res.file_path,
						alt: res.prod_name + " 이미지"
					});
					$("#prod_name").text(res.prod_name);
					// 평점 관련 스크립트
					code = "";
					const rating = res.review_rating;
					for (let i = 0; i < 5; i++) {
					    if (i < rating) {
					        code += `<span class="material-symbols-outlined star able" data-const="${i}">star</span>`;
					    } else {
					        code += `<span class="material-symbols-outlined star disable" data-const="${i}">star</span>`;
					    }
					}

					$(".review_rating").html(code);
					$("#mem_name").text(res.mem_name);
					$("#prod_price").text(res.prod_price.toLocaleString() + "원");
					$("#review_cont").text(res.review_cont);
					
					
					$(".popup-wrap").css('display','flex').hide().fadeIn();
				},				
				error: xhr => {
					alert("오류: " + xhr.status) ;
				},
				dataType: "json"
			  })
			});
			
			
			$(document).on ("click", "#deleteBtn", function(){
				const txn = $(this).data("idx");
				if(confirm("삭제하시겠습니까?")) { 
					$.ajax({
						url: "<%=request.getContextPath()%>/admin/deleteReview.do",
						type:"post",
						data: {
							"txn" : txn
						},
						success: res =>{
							console.log(res);
							alert("정상적으로 삭제되었습니다.");
						},
						error: xhr => {
							alert(xhr.status);
						},
						dataType: "json"
					})
					
				} else {
					alert("삭제 취소.");
				}
			})
			
			$("#searchNoticeBtn").on ("click", function(){
				const select = $("#searchSelect").val();
				const value = $("#searchText").val();
				console.log(value, select);
				$.ajax({
					url: "<%=request.getContextPath()%>/admin/searchReview.do",
					type:"post",
					data: {
						"value" : value,
						"select" : select
					},
					success: res =>{
						console.log(res);
						code = "";
					    // 테이블 본문 초기화
					    $("#tBody").html(""); 


						if(res.length > 0){
							$.each(res, function(i, v){
								code += 
									`
									<tr>
										<td>\${v.txn_no}</td>
										<td>\${v.prod_name}</td>
										<td>\${v.mem_name}</td>
										<td>\${v.review_timestamp}</td>
										<td>
										  <div class="modal-btn-box">
										 	 <button type="button" class="modal-open" data-idx="\${v.txn_no}">리뷰확인test</button>  
										  </div>
										</td>
										<td><button type="button" data-qnano='\${v.txn_no}' id="deleteBtn" class="adm_del_btn"  data-idx="\${v.txn_no}">삭제</button></td>
									</tr>
								`;
							})
						} else{
							code += 
								`
								<tr>
									<td colspan="6">검색된 결과가 없습니다.</td>
								</tr>
								`;
							
						}
						$("#tBody").html(code);
					},
					error: xhr => {
						alert(xhr.status);
					},
					dataType: "json"
				})
			})
		})
	</script>
    <div id="wrapper">

        <div id="container">

            <h1 id="container_title">상품관리 > 후기 내역</h1>
            <div class="container_wr">
                <section>
                    
                    <div class="local_desc local_desc03 jc_fe ">
                    	<form action="" class="search_form mt0">
			              <select name="searchNotice" id="searchSelect">
			                <option value="txn_no">번호</option>
			                <option value="prod_name">거래상품 이름</option>
			                <option value="mem_name">작성자</option>
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
                            	<col width="30%">
                            	<col width="30%">
                            	<col width="10%">
                            	<col width="10%">
                            	<col width="5%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">거래상품 이름</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col">&nbsp;</th>
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
    
<div class="container">
  <div class="popup-wrap">
    <div class="popup">
      <div class="popup-head">
          <span class="head-title">리뷰확인</span>
      </div>
      <div class="popup-body">
      	  <div class="review_info">
          	<div id="img_box">
      	  		<img src="" alt="\${v.file_path}">
      	  	</div>
      	  	<div class="txt_box">
      	  		<span id="prod_name"></span>
      	  		<span id="prod_price"></span>
      	  	</div>
      	  </div>
      	  <div class="review_rating"></div>
      	  <div class="review_txt_box">
      	  	<div class="writer">
      	  		<span>작성자</span>
      	  		<p id="mem_name"></p>
      	  	</div>
      	  	<div id="review_cont"></div>
      	  </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn confirm">확인</span>
      </div>
    </div>
  </div>
</div>

    
	
</body>
</html>