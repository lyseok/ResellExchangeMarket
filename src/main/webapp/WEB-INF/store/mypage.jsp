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
    
    String introductText = storeVO.getPr_info().replaceAll("\\n", "<br>");
    
    Timestamp timestamp = Timestamp.valueOf(storeVO.getMem_join_at());
	SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd");
	String shopOpenDate = dateFormat.format(timestamp);
%>
<script>
	storeId = <%=storeId%>;
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
				<img src="<%=request.getContextPath() %>/images/shop/ico_point{$point_count}.png" alt="{$point_count}점">
				<p class="prod_cnt">상품 <span class="cnt"><%=countAllProducts %></span></p>
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
				<script>
				$(".edit *").on("click", function(){
					editProfileForm();
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
//						data: {editedAlias: editedAlias, editedPrInfo: editedPrInfo},
						dataType:"json",
						data: formData,
						contentType: false,
						processData: false,
						success: function(data){
							console.log("success!");
							let result = '<%= request.getAttribute("editProcess") != null ? request.getAttribute("editProcess").toString().replace("'", "\\'") : "" %>';
							
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
				
				
			</div>
			<!-- //상점정보 -오른쪽영역 end -->
			
		</div>
		<!-- // 상점정보 end -->
		
				
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
<script>
$(document).ready(function () {
    const formDataAT = new FormData();
    formDataAT.append("storeId", storeId);
    formDataAT.append("tabName", "tabProd");
    $.ajax({
    	url: mypath + "/store/tabContent.do",
		type: "POST",
		data: formDataAT,
		dataType: "json",
		contentType: false,
		processData: false,
		success: function(data){
			let tabList = "상품";
			let tabCnt = 0;
			let htmlCode = `<ul>`;
			data.forEach(vo => {
				console.log(vo.prod_name, vo.prod_price);
				if(vo.prod_tr_status==1)
					htmlCode +="<li class='sold_out'><a href='javascript:void(0)'><span class='img_box'>";
				else if(vo.prod_tr_status==0)
					htmlCode +="<li><a href='javascript:void(0)'><span class='img_box'>";
				htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
				htmlCode +="</span><span class='txt_box'><span>" +vo.prod_no+"_"+vo.prod_name+ "</span>";
				htmlCode +="<b>" +vo.prod_price+ "</b></span></a></li>";
				tabCnt++;
			});
			htmlCode+=`</ul>`;
			
			$(".store_list_cnt").html(tabList+" <span>"+tabCnt+"</span>");
			$("#prod_list").empty();
			$("#prod_list").append(htmlCode);
		},
		error: function(xhr){
			console.log("상태:: " + xhr.status);
		}
    });
	
	
	$(".store_tab_box li").on("click", function () {
        // 모든 탭에서 클래스 제거
        $(".store_tab_box li").removeClass("on");

        // 클릭된 탭에 클래스 추가
        $(this).addClass("on");

        // 데이터 속성으로부터 탭 이름 가져오기
        const tabName = $(this).data("tab");
		
        const formData = new FormData();
        formData.append("storeId", storeId);
        formData.append("tabName", tabName);
        
		$.ajax({
			url: mypath + "/store/tabContent.do",
			type: "POST",
			data: formData,
			dataType: "json",
			contentType: false,
			processData: false,
			success: function(data){
				let tabList = "상품";
				let tabCnt = 0;
				let htmlCode = `<ul>`;

				switch(tabName){
				case "tabProd":
					data.forEach(vo => {
						console.log(vo.prod_name, vo.prod_price);
						if(vo.prod_tr_status==1)
							htmlCode +="<li class='sold_out'><a href='javascript:void(0)'><span class='img_box'>";
						else if(vo.prod_tr_status==0)
							htmlCode +="<li><a href='javascript:void(0)'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +vo.prod_no+"_"+vo.prod_name+ "</span>";
						htmlCode +="<b>" +vo.prod_price+ "</b></span></a></li>";
						tabCnt++;
					});
					break;
				case "tabReview":
					data.forEach(vo => {
						let prodName = vo.prod_name;
						let prodPrice = vo.prod_price;
						console.log(vo.prod_name, vo.prod_price);
						htmlCode +="<li><a href='javascript:void(0)'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +prodName+ "</span>";
						htmlCode +="<b>" +prodPrice+ "</b></span></a></li>";
						tabList = "리뷰";
						tabCnt++;
					});
					break;
				case "tabSoldout":
					data.forEach(vo => {
						console.log(vo.prod_name, vo.prod_price);
						if(vo.prod_tr_status==1)
							htmlCode +="<li class='sold_out'><a href='javascript:void(0)'><span class='img_box'>";
						else if(vo.prod_tr_status==0)
							htmlCode +="<li><a href='javascript:void(0)'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +vo.prod_no+"_"+vo.prod_name+ "</span>";
						htmlCode +="<b>" +vo.prod_price+ "</b></span></a></li>";
						tabList = "판매완료";
						tabCnt++;
					});
					break;
				case "tabWishlist":
					data.forEach(vo => {
						console.log(vo.prod_name, vo.prod_price);
						if(vo.prod_tr_status==1)
							htmlCode +="<li class='sold_out'><a href='javascript:void(0)'><span class='img_box'>";
						else if(vo.prod_tr_status==0)
							htmlCode +="<li><a href='javascript:void(0)'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +vo.prod_no+"_"+vo.prod_name+ "</span>";
						htmlCode +="<b>" +vo.prod_price+ "</b></span></a></li>";
						tabList = "찜";
						tabCnt++;
					});
					break;
				}
				
				htmlCode+=`</ul>`;
				
				$(".store_list_cnt").html(tabList+" <span>"+tabCnt+"</span>");
				$("#prod_list").empty();
				$("#prod_list").append(htmlCode);
			},
			error: function(xhr){
				console.log("상태:: " + xhr.status);
			}
		});
    });
});
</script>
		<div class="store_product_list_wrap">
			<h6 class="store_list_cnt">상품 <span>N</span></h6>
			<div class="store_list_filter">
				<ul>
					<li class="on"><a href="javascript:void(0)">최신순</a></li>
					<li><a href="javascript:void(0)">고가순</a></li>
					<li><a href="javascript:void(0)">저가순</a></li>
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
		





	