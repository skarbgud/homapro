<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	
  function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
  
</script>


<style>
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
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
<script src="//cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<title>BoardRegist</title>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>
	
	<div class="container">
	<c:if test="${msg ==null}">
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="userId" value="${member.userId}" />
			<div>
				<h2>신고하기</h2>
			</div>

			<div>

				<div>
					<div>
						<label>제목</label> <input type="text" class="form-control"
							required="required" name="rp_subject">
					</div>
					<div>
						<label>신고대상 아이디 : </label> <input type="text" class="form-control"
							required="required" name="rp_reportId">
					</div>
					
					<div>
						<label>신고대상 URL : </label> <input class="form-control"
							required="required" name="rp_reportArticle" type="url">
					</div>
			
					<div>
						<label>내용</label>  <textarea class="form-control"
							required="required" name="rp_content"></textarea>		
					</div>
					
					<div>
						<label>비밀번호</label>  <input type="number" class="form-control "
							required="required" name="rp_passwd"  placeholder="게시글을 조회하기 위해서는 비밀번호가 필요합니다." maxlength="4" oninput="maxLengthCheck(this)">
					</div>
					
				</div>

			</div>
			<div>
				<button type="button" id="cancel_btn" class="btn btn-default">취소</button>
				<button class="btn btn-primary" type="submit">등록</button>
			</div>

			<script>
				//폼을 변수에 저장
				var formObj = $("form[role='form']");

				//취소버튼 클릭
				$("#cancel_btn").click(function() {
					self.location = "/report/list"
				});
			</script>
		</form>
	</c:if>

	<c:if test="${msg == false}">
		<div class="text-center">
			<p>
				로그인을 하셔야 글을 작성할 수 있습니다.
			<p>
			
			<p>
				<a href="/member/login"><button>로그인</button></a>
			</p>
		</div>
	</c:if>
	</div>

</body>
</html>