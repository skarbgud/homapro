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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
<title>Insert title here</title>
</head>
<body>
	
		<header id="header">
			<div id="header_box">
				<%@include file="../include/header.jsp" %>
			</div>
		</header>

		<nav>
			<%@include file="../include/nav.jsp"%>
		</nav>
		
		<div class="container">
			<section>
			<form role="form" method="post" autocomplete="off">
				<div>
				<div class="pull-left">
					<h2>공지사항</h2>
				</div>
				<div class="form-group pull-right" >
				
					<button type="button" id="list_btn" class="btn btn-primary">목록</button>
					<button type="button" id="modity_btn" class="btn btn-warning">수정</button>
					<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
	
						<script>
							// 폼을 변수에 저장
							var formObj = $("form[role='form']");
		
							// 목록 버튼 클릭
							$("#list_btn")
									.click(
											function() {
												self.location = "/admin/notice/listSearch?"
														+ "page=${scri.page}&perPageNum=${scri.perPageNum}"
														+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
											});

							// 수정 버튼 클릭
							$("#modity_btn").click(function() {
								formObj.attr("action", "/admin/notice/modify");
								formObj.attr("method", "get");
								formObj.submit();
							});
		
							// 삭제 버튼 클릭
							$("#delete_btn").click(function() {
								formObj.attr("action", "/admin/notice/delete");
								formObj.attr("method", "get");
								formObj.submit();
		
							});
						</script>
				</div>
				</div>
				
				<table class="table table_table-hover">
					<thead>
						<tr class="active">
							<td>NO</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>${read.no_num }</td>
							<td>${read.no_subject}</td>
							<td>${read.userId}</td>
							<td><fmt:formatDate value="${read.no_date}" pattern="yyyy-MM-dd"/></td>
							<td>${read.no_readCount}</td>
						</tr>
						
						<tr>
							<td colspan="5"><p>${read.no_content }</p></td>
						</tr>		
					</tbody>			
				</table>
				
					<input type="hidden" id="page" name="page" value="${scri.page}"
						readonly="readonly" /> <input type="hidden" id="perPageNum"
						name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
				<input type="hidden" id="searchType" name="searchType"
						value="${scri.searchType}" readonly="readonly" /> <input
						type="hidden" id="keyword" name="keyword" value="${scri.keyword}"
						readonly="readonly" />
				<input type="hidden" id="no_num" name="no_num" class="form-control"
				value="${read.no_num}" readonly="readonly" />
			
				</form>
				</section>
			</div>

		<footer id="footer"  class="container-fluid navbar-fixed-bottom">
			<div id="footer_box">
				<%@include file="../include/footer.jsp" %>
			</div>
		</footer>

	
</body>
</html>