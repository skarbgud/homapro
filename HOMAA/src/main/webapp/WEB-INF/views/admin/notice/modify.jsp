<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 제이쿼리 -->
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
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script src="//cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
	
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:20px; padding:20px 0; }
	header#header a { color:#000; font-weight:bold; }
	header#header img {width: 70px; height: 80px; margin-left: 20px;}

	
	#main{ padding:20px 0; border-bottom:2px solid #eee; }
	#main::after { content:""; display:block; clear:both; }
		
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; }
</style>
<meta charset="UTF-8">
<title>BoardModify</title>
</head>
<body>
	<header id="header">
			<div id="header_box">
				<%@include file="../include/header.jsp" %>
			</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@include file="../include/nav.jsp" %>
		</div>
	</nav>
	
    <form role="form" method="post">
    	 
   		<input type="hidden" id="userId" name="userId" value="${member.userId }">
    <div class="container">
    	<section>
    		<div>
    			<h2>글수정</h2>
    		</div>

 			<div>
 				<div>
 					<label>제목</label>
 					<input type="text" class="form-control" required="required" name="no_subject" value="${modify.no_subject }">
 				</div>
 				
 				<div>
 					<label>내용</label>
 					<textarea rows="5" cols="50" id="no_content" name="no_content">${modify.no_content }</textarea>
 					<script>
					 CKEDITOR.replace("no_content");
					</script>
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
 				$("#cancel_btn").click(function(){
 					self.location = "/admin/notice/listSearch"
 				});
 			</script>
 			
 			</section>
 			</div>  
 		</form>
 		
 	<footer id="footer">
		<div id="footer_box">
		<%@include file="../include/footer.jsp" %>
		</div>
	</footer>	
</body>
</html>