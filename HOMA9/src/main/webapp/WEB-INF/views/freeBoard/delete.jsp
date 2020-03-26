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
	header#header { font-size:20px; padding:5px 0; }
   	header#header a { color:#000; font-weight:bold; font-size:14px;text-align: right }
   	header#header img {width: 40px; height: 44px; margin-left: 10px; margin-bottom: 3px;}
   	header#header .title{ border-bottom: 1px solid gray;}  
   	#footer { background:#f9f9f9; padding:8px; }
   	#footer ul li { display:inline-block; margin-right:10px; }
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
    
    <div class="container text-center">
    <form role="form" method="post" autocomplete="off">
    	<input type="hidden" id="fb_num" name="fb_num" value="${delete}"/>
    	
    	<p>선택한 게시물을 정말 삭제하시겠습니까?</p>
    	<p>한번 삭제한 자료는 복구할 수 없습니다.</p>
    	
    	<p>
    		<button type="submit" >예 ,삭제합니다.</button>
    		<button type="button"   id="cancel_btn" >아니오 ,삭제하지 않습니다.</button>
    		
    		<script>
    			//폼을 변수에 저장
    			var formObj = $("form[role='form']");
    			
    			//취소 버튼 클릭
    			$("#cancel_btn").click(function(){
    				self.location = "/freeBoard/read?fb_num=${delete}"
    						+"&page=${scri.page}"
							+"&perPageNum=${scri.perPageNum}"
							+"&searchType=${scri.searchType}"
							+"&keyword=${scri.keyword}";
				});
    		</script>
    	</p>
    </form>
    </div>
    
    
    
  
</body>
</html>