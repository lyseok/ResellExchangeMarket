<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>
<script>

$(function() {
	$('#btn').on('click', function(){
		console.log("<%= request.getContextPath() %>");
	    $.ajax({
	    	url: "<%=request.getContextPath() %>/getTest.do",
	        type: 'post',
	        success: function(data){
	            $('#result').html(data);
	        },
	        error: function(xhr){
	            console.log(xhr.status);
	        },
	        dataType: 'json'
	
	    });
	});
});

</script>
<body>
	<input type="button" id="btn" value="test">

    <div id="result"></div>
</body>
</html>