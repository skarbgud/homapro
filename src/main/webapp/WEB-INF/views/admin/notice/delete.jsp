<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 제이쿼리 -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<style>
html, body {
   margin: 0;
   padding: 0;
}

#logo{
	height: 70px;
	width: 50px;
	margin-top: 10px;
	margin-left: 10px;
}

#intro{
	color:#C0C0C0;
	font-size: 0.6em;
}


.line{
	margin: 0px;
	padding: 0px;
	height: 1px;
}

#header-under{
	margin-top: 5px;
	margin-bottom: 5px;
}

#allroom{
	font-size: 1.0em;
	margin-left: 15px;
}

#content-right {
   float: right;
   margin-top: 50px;
   margin-right: 10px;
}

#nav-right {
   float: right;
   margin-right: 15px;
}

#seek{
	color: #2f528f;
}

table{ 
	border-collapse: collapse;
}
tr{
	border-bottom: 1px solid gray;
}
.table-content{
	height: 60px;
	text-align: center;
}
#click{
	text-align: center;
	margin-top: 20px;
}
.on{
	width: 100px;
	height: 40px;
	text-align: center;
	
}
.container{
	margin-top:220px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>BoardModify</title>
</head>
<body>
	<header>
		<%@ include file="../include/header.jsp" %>
	</header>
    
    <div class="container">
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
    				self.location = "/admin/notice/read?no_num=${delete}"
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