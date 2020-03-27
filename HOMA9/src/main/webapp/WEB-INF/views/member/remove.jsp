<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>관리자</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<style>
body {
	font-family: '맑은 고딕', verdana;
	padding-bottom: 70px;
	margin: 0;
}

header#header {
	font-size: 20px;
	padding: 5px 0;
}

header#header a {
	color: #000;
	font-weight: bold;
	font-size: 14px;
	text-align: right
}

header#header img {
	width: 40px;
	height: 44px;
	margin-left: 10px;
	margin-bottom: 3px;
}

header#header .title {
	border-bottom: 1px solid gray;
}

#footer {
	background: #f9f9f9;
	padding: 8px;
}

#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>

<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>


	<div class="container">
		<div class="row">

			<aside class="col-lg-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">마이페이지</h3>
					</div>
					<!-- 사이드바 메뉴목록1 -->
					<ul class="list-group">
						<li class="list-group-item"><a href="/member/modify">회원정보수정</a></li>
						<li class="list-group-item"><a href="/member/remove">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 패널 타이틀2(미정) -->

				<!--  <div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">신고하기</h3>
										</div>
										사이드바 메뉴목록2 
										<ul class="list-group">
											<li class="list-group-item"><a href="#"></a></li>
											<li class="list-group-item"><a href="#"></a></li>
										</ul>
									</div>-->
			</aside>

			<!-- 메인컨텐츠 -->
			<div class="col-lg-10">
				<h2>회원탈퇴</h2>
					<form role="form" method="post" autocomplete="off" class="form-horizontal">
						<div class="form-group">
						<label class="control-label col-lg-2" for="userId">아이디</label>
						<input type="text" id="userId" name="userId" required="required" readonly="readonly" class="col-lg-6" value="${member.userId}">
						</div>
						<div class="form-group"> 
						<label class="control-label col-lg-2" for="userPass">비밀번호</label> 
						<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해주세요" required="required" class="col-lg-6">
						</div>
						<div class="col-lg-offset-2 col-lg-10">
						<button type="submit" name="signup_btn"
							class=" btn btn-danger">탈퇴하기</button>
						</div>
						<c:if test="${msg == false }">
							<p style="color: red; text-align: center;">입력한 비밀번호가 잘 못 되었습니다.</p>
						</c:if>
					</form>
				</div>
				</div>
			</div>
	

	<footer>
		<div id="footer" class=" navbar-fixed-bottom">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>