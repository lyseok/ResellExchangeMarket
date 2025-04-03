<%@page import="rem.file.vo.ImgFileVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/store/store.css">
<%@include file="/WEB-INF/include/category.jsp" %>
<script src="<%=request.getContextPath() %>/js/store/store.js"></script>
<%
	MemberVO storeVO = (MemberVO)request.getAttribute("storeVO");
	int storeId = (Integer)request.getAttribute("storeId");
	int countAllProducts     = (Integer)request.getAttribute("countAllProducts");
    int countSoldoutProducts = (Integer)request.getAttribute("countSoldoutProducts");
    ImgFileVO profileImg = (ImgFileVO)request.getAttribute("profileImg");
    String profileImgSrc = profileImg.getFile_path();
    double averageRating = storeVO.getPr_rating_avg();
    
    String introductText = storeVO.getPr_info().replaceAll("\\n", "<br>");
    
    Timestamp timestamp = Timestamp.valueOf(storeVO.getMem_join_at());
	SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd");
	String shopOpenDate = dateFormat.format(timestamp);
%>
<script>
	storeId = <%=storeId%>;
	avgRating = <%=averageRating%>;
	profileImgSrc = "<%=profileImgSrc %>";
	console.log(avgRating);
	
	$(document).ready(function () {
		
		/* 프로필영역 리뷰평점 별 표시 */
		viewRatingScore();
		
		/* 탭영역 최신순|고가순|저가순 정렬기능 */
		tabFiltering();

		/* tabContent.SERVLET 호출 -기본값: tabProd */
		loadProdTabAtFirst();
		
		/* tabContent.SERVLET 호출 */
		loadTabContent();
	});
</script>
	<!-- 상점 상세보기 시작 -->
	<div id="store" class="inner">	
	
		<!-- 상점정보 -->
		<div class="store_info_wrap">
		
			<!-- 상점정보 - 왼쪽영역 -->
			<div class="store_info_box">
				<div class="thumb">
					<img src="<%=profileImgSrc %>" alt="shop_info_img" id="kcy_previewImg">
				</div>
				<b><%=storeVO.getMem_alias() %></b>
				<%--<img src="<%=request.getContextPath() %>/images/shop/ico_point{$point_count}.png" alt="{$point_count}점"> --%>
				<span class="ratingView">
				<span class="material-symbols-outlined star" data-const="1">star</span>
				<span class="material-symbols-outlined star" data-const="2">star</span>
				<span class="material-symbols-outlined star" data-const="3">star</span>
				<span class="material-symbols-outlined star" data-const="4">star</span>
				<span class="material-symbols-outlined star" data-const="5">star</span>
				</span>
				
				<p class="prod_cnt">상품 <span class="cnt"><%=countAllProducts %></span></p>
				<img class="store_info_wrap_biggerThumb" src="<%=profileImgSrc %>" alt="shop_info_img">
			</div>
			<!-- // 상점정보 - 왼쪽영역 end -->
			
			<!-- 상점정보 - 오른쪽영역 -->
			<div class="store_info_txt_wrap">
				<div class="info_txt_tit">
					<!-- 타이틀 -->
					<h6 id="kcy_storename"><%=storeVO.getMem_alias() %></h6>
					<!-- // 타이틀 end  -->
					
					<!-- 본인인증 -->
					<div class="mem_ck">
						<% if(storeVO.getMem_tel() != null){ %>
						<span class="material-symbols-outlined">check_circle</span>
						<p>본인인증 완료</p>
						<%} else { }%>
					</div>
					<!-- // 본인인증 end -->
				</div>
				
				<!-- 아이콘영역  -->
				<div class="store_info_icon_box">
					<ul>
						<li class="shop_open">
							<span class="material-symbols-outlined">storefront</span>
							<div>상점오픈일 <span><%=shopOpenDate %></span></div>
						</li>
						<li class="shop_cart">
							<span class="material-symbols-outlined">shopping_cart</span>
							<div>상품판매 <span><%=countSoldoutProducts %></span></div>
						</li>
					</ul>
				</div>				
				<!-- // 아이콘영역 end  -->
				
				<div class="store_info_txt_box">
					<p id="kcy_storeintroduct"><%=introductText %></p>
				</div>

<%if(loginInfo.getMem_no() == storeVO.getMem_no()){ %>
				<div class="edit">
					<span class="material-symbols-outlined">edit</span>
					<span>수정하기</span>
				</div>
<%} else { %>
				<div class="siren">
					<span class="material-symbols-outlined">siren</span>
					<span>신고하기</span>
				</div>
<%} %>
			</div>
			<!-- //상점정보 -오른쪽영역 end -->
		</div>
		<!-- // 상점정보 end -->
		
<!--■■■■■프로필수정 스크립트 -->
<script>
$(".edit *").on("click", function(){
	editProfileForm();
});
$(document).on("click", ".completeEdit", function(){
	$(document).on("click", ".completeEdit", function(){
		editedAlias  = $("#kcy_editAlias").val();
		editedPrInfo = $("#kcy_editPrInfo").val().replaceAll(/<br>/g, "\\n");;
		
		checkNewImg = "NEW-IMG";
		
		const fileInput = document.getElementById("kcy_imageInput");
	    const file = fileInput.files[0];
	    if (!file) {
	        checkNewImg = "NO";
	    }
	    const formData = new FormData();
	    formData.append("checkNewImg", checkNewImg);
	    formData.append("editedImage", file);
		formData.append("editedAlias", editedAlias);
		formData.append("editedPrInfo", editedPrInfo);
	    
		console.log(editedAlias +" "+ editedPrInfo);
		
		$.ajax({
			url: "<%=request.getContextPath()%>/store/mypageProfileEdit.do?",
			type: "POST",
			//data: {editedAlias: editedAlias, editedPrInfo: editedPrInfo},
			dataType:"json",
			data: formData,
			contentType: false,
			processData: false,
			success: function(data){
				console.log("success!");
				console.log("data : ",data);
				
				if(data.result=="success"){
					location.href= '/REMProject/store/storePage.do?param=mem_no&value=<%=loginInfo!=null ? loginInfo.getMem_no() : "" %>';//주소를 재요청
				}else{//실패
					alert("에러 발생^0^: 수정사항이 저장되지 않았습니다. 관리자에게 문의해주세요.");
				}
				
			},
			error: function(xhr){
				console.log("상태: " + xhr.status);
			}
			
		});
	});
});
$(document).on("click", ".completeEdit", function(){
	editedAlias  = $("#kcy_editAlias").val();
	editedPrInfo = $("#kcy_editPrInfo").val().replaceAll(/<br>/g, "\\n");;
	
	checkNewImg = "NEW-IMG";
	
	const fileInput = document.getElementById("kcy_imageInput");
    const file = fileInput.files[0];
    if (!file) {
        checkNewImg = "NO";
    }
    const formData = new FormData();
    formData.append("checkNewImg", checkNewImg);
    formData.append("editedImage", file);
	formData.append("editedAlias", editedAlias);
	formData.append("editedPrInfo", editedPrInfo);
    
	console.log(editedAlias +" "+ editedPrInfo);
	
	$.ajax({
		url: "<%=request.getContextPath()%>/store/mypageProfileEdit.do?",
		type: "POST",
		//data: {editedAlias: editedAlias, editedPrInfo: editedPrInfo},
		dataType:"json",
		data: formData,
		contentType: false,
		processData: false,
		success: function(data){
			console.log("success!");
			<%-- let result = '<%= request.getAttribute("editProcess") != null ? request.getAttribute("editProcess").toString().replace("'", "\\'") : "" %>'; --%>
			
			//1) 이렇게 JSON String으로 넘어옴
			//String json = gson.toJson("success");
			//map.put("result", "success");
			
			//2) J/S에서는 이렇게 받아야해요
			//data :  {"result":"success"}
			console.log("data : ",data);
			
			if(data.result=="success"){
				location.href= '/REMProject/store/storePage.do?param=mem_no&value=<%=loginInfo!=null ? loginInfo.getMem_no() : "" %>';//주소를 재요청
			}else{//실패
				alert("에러 발생^0^: 수정사항이 저장되지 않았습니다. 관리자에게 문의해주세요.");
			}
			
		},
		error: function(xhr){
			console.log("상태: " + xhr.status);
		}
		
	});
});
$(document).on("change", "#kcy_imageInput", function () {
    const input = this;
    const previewImage = $("#kcy_previewImg")[0];
    const file = input.files[0];

    if (file) {
        // 단순히 이미지 엘리먼트를 활성화
        previewImage.style.display = "block";
        previewImage.src = URL.createObjectURL(file);
        
      /*   //<!-- 확대블러처리된 썸네일박스 -->
		backgroundThumbnail();
		//<!-- // 썸네일박스 동적 처리 end --> */

        // 메모리 누수 방지
        input.addEventListener("blur", () => URL.revokeObjectURL(previewImage.src));
    } else {
        previewImage.style.display = "none";
    }
});
</script>
<!-- 프로필수정 스크립트 end ■■■■■-->

		<!-- 탭영역 -->
		<div class=store_tab_wrap>
		
			<!-- 상품설명 영역 -->
			<ul class="store_tab_box">
				<li class="on" data-tab="tabProd">
					<a href="javascript:void(0)">상품</a>
				</li>
				<li data-tab="tabReview">
					<a href="javascript:void(0)">상점후기</a>
				</li>
				<li data-tab="tabSoldout">
					<a href="javascript:void(0)">판매상품</a>
				</li>
<%if(loginInfo.getMem_no() == storeVO.getMem_no()){ %>
				<li data-tab="tabWishlist">
					<a href="javascript:void(0)">찜목록</a>
				</li>
<%} %>
			</ul>			
			<!-- // 판매자 정보 end -->
		</div>
		<!-- // 탭영역 -->
		
		
		<!-- '상품'탭 리스트 -->


		<div class="store_product_list_wrap">
			<h6 class="store_list_cnt">상품 <span>N</span></h6>
			<div class="store_list_filter">
				<ul>
					<li class="on" id="sort_date"><a href="javascript:void(0)">최신순</a></li>
					<li id="sort_price_desc"><a href="javascript:void(0)">고가순</a></li>
					<li id="sort_price_asc"><a href="javascript:void(0)">저가순</a></li>
				</ul>
			</div>

			<div id="tabContent">
				<%-- <%@include file="/WEB-INF/store/tabContent.jsp" %> --%>
							
			
				<div id="prod_list">
					<%-- <ul>
						<li>
							<a href="javascript:void(0)">
								<span class="img_box">
									<img src="<%=request.getContextPath() %>/images/shop/product1.png" alt="prod_img1" />
								</span>
								<span class="txt_box">
									<span>[빈티지 구제] 체크 겨울남방</span>
									<b>15,000원</b>
								</span>
							</a>
						</li>
						<li class="sold_out">
							<a href="javascript:void(0)">
								<span class="img_box">
									<img src="<%=request.getContextPath() %>/images/shop/product2.png" alt="prod_img2" />
								</span>
								<span class="txt_box">
									<span>[빈티지 구제] 체크 겨울남방</span>
									<b>15,000원</b>
								</span>
							</a>
						</li>
					</ul> --%>
				</div>
			</div>
		</div>
		<!-- // '상품'탭 리스트 end -->
		
	</div>
	<!-- // 상점 상세보기 end -->

<%@include file="/WEB-INF/include/footer.jsp" %>
		





	