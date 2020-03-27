<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>관리자</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<style>
	body { font-family:'맑은 고딕', verdana; padding-bottom:70px; margin:0; }
   
	header#header { font-size:20px; padding:5px 0; }
   	header#header a { color:#000; font-weight:bold; font-size:14px;text-align: right }
   	header#header img {width: 40px; height: 44px; margin-left: 10px; margin-bottom: 3px;}
   	header#header .title{ border-bottom: 1px solid gray;}  
   	#footer { background:#f9f9f9; padding:8px; }
   	#footer ul li { display:inline-block; margin-right:10px; }
   	.form-signin{max-width: 330px;padding: 15px;margin: 0 auto;}
   	.btn-login {margin-top: 10px;}
</style>
<meta charset="UTF-8">
<title>LOGIN</title>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>


	<div class="container">
		<div class="row">
			<div class="col-lg-offset-3 col-lg-5">
				<form role="form" method="post" autocomplete="off" class="form-signin">
					
					<h2 class="text-center">
						LOGIN
					</h2>
					
					<label for="userId" class="sr-only">userId</label>
					<input type="text" id="userId" name="userId" required="required" placeholder="아이디" class="form-control">
					
					<label for="userPass" class="sr-only">userPass</label>
					<input type="password" id="userPass" name="userPass" required="required" placeholder="패스워드" class="form-control">
					
					<button type="submit" class="btn btn-lg btn-primary btn-block btn-login">로그인</button>
					
					<c:if test="${msg == false }">
						<p style="color: red;">아이디 혹은 비밀번호를 확인하세요</p>
					</c:if>
				</form>
			</div>
		</div>	
	</div>		

	<footer class="navbar navbar-default navbar-fixed-bottom">
		<div id="footer" class="container-fluid">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>
</body>
</html>