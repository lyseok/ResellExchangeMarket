<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	location.href = "<%=request.getContextPath() %>/main.do";
</script>
</head>
<body>
<input type="text" id="id" name="id"><br>
<input type="text" id="pw" name="pw"><br>
<input type="button" id="login" name="login">
</body>
</html>