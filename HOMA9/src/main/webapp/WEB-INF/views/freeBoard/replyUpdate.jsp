<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<style>
.content-right {
	float: right;
	margin-top: 50px;
}

.nav-right {
	float: right;
}

html, body {
	margin: 0;
	padding: 0;
}

#main {
	width: 100%;
	height: 798px;
	background-color: #dae3f4;
	float: left;
}

.main-content {
	height: 40px;
	width: 400px;
	border: 1px solid #305498;
	background-color: white;
	margin: 0 auto;
}

#titleArea {
	width: 70%;
	margin: auto;
	top-padding: 20%;
}

#contentArea {
	width: 65%;
	margin: auto;
	font:
}

table {
	width: 100%;
	margin: auto;
}

.td_num {
	width: 70px;
}

.td_subject {
	width: 150px;
}

.td_writer, .td_readcount, .td_regDate {
	width: 120px;
}

#pageListArea {
	text-align: center;
}

#writeArea {
	width: 65%;
	margin: auto;
}

.myButton {
	background-color: #244782;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	padding: 2px 10px;
	text-decoration: none;
	text-align: right;
}

.myButton:hover {
	background-color: #476e9e;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.buttonArea {
	float: right;
	margin-right: 200px;
}

.title-right {
	float: right;
	margin-right: 20px;
	font-size: 15px;
	color: #8c8c8c;
}

#commentArea {
	width: 65%;
	margin: auto;
	color: #787878;
}

textarea {
	width: 700px;
	height: 50px;
	float: center;
}

input[type=button] {
	float: right;
	margin-right: 90px;
}

.myButton1 {
	background-color: #ffffff;
	display: inline-block;
	cursor: pointer;
	color: #8c8c8c;
	font-family: Arial;
	font-size: 12px;
	padding: 2px 5px;
	text-decoration: none;
	text-align: right;
}

.myButton1:hover {
	background-color: #96C7ED;
}

.myButton1:active {
	position: relative;
	top: 1px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@include file="../include/header.jsp"%>
	</header>

	<br>
	<br>
	<br>
	<br>
	<form role="form" method="post" autocomplete="off">
		<div class="buttonArea">
			<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly">
			
		
			<input type="hidden" id="fb_num"  name="fb_num" value="${read.fb_num}"/>
			<button type="button" class="myButton" id="list_btn" class="myButton">목록</button>
			<button type="button" class="myButton" id="modity_btn" class="myButton">수정</button>
			<button type="button"  class="myButton" id="delete_btn" class="myButton">삭제</button>
			<script>
				// 폼을 변수에 저장
				var formObj = $("form[role='form']");
				
				//목록 버튼 클릭
				$("#list_btn").click(function() {
					self.location = "/freeBoard/listSearch?"
							+"page=${scri.page}&perPageNum=${scri.perPageNum}"
							+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
				});
				
				// 수정 버튼 클릭
				$("#modity_btn").click(function() {
					formObj.attr("action", "/freeBoard/modify");
					formObj.attr("method", "get");
					formObj.submit();
				});

				// 삭제 버튼 클릭
				$("#delete_btn").click(function() {
					formObj.attr("action", "/freeBoard/delete");
					formObj.attr("method", "get");
					formObj.submit();
				});
			</script>
		</div>
	</form>
	
	<section id="titleArea">
		<h3>${read.fb_subject}</h3>
		<font color="#8c8c8c"><fmt:formatDate value="${read.fb_date}"
				pattern="yyyy-MM-dd" /> </font> <font class="title-right"> 작성자
			:${read.userId} &nbsp;&nbsp; 조회수 : ${read.fb_readCount } </font>

		<hr class="line"
			style="width: 100%; background-color: #305498; height: 2px;" />

	</section>
	<br>
	<br>
	<br>
	<section id="contentArea">${read.fb_content }</section>

	<br>
	<br>
	<br>
	<hr class="line1"
		style="width: 70%; background-color: #C0C0C0; height: 1px;" />
	<br>
	<section id="commentArea">
		<div>
			<section class="replyForm">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="fb_num" name="fb_num" value="${read.fb_num}" readonly="readonly" />
				<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
				
				
				<p>
					<label for="userId">작성자</label>
					<input type="text" id="userId" name="userId" readonly="readonly" value="${member.userId }"/>
				</p>
				<p>
					<label for="c_content">댓글내용</label>
					<textarea id="c_content" name="c_content"></textarea>
				</p>
				<p>
					<c:if test="${msg == null}">
					<button type="button" class="repSubmit">작성</button>
					</c:if>
					
					<c:if test="${msg == false }">
					<button type="button" class="login">작성</button>
					</c:if>
			
					<script>
						var formObj = $(".replyForm form[role='form']");
						$(".repSubmit").click(function(){
								formObj.attr("action","replyWrite");
								formObj.submit();
						});
						
						$(".login").click(function(){
							alert("로그인이필요합니다.");
							document.location.href="/member/login";
						});
						
					</script>
				</p>
				
				
				
			</form>
			</section>		
		
			<ol>
			<c:forEach items="${repList}" var="repList">
			<li>
			 	<section id="replyUD">
				<form role="form" method="post" autocomplete="off">
				<p>
					작성자 : ${repList.userId}<br />
					작성 날짜 : <fmt:formatDate value="${repList.c_date}" pattern="yyyy-MM-dd"/>
				</p>
				<div id = "repcontent">
				<p>${repList.c_content }</p>
				</div>
				<p>
					<c:if test="${member.userId == repList.userId}">
						<button type="button" id="replyUpdate" data-cnum = "${repList.c_num }">수정</button>
						<button type="button" id="replyDelete" data-cnum = "${repList.c_num }">삭제</button>
					</c:if>
					<script>
						$(".replyUpdate").click(function(){
							self.location = "freeBoard/replyUpdate?fb_num=${read.fb_num}"
									+"&page=${scri.page}"
									+"&perPageNum=${scri.perPageNum}"
									+"&searchType=${scri.searchType}"
									+"&keyword=${scri.keyword}"
									+"&c_num=" + $(this).attr("date-cnum");
						});
					</script>
				</p>
				
			</form>
			</section>
			</li>			
			</c:forEach>
			</ol>
		</div>
	</section>


	<br>




	<br>
	<br>
</body>
</html>