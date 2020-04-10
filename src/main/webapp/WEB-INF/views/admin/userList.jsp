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
	header#header a { color:#000; font-weight:bold;  }
	header#header img {width: 70px; height: 80px; margin-left: 20px;}
	
	
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	 
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
		
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; }
</style>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@include file="include/nav.jsp" %>
		</div>
	</nav>
	
	<section class="container">
		
	 	
	 	<ul class="list-unstyled">
	 		<li>
	 			<div class="allCheck">
	 				<input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두선택</label>
	 				
	 				<script>
	 					$("#allCheck").click(function(){
	 						var chk = $("#allCheck").prop("checked");
	 						
	 						if(chk){
	 							$(".chBox").prop("checked",true);
	 						}
	 						else{
	 							$(".chBox").prop("checked",false);
	 						}
	 					});
	 				</script>
	 				
	 			</div>
	 			<div class="delBtn">
	 				<button type="button" class="selectDelete_btn">선택 삭제</button>
	 				
	 				<script>
	 					$(".selectDelete_btn").click(function(){
	 						var confirm_val = confirm("정말 삭제하시겠습니까?");
	 						
	 						if(confirm_val){
	 							var checkArr = new Array();
	 							
	 							$("input[class='chBox']:checked").each(function() {
									checkArr.push($(this).attr("data-userId"));
								});
	 							
	 							
	 							$.ajax({
	 								url : "/admin/userDelete",
	 								type : "POST",
	 								data : { chbox : checkArr },
	 								success : function(){
	 									location.href = "/admin/userList";
	 								}
	 							});
	 						}
	 					});
	 				</script>
	 			</div>
	 			
	 		</li>
	 		
	 		
	 		<c:forEach items="${userList}" var="userList">
		 		<li>
					<div class="checkBox">
						<input type="checkbox" name="chBox" class="chBox" data-userId="${userList.userId}" />
						
						<script>
							$(".chBox").click(function(){
								$("#allCheck").prop("checked",false);
							});
						</script>
					</div>		 		
					
					<div class="userInfo">						
						<table class="table table-hover">
							<thead>
								<tr>
									<td>아이디</td>
									<td>이름</td>
									<td>전화번호</td>
									<td colspan="3">주소</td>
									<td>가입일</td>
									<td>권한</td>
									<td>이메일</td>
									<td>성별</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${userList.userId }</td>
									<td>${userList.userName}</td>
									<td>${userList.userPhon}</td>
									<td colspan="3">
									${userList.userAddr1}
									${userList.userAddr2}
									${userList.userAddr3}</td>
									<td>
										<fmt:formatDate value="${userList.regDate}" pattern="yyyy-MM-dd"/>
									</td>
									<td>${userList.verify}</td>
									<td>${userList.userEmail}</td>
									<td>${userList.gender}</td>
								</tr>
							</tbody>
						</table>
						
						<div class="delete">
							<button type="button" class="delete${userList.userId}_btn" data-userId="${userList.userId}">삭제</button>
							 <script>
								 $(".delete${userList.userId}_btn").click(function(){
				 						var confirm_val = confirm("정말 삭제하시겠습니까?");
				 						
				 						if(confirm_val){
				 							var checkArr = new Array();
				 							
				 							$("input[class='chBox']:checked").each(function() {
												checkArr.push($(this).attr("data-userId"));
											});
				 							
				 							
				 							$.ajax({
				 								url : "/admin/userDelete",
				 								type : "POST",
				 								data : { chbox : checkArr },
				 								success : function(){
				 									location.href = "/admin/userList";
				 								}
				 							});
				 						}
				 					});  
							 </script>
						</div>
					</div>
					
			 	</li>	
	 		</c:forEach>
	 	</ul>
 	</section>
	
	<footer id="footer"  class="container-fluid navbar-fixed-bottom">
			<div id="footer_box">
				<%@include file="../include/footer.jsp" %>
			</div>
	</footer>
	
</body>
</html>