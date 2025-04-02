<%@page import="rem.product.vo.CateNameVO"%>
<%@page import="rem.file.vo.ImgFileVO"%>
<%@page import="java.util.List"%>
<%@page import="rem.product.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>

<%@include file="/WEB-INF/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productDetail.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>

<% 
	List<ImgFileVO> list = (List<ImgFileVO>)request.getAttribute("imgfile");
	ProductVO pvo = (ProductVO)request.getAttribute("productDetail");
	ImgFileVO filevo = (ImgFileVO)request.getAttribute("profileImg");
	int countReview = (Integer)request.getAttribute("countReview");
	int countWish = (Integer)request.getAttribute("countWish");
	int countProduct = (Integer)request.getAttribute("countProduct");
	MemberVO memInfo = (MemberVO)request.getAttribute("memInfo");
	CateNameVO svo = (CateNameVO)request.getAttribute("svo");
	
	String content = pvo.getProd_content().replaceAll("\\n", "<br>");
%>
<script>
$(function(){
	pvoNo = <%=pvo.getProd_no()%>;
	loginInfo = <%=loginInfo.getMem_no()%>
	memNo = <%=pvo.getMem_no()%>
	
	$('#confirm').on('click', function(){
		
		location.href = `${mypath}/product/purchase.do?prod_no=${pvoNo}`;
	})
	
	if(loginInfo===memNo){
		$('#wish').prop('disabled', true);
		$('#chat').prop('disabled', true);
		$('#modal-open').prop('disabled', true);
	}
})
</script>

<div class="inner">
	
	<%@include file="/WEB-INF/include/category.jsp" %>
		<div class="cont">
			<br>
			<div class="innerCont">
				<div class="innerCont text">
					<div class="innerCont text photo" id="photo">
					<% for(ImgFileVO fvo : list){ %>
						<img src="<%=fvo.getFile_path() %>" alt="prod_img" id="prod_img">
					<% } %>
					</div>
				</div>
				<div class="innerCont item" id="innerCont item">
					<div class="innerCont item status">
						<%if(pvo.getProd_tr_status()==0){ %>
						<span>판매중</span>
						<%}else{ %>
						<span>판매완료</span>
						<%} %>
					</div>
					<div class="innerCont item name">
						<span id="name"><%=pvo.getProd_name() %></span><br>
						<span id="price"><%=pvo.getProd_price() %> 원</span>
					</div>
					<div class="innerCont item view">
						<span class="material-symbols-outlined">favorite <span class="number"><%=countWish %></span></span>
						<span class="material-symbols-outlined">visibility <span class="number"><%=pvo.getProd_view() %></span></span>
						<span class="material-symbols-outlined">schedule<span class="number"><%=pvo.getProd_at() %></span></span>
						<span class="material-symbols-outlined siren">siren<span class="report">신고하기</span></span>
					</div>
					<div class="innerCont item trade">
						<%if(pvo.getProd_tr_approch()==0) {%>
						<span class="stat">거래 방식<span class="stat2">직거래</span></span>
						<%}else if(pvo.getProd_tr_approch()==1){ %>
						<span class="stat">거래 방식<span class="stat2">택배거래(선불)</span></span>
						<%}else if(pvo.getProd_tr_approch()==2) {%>
						<span class="stat">거래 방식<span class="stat2">택배거래(착불)</span></span>
						<%} %>
						<%if(pvo.getPrice_offer()==1){ %>
						<span class="stat">가격 제안<span class="stat2">가능</span></span>
						<%}else{ %>
						<span class="stat">가격 제안<span class="stat2">불가능</span></span>
						<%} %>
						<%if(pvo.getProd_condition()==1) {%>
						<span class="stat">상품 상태<span class="stat2">새상품(미사용)</span></span>
						<%}else if(pvo.getProd_condition()==2) {%>
						<span class="stat">상품 상태<span class="stat2">사용감 없음</span></span>
						<%}else if(pvo.getProd_condition()==3) {%>
						<span class="stat">상품 상태<span class="stat2">사용감 적음</span></span>
						<%}else if(pvo.getProd_condition()==4) {%>
						<span class="stat">상품 상태<span class="stat2">사용감 잦음</span></span>
						<%}else { %>
						<span class="stat">상품 상태<span class="stat2">고장/파손 상품</span></span>
						<%} %>
					</div>
					<div class="innerCont item button">
						<%if(pvo.getProd_tr_status()==0){ %>
						<button class="btn" id="wish">
							<span class="material-symbols-outlined but">heart_plus<span class="btnText" id="wbtn">찜<%=countWish %></span></span>
						</button>
						<button class="btn" id="chat">
							<span class="material-symbols-outlined but">chat_bubble<span class="btnText" id="cbtn">띹톡</span></span>
						</button>
						<button  class="btn" type="button" id="modal-open">구매하기
						</button>  
						<%}else{ %>
						<%} %>
					</div>
				</div>		
			</div>
			<div class="innerCont">
				<div class="innerCont text2">
					<div class="innerCont text2 content">
						<h2>상품 정보</h2>
						<span><%=content %></span>
					</div>		
					<div class="innerCont text2 cate">
						<span class="material-symbols-outlined cate">inbox_text<span>카테고리</span></span>
						<span><%=svo.getCate_main_name() %> > <%=svo.getCate_sub_name() %></span>
					</div>		
				</div>
				<div class="innerCont item2">
					<div class="innerCont item2">
						<h3>상점 정보</h3>
					</div>
					<div class="innerCont item2 store">
						<div class="innerCont item2 store proImg">
							<img src="<%=filevo.getFile_path() %>" alt="profiile_img" id="profileImg">
						</div>
						<div class="innerCont item2 store profile">
							<div class="innerCont item2 store profile alias">							
								<span id="alias"><%=memInfo.getMem_alias() %></span>
							</div>
							<div class="innerCont item2 store profile review">
								<span>상품 <%=countProduct %> | 후기 <%=countReview %></span>
							</div>
						</div>
						
					</div>
				</div>		
			</div>
			
			<div class="innerCont">
				<div class="innerCont text">
									
				</div>
				<div class="innerCont item">
					
				</div>		
			</div>
			
			
	</div>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>

<div class="container">
  <div class="modal-btn-box">
  </div>
  
  <div class="popup-wrap" id="popup">
    <div class="popup">
      <div class="popup-head">
          <span class="head-title">
            상품 구매 확정
          </span>
      </div>
      <div class="popup-body">
      	<p>
      		해당상품을<br> 구매 확정하시겠습니까?
      	</p>
      </div>
      <div class="popup-foot">
        <span class="pop-btn confirm" id="confirm">확인</span>
        <span class="pop-btn close" id="close">취소</span>
      </div>
    </div>
</div>
</div>