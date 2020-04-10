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
   	body { font-family:'맑은 고딕', verdana; padding-bottom:70px; margin:0; }  
	header#header { font-size:20px; padding:5px 0; }
   	header#header a { color:#000; font-weight:bold; font-size:14px;text-align: right }
   	header#header img {width: 40px; height: 44px; margin-left: 10px; margin-bottom: 3px;}
   	header#header .title{ border-bottom: 1px solid gray;}  
   	#footer { background:#f9f9f9; padding:8px; }
   	#footer ul li { display:inline-block; margin-right:10px; }
</style>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	
  <header id="header">
      <div id="header_box">
         <%@include file="include/header.jsp" %>
      </div>
   </header>

   <div id = "main" class="container-fluid">
      <h1 style = "text-align:center;font-size:2em; padding-top: 100px">"HOMA회원이 되어 최상의</h1> 
      <h1 style = "text-align:center;font-size:2em; padding-top: 10px">하우스메이트를 매칭 받아 보세요."</h1>
      <div class="container">
      	<div>
	        <!-- 검색 -->
	        <div class="col-lg-offset-3 col-lg-6" style="margin-top:10px;">
				<div class="input-group">
					<select name="searchType" style="display: none;">
						<option value="a"
							<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>주소</option>
					</select> <input type="text" name="keyword" placeholder="00구,00동으로 검색해주세요."
						id="keywordInput" value="${scri.keyword}" class="form-control" /> <span
						class="input-group-btn">
						<button id="searchBtn" class="btn btn-default">검색</button>
					</span>
				</div>
			</div>
		</div>	      
      </div>  
   </div>
   <script>  
		$(function() {
			$('#searchBtn').click(  
					function() {
						self.location = "/room/list"      
								+ '${listPageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					});
		});
	</script> 
   <footer>
   		<div id="footer" class=" navbar-fixed-bottom">
   			<%@include file="include/footer.jsp" %>
   		</div>
   </footer>
   
</body>
</html>