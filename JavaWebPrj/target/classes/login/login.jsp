<%@page import="org.apache.commons.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ログイン画面</title>
</head>
<body>
	<%-- <jsp:include page="<%=request.getContextPath()%>/common/login_header.jsp"></jsp:include> --%>
	<div id="login">
		<div class="container col-md-8 col-md-offset-3">
			<h1>ログイン</h1>
			<form id="frm_login" action="<%=request.getContextPath()%>/login" method="post">
				<div class="form-group">
					<label for="username">ユーザ名</label>
					<input type="text" class="form-control" id="username" name="username">
				</div>
				<div class="form-group">
					<label for="password">パスワード</label>
					<input type="password" class="form-control" id="password" name="password" required>
				</div>
				<a href="javascript:login()" type="button" class="btn btn-primary">ログイン</a>
				<p>登録してない方はこちらから<a href="javascript:register_form()">ユーザー登録</a></p>
			</form>
		</div>
	</div>
	<%-- <jsp:include page="<%=request.getContextPath()%>/common/login_footer.jsp"></jsp:include> --%>
</body>
<script>
	function login() {
		var username = $("#username").val();
		var password = $("#password").val();
		if (username == '') {
			alert('ユーザー名を入力してください。');
		} else {
			if (password == '') {
				alert('パスワードを入力してください。');
			} else {
				$("#frm_login").submit();
			}
		}
	}
	
	function register_form() {
		window.location.replace("<%=request.getContextPath()%>/register");
	}
</script>
</html>