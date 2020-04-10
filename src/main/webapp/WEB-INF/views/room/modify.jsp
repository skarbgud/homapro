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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<style>
   	body { font-family:'맑은 고딕', verdana; padding-bottom:70px; margin:0; }  
	header#header { font-size:20px; padding:5px 0; }
   	header#header a { color:#000; font-weight:bold; font-size:14px;text-align: right }
   	header#header img {width: 40px; height: 44px; margin-left: 10px; margin-bottom: 3px;}
   	header#header .title{ border-bottom: 1px solid gray;}  
   	#footer { background:#f9f9f9; padding:8px; }
   	#footer ul li { display:inline-block; margin-right:10px; }
   	
	label{position:relative;}
	.border{border: 1px solid #ddd;}
	.col-md-12{margin-top: 30px;}
	.noresize{resize: none;}
	input[type=radio]{display: none;}
</style>

</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>

	<form role = "form" method="POST" autocomplete="off" enctype="multipart/form-data" onsubmit="return checkForm(this)">
	<div id = "main" class="container-fluid">
   		<div class="row">
   			<div class="col-lg-offset-2 col-lg-8">
			      <h2 class="text-center"><b>방수정</b></h2>
  				<!-- 하우스 종류 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>하우스종류</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>종류선택</h4>
			      		</div>
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 2px;" data-toggle="buttons">
		      				<label class="btn btn-primary">
		      					<input type="radio" class="kindCheck" name="r_kind" value="원룸"/>원룸
		      				</label> 
		      				<label class="btn btn-primary">		
		      					<input type="radio" class="kindCheck" name="r_kind" value="투룸"/>투룸
			      			</label>
			      			<label class="btn btn-primary">		
			      				<input type="radio" class="kindCheck" name="r_kind" value="쓰리룸"/>쓰리룸
			      			</label>
			      			<label class="btn btn-primary">	
			      				<input type="radio" class="kindCheck" name="r_kind" value="아파트"/>아파트
		      				</label>	
		      				<label class="btn btn-primary">	
		      					<input type="radio" class="kindCheck" name="r_kind" value="오피스텔"/>오피스텔
		      				</label>
		      			</div>
			      	</div>
			      </div>
			      <!-- 하우스 종류 끝 -->

					<!-- 주소 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>주소</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>주소</h4>
			      		</div>
			      			
		      			<div class="col-md-9 border text-center" style="padding-top: 4px;padding-bottom: 5px;">
		      				<input type="text" readonly="readonly" required="required" name="r_address1" id="r_address1" style="width: 300px;">
							<input type="text" required="required"  name="r_address2" id="r_address2"placeholder="상세주소">
							<button type="button" class="btn btn-default btn-sm" onclick="sample5_execDaumPostcode()">주소검색</button>
		      			</div>
			      	</div>
			      </div>
			      <div id="map" style="width: 100%;height: 400px; margin-top: 20px; display: none; margin-bottom: 20px;"></div>
			      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cb38fdf6754a74592c8ec4b53a52c9&libraries=services&libraries=services"></script>
				  <script>
				  		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						mapOption = {
							center : new daum.maps.LatLng(37.537187,
									127.005476), // 지도의 중심좌표
							level : 3
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
													.getElementById("r_address1").value = addr;
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
			      <!-- 주소끝 -->
			      
			      <!-- 하우스 종류 가격 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>가격</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>거래가격</h4>
			      		</div>
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 3px;" data-toggle="buttons">
		      				<input type="text" id="r_price" class="number" name="r_price" 
		      				required="required" placeholder="만원" maxlength="10" style="width: 300px;">
		     				<label class="btn btn-default">
			      				<input type="radio" class = "speciesCheck" name="r_species" value="전세"/>전세
		      				</label>
		      				<label class="btn btn-default">
		      					<input type="radio" class = "speciesCheck" name="r_species" value="월세"/>월세
		      				</label>
		      			</div>
			      	</div>
			      </div>
			      
			      
			      <!-- 하우스 종류 가격 끝 -->
			      
			      <!-- 입주가능일 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>입주가능일</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>입주가능일</h4>
			      		</div>
			      			
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 3px;">
		      				<input name="r_enter" id="from" class="form-control" placeholder="연도-월-일" >
		      			</div>
			      	</div>
			      </div>
			      <!-- 입주가능일 끝-->
			      
			      <!-- 거주가능일 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>거주가능일</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>거주가능일</h4>
			      		</div>
			      			
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 3px;" >
		      				<input name="r_live" id="to" class="form-control" placeholder="연도-월-일" >
		      			</div>
			      	</div>
			      </div>
			      
			      <script>
				      var rangeDate = 31; // set limit day
				      var setSdate, setEdate;
				      $("#from").datepicker({
				          dateFormat: 'yy-mm-dd',
				          minDate: 0,
				          onSelect: function(selectDate){
				              var stxt = selectDate.split("-");
				                  stxt[1] = stxt[1] - 1;
				              var sdate = new Date(stxt[0], stxt[1], stxt[2]);
				              var edate = new Date(stxt[0], stxt[1], stxt[2]);
				                  edate.setDate(sdate.getDate() + rangeDate);
				              
				              $('#to').datepicker('option', {
				                  minDate: selectDate,
				                  beforeShow : function () {
				                      $("#to").datepicker( "option", "maxDate", edate );                
				                      setSdate = selectDate;
				                      console.log(setSdate)
				              }});
				              //to 설정
				          }
				          //from 선택되었을 때
				      });
				                  
				      $("#to").datepicker({ 
				          dateFormat: 'yy-mm-dd',
				          onSelect : function(selectDate){
				              setEdate = selectDate;
				              console.log(setEdate)
				          }
				      });
			      </script>
			      <!-- 거주가능일 끝-->
			      
			      
			      <!-- 자기성별 -->
			      <input type="hidden" value="${member.gender}" name="r_gender">
			      
			      <!-- 룸메이트 성별 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>룸메이트 성별</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>룸메이트 성별</h4>
			      		</div>
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 3px;"  data-toggle="buttons">
		      				<label class="btn btn-default">		      		
				      			<input type="radio" class = "availableCheck" name="r_available" value="남자" />남자
			      			</label>
			      			
			      			<label class="btn btn-default">
			      				<input type="radio" class = "availableCheck" name="r_available" value="여자"/>여자
			      			</label>	
			      			
			      			<label class="btn btn-default">
				      			<input type="radio" class = "availableCheck" name="r_available" value="상관없음"/>상관없음
			      			</label>	
		      			</div>
			      	</div>
			      </div>
			      <!-- 룸메이트 성별 끝 -->
			      
			   <!-- 이미지업로드 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>방사진</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>방사진</h4>
			      		</div>
			      			
		      			<div class="col-md-9 border text-center" style="padding-top: 7px;padding-bottom: 7px;">
		      				<input type="file" id="r_img" name="file"/>
		      			</div>
			      	</div>
			      </div>
			      
			      <div class="select_img"> 
			      	<img src="${modify.r_img}"/>
			      	<input type="hidden" name="r_img" value="${modify.r_img}" /> 
			      </div>
			      
			      <script>
			      	$("#r_img").change(function() {
						if(this.files && this.files[0]){
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src",data.target.result).width(410).height(320);
							}
							reader.readAsDataURL(this.files[0]);
						}
					}); 
			      </script>
			      <!-- 이미지업로드 끝-->
			      
			      <!-- 방 상세설명 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>방 상세설명</h4></div>

		      			<div class="col-md-3 border text-center" style="padding-top: 60px;padding-bottom: 60px;">
		      				<h4>상세설명</h4>
			      		</div>
			      			
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 3px;" >
		      				<textarea name="r_content" class="form-control noresize" rows="7" style="width: 365px;disl" required="required"></textarea>
		      			</div>
			      	</div>
			      </div>			      	
			      <!-- 방 상세설명 -->
			      
			      <!-- 카톡아이디 -->
    			  <input type="hidden" name="r_kakao" value="${modify.r_kakao}">
    			  
    			  <!-- 전용면적 -->
    			  <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-3 border text-center" >
		      				<h4>전용면적</h4>
			      		</div>
			      		
		      			<div class="col-xs-9 border text-center"style="padding-top: 6px;padding-bottom: 7px;"  >
		      				<input type="text" maxlength="10" name="r_area" class="number" required="required">m²
		      			</div>
			      	</div>
			      </div>
    			  <!-- 전용면적 끝 -->
			      
			      <!-- 추가옵션 -->
			      <div class="col-md-12 form-group">
			      	<div class="row">
			      		<div class="col-xs-12 border text-center"><h4>추가옵션</h4></div>

		      			<div class="col-md-3 border text-center">
		      				<h4>추가옵션</h4>
			      		</div>
			      			
		      			<div class="col-md-9 border text-center" style="padding-top: 2px;padding-bottom: 2px;" data-toggle="buttons">
		      			<label class="btn btn-default">		      		
			      			<input type="checkbox" name="r_option"  value="주차장"/>주차장
			      			</label>
			      			
			      			<label class="btn btn-default">
			      			<input type="checkbox" name="r_option" value="엘레베이터"/>엘레베이터
			      			</label>	
			      			
			      			<label class="btn btn-default">
			      			<input type="checkbox" name="r_option" value="반려동물"/>반려동물
			      			</label>
			      			
			      			<label class="btn btn-default">
			      			<input type="checkbox" name="r_option" value="베란다/발코니">베란다/발코니
			      			</label>
		      			</div>
			      	</div>
			      </div>
			      <!-- 추가옵션 끝 -->
			         <script type="text/javascript">
					function checkForm(){
						if($(".kindCheck:checked").length == 0){
							alert("주거 종류를 골라주세요!");
							return false;
						}
						if($(".speciesCheck:checked").length==0){
							alert("지불 방법을 선택하세요!");
							return false;
						}
						if($(".availableCheck:checked").length==0){
							alert("희망하는 성별을 선택하세요!");
							return false;
						}
					}
					</script>
			      <!-- 유저아이디 -->
			      <input type="hidden" name="userId" value="${member.userId}">
			      
			      
			      <div class="col-sm-offset-4 col-sm-4 text-center">
			      <button type="submit" class="btn btn-primary btn-lg" style="margin-top: 30px;"
			      >방수정</button>
			      </div>
	      </div>
	    </div>
   	</div> 
			      </form>

   
   <footer>
   		<div id="footer" class=" navbar-fixed-bottom">
   			<%@include file="../include/footer.jsp" %>
   		</div>
   </footer>
   <script>
	$(".number").keyup(function(event){
	         if (!(event.keyCode >=37 && event.keyCode<=40)) {
	             var inputVal = $(this).val();
	             $(this).val(inputVal.replace(/[^0-9]/gi,''));
	         }
	   });
	</script>
</body>
</html>