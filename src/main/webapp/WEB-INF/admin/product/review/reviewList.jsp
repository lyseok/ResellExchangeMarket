<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/modal/modal.css">
	
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
								 	 <button type="button" class="modal-open">리뷰확인</button>  
								  </div>
								</td>
								<td><button type="button" data-qnano='\${v.txn_no}' id="deleteBtn" class="adm_del_btn">삭제</button></td>
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
			$.ajax({
				url: "<%=request.getContextPath()%>/admin/reviewModal.do",
				type: "post",
				contentType:"application/json;charset=utf-8",
				success: res =>{
					console.log(res);
					 $(".popup-wrap").css('display','flex').hide().fadeIn();
				},				
				error: xhr => {
					alert("오류: " + xhr.status) ;
				},
				dataType: "json"
			})			  
			  
			  
		  });
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
			                <option value="mem_no">작성자번호</option>
			                <option value="qna_title">제목</option>
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
          	<div class="img_box">
      	  	<img src="\${v.file_path}" alt="\${v.file_path}">
      	  	</div>
      	  	<div class="txt_box">
      	  		<span>\${v.prod_name}</span>
      	  		<span>\${v.prod_price}</span>
      	  	</div>
      	  </div>
      	  <div class="">
      	  </div>
      	  <div class="review_txt_box">
      	  	<div class="">
      	  		<span>작성자</span>
      	  		<p>\${v.mem_name}</p>
      	  	</div>
      	  	<div class="">\${v.review_cont}</div>
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