<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>자유게시판 글보기</title>
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

<style>
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userId { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .c_date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.c_content { padding:10px; margin:20px 0; }
 section.replyList div button { margin-left: 10px;}

</style>

<!--  모달 css -->
<style>
	div.replyModal { position:relative; z-index:1; display: none; }
	div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
	div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:200px; padding:20px 10px; background:#fff; border:2px solid #666; }
	div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:475px; height:100px; }
	div.modalContent button { padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	div.modalContent button.modal_cancel { margin-left:20px; }
</style>


<!-- 댓글 목록 -->
<script>
function replyList(){
	var fb_num = ${read.fb_num};
	$.getJSON("/freeBoard/read/replyList"+"?fb_num="+fb_num, function(data){
		var str = "";
		
		$(data).each(function(){
			
			console.log(data);
			
			//날짜 데이터를 보기 쉽게 변환
			var c_date= new Date(this.c_date);
			c_date = c_date.toLocaleDateString("ko-US")
			
			//HTML코드 조립
 		str += "<li data-c_num='" + this.c_num+ "'>"
 	     + "<div class='userInfo'>"
 	     + "<span class='userId'>" + this.userId + "</span>"
 	     + "<span class='c_date'>" + c_date + "</span>"
 	     + "</div>"
 	     + "<div class='c_content'>" + this.c_content+ "</div>"
 	     
 	     +"<c:if test='${member != null}'>"
 	     
 	     +"<div class='replyFooter'>"
 	     +"<button type='button' class='modify btn btn-warning' data-c_num='"+ this.c_num+"'>수정</button>"
 	     +"<button type='button' class='delete btn btn-danger' data-c_num='"+ this.c_num+"'>삭제</button>"
 	     +"</div>"
 	     
 	     +"</c:if>"
 	     
 	     + "</li>"; 
		});
		
		$("section.replyList ol").html(str);
	});
}
</script>  
<!-- 댓글 목록 -->

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
	        <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly"> 
	        <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly">
	        <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly"> 
	        <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly"> 
	        <input type="hidden" id="fb_num" name="fb_num" value="${read.fb_num}" />
	        <input type="hidden" id ="userName" name="${read.userName}">
	        <div class="form-group pull-right">
				
	            <button type="button" id="list_btn" class="btn btn-primary">목록</button>
	            <c:if test="${loginId == writeId}">
	            <button type="button" id="modity_btn" class="btn btn-warning">수정</button>
	            <button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
				</c:if>
				<c:if test="${member != null && loginId != writeId}">
				<a href="/report/regist?fb_num=${read.fb_num}&userId=${read.userId}&userName=${read.userName}"><button type="button"  class="btn btn-danger" id="report_btn">신고</button></a>
				</c:if>
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
	                <input type="hidden" name="fb_num" value="${read.fb_num}" readonly="readonly" />
	                <input type="hidden"name="page" value="${scri.page}" readonly="readonly" />
	                <input type="hidden" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
	                <input type="hidden"  name="searchType" value="${scri.searchType}" readonly="readonly" />
	                <input type="hidden" name="keyword" value="${scri.keyword}" readonly="readonly" />
	                <input type="hidden"  name="userId" value="${member.userId}" readonly="readonly" />
	                <div>
	                    <div class="col-md-11">
	                        <textarea class="form-control pull-left" rows="3" id="c_content" name="c_content"></textarea>
	                    </div>
	                    <div class="col-md-1">
	                        <c:if test="${member != null}">
	                            <button type="button" class="btn btn-danger pull-right" id="repSubmit">등록</button>
	                        </c:if>
	                        <c:if test="${member == null}">
	                            <button type="button" class="btn btn-danger pull-right" id="login">등록</button>
	                        </c:if>
	                        <script>
	                            $("#repSubmit").click(function() {
	                                //formObj.attr("action", "replyWrite");
	                                //formObj.submit();
	                                
	                                var formObj = $(".replyForm form[role='form']");
	                                var fb_num = $("#fb_num").val();
	                                var c_content = $("#c_content").val()
	                                
	                                var data = {
	                                	fb_num : fb_num,
	                                	c_content : c_content
	                                };
	                                
	                                $.ajax({
	                                	url : "/freeBoard/read/registReply",
	                                	type : "post",
	                                	data : data,
	                                	success : function(){
	                                		replyList();
	                                		$("#c_content").val("");
	                                	}
	                                
	                                });
	                                
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
	   		 	<ol class="list-unstyled">
	   		 		 
				</ol>	
	   		 	<script>
	   		 		replyList();
	   		 	</script>
	   		 	
	   		 	<script>
					$(document).on("click",".modify",function(){
						$(".replyModal").fadeIn(200);
						
						var c_num = $(this).attr("data-c_num");
						var c_content = $(this).parent().parent().children(".c_content").text();
						
						$(".modal_c_content").val(c_content);
						$(".modal_modify_btn").attr("data-c_num",c_num);
					});   		 			
	   		 	
	   		 		$(document).on("click",".delete",function(){
	   		 			var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	   		 			
	   		 			if(deleteConfirm){
		   		 			var data = { c_num : $(this).attr("data-c_num")};
		   		 			
		   		 			$.ajax({
		   		 				url : "/freeBoard/read/deleteReply",
		   		 				type : "post",
		   		 				data : data,
		   		 				success : function(result){
		   		 					
		   		 					//result의 값에 따라 동작
		   		 					if(result == 1){
		   		 						replyList();	//리스트 새로고침	
		   		 					}
		   		 					else{
		   		 						alert("작성자 본인만 할 수 있습니다.")
		   		 					}
		   		 				},
		   		 				error : function(){
		   		 					alert("로그인하셔야합니다.");
		   		 					document.location.href = "/member/login";
		   		 				}
		   		 			});
	   		 			}
	   		 		});
	   		 	
	   		 	</script>	 
	   		 </section>
	    </div>
	    
	</div>

	
	<footer>
		<div id="footer" class="navbar-fixed-bottom">
			<%@include file="../include/footer.jsp" %>
		</div>
	</footer>
	
	
	
	<div class="replyModal">
	
		<div class="modalContent">
		 
			<div>
				<textarea class="modal_c_content" name="modal_c_content"></textarea>
			</div>
			 
			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>
		 
		</div>
		
		<div class="modalBackground"></div>
	 
	</div>
	
	<script>
		$(".modal_modify_btn").click(function(){
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			
			if(modifyConfirm){
				var data = {
						c_num : $(this).attr("data-c_num"),
						c_content : $(".modal_c_content").val()
				};	//ReplyVO 형태로 데이터 생성
				
				$.ajax({
					url : "/freeBoard/read/modifyReply",
					type: "post",
					data : data,
					success : function(result){
						
						//result의 값에 따라 동작
						if(result == 1){
							replyList();	//리스트 새로고침
							$(".replyModal").fadeOut(200);
						}else{
							alert("작성자 본인만 할 수 있습니다.")		//본인이 아닌 경우
						}
					},
					error : function(){
						// 로그인 하지 않아서 에러가 발생한 경우
						alert("로그인하셔야 합니다.")
						document.location.href = "/member/login";
					}
				});
			}
			
		});
		
		$(".modal_cancel").click(function() {
			$(".replyModal").fadeOut(200);
		});
	</script>
	
</body>
</html>