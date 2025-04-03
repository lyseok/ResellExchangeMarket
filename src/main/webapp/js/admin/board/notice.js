// ajax로 공지사항 리스트를 받아온다.
const allNoticeBoard = () => {
  $.ajax({
    url: `${mypath}/admin/selectAllNoticeBoard.do`,
    type: "get",
    success: function(data) {
      console.log(data);
      code = '';
      $.each(data, function(i , v) {
        code += /* html */`
          <tr class="noticeBoard">
            <td>${v.notice_no}</td>
            <td>${v.notice_title}</td>
            <td>${v.notice_cnt}</td>
            <td>${v.notice_at.substring(0,10)}</td>
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
}

const searchNoticeBoard = () => {
  const search_notice = $('#searchNotice').val();
  const search_text = $('#searchText').val();
  if (search_text == "") {
    alert("검색어를 입력하세요.");
    return false;
  } else {
    $.ajax({
      type: "get",
      url: `${mypath}/admin/searchNoticeBoard.do`,
      data: {
        searchNotice: search_notice,
        searchText: search_text
      },
      success: function(data) {
        code = '';
        $.each(data, function(i , v) {
          code += /* html */`
            <tr class="noticeBoard">
              <td>${v.notice_no}</td>
              <td>${v.notice_title}</td>
              <td>${v.notice_cnt}</td>
              <td>${v.notice_at}</td>
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
  }
}

// 수정 버튼을 클릭하면 textarea로admin_bd_view_cont의 내용을 가져와서 textarea에 넣어준다.
const noticeBoardUpdateForm = () => {
  var cont = $('.admin_bd_view_cont').text().replaceAll(/<br>/g, "\n");
  var code=`<textarea id="notice_cont" class="input" placeholder="내용을 입력하세요">${cont}</textarea>
        <div class="btn_list03 btn_list">
          <button id="confirmBtn">확인</button>
          <button id="cancelBtn">취소</button>
        </div>`;
  $('.admin_bd_view_cont').html(code);
}

// 삭제 버튼을 누르면 해당 게시글의 번호를 가지고 서블릿 호출
const deleteNoticeBoard = () => {
  $.ajax({
    url: `${mypath}/admin/deleteNoticeBoard.do`,
    type: "post",
    data: {notice_no: noticeNo},
    success: function(data) {
      console.log(data);
    if(data > 0) location.href = `${mypath}/admin/noticePage.do`;
    },
    error: function(xhr) {
      console.log(xhr.status);
    },
    dataType: "json"
  });
}

// 확인 버튼을 클릭하면 textarea의 내용을 가져와서 ajax로 보내준다.
const noticeBoardUpdate = () => {
  var cont = $('#notice_cont').val().replaceAll(/\n/g, "<br>");
  $.ajax({
    url: `${mypath}/admin/updateNotice.do`,
    type: "post",
    data: {notice_no: noticeNo, notice_cont: cont},
    success: function(data){
      console.log(data);
      $('.admin_bd_view_cont').html(cont);
    },
    error: function(xhr){
      console.log(xhr.status);
    },
    dataType: "json"
  });
}