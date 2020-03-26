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

</head>
<body>

	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp" %>
		</div>
	</header>
	
	
	
	
	
	<div id="main">
	<section class="container">
	<div id="container_box">
		<div>
			<div class="pull-left">
					<h2>공지사항</h2>
			</div>
			<div class="pull-right" >
				<a href="/admin/notice/write"><button class="btn btn-primary">글쓰기</button></a>
			</div>
		</div>
 		<table class="table table_table-hover">
 			<thead>
 				<tr class="active">
 					<th>NO</th>
 					<th>제목</th>
 					<th>작성자</th>
 					<th>작성일</th>
 					<th>조회수</th>
 				</tr>
 			</thead>
 				
			<!-- 목록시작 -->
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.no_num}</td>
				<td class="c-table">
				<a href="/admin/notice/read?no_num=${list.no_num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">${list.no_subject}</a>
				</td>
				<td>${list.userId }</td>
				<td><fmt:formatDate value= "${list.no_date}" pattern="yyyy-MM-dd"/></td>
				<td>${list.no_readCount }</td>
			</c:forEach>
			<!-- 목록끝 -->
 		</table>
 		  
    
    
    
   
    <div class="search row">
		<div class="col-xs-2 col-sm-2">
			<select name="searchType" class="form-control"> 
				<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			</select>
		</div>	
	
	<div class="col-xs-10 col-sm-10">
		<div class="input-group">
			<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
			<span class="input-group-btn">
				<button id="searchBtn" class="btn btn-default">검색</button>
			</span>
		</div>
	</div>

	<script>
	$(function(){
		$('#searchBtn').click(function() {
			self.location = "listSearch" + '${pageMaker.makeQuery(1)}'
					+ "&searchType=" + $("select option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				});
	});			
	</script>
	</div>	
		 
		
	<div class="col-md-offset-3"> 
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>	

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
				<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>
					
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>	
		</ul> 
	</div>
	</div>

	</section>
	</div>
	
	<footer id="footer">
		<div id="footer_box">
		<%@include file="../include/footer.jsp" %>
		</div>
	</footer>

</body>
</html>
