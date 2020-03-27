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
	padding-bottom:70px;
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
<title>Insert title here</title>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>

	<div class="container">
	    <form role="form" method="post" autocomplete="off">
	        <div class="pull-left">
	            <h2>자유게시판</h2>
	        </div>
	        <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly"> <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly">
	        <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly"> <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly"> <input type="hidden" id="fb_num" name="fb_num" value="${read.fb_num}" />
	        <div class="form-group pull-right">
	
	            <button type="button" id="list_btn" class="btn btn-primary">목록</button>
	            <button type="button" id="modity_btn" class="btn btn-warning">수정</button>
	            <button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
	            <button type="button" id="report_btn" class="btn btn-danger">신고</button>
	
	            <script>
	                // 폼을 변수에 저장
	                var formObj = $("form[role='form']");
	
	                //목록 버튼 클릭
	                $("#list_btn")
	                    .click(
	                        function() {
	                            self.location = "/freeBoard/listSearch?" +
	                                "page=${scri.page}&perPageNum=${scri.perPageNum}" +
	                                "&searchType=${scri.searchType}&keyword=${scri.keyword}";
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
	                // 신고 버튼 클릭
	                $("#report_btn").click(function() {
	                    formObj.attr("action", "/report/regist");
	                    formObj.attr("method", "get");
	                    formObj.submit();
	                });
	
	            </script>
	        </div>
	
	        <table class="table table-hover">
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
	                    <td>${read.fb_num }</td>
	                    <td>${read.fb_subject}</td>
	                    <td>${read.userId}</td>
	                    <td>
	                        <fmt:formatDate value="${read.fb_date}" pattern="yyyy-MM-dd" />
	                    </td>
	                    <td>${read.fb_readCount}</td>
	                </tr>
	                <tr>
	                    <td colspan="5">${read.fb_content }</td>
	                </tr>
	            </tbody>
	        </table>
	    </form>
	
	    <!-- 댓글 -->
		
		<div>
			<!-- 댓글작성 -->
	    	<section class="container replyForm">
	        <u>
	            <h3>Comments</h3>
	        </u>
	            <form role="form" method="post" autocomplete="off">
	                <input type="hidden" id="fb_num" name="fb_num" value="${read.fb_num}" readonly="readonly" />
	                <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
	                <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
	                <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
	                <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
	                <input type="hidden" id="userId" name="userId" value="${member.userId}" readonly="readonly" />
	                <div>
	                    <div class="col-md-11">
	                        <textarea class="form-control pull-left" rows="3" id="c_content" name="c_content"></textarea>
	                    </div>
	                    <div class="col-md-1">
	                        <c:if test="${msg ==null }">
	                            <button type="button" class="btn btn-danger pull-right" id="repSubmit">등록</button>
	                        </c:if>
	                        <c:if test="${msg == false}">
	                            <button type="button" class="btn btn-danger pull-right" id="login">등록</button>
	                        </c:if>
	                        <script>
	                            var formObj = $(".replyForm form[role='form']");
	                            $("#repSubmit").click(function() {
	                                formObj.attr("action", "replyWrite");
	                                formObj.submit();
	                            });
	
	                            $("#login").click(function() {
	                                alert("로그인이 필요합니다.");
	                                document.location.href = "/member/login";
	                            });
	
	                        </script>
	                    </div>
	
	
	
	                </div>
	            </form>
	   		 </section>
	   		 
	   		 <!-- 댓글작성 끝 -->
	   		 
	   		 <!-- 댓글목록 -->
	   		 <section class="replyList container">
	   		 	<ul class="list-unstyled">
	   		 		<c:forEach items="${repList}" var="repList">
		   		 		<li>
		   		 			<div id="comment_content" style="border: 1px solid black;">
			   		 			<p>
			   		 			<span class="glyphicon glyphicon-user"></span>
			   		 				${repList.userId}				
									(<fmt:formatDate value="${repList.c_date}" pattern="yyyy-MM-dd"/>)
								</p>
								
								<div class="form-group pull-right">
									<button type="button" id="btnUpdate">수정</button>
									<button type="button" id="btnDelete">삭제</button>
									
									<script>
										
									$("#btnUpdate").click(function(){
										var htmls = "";
										htmls += '<textarea class="form-control pull-left" rows="3" id="c_content" name="c_content></textarea>';
										htmls += '<button type="button" class="btn btn-danger pull-right" >수정</button>';
									}
									.replaceWith(htmls);
									
									);
									
									</script>
									
								</div>
								
								<p>
									내용 : ${repList.c_content }
								</p>
							</div>
						</li>
					</c:forEach>
	   		 	</ul>	   		 
	   		 </section>
	    </div>
	    
	</div>

	
	<footer>
		<div id="footer" class="navbar-fixed-bottom">
			<%@include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>