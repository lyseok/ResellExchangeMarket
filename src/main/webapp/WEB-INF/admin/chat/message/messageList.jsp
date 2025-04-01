<%@page import="rem.chat.vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>
	<script>
		$(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/messageList.do",
				contentType:"application/json;charset=utf-8",
				type: "post",
				success: res =>{
					console.log(res);
					html = "";
					$.each(res, function(i, v){
						html += `<tr>
				            <td>\${v.msg_no}</td>
				            <td>\${v.chat_room_no}</td>
				            <td>\${v.mem_no}</td>
				            <td>`
				            	if(v.msg_imgck == 0){
				            		 html += "파일 없음";
				            	}  else{
				            		 html += "파일 없음";				            		
				            	}
				        html +=  `</td>
				            <td>\${v.msg_cont}</td>
				            <td>\${v.msg_create_at}</td>
				            </tr>`;
					})
					$("#tbody").html(html);
				},
				error: xhr => {
					alert("오류: " + xhr.status);
				},
				dataType:"json"
				
			})
		})
		$(function(){
			let opName = $("#searchNotice option").val();
			let inVal = $("#searchText").val();
			if (search_text == "") {
				alert("검색어를 입력하세요.");
				return false;
			} else {
				
			}
			
		})
	</script>
    <div id="wrapper">

        <div id="container" class="">

            <h1 id="container_title">채팅관리 > 메세지 관리</h1>
            <div class="container_wr">
                <section>
                    
                    <div class="local_desc local_desc03 jc_sb ai_c">
                    	<h2>최근 거래내역</h2>
                        <form action="" class="search_form mt0">
                            <select name="searchNotice" id="searchNotice">
                                <option value="mem_no">발신자 번호</option>
                                <option value="msg_cont">내용</option>
                            </select>
                            <div>
                                <input type="text" id="searchText" name="searchText">
                                <span class="material-symbols-outlined" id="searchNoticeBtn">
                                    search
                                </span>
                            </div>
                        </form>
                    </div>

                    <div class="tbl_head01 tbl_wrap">
                        <table>
                            <caption>메세지 내역</caption>
                            <colgroup>
                            	<col width="10%">
                            	<col width="8%">
                            	<col width="8%">
                            	<col width="20%">
                            	<col width="18%">
                            	<col width="20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">메세지번호</th>
                                    <th scope="col">채팅방번호</th>
                                    <th scope="col">발신자</th>
                                    <th scope="col">사진여부</th>
                                    <th scope="col">내용</th>
                                    <th scope="col">생성일자</th>
                                </tr>
                            </thead>
                            <tbody id="tbody"></tbody>
                        </table>
                        
                    </div>

                    <div class="pager_wrap">
                    	<ul>
                    		<li class="on"><a href="javascript:void(0)">1</a></li>
                    		<li><a href="javascript:void(0)">2</a></li>
                    		<li><a href="javascript:void(0)">3</a></li>
                    		<li><a href="javascript:void(0)">4</a></li>
                    		<li><a href="javascript:void(0)">5</a></li>
                    	</ul>
                    </div>
                </section>

            </div>
        </div>

    </div>
</body>

</html>