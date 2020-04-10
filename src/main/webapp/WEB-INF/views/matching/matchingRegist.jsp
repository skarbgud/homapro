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

.form-group {
	margin-bottom: 60px;
}
</style>

<style type="text/css">
.output {
	width: 100%;
	margin-left: 50%;
	padding-top: 0px;
}

.text-center {
	margin: 0px;
}

input[type=range] {
	-webkit-appearance: none;
	/* Hides the slider so that custom slider can be made */
	height: 5px;
	width: 100%;
	cursor: pointer;
	background: #07C;
}

input[type=range]::-webkit-slider-thumb {
	-webkit-appearance: none;
	border: 2px solid #07C;
	height: 20px;
	width: 20px;
	border-radius: 20px;
	background: #fff;
	cursor: pointer;
	margin-top: 0px;
	/* You need to specify a margin in Chrome, but in Firefox and IE it is automatic */
}

input[type=range]:focus {
	outline: none;
}
</style>

<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>

	<div class="container">
		<h2>매칭정보등록</h2>
		<br>
		<p class="lead">매칭정보는 작성자의 개인적인 성향과 정보를 등록합니다.</p>
		<p>매칭은 기본적으로 작성자와 비슷한성향과 정보를 위주로 매칭합니다. 매칭시 중요하게 생각되는 부분의 중요도에 숫자를
			높게 부여하세요!</p>
		<form role="form" class="form-horizontal" method="post"
			autocomplete="off" onsubmit="return CheckForm(this)">
			<input type="hidden" name="userId" value="${member.userId }">
			<input type="hidden" name="mat_region1" value="${member.userAddr1 }">
			<input type="hidden" name="mat_region2" value="${member.userAddr3 }">


			




			<div class="form-group" id="divPassword">
				<label for="userPass" class="col-lg-2 control-label">직업</label>
				<div class="col-lg-10">
					<div class="col-md-3">
						<select class="form-control" name="mat_job">
							<option>학생</option>
							<option>회사원</option>
							<option>자영업</option>
							<option>군인</option>
							<option>공무원</option>
							<option>무직</option>
							<option>기타</option>
						</select>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_jobDetail" id="mat_jobDetail" type="range"
							min="0" value="0" max="5" step="1" list="list2"
							oninput="Output2.value = mat_jobDetail.value" />
						<output id="Output2" class="output">0</output>
					</div>

					<datalist id="list2">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->
				</div>
			</div>

			<!-- 활동시간 -->
			<div class="form-group">
				<label for="userId" class="col-lg-2 control-label">취침시간</label>
				<div class="col-lg-8">
					<div class="col-md-3">
						<select class="form-control" name="mat_bedTime">
							<option>01시</option>
							<option>02시</option>
							<option>03시</option>
							<option>04시</option>
							<option>05시</option>
							<option>06시</option>
							<option>07시</option>
							<option>08시</option>
							<option>09시</option>
							<option>10시</option>
							<option>11시</option>
							<option>12시</option>
							<option>13시</option>
							<option>14시</option>
							<option>15시</option>
							<option>16시</option>
							<option>17시</option>
							<option>18시</option>
							<option>19시</option>
							<option>20시</option>
							<option>21시</option>
							<option>22시</option>
							<option>23시</option>
							<option>24시</option>
						</select>
					</div>

					
					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_bedTimeDetail" id="mat_bedTimeDetail" type="range"
							min="0" value="0" max="5" step="1" list="list1"
							oninput="Output1.value = mat_bedTimeDetail.value" />
						<output id="Output1" class="output">0</output>

					</div>
					<datalist id="list1">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

				</div>
				<!-- 중요도끝 -->
			</div>
	


			<div class="form-group">
				<label for="wakeUp" class="col-lg-2 control-label">기상시간</label>
				<div class="col-lg-10">
					<div class="col-md-3">
						<select class="form-control" name="mat_wakeUp">
							<option>01시</option>
							<option>02시</option>
							<option>03시</option>
							<option>04시</option>
							<option>05시</option>
							<option>06시</option>
							<option>07시</option>
							<option>08시</option>
							<option>09시</option>
							<option>10시</option>
							<option>11시</option>
							<option>12시</option>
							<option>13시</option>
							<option>14시</option>
							<option>15시</option>
							<option>16시</option>
							<option>17시</option>
							<option>18시</option>
							<option>19시</option>
							<option>20시</option>
							<option>21시</option>
							<option>22시</option>
							<option>23시</option>
							<option>24시</option>
						</select>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_wakeUpDetail" id="mat_wakeUpDetail" type="range"
							min="0" value="0" max="5" step="1" list="list3"
							oninput="Output3.value = mat_wakeUpDetail.value" />
						<output id="Output3" class="output">0</output>
					</div>

					<datalist id="list3">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->


				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-2 control-label">음식취향</label>
				<div class="col-lg-10">
					<div class="col-md-5">
						<label class="checkbox-inline"> 
							<input type="checkbox" name="mat_food" id="food1" value="한식" readonly="readonly" required="required" class="mat_food"/>한식
						</label> 
						<label class="checkbox-inline"> 
							<input type="checkbox" name="mat_food" id="food2" value="중식" class="mat_food"/>중식
						</label>
						<label class="checkbox-inline"> 
							<input type="checkbox" name="mat_food" id="food3" value="양식" class="mat_food"/>양식
						</label> 
						<label class="checkbox-inline"> 
							<input type="checkbox" name="mat_food" id="food4" value="일식" class="mat_food"/>일식
						</label>
					</div>
					<script type="text/javascript">
					function CheckForm(){
						if($(".mat_food:checked").length == 0){
							alert("음식 취향을 한개 이상 골라주세요!");
							return false;
						}
					}
					</script>
						
						
					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_foodDetail" id="mat_foodDetail" type="range"
							min="0" value="0" max="5" step="1" list="list4"
							oninput="Output4.value = mat_foodDetail.value" />
						<output id="Output4" class="output">0</output>
					</div>

					<datalist id="list4">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->

				</div>
			</div>


			<div class="form-group">
				<label class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<div class="col-md-2">
						<select class="form-control" name="mat_gender">
							<option>남자</option>
							<option>여자</option>
							<option>상관없음</option>
						</select>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_genderDetail" id="mat_genderDetail" type="range"
							min="0" value="0" max="5" step="1" list="list5"
							oninput="Output5.value = mat_genderDetail.value" />
						<output id="Output5" class="output">0</output>
					</div>

					<datalist id="list5">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->

				</div>
			</div>


			<div class="form-group">
				<label class="col-lg-2 control-label">청소</label>
				<div class="col-lg-10">
					<div class="col-md-4 inline">
						<select class="form-control" name="mat_clean">
							<option>주 1회</option>
							<option>주 2회</option>
							<option>주 3회</option>
							<option>주 4회</option>
							<option>주 5회</option>
							<option>주 6회</option>
							<option>주 7회</option>
						</select>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_cleanDetail" id="mat_cleanDetail" type="range"
							min="0" value="0" max="5" step="1" list="list6"
							oninput="Output6.value = mat_cleanDetail.value" />
						<output id="Output6" class="output">0</output>
					</div>

					<datalist id="list6">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->


				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-2 control-label">성격</label>
				<div class="col-lg-10">
					<div class="col-md-5">
						<select class="form-control" name="mat_person">
							<option>내성적</option>
							<option>감정적</option>
							<option>외향적</option>
							<option>안정적</option>
						</select>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_personDetail" id="mat_personDetail" type="range"
							min="0" value="0" max="5" step="1" list="list7"
							oninput="Output7.value = mat_personDetail.value" />
						<output id="Output7" class="output">0</output>
					</div>

					<datalist id="list7">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->

				</div>
			</div>


			<div class="form-group">
				<label class="col-lg-2 control-label">지역</label>
				<div class="col-lg-10">
					<div class="col-md-4">
						<label>현재 지역설정</label>

					</div>
					<div class="col-md-4 form-group">${member.userAddr1 }
						${member.userAddr3 }</div>


				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-2 control-label">지역</label>
				<div class="col-lg-10">
					<div class="col-md-4">
						<input type="text" id="sample5_address" name="mat_region" placeholder="주소" required="required">
						<input type="button" onclick="sample5_execDaumPostcode()"
							value="주소검색"><br>
						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

						<script
							src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cb38fdf6754a74592c8ec4b53a52c9&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center : new daum.maps.LatLng(37.537187,
										127.005476), // 지도의 중심좌표
								level : 5
							// 지도의 확대 레벨
							};

							//지도를 미리 생성
							var map = new daum.maps.Map(mapContainer, mapOption);
							//주소-좌표 변환 객체를 생성
							var geocoder = new daum.maps.services.Geocoder();
							//마커를 미리 생성
							var marker = new daum.maps.Marker({
								position : new daum.maps.LatLng(37.537187,
										127.005476),
								map : map
							});

							function sample5_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												var addr = data.address; // 최종 주소 변수

												// 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById("sample5_address").value = addr;
												// 주소로 상세 정보를 검색
												geocoder
														.addressSearch(
																data.address,
																function(
																		results,
																		status) {
																	// 정상적으로 검색이 완료됐으면
																	if (status === daum.maps.services.Status.OK) {

																		var result = results[0]; //첫번째 결과의 값을 활용

																		// 해당 주소에 대한 좌표를 받아서
																		var coords = new daum.maps.LatLng(
																				result.y,
																				result.x);
																		// 지도를 보여준다.
																		mapContainer.style.display = "block";
																		map
																				.relayout();
																		// 지도 중심을 변경한다.
																		map
																				.setCenter(coords);
																		// 마커를 결과값으로 받은 위치로 옮긴다.
																		marker
																				.setPosition(coords)
																	}
																});
											}
										}).open();
							}
						</script>
					</div>

					<!-- 중요도 -->
					<div class="col-md-4" id="important">
						<p class="text-center">
							<strong>중요도</strong>
						</p>
						<input name="mat_regionDetail" id="mat_regionDetail" type="range"
							min="0" value="0" max="5" step="1" list="list8"
							oninput="Output8.value = mat_regionDetail.value" />
						<output id="Output8" class="output">0</output>
					</div>

					<datalist id="list8">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</datalist>

					<!-- 중요도끝 -->


				</div>

			</div>

			<button type="submit"
				class="col-lg-offset-5 col-lg-1  btn btn-primary">등록</button>
		</form>

	</div>

	<footer>
		<div id="footer" class=" navbar-fixed-bottom">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>