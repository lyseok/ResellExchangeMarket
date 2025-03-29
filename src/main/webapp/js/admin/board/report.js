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
          <tr class="reportBoard">
            <td>${v.rpt_no}</td>
            <td>${v.mem_no}</td>
            <td>${v.rpt_type}</td>
            <td>${v.rpt_idx_no}</td>
            <td>${com_status}</td>
            <td>${v.rpt_time}</td>
            <td><a href="javascript:void(0)">삭제</a></td>
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