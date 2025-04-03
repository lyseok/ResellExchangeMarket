/**
 * 
 */

		
function loadTransactionData(category){    //동적 이미 만들어진거에 적용

		$.ajax({
		
			url: `${mypath}/getTransactionData.do`,
			
			data: {category:category},
			
			contentType : 'application/json;charset=UTF-8',
			
			success : res =>{
			
				console.log(res);
				
				updateTable(res, category);
			
			},
			
			dataType: 'json'
			
			});
		
	}
	
	
	function updateTable(data, category){
				
			let tableCode = "<table>";
			
			if (category == '상품관리') {
			
				tableCode += `
				           <thead>
				               <tr>
				                   <th>사진</th>
				                   <th>판매상태</th>
				                   <th>상품명</th>
				                   <th>가격</th>
				                   <th>끌올시간</th>
				                   <th>기능</th>
				               </tr>
				           </thead>
				           <tbody>`;
		
		}
		
		else if (category == '구매관리') {
		
			tableCode += `
			            <thead>
			                <tr>
			                    <th>사진</th>
			                    <th>거래유형</th>
			                    <th>상태</th>
			                    <th>상품명</th>
			                    <th>가격</th>
			                    <th>구입일</th>
			                    <th>기능</th>
			                </tr>
			            </thead>
			            <tbody>`;
		
		}
		
		else if(category == '판매관리'){
		
			tableCode += `
			            <thead>
			                <tr>
			                    <th>사진</th>
			                    <th>거래유형</th>
			                    <th>상태</th>
			                    <th>상품명</th>
			                    <th>가격</th>
			                    <th>판매일</th>
			                    <th>기능</th>
			                </tr>
			            </thead>
			            <tbody>`;
		
		}
	
	

		$.each(data, function(i, v) {
				
			

			if (category === '상품관리') {
				

			prod = data.prodList;
			img = data.imgList; 
			
			console.log('상품' + prod);
			console.log('이미지' + img);	
		tableCode += `
		
			<tr>
			
			<td><img src= "${img.file_path}" alt="prod_img" id="prod_img"></td>
			<td>
				<select class = "prod-status">
					<option value ="판매중">판매완료</option>
					<option value ="판매완료">판매중</option>
					<option value ="예약중">판매중</option>
				</select>
			</td>
			<td>${prod.prod_name}</td>
			<td>${prod.prod_price}</td>
			<td>${prod.prod_newing}</td>
			<td>
			    <input type = "button" class = "up-btn"  data-prodno= "${prod.prod_no}"  value = "UP"> <br>
				<input type = "button" class = "edit-btn"  value = "수정"> <br>
				<input type = "button" class = "delete-btn" data-prodno="${prod.prod_no}"  value = "삭제">
			</td>
			
			</tr>`;
			
			}
			
			
			else if (category === '구매관리' || category === '판매관리') {

			            let txnStatus = '';
			            if (v.txn_status == 0) {
			                txnStatus = '거래중';
			            } else if (v.txn_status == 1) {
			                txnStatus = '배송중';
			            } else {
			                txnStatus = '거래완료';
			            }

			            let prodApproch = '';
			            if (v.prod_tr_approch == 0) {
			                prodApproch = '직거래';
			            } else if (v.prod_tr_approch == 1) {
			                prodApproch = '택배거래(선불)';
			            } else if (v.prod_tr_approch == 2) {
			                prodApproch = '택배거래(착불)';
			            }

			            if (category === '구매관리') {
			                
							tableCode += `
			                <tr>
			                    <td>사진</td>
			                    <td>${prodApproch}</td>
			                    <td>${txnStatus}</td>
			                    <td>${v.prod_name}</td>
			                    <td>${v.prod_price}</td>
			                    <td>${v.txn_create_at}</td>
			                    <td>`;
								
								if(v.prod_tr_approch == 0){
									tableCode += `
									<input type="button" class="confirmation-btn" data-txnno="${v.txn_no}" value="구매확정.">`;
								}else{
									tableCode += `
									<input type="button" class="confirmation-btn" data-txnno="${v.txn_no}" value="구매확정."> <br>
									<input type="button" class="trackInfoView-btn" data-txnno="${v.txn_no}" value="배송조회">`;
											                 
								}
								tableCode += `</td></tr>`;
			                       
								
								
			            } else if (category === '판매관리') {
			                tableCode += `
			                <tr>
			                    <td>사진</td>
			                    <td>${prodApproch}</td>
			                    <td>${txnStatus}</td>
			                    <td>${v.prod_name}</td>
			                    <td>${v.prod_price}</td>
			                    <td>${v.txn_create_at}</td> 
			                    <td>`;
			                  if(v.prod_tr_approch == 0){
								tableCode += `<input type="button" class="trackReview-btn" data-txnno="${v.txn_no}" value="리뷰 확인">`;
							  }
							  else {
								tableCode += `<input type="button" class="trackInfoInsert-btn" data-txnno="${v.txn_no}" value="운송정보 입력">`;
							  }
							  
							  tableCode += `</td></tr>`;
			            }
			        }
			    });

		
		
		tableCode += "</tbody></table>";

		$('#ajaxview').html(tableCode);
	}
	
	
	//상품 끌올
	$(document).on('click','.up-btn', function() {   //이후에 만들어진 버튼
		const prodNo = $(this).data("prodno");
		updateTimeDate(prodNo);
	});

	//상품 삭제
	$(document).on('click','.delete-btn', function() {
		const prodNo = $(this).data("prodno");
		deleteProd(prodNo);
		
	});

	$(document).on('click','.edit-btn', function() {
		location.href = "<%=request.getContextPath() %>/mainPage.do";
	});
	
	
	
	
	

	
	// 운송정보 입력 이벤트
		$(document).on('click', '.trackInfoInsert-btn', function () {
		    const txnNo = $(this).data("txnno");
		    console.log("txnNo 값 확인:", txnNo);

		   
			    // 운송정보 입력 모달 생성
			    const trackModalCode = `
			        <div id="trackModal">
			            <div class="modal-content">
			                <h4>운송정보를 입력해주세요</h4>
			                <input type="text" id="ship-porv" placeholder="운송업체 입력">
			                <input type="text" id="track-num" placeholder="운송장 번호 입력">
			            </div>
			            <div class="modal-footer">
			                <button id="submitTrackInfo"> 입력완료</button>
			                <button class="modal-closebtn"> 닫기 </button>
			            </div>
			        </div>`;
		
			    $("#modal-container").html(trackModalCode);
			    $("#trackModal").show();
			
			
		
			// 운송정보 입력 완료 이벤트
			$(document).on('click', '#submitTrackInfo', function () {
			    const shipPorv = $("#ship-porv").val().trim();
			    const trackNum = $("#track-num").val().trim();
			    const txnNo = $(".trackInfoInsert-btn").data("txnno");
		
			    if (!shipPorv || !trackNum) {
			        alert("운송업체와 운송장 번호를 입력하세요.");
			        return;
			    }
		
			    $.ajax({
			        url: `${mypath}/insertTrackInfo.do`,
			        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
			        method: 'post',
			        data: {
			            "shipPorv": shipPorv,
			            "trackNum": trackNum,
			            "txnNo": txnNo
			        },
			        success: res => {
			            console.log(res);
						
						if(res.status == 'success'){
			            $(`.trackInfoInsert-btn[data-txnno="${txnNo}"]`).replaceWith(`
			                <input type="button" class="trackReview-btn" data-txnno="${txnNo}" value="리뷰 확인">`);
			            $('#trackModal').hide();
						}
			        },
			        error: function (xhr) {
			            alert('운송장 정보 입력 실패');
			        }
			    });
		});

	});
	

	
	//리뷰확인
	$(document).on('click', '.trackReview-btn', function(){
		const txnNo = $(this).data('txnno');
		console.log("txnNo 값 확인:", txnNo); 
		
		
		$.ajax({
			url : `${mypath}/getReview.do`,
			method : 'post',
			//data : {txnNo},
			data : {
				"txnNo" : txnNo
			},
			dataType : 'json',
			success: res =>{
				console.log(res);
				

				const reviewModalCode = `
				
						<div id = "reviewModal">
							<div class = "modal-content">
								<h4> 리뷰확인 </h4>
								
								<div id = "review-info">
									<p>${res.prod_name}</p>
									<p>${res.prod_price}</p>
									
								</div>
								<div id = "review-content">
								<p>${res.review_rating}</p>
								<p>${res.mem_name}</p>
								<p>${res.review_cont}</p>
								</div>
								
								<div class = "modal-footer">
									<button class = "modal-closebtn">닫기</button>
								</div>
						</div>`;
						$("#modal-container").html(reviewModalCode);
						$("revieweModal").show();
			},
			error : function(){
				alert("리뷰를 불러오지 못했습니다.")
			}
			
		
		})
		
		
	})

	
	
	//구매확정 이벤트
	$(document).on('click', '.confirmation-btn', function(){
		
		
		
		const txnNo = $(this).data('txnno');
		 console.log("txnNo값 확인: ", txnNo);
		 
		 
		 confrimModalCode = `
					 			<div id = "confrimModal">
									<div class = "modal-content">
										<h4>구매를 확정하시겠습니까?<h4>
									</div>
									
									<div class = "modal-footer">
										<button id = "submitConfrimbtn"> 확정</button>
										<button class = "modal-closebtn"> 취소 </button>
									</div>
								</div>`;
								
			$("#modal-container").html(confrimModalCode);
			$("#confrimModal").show();
			
			$(document).on('click', '#submitConfrimbtn', function(){
				$("#confrimModal").hide();
			
				$.ajax({
				url:`${mypath}/buyConfrimation.do`,
				data : {
					"txnNo" : txnNo
				},
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				
				success : res =>{
					console.log(res);
					
					confrimCheckCode = `<div id = "confrimCheckModal">
										<div class = "modal-content">`
											
					if(res.status == 'success'){
						confrimCheckCode += `<h4>구매가 확정되었습니다.<h4> `;
					}
											
					else if(res.status =='error'){
						confrimCheckCode += `<h4>구매가 확정실패입니다.<h4> `;
					}						
					confrimCheckCode += `</div>					
											<div class = "modal-footer">
												<button class = "modal-closebtn">닫기</button>
											</div>
										</div>`;
					$("#modal-container").html(confrimCheckCode);
					$("#confrimModal").show();				
					
					if(res.status == 'success' ){
					  $(`.confirmation-btn[data-txnno="${txnNo}"]`).replaceWith(`
						<input type="button" class="insertReview-btn" data-txnno="${txnNo}" value="리뷰 작성">`);
						$('#confrimModal').hide();
						}
										
					}

				})
			})		
				
	} )
	
	

	//리뷰작성
	$(document).on('click', '.insertReview-btn', function(){
		const txnNo = $(this).data('txnno');
		console.log("txnNo 값 확인:", txnNo); 
		
		
		reviewModalCode = '';
		$.ajax({
			url :`${mypath}/getReview.do`,
			method : 'post',
			data : {
				"txnNo" : txnNo
			},
			
			dataType : 'json',
			success :  res=>{
				console.log(res);
				reviewModalCode += `
				<div id = "insertReviewModal">
					<div class = "modal-content">
							<h4> 리뷰작성 </h4>
							<div id = "prod_info">
								<p>${res.prod_name}</p>
								<p>${res.prod_price}</p>
							<div>
					</div>
					<div>
						 <input type="text" id="reviewRating" placeholder="별점 입력">
						<br><br>
				
						<textarea id = "reviewTextarea"  rows="6" cols="22" placeholder= "리뷰를 작성해주세요""></textarea>
					</div>
					
					<div class = "modal-footer">
					<button class = "reviewSubmitbtn">확인</button>
					</div>
				</div>
			 `;
			 
			 $("#modal-container").html(reviewModalCode);
			 $("#insertReviewModal").show();	
			},
			error: err => {
			            console.log("상품 정보 불러오기 실패:", err);
			        }
			
			
		})
		
		
		
		$(document).on('click', '.reviewSubmitbtn', function(){
			
			reviewCont = $('#reviewTextarea').val();
			reviewRating = $('#reviewRating').val();
			
			console.log("txnNo:", txnNo);
			    console.log("reviewContent", reviewCont);
			    console.log("reviewRating", reviewRating);

			$.ajax({
				url: `${mypath}/insertReview.do`,
				method : 'post',
				data : {
					"txnNo" : txnNo,
					"reviewCont": reviewCont,
					"reviewRating" : reviewRating
				},
				success : res =>{
					let response = JSON.parse(res);
					          if (response.status === "success") {
					              alert("리뷰가 성공적으로 등록되었습니다!");
					              $('#insertReviewModal').hide();
					          } else {
					              alert("리뷰 등록 실패: " + response.message);
					          }
				},
				error: err => {
				           console.log("리뷰 등록 실패:", err);
				       }
							
			})
		})
		
		
	})
	
	
	
	
	//배송조회 이벤트
	$(document).on('click', '.trackInfoView-btn', function(){
		const txnNo = $(this).data('txnno');
			console.log("txnNo 값 확인:", txnNo); 
			$.ajax({
				url :`${mypath}/getTrackInfo.do`,
				data : {
					"txnNo" : txnNo
				},
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				
				success : res =>{
					console.log(res)
					trackViewModalCode = `
									<div id = "trackViewModal">
										<div class = "modal-content">
											<h4>배송 조회</h4>`;
											
									if (res.status == 'null'){
										trackViewModalCode += `<p>배송지 입력 전입니다.<p>`;
									}
									else if(res.status == 'notNull'){
										trackViewModalCode += `<p>${res.ship_porv}</p>`;
										trackViewModalCode += `<p>${res.track_num}</p>`;
									}
											
										trackViewModalCode += `</div>`;
										
							 trackViewModalCode +=	`<div class = "modal-footer">
											<button class = "modal-closebtn"> 확인 </button>
												</div> `;
					$("#modal-container").html(trackViewModalCode);
					$("#trackViewModal").show();
					
				}
				
			})
			
	})
	
	
	$(document).on('click', '.modal-closebtn', function(){
		$('#trackModal').hide();
		$('#trackViewModal').hide();
		$('#confrimModal').hide();
		$('#confrimCheckModal').hide();
		$("#reviewModal").hide();
		$("#insertReviewModal").hide();
		
	})
	
	
	
	function updateTimeDate(prodNo){
		
		$.ajax({
			url : `${mypath}/upProduct.do`,
			data : {prodNo : prodNo},
			success : function(res) {
				console.log(res);
				alert('상품 끌올');
				loadTransactionData('상품관리');
			},
			error : function(xhr){
				console.log('up처리오류');
			}
			
		});
	}
	
	
	function deleteProd(prodNo){
		
		$.ajax({
			url : `${mypath}/deleteProduct.do`,
			data: { prodNo: prodNo },
			success : function(res) {
				console.log(res);
				alert('상품삭제');
				loadTransactionData('상품관리');
			},
			error : function(xhr){
				console.log('삭제처리오류');
			}
		});
	}
	
	
	
	
	
	
	