<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/admin/include/header_admin.jsp" %>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/board/notice.css">

<script>

$(function() {
    $.ajax({
        url: "<%=request.getContextPath() %>/admin/selectAllNoticeBoard.do",
        type: "get",
        success: function(data) {
            console.log(data);
            code = '';
            $.each(data, function(i , v) {
                code += /* html */`
                    <tr class="noticeBoard">
                        <td>\${v.notice_no}</td>
                        <td>\${v.notice_title}</td>
                        <td>\${v.notice_cnt}</td>
                        <td>\${v.notice_at.substring(0,10)}</td>
                    </tr>
                `;
            });
            
            console.log(code);
            $("#noticeList").html(code);
        },
        error: function(xhr) {
            console.log(xhr.status);
        },
        dataType: "json"
    });
    
    $(document).on("click", ".noticeBoard", function() {
        const bono = $(this).find("td").eq(0).text();
        location.href = "<%=request.getContextPath() %>/admin/noticeViewPage.do?bono=" + bono;
      });

})

</script>
    <div id="wrapper">

        <div id="container" class="">

            <h1 id="container_title">글관리>공지사항</h1>
            <div class="container_wr">
                <section>
                    
                    <div class="local_desc local_desc03">
                        <form action="" class="search_form">
                            <select name="searchNotice" id="searchNotice">
                                <option value="no">번호</option>
                                <option value="title">제목</option>
                            </select>
                            <div>
                                <input type="text">
                                <span class="material-symbols-outlined" id="searchNoticeBtn">
                                    search
                                </span>
                            </div>
                        </form>
                    </div>

                            <div class="tbl_head01 tbl_wrap">
                                <table>
                                    <colgroup>
                                        <col width="10%">
                                        <col width="60%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">조회수</th>
                                            <th scope="col">작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody id="noticeList">
                                    </tbody>
                                </table>
                            </div>

                    <div class="btn_list03 btn_list">
                        <a href="<%=request.getContextPath() %>/admin/insertNoticePage.do">공지 글쓰기</a>
                    </div>

                </section>


            </div>
        </div>

    </div>
</body>

</html>