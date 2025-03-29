<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<script>
			
			
			$(document).ready(function () {
			    $(".store_tab_box li").on("click", function () {
			        // 모든 탭에서 클래스 제거
			        $(".store_tab_box li").removeClass("on");
			
			        // 클릭된 탭에 클래스 추가
			        $(this).addClass("on");
			
			        // 데이터 속성으로부터 탭 이름 가져오기
			        const tabName = $(this).data("tab");
					
			        const formData = new FormData();
			        //var storeId ;
			        formData.append("storeId", storeId);
			        
					$.ajax({
						url: "<%=request.getContextPath()%>/store/tabContent.do",
						type: "POST",
						data: formData,
						dataType: "json",
						contentType: false,
						processData: false,
						success: function(data){
							console.log("■■■■■"+data);
						},
						error: function(xhr){}
					});
			    });
			});
			</script>
<div id="prod_list">
	<ul>
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
	</ul>
</div>