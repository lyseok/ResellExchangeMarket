

code='';
$.each(noticeList, function(i,v){
	noticeView_url = urlView + v.notice_no;
	code += `
	<li>
		<span id='articleTitle' style='float:left;'>
			<a href='${noticeView_url}'>${v.notice_title}</a>
		</span>
		<span id='articleAt' style='float:right;max-height:fit-content;'>
		${v.notice_at}
		</span>
	</li>
	`;
});
$(".kcy_boardList").html(code);

$("#searchNoticeText").attr("placeholder", articleSearchText);

