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
			
		tableCode += `
		
			<tr>
			
			<td>사진</td>
			<td>
				<select class = "prod-status">
					<option value ="판매중">판매완료</option>
					<option value ="판매완료">판매중</option>
					<option value ="예약중">판매중</option>
				</select>
			</td>
			<td>${v.prod_name}</td>
			<td>${v.prod_price}</td>
			<td>${v.prod_newing}</td>
			<td>
			    <input type = "button" class = "up-btn"  data-prodno= "${v.prod_no}"  value = "UP"> <br>
				<input type = "button" class = "edit-btn"  value = "수정"> <br>
				<input type = "button" class = "delete-btn" data-prodno="${v.prod_no}"  value = "삭제">
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
			                    <td>
			                        <input type="button" class="view-btn" data-prodno="${v.prod_no}" value="배송조회"> <br>
			                    </td>
			                </tr>`;
			            } else if (category === '판매관리') {
			                tableCode += `
			                <tr>
			                    <td>사진</td>
			                    <td>${prodApproch}</td>
			                    <td>${txnStatus}</td>
			                    <td>${v.prod_name}</td>
			                    <td>${v.prod_price}</td>
			                    <td>${v.txn_create_at}</td>
			                    <td>
			                        <input type="button" class="insert-btn" data-prodno="${v.prod_no}" value="운송정보입력"> <br>
			                    </td>
			                </tr>`;
			            }
			        }
			    });

		
		
		tableCode += "</tbody></table>";

		$('#ajaxview').html(tableCode);
	}
	
	
	
	$(document).on('click','.up-btn', function() {   //이후에 만들어진 버튼
		const prodNo = $(this).data("prodno");
		updateTimeDate(prodNo);
	});

	$(document).on('click','.delete-btn', function() {
		const prodNo = $(this).data("prodno");
		deleteProd(prodNo);
		
	});

	$(document).on('click','.edit-btn', function() {
		location.href = "<%=request.getContextPath() %>/mainPage.do";
	});
	
	
	
	
	
	$(document).on('click','.view-btn' , function() {
		
	});
	$(document).on('click','.insert-btn' , function() {
		
	});
	
	
	
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
	
	
	
	