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
         <%@include file="../include/header.jsp" %>
      </div>
   </header>
	
	<div class="container">
		
		<div class="form-group">
			<h2>나의 매칭 정보</h2>
				<div class="pull-right">
				<button class="btn btn-warning">수정</button>
				</div>
		</div>
		
		<form role="form" class="form-horizontal" method="post" autocomplete="off" onsubmit="return CheckForm(this)">
			<input type="hidden" name="userId" value="${member.userId }">

			<!-- 활동시간 -->
			<div class="form-group">
				<label for="userId" class="col-lg-2 control-label">활동시간</label>
				<div class="col-lg-8">
					<div class="col-md-2">
						<h5>${matchingVO.mat_workStart}~${matchingVO.mat_workEnd}</h5>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
							<h5><strong>중요도 : ${matchingVO.mat_workDetail }</strong></h5>
					</div>
				<!-- 중요도끝 -->
				</div>
			</div>
			



			<div class="form-group" id="divPassword">
				<label for="userPass" class="col-lg-2 control-label">직업</label>
				<div class="col-lg-10">
					<div class="col-md-2">
						<h5>${matchingVO.mat_job}</h5>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5><strong>중요도 : ${matchingVO.mat_jobDetail }</strong></h5>
					</div>	
					<!-- 중요도끝 -->
				</div>
			</div>

			<div class="form-group">
				<label for="wakeUp" class="col-lg-2 control-label">기상시간</label>
				<div class="col-lg-10">
					<div class="col-md-2">
						<h5>${matchingVO.mat_wakeUp}</h5>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5>
							<strong>중요도 : ${matchingVO.mat_wakeUpDetail}</strong>
						</h5>
					</div>

					<!-- 중요도끝 -->


				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-2 control-label">음식취향</label>
				<div class="col-lg-10">
					<div class="col-md-5">
						<h5>${matchingVO.mat_food}</h5>
					</div>
					
						
						
					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5>
							<strong>중요도 : ${matchingVO.mat_foodDetail}</strong>
						</h5>
					</div>
					<!-- 중요도끝 -->

				</div>
			</div>


			<div class="form-group">
				<label class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<div class="col-md-2">
						<h5>${matchingVO.mat_gender}</h5>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5>
							<strong>중요도 : ${matchingVO.mat_genderDetail}</strong>
						</h5>
					</div>
					<!-- 중요도끝 -->

				</div>
			</div>


			<div class="form-group">
				<label class="col-lg-2 control-label">청소</label>
				<div class="col-lg-10">
					<div class="col-md-2">
						<h5>${matchingVO.mat_clean}</h5>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5>
							<strong>중요도 : ${matchingVO.mat_cleanDetail}</strong>
						</h5>
					</div>
					<!-- 중요도끝 -->


				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-2 control-label">성격</label>
				<div class="col-lg-10">
					<div class="col-md-2">
						<h5>${matchingVO.mat_person}</h5>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5>
							<strong>중요도 : ${matchingVO.mat_personDetail}</strong>
						</h5>
					</div>
					<!-- 중요도끝 -->
				</div>
			</div>


			<div class="form-group">
				<label class="col-lg-2 control-label">지역</label>
				<div class="col-lg-10">
					<div class="col-md-4">
						<h5>${matchingVO.mat_region}</h5>
					</div>
					
					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<h5>
							<strong>중요도 : ${matchingVO.mat_regionDetail}</strong>
						</h5>
					</div>
					<!-- 중요도끝 -->
				</div>
			</div>

			
			

			<button type="submit"
				class="col-lg-offset-5 col-lg-1  btn btn-primary">매칭하기</button>
		</form>

	</div>

   
   
   <footer>
   		<div id="footer" class=" navbar-fixed-bottom">
   			<%@include file="../include/footer.jsp" %>
   		</div>
   </footer>
   
</body>
</html>