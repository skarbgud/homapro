<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body {
	font-family: '맑은 고딕', verdana;
	padding-bottom: 70px;
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
.r_img {
	width:575px; 
	height:500px;
	margin-left:130px;
}
#titletable{
   	text-align: left;
    margin-right: auto;
    margin-left: auto;
    width : 80%;
    margin-top: 70px;
}
#room-container {
     width: 80%;
     margin: 0px auto;
     padding: 20px;
}
#room-content {
     width: 580px;
     padding: 3px;
     margin-bottom: 20px;   
     float: right;
}
#imgli{
 	list-style-type:none;
}
.img-sidebar {
     width: 550px;
     padding: 20px;
     margin-bottom: 20px;
     float: left;
}
#content-footer {
     clear: both;
     padding: 20px;  
} 
.buttondisplay{
	width:500px;
	float:right;
	margin-top:20px;
}

</style>
</head>

<body>
	<header id="header">
		<div id="header_box">
		<%@ include file="../include/header.jsp"%>
	</div>
	</header>
		
	<table id = "titletable">
		<tr>
			<td style="width:7%;">
				<form role="form" method="POST" autocomplete="off">
			 글 번호 : <input type="hidden" id="r_num" name="r_num"
					value="${read.r_num}" readonly="readonly" style="border: none;">
				</form>
			</td>
			<td style="width: 30%;">${read.r_num}</td>
			<td style="width: 10%;">작성자 아이디 :</td>
			<td style="width: 9%;">${member.userId }</td>
			<td style="width: 7%;">작성 날짜 :</td>
			<td style="width: 15%;"><fmt:formatDate value="${read.r_date}" pattern="yyyy-MM-dd" /></td>
			<td style="width: 8%;">방의 주소 :</td>
			<td style="width: 7%;">${read.r_address2}</td>
			<%-- <td style="width: 8%;">조회수 :</td>
			<td style="width: 7%;">${read.count}</td> --%>
		<tr>
	</table>	
	
	<hr color="#4472c4" width = "80%" >
	
	<div id="room-container">
    	<div id="room-content">
    		<p><img src="../images/kakaoimage.png" alt="kakaoimage" width="25" height="30"> &nbsp;카카오톡 아이디 : ${read.r_kakao} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 작성자 성별 : ${read.r_gender}</p>
    		<hr color="grey">
    	<ul>
    		<li>${read.r_kind}</li>
    		<li>${read.r_species} ${read.r_price }(만원)</li>
    		<li>${read.r_address1}-${read.r_address2}</li>
    		<li>입주일 : ${read.r_enter}</li>
    		<li>거주가능기간 : ${read.r_live}</li>
    		<li>거주 가능 성별 :${read.r_available}</li>
    			
   			<li>면적 : ${read.r_area} <b style="text-align: center; font-size: 20px;">m<sup>2</sup></b></li>
    		<li>
    			<div id ="content-footer">
      				<h3>상세설명</h3>
    			${read.r_content}
    			</div><br><br><br><br><br><br><br><br>
    		</li>
    		 
    		<li>
    			<h3>추가옵션</h3>
       			<hr color="grey">
        		<br>
    			${read.r_option}
    		</li>
    	</ul>
    	<div class = "buttondisplay">
		<button id="list_btn">목록</button>
		<button id="modify_btn">수정</button>
		<button id="delete_btn">삭제</button>

		<script>
			//폼을 변수에 저장
			var formObj = $("form[role='form']");

			//목록 버튼을 클릭
			$("#list_btn")
					.click(
							function() {
								self.location = "/room/list?"
										+ "page=${scri.page}&perPageNum=${scri.perPageNum}"
										+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
							});

			//수정 버튼을 클릭
			$("#modify_btn").click(function() {
				formObj.attr("action", "/room/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			//삭제 버튼을 클릭
			$("#delete_btn").click(
					function() {
						formObj.attr("action", "/room/delete?r_num="
								+ $("#r_num").val());
						formObj.submit();
					});
				</script>
			</div>
    	</div>  
    </div>
    <div class ="img-sidebar">
				<img src="${read.r_img}" onerror="this.src='../images/none.png';" class="r_img" />
	</div>
	
			
	<form role="form" method="POST" autocomplete="off">
		<input type="hidden" id="page" name="page" value="${scri.page}"
			readonly="readonly" /> <input type="hidden" id="perPageNum"
			name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
		<input type="hidden" id="searchType" name="searchType"
			value="${scri.searchType}" readonly="readonly" /> <input
			type="hidden" id="keyword" name="keyword" value="${scri.keyword}"
			readonly="readonly" />
	</form>
</body>
</html>