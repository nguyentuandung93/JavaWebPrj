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
	<title>ユーザー登録画面</title>
</head>
<body>
	<%-- <jsp:include page="<%=request.getContextPath()%>/common/login_header.jsp"></jsp:include> --%>
	<div id="login">
		<div class="container col-md-8 col-md-offset-3">
			<h1>ユーザー登録</h1>
			<form id="frm_register" action="<%=request.getContextPath()%>/register" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="username">ユーザ名</label>
					<input type="text" class="form-control" id="username" name="username" autocomplete="off">
				</div>
				<div class="form-group">
					<label for="password">パスワード</label>
					<input type="password" class="form-control" id="password" name="password" autocomplete="off">
				</div>
				<div class="form-group">
					<label for="re_password">パスワード確認</label>
					<input type="password" class="form-control" id="re_password" name="re_password" autocomplete="off">
				</div>
				<div class="form-group">
					<label for="image_file">アップロード画像</label>
					<input type="file" class="form-control" id="image_file" name="image_file" accept="image/*">
				</div>
				<a href="javascript:register()" type="button" class="btn btn-primary">登録</a>
				<p>既に登録した方はこちらから<a href="javascript:login_form()">ログイン</a></p>
			</form>
		</div>
	</div>
	<%-- <jsp:include page="<%=request.getContextPath()%>/common/login_footer.jsp"></jsp:include> --%>
</body>
<script>
	function register() {
		if (check_input() == 0) {
			$("#frm_register").submit();
		}
	}
	
	function check_input() {
		var err_flg = 0;
		var username = $("#username").val();
		var password = $("#password").val();
		var re_password = $("#re_password").val();
		var image_file = $("#image_file").val();
		if (username == '') {
			alert('ユーザー名を入力してください。');
			err_flg++;
			return err_flg;
		}
		if (password == '') {
			alert('パスワードを入力してください。');
			err_flg++;
			return err_flg;
		}
		if (password.length < 6) {
			alert('パスワードの６文字以上を入力してください。');
			err_flg++;
			return err_flg;
		}
		if (re_password != password) {
			alert('パスワード確認を再度に入力してください。');
			err_flg++;
			return err_flg;
		}
		if (image_file == '') {
			alert('画像ファイルをインポートしてください。');
			err_flg++;
			return err_flg;
		}
		return err_flg;
	}
	
	function login_form() {
		window.location.replace("<%=request.getContextPath()%>/");
	}
</script>
</html>