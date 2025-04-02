<%@page import="rem.file.vo.ImgFileVO"%>
<%@page import="java.util.List"%>
<%@page import="rem.product.vo.CateNameVO"%>
<%@page import="rem.product.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>

<%@include file="/WEB-INF/include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/purchase.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>
<%@include file="/WEB-INF/include/category.jsp" %>

<%
	ProductVO pvo = (ProductVO)request.getAttribute("pvo");
	CateNameVO cvo = (CateNameVO)request.getAttribute("cvo");
	List<ImgFileVO> list = (List<ImgFileVO>)request.getAttribute("list");
	int mem_bal = (Integer)request.getAttribute("mem_bal");
	
	String content = pvo.getProd_content().replaceAll("\\n", "<br>");
	
	System.out.println("loginSession :" + login);
	if(login == null) {
		response.sendRedirect(request.getContextPath() + "/accessCheck.do");
	}
	
	int price = pvo.getProd_price();
%>
<script>
$(function(){
	pvoNo = <%=pvo.getProd_no()%>
	
	$('#allCheck').on('change', function(){
		
		isChecked = $(this).prop('checked');
		$('.checkbox').prop('checked', isChecked);
	})
	
	$('.checkbox').on('change', function(){
		
		allChecked = $('.checkbox').length === $('.checkbox:checked').length;
		anyChecked = $('.checkbox:checked').length > 0;
		$('#allCheck').prop('checked', allChecked);
		$('#allCheck').prop('indeterminate', !allChecked && anyChecked);
	})
	
	$('#order').on('click', function(){
		
		location.href = `${mypath}/product/insertTransaction.do?prod_no=${pvoNo}`;
	})
})
</script>
<hr>
<div class="inner">
	<h1>구매하기</h1>
	<hr>
		<div class="cont">
			<br>
			<div class="innerCont">
				<div class="innerCont text">
					<h3>거래방법</h3>
				</div>
				<div class="innerCont item" id="innerCont item">
					<%if(pvo.getProd_tr_approch()==0){ %>
						<span>직거래</span>
					<%}else if(pvo.getProd_tr_approch()==1) {%>
						<span>택배거래(선불)</span>
					<%}else{ %>
						<span>택배거래(착불)</span>
					<%} %>
				</div>		
			</div>
			<div class="innerCont">
				<div class="innerCont text">
					<div class="innerCont text prod">
						<h3>주문상품</h3>
					</div>
				</div>
				<div class="innerCont item">
					<div class="innerCont item prod">
						<span><%=pvo.getProd_name() %></span>
						<% for(ImgFileVO fvo : list){%>
							<img src="<%=fvo.getFile_path() %>" alt="prod_img" id="prod_img">
						<% } %>
					</div>
				</div>
				
				<div class="innerCont2 text">
					<div class="innerCont text prod">
						<h2>상품 정보</h2>
					</div>
				</div>
				<div class="innerCont3 item">
					<div class="innerCont item prod">
						<span><%=content %></span>
					</div>
				</div>
			</div>
			<div class="innerCont">
				<div class="innerCont text">
					<div class="innerCont text cate">
						<h3>카테고리</h3>
					</div>
				</div>
				<div class="innerCont item">
					<div class="innerCont item cate">
						<span><%=cvo.getCate_main_name() %> > <%=cvo.getCate_sub_name() %></span>
					</div>
				</div>
			</div>
			<div class="innerCont">
				<div class="innerCont text">
					<div class="innerCont text condition">
						<h3>상품상태</h3>
					</div>
				</div>
				<div class="innerCont item">
					<div class="innerCont item condition">
						<%if(pvo.getProd_condition()==1){ %>
							<span>새상품(미사용)</span>
						<%}else if(pvo.getProd_condition()==2){ %>
							<span>사용감 없음</span>
						<%}else if(pvo.getProd_condition()==3){ %>
							<span>사용감 적음</span>
						<%}else if(pvo.getProd_condition()==4){ %>
							<span>사용감 잦음</span>
						<%}else{ %>
							<span>고장/파손 상품</span>
						<%} %>
					</div>
				</div>
			</div>
			<div class="innerCont">
				<div class="innerCont text">
					<div class="innerCont text price">
						<h3>가격</h3>
					</div>
				</div>
				<div class="innerCont item">
					<div class="innerCont item price">
						<span><%=price %> 원</span>
					</div>
				</div>
			</div> 
			
			<div class="innerCont">
				<div class="innerCont item2">
					<div class="innerCont item check">
						<label>
							<input type="checkbox" id="allCheck" class="checkbox"> 아래 내용에 전체 동의해요<br>
						</label>
						<label>
							<input type="checkbox" class="checkbox">띹장터 서비스 이용약관 동의(필수)<br>
						</label>
						<label>
							<input type="checkbox" class="checkbox">개인정보 수집 및 이용 동의(필수)<br>
						</label>
						<label>
							<input type="checkbox" class="checkbox">개인정보 제3자 제공 동의(필수)<br>
						</label>
					</div>
				</div>
				
				<div class="innerCont2 text2">
					<div class="innerCont text2 pay">
						<h2>결제금액</h2>
					</div>
				</div>
				<div class="innerCont3 item4">
					<div class="innerCont3 item3 pay">
						 <div class="innerCont3 item3 pay balT">
						 	<span>페이 잔액</span>
						 </div>
						 <div class="innerCont3 item3 pay balI">
						 	<span class="bal"><%=mem_bal %> 원</span>
						 </div>
					</div>
					<div class="innerCont3 item3 pay">
						 <div class="innerCont3 item3 pay balT">
						 	<span>상품 금액</span>
						 </div>
						 <div class="innerCont3 item3 pay balI">
						 	<span class="bal"><%=price %> 원</span>
						 </div>
					</div>
					<div class="innerCont3 item3 pay">
						 <div class="innerCont item3 pay balT">
						 	<span>거래 후 페이</span>
						 </div>
						 <div class="innerCont3 item3 pay balI">
						 	<span class="bal"><%=mem_bal-price %> 원</span>
						 </div>
					</div>
				</div>
			</div>
	</div>
</div>
<div class="innerGray">
				<div class="innerGray button">
					<div class="order">
						<input type="button" value="구입하기" id="order">
					</div> 
				</div>		
			</div>
<%@include file="/WEB-INF/include/footer.jsp" %>