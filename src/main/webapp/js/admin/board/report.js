const allReportBoard = () => {
  $.ajax({
    url: `${mypath}/admin/selectAllReportBoard.do`,
    type: "get",
    success: function(data) {
      console.log(data);
      code = '';
      $.each(data, function(i , v) {
        if(v.rpt_com_status == 0) {
          com_status = "답변전";
        } else {
          com_status = "답변완료";
        }
        code += /* html */`
          <tr>
            <td class="reportBoard">${v.rpt_no}</td>
            <td class="reportBoard">${v.mem_no}</td>
            <td class="reportBoard">${v.rpt_title}</td>
            <td class="reportBoard">${v.rpt_idx_no}</td>
            <td class="reportBoard">${com_status}</td>
            <td class="reportBoard">${v.rpt_time}</td>
            <td><span id="deleteReportBoard" class="adm_del_btn">삭제</span></td>
          </tr>
        `;
      });
        
      console.log(code);
      $("#reportList").html(code);
    },
    error: function(xhr) {
      console.log(xhr.status);
    },
    dataType: "json"
  });
}


  $(document).on("click", "#deleteReportBoard", function() {
    let rpt_no = $(this).closest("tr").find("td:eq(0)").text();
    console.log(rpt_no);
    if(confirm("정말 삭제하시겠습니까?")) {
      $.ajax({
        url: `${mypath}/admin/deleteReportBoard.do`,
        type: "post",
        data: {rpt_no: rpt_no},
        success: function(data) {
          alert("삭제되었습니다.");
          allReportBoard();
        },
        error: function(xhr) {
          console.log(xhr.status);
        },
        dataType: "json"
      });
    }
  });
