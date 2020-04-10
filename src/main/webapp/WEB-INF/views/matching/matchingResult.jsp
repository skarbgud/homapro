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

.col-sm-4 {
	border-left: 1px solid #e7e7e7;
	border-right: 1px solid #e7e7e7;
	height: 70%;
	margin-top: 10%;
	text-align: center;
	line-height: 250%
}

.glyphicon {
	font-size: 50px;
	margin-top: 10px;
}

.row.heading h2 {
	color: #fff;
	font-size: 52.52px;
	line-height: 95px;
	font-weight: 400;
	text-align: center;
	margin: 0 0 40px;
	padding-bottom: 20px;
	text-transform: uppercase;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.heading.heading-icon {
	display: block;
}

.padding-lg {
	display: block;
	padding-top: 60px;
	padding-bottom: 60px;
}

.practice-area.padding-lg {
	padding-bottom: 55px;
	padding-top: 55px;
}

.practice-area .inner {
	border: 1px solid #999999;
	text-align: center;
	margin-bottom: 28px;
	padding: 40px 25px;
}

.our-webcoderskull .cnt-block:hover {
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	border: 0;
}

.practice-area .inner h3 {
	color: #3c3c3c;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Poppins', sans-serif;
	padding: 10px 0;
}

.practice-area .inner p {
	font-size: 14px;
	line-height: 22px;
	font-weight: 400;
}

.practice-area .inner img {
	display: inline-block;
}

.our-webcoderskull .cnt-block {
	float: left;
	width: 100%;
	background: #fff;
	padding: 30px 20px;
	text-align: center;
	border: 2px solid #d5d5d5;
	margin: 0 0 28px;
}

.our-webcoderskull .cnt-block figure {
	width: 148px;
	height: 148px;
	border-radius: 100%;
	display: inline-block;
	margin-bottom: 15px;
}

.our-webcoderskull .cnt-block img {
	width: 148px;
	height: 148px;
	border-radius: 100%;
}

.our-webcoderskull .cnt-block h3 {
	color: #2a2a2a;
	font-size: 20px;
	font-weight: 500;
	padding: 6px 0;
	text-transform: uppercase;
}

.our-webcoderskull .cnt-block h3 a {
	text-decoration: none;
	color: #2a2a2a;
}

.our-webcoderskull .cnt-block h3 a:hover {
	color: #337ab7;
}

.our-webcoderskull .cnt-block p {
	color: #2a2a2a;
	font-size: 17px;
	line-height: 150%;
	font-weight: 400;
}

.our-webcoderskull .cnt-block .follow-us {
	margin: 20px 0 0;
}

.our-webcoderskull .cnt-block .follow-us li {
	display: inline-block;
	width: auto;
	margin: 0 5px;
}

.our-webcoderskull .cnt-block .follow-us li .fa {
	font-size: 24px;
	color: #767676;
}

.our-webcoderskull .cnt-block .follow-us li .fa:hover {
	color: #025a8e;
}
</style>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>


	<section class="our-webcoderskull padding-lg">
		<div class="container">
			<div class="row heading heading-icon">
				<h2></h2>
			</div>
			<ul class="row">
				<li class="col-12 col-md-6 col-lg-4">
					<div class="cnt-block equal-hight" style="height: 500px;">
						<figure>
							<img src="../../resources/images/user.png" class="img-responsive"
								alt="">
						</figure>
						<h2>${bestMember1.userId}</h2>
						<br>
						<p>
							성별 : ${bestMember1.mat_gender }<br> 희망 지역 :
							${bestMember1.mat_region }<br> 직업 : ${bestMember1.mat_job }<br>
							취침시간 : ${bestMember1.mat_bedTime }<br> 기상시간 :
							${bestMember1.mat_wakeUp }<br> 성격 : ${bestMember1.mat_person }<br>
							청소 : ${bestMember1.mat_clean }<br> 음식취향:
							${bestMember1.mat_food }<br>
							카카오톡 :${member1Kakao}
							
						</p>
					</div>
				</li>
				<li class="col-12 col-md-6 col-lg-4">
					<div class="cnt-block equal-hight" style="height: 500px;">
						<figure>
							<img src="../../resources/images/user.png" class="img-responsive"
								alt="">
						</figure>
						<h2>${bestMember2.userId}</h2>
						<br>
						<p>
							성별 : ${bestMember2.mat_gender }<br> 희망 지역 :
							${bestMember2.mat_region }<br> 직업 : ${bestMember2.mat_job }<br>
							취침시간 : ${bestMember2.mat_bedTime }<br> 기상시간 :
							${bestMember2.mat_wakeUp }<br> 성격 : ${bestMember2.mat_person }<br>
							청소 : ${bestMember2.mat_clean }<br> 음식취향:
							${bestMember2.mat_food }<br>
							카카오톡: ${member2Kakao}
						</p>
					</div>
				</li>
				<li class="col-12 col-md-6 col-lg-4">
					<div class="cnt-block equal-hight" style="height: 500px;">
						<figure>
							<img src="../../resources/images/user.png" class="img-responsive"
								alt="">
						</figure>
						<h2>${bestMember3.userId}</h2>
						<br>
						<p>
							성별 : ${bestMember3.mat_gender }<br> 희망 지역 :
							${bestMember3.mat_region }<br> 직업 : ${bestMember3.mat_job }<br>
							취침시간 : ${bestMember3.mat_bedTime }<br> 기상시간 :
							${bestMember3.mat_wakeUp }<br> 성격 : ${bestMember3.mat_person }<br>
							청소 : ${bestMember3.mat_clean }<br> 음식취향:
							${bestMember3.mat_food }<br>
							카카오톡: ${member3Kakao}
						</p>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<footer>
		<div id="footer" class=" navbar-fixed-bottom">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>