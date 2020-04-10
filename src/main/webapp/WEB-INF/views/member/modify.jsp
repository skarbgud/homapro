<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>관리자</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
<title>joinMembership</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script>
function validate() {
   var userPass = document.getElementById("userPass");
   
   if(userPass.value != passwordCheck.value) {
          alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
          passwordCheck.value = "";
          passwordCheck.focus();
          return false;
      }
}
</script>

</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>
	
	<div class="container">	
		<div class="row">
			<!-- 사이드바 -->
				<aside class="col-lg-2">
					<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">마이페이지</h3>
				</div>
				<!-- 사이드바 메뉴목록1 -->
				<ul class="list-group">
					<li class="list-group-item"><a href="/member/modify">회원정보수정</a></li>
					<li class="list-group-item"><a href="/member/remove">회원탈퇴</a></li>
				</ul>
			</div>
									<!-- 패널 타이틀2(미정) -->
									
									<!--  <div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">신고하기</h3>
										</div>
										사이드바 메뉴목록2 
										<ul class="list-group">
											<li class="list-group-item"><a href="#"></a></li>
											<li class="list-group-item"><a href="#"></a></li>
										</ul>
									</div>-->	
			</aside>
			
			
			<!-- 수정창 -->
				<div class="col-lg-10">
				<!-- 모달창 -->
			            <div class="modal fade" id="defaultModal">
			                <div class="modal-dialog">
			                    <div class="modal-content">
			                        <div class="modal-header">
			                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			                            <h4 class="modal-title">알림</h4>
			                        </div>
			                        <div class="modal-body">
			                            <p class="modal-contents"></p>
			                        </div>
			                        <div class="modal-footer">
			                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			                        </div>
			                    </div><!-- /.modal-content -->
			                </div><!-- /.modal-dialog -->
			            </div><!-- /.modal -->
			            <!--// 모달창 -->
			            <hr/>
			            <!-- 본문 들어가는 부분 -->
			            
			            
			            
					<h2>회원정보수정</h2>
					<form role="form" class="form-horizontal" method="post" autocomplete="off" onsubmit="return validate();">
						<div class="form-group" id="divId">
							<label for="userId" class="col-lg-2 control-label">아이디</label>
							<div class="col-lg-8">
								<input type="text" id="userId" name="userId" data-rule-required="true" required="required" readonly="readonly" value="${member.userId }">
							</div>
						</div>
						
						<div class="form-group" id="divPassword">
			            	<label for="userPass" class="col-lg-2 control-label">패스워드</label>
			                	<div class="col-lg-10">
			                    	<input type="password" class="form-control" id="userPass" name="userPass" data-rule-required="true" placeholder="패스워드" maxlength="30" required="required">
			                </div>
			            </div>
						
						<div class="form-group" id="divPasswordCheck">
			                    <label for="userPassCheck" class="col-lg-2 control-label">패스워드 확인</label>
			                    <div class="col-lg-10">
			                        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30" required="required" >
			                    </div>
						</div>
						
						
						<div class="form-group" id="divPassQuestion">
			                    <label for="passQuestion" class="col-lg-2 control-label">비밀번호 질문</label>
			                    <div class="col-lg-10">
			                        <select class="content">
												<option>가장좋아하는 색깔은?</option>
												<option>자신의 인생 좌우명은?</option>
												<option>자신의 보물 1호는?</option>
												<option>가장 기억에 남는 장소는?</option>
												<option>인상 깊게 읽은 책은?</option>
												<option>자신이 두번째로 존경하는 인물은?</option>
												<option>초등학교때 기억에 남는 짝궁 이름은?</option>
												<option>내가 좋아하는 캐릭터는?</option>
												<option>다시 태어나면 되고 싶은 것은?</option>
									</select>
			                    </div>
						</div>
						
						<div class="form-group" id="divPasswordHint">
			                    <label for="passwordHint" class="col-lg-2 control-label">비밀번호 답변</label>
			                    <div class="col-lg-10">
			                        <input type="text" class="form-control" id="passwordHint"  name="passwordHint" data-rule-required="true" placeholder="패스워드 힌트" maxlength="30" required="required" >
			                    </div>
						</div>
						
						
						
						
						
						
						
						
						<div class="form-group" id="divName">
			                    <label for="userName" class="col-lg-2 control-label">이름</label>
			                    <div class="col-lg-10">
			                        <input type="text" class="form-control onlyHangul" id="userName" name="userName" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15" required="required">
			                    </div>
						</div>
						
						<div class="form-group" id="divEmail">
			                    <label for="userEmail" class="col-lg-2 control-label">이메일</label>
			                    <div class="col-lg-10">
			                        <input type="email" class="form-control" id="userEmail" name="userEmail" data-rule-required="true" placeholder="이메일" maxlength="40" required="required">
			                    </div>
			            </div>
			            
			            <div class="form-group" id="divKakao">
			                    <label for="kakao" class="col-lg-2 control-label">카카오톡 아이디</label>
			                    <div class="col-lg-10">
			                        <input type="kakao" class="form-control" id="kakao" name="kakao" data-rule-required="true" placeholder="카카오톡 아이디" maxlength="20" required="required">
			                    </div>
			            </div>
			            
			            <div class="form-group" id="divPhoneNumber">
			                    <label for="userPhon" class="col-lg-2 control-label">휴대폰 번호</label>
			                    <div class="col-lg-10">
			                        <input type="tel" class="form-control onlyNumber" id="userPhon" name="userPhon" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" required="required">
			                    </div>
			            </div>
			            
			            <div class="form-group">
			                    <label for="inputGender" class="col-lg-2 control-label">성별</label>
			                    <div class="col-lg-10">
			                        <select class="form-control" id="gender" name="gender">
			                            <option value="M">남</option>
			                            <option value="F">여</option>
			                        </select>
			                    </div>
			            </div>
						
						<div class="form-group">
			                    <label for="inputAddr" class="col-lg-2 control-label">주소</label>
			                    <div class="col-lg-10">
			                        <input type="text" id="sample2_postcode" placeholder="우편번호" readonly="readonly">
											<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" readonly="readonly" required="required"><br>
											<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" readonly="readonly" required="required"><br>
											<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소" required="required"><br>
											<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목" readonly="readonly" required="required">
										</div>
			
										<div id="layer"
											style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnCloseLayer"
												style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
												onclick="closeDaumPostcode()" alt="닫기 버튼">
										</div>
										
									
										
										
			
										<script
											src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
											// 우편번호 찾기 화면을 넣을 element
											var element_layer = document
													.getElementById('layer');
			
											function closeDaumPostcode() {
												// iframe을 넣은 element를 안보이게 한다.
												element_layer.style.display = 'none';
											}
			
											function sample2_execDaumPostcode() {
												new daum.Postcode(
														{
															oncomplete : function(data) {
																// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
																// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																var addr = ''; // 주소 변수
																var extraAddr = ''; // 참고항목 변수
			
																//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																	addr = data.roadAddress;
																} else { // 사용자가 지번 주소를 선택했을 경우(J)
																	addr = data.jibunAddress;
																}
			
																// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																if (data.userSelectedType === 'R') {
																	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																	if (data.bname !== ''
																			&& /[동|로|가]$/g
																					.test(data.bname)) {
																		extraAddr += data.bname;
																	}
																	// 건물명이 있고, 공동주택일 경우 추가한다.
																	if (data.buildingName !== ''
																			&& data.apartment === 'Y') {
																		extraAddr += (extraAddr !== '' ? ', '
																				+ data.buildingName
																				: data.buildingName);
																	}
																	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																	if (extraAddr !== '') {
																		extraAddr = ' ('
																				+ extraAddr
																				+ ')';
																	}
																	// 조합된 참고항목을 해당 필드에 넣는다.
																	document
																			.getElementById("sample2_extraAddress").value = extraAddr;
			
																} else {
																	document
																			.getElementById("sample2_extraAddress").value = '';
																}
			
																// 우편번호와 주소 정보를 해당 필드에 넣는다.
																document
																		.getElementById('sample2_postcode').value = data.zonecode;
																document
																		.getElementById("sample2_address").value = addr;
																// 커서를 상세주소 필드로 이동한다.
																document
																		.getElementById(
																				"sample2_detailAddress")
																		.focus();
			
																// iframe을 넣은 element를 안보이게 한다.
																// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
																element_layer.style.display = 'none';
															},
															width : '100%',
															height : '100%',
															maxSuggestItems : 5
														}).embed(element_layer);
			
												// iframe을 넣은 element를 보이게 한다.
												element_layer.style.display = 'block';
			
												// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
												initLayerPosition();
											}
			
											// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
											// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
											// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
											function initLayerPosition() {
												var width = 600; //우편번호서비스가 들어갈 element의 width
												var height = 600; //우편번호서비스가 들어갈 element의 height
												var borderWidth = 5; //샘플에서 사용하는 border의 두께
			
												// 위에서 선언한 값들을 실제 element에 넣는다.
												element_layer.style.width = width + 'px';
												element_layer.style.height = height + 'px';
												element_layer.style.border = borderWidth
														+ 'px solid';
												// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
												element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
														+ 'px';
												element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
														+ 'px';
											}
										</script>
			                    </div>
			                    
			                    <div class="form-group">
				                    <div class="col-lg-offset-2 col-lg-10">
				                        <button type="submit" id="signup_btn" name="signup_btn"  class="submit btn btn-primary">회원정보수정</button>
				                    </div>
			                	</div>
			                    
			                   
						</form>
					</div>
			</div>
			</div>
				 <footer>
			   		<div id="footer" class=" navbar-fixed-bottom">
			   			<%@include file="../include/footer.jsp" %>
			   		</div>
			  	 </footer>
			  	 
			  	 
			  	 
			  	 
			  	
				<script>
					$(function(){
						//모달을 전역변수로 선언
						var modalContents = $(".modal-contents");
						var modal = $("#defaultModal");
						
						$('.onlyAlphabetAndNumber').keyup(function(event){
							if(!(event.keyCode >= 37 && event.keyCode<=40)){
								var inputVal = $(this).val();
								 $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
							}
						});
						
						$(".onlyHangul").keyup(function(event){
							if(!(event.keyCode >=37 && event.keyCode <=40)){	
								var inputVal = $(this).val();
								 $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
							}
						});
						
						$(".onlyNumber").keyup(function(event){
			                if (!(event.keyCode >=37 && event.keyCode<=40)) {
			                    var inputVal = $(this).val();
			                    $(this).val(inputVal.replace(/[^0-9]/gi,''));
			                }
			            });
						
						$('#userId').keyup(function(event){
			                
			                var divId = $('#divId');
			                
			                if($('#userId').val()==""){
			                    divId.removeClass("has-success");
			                    divId.addClass("has-error");
			                }else{
			                    divId.removeClass("has-error");
			                    divId.addClass("has-success");
			                }
			            });
			            
			            $('#userPass').keyup(function(event){
			                
			                var divPassword = $('#divPassword');
			                
			                if($('#userPass').val()==""){
			                    divPassword.removeClass("has-success");
			                    divPassword.addClass("has-error");
			                }else{
			                    divPassword.removeClass("has-error");
			                    divPassword.addClass("has-success");
			                }
			            });
			            
			            $('#passwordCheck').keyup(function(event){
			                
			                var passwordCheck = $('#passwordCheck').val();
			                var password = $('#userPass').val();
			                var divPasswordCheck = $('#divPasswordCheck');
			                
			                if((passwordCheck=="") || (password!=passwordCheck)){
			                    divPasswordCheck.removeClass("has-success");
			                    divPasswordCheck.addClass("has-error");
			                }else{
			                    divPasswordCheck.removeClass("has-error");
			                    divPasswordCheck.addClass("has-success");
			                }
			            });
			            
			            $('#userName').keyup(function(event){
			                
			                var divName = $('#divName');
			                
			                if($.trim($('#userName').val())==""){
			                    divName.removeClass("has-success");
			                    divName.addClass("has-error");
			                }else{
			                    divName.removeClass("has-error");
			                    divName.addClass("has-success");
			                }
			            });
			            $('#userEmail').keyup(function(event){
			                
			                var divEmail = $('#divEmail');
			                
			                if($.trim($('#userEmail').val())==""){
			                    divEmail.removeClass("has-success");
			                    divEmail.addClass("has-error");
			                }else{
			                    divEmail.removeClass("has-error");
			                    divEmail.addClass("has-success");
			                }
			            });
			            
			            $('#userPhon').keyup(function(event){
			                
			                var divPhoneNumber = $('#divPhoneNumber');
			                
			                if($.trim($('#userPhon').val())==""){
			                    divPhoneNumber.removeClass("has-success");
			                    divPhoneNumber.addClass("has-error");
			                }else{
			                    divPhoneNumber.removeClass("has-error");
			                    divPhoneNumber.addClass("has-success");
			                }
			            });
			            
			            $('.submit').click(function( event ) {
			                var divPassword = $('#divPassword');
			                var divPasswordCheck = $('#divPasswordCheck');
			                var divName = $('#divName');
			                var divEmail = $('#divEmail');
			                var divPhoneNumber = $('#divPhoneNumber');
			            
			                
			                //패스워드 검사
			                if($('#userPass').val()==""){
			                    modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
			                    modal.modal('show');
			                    
			                    divPassword.removeClass("has-success");
			                    divPassword.addClass("has-error");
			                    $('#userPass').focus();
			                    return false;
			                }else{
			                    divPassword.removeClass("has-error");
			                    divPassword.addClass("has-success");
			                }
			                
			                //패스워드 확인
			                if($('#passwordCheck').val()==""){
			                    modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
			                    modal.modal('show');
			                    
			                    divPasswordCheck.removeClass("has-success");
			                    divPasswordCheck.addClass("has-error");
			                    $('#passwordCheck').focus();
			                    return false;
			                }else{
			                    divPasswordCheck.removeClass("has-error");
			                    divPasswordCheck.addClass("has-success");
			                }
			                
			                //패스워드 비교
			                if($('#userPass').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
			                    modalContents.text("패스워드가 일치하지 않습니다.");
			                    modal.modal('show');
			                    
			                    alert("패스워드가 일치하지 않습니다.");
			                    $(".submit").attr("disabled", "disabled");
			                    
			                    divPasswordCheck.removeClass("has-success");
			                    divPasswordCheck.addClass("has-error");
			                    $('#passwordCheck').focus();
			                    return false;
			                }else{
			                    divPasswordCheck.removeClass("has-error");
			                    divPasswordCheck.addClass("has-success");
			                }
			                
			                //이름
			                if($('#userName').val()==""){
			                    modalContents.text("이름을 입력하여 주시기 바랍니다.");
			                    modal.modal('show');
			                    
			                    divName.removeClass("has-success");
			                    divName.addClass("has-error");
			                    $('#userName').focus();
			                    return false;
			                }else{
			                    divName.removeClass("has-error");
			                    divName.addClass("has-success");
			                }
			                
			                
			                //이메일
			                if($('#userEmail').val()==""){
			                    modalContents.text("이메일을 입력하여 주시기 바랍니다.");
			                    modal.modal('show');
			                    
			                    divEmail.removeClass("has-success");
			                    divEmail.addClass("has-error");
			                    $('#userEmail').focus();
			                    return false;
			                }else{
			                    divEmail.removeClass("has-error");
			                    divEmail.addClass("has-success");
			                }
			                
			                //휴대폰 번호
			                if($('#userPhon').val()==""){
			                    modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
			                    modal.modal('show');
			                    
			                    divPhoneNumber.removeClass("has-success");
			                    divPhoneNumber.addClass("has-error");
			                    $('#userPhon').focus();
			                    return false;
			                }else{
			                    divPhoneNumber.removeClass("has-error");
			                    divPhoneNumber.addClass("has-success");
			                }
			            });
					});
				</script>
		
	
</body>
</html>