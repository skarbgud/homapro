<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>id find</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
body { font-family:'맑은 고딕', verdana; padding-bottom:70px; margin:0; }
   
	header#header { font-size:20px; padding:5px 0; }
   	header#header a { color:#000; font-weight:bold; font-size:14px;text-align: right }
   	header#header img {width: 40px; height: 44px; margin-left: 10px; margin-bottom: 3px;}
   	header#header .title{ border-bottom: 1px solid gray;}  
   	#footer { background:#f9f9f9; padding:8px; }
   	#footer ul li { display:inline-block; margin-right:10px; }
   	.form-signin{max-width: 330px;padding: 15px;margin: 0 auto;}
   	.btn-login {margin-top: 10px;}
   	
	.login-form {
		width: 340px;
		margin: 50px auto;
	}
    .login-form form {        
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
        height: 70%;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
	.input-group-addon .fa {
        font-size: 18px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
	    .btn-primary {
	    background-color: #2f528f;
	    border-color: #2f528f;
	    color: #FFF; }
	.btn-primary:hover,
	.btn-primary:focus {
	    border-color: #FFD966;
	    background-color:#FFD966;
	    color: #FFF; }
	.btn-primary:active,
	.btn-primary:visited,
	.btn-primary:active:focus,
	.btn-primary:active:hover {
	    border-color: #FFD966;
	    background-color: #FFD966;
	    color: #FFF; }
		
	div { text-align: center; }
		</style>
<meta charset="UTF-8">
<title>LOGIN</title>
<body>
	<header id="header">
		<div id="header_box">
			<%@include file="../include/header.jsp"%>
		</div>
	</header>

	<div class="login-form">
		<form role="form" method="POST" autocomplete="off" action="idprint">
			<div class="form-group">
				<img src="../../resources/images/HOMAA.png" width="140" height="40">

				<div class="input-group" style="padding: 20% 0px 0px 0px;">
					<span class="input-group-addon"><i class="fa fa-user"></i></span> <input
						type="text" class="form-control" id="userName" name="userName"
						placeholder="이름을 입력해 주세요" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-envelope"></i></span> <input type="email"
						class="form-control" id="userEmail" name="userEmail"
						placeholder="이메일을 입력해 주세요" required="required">
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block submit"
					id="signup_btn" name="signup_btn">다음</button>
			</div>
		</form>
	</div>



	<footer class="navbar navbar-default navbar-fixed-bottom">
		<div id="footer" class="container-fluid">
			<%@include file="../include/footer.jsp"%>
		</div>
	</footer>
		
		<!-- <div id="sessionlogin">
			<section id="container">
				<div id="container_box">
					<section id="content">
					
	
						
						<form role="form" method="POST" autocomplete="off"
							action="idprint">
							<div class="input_area">
								<label for="userName">이름</label> <input type="text"
									id="userName" name="userName" placeholder="이름을 입력해주세요"
									required="required" />
							</div>
							<div class="input_area">
								<label for="userEmail">이메일</label> <input type="email"
									id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요"
									required="required" />
							</div>
							<button type="submit" id="signup_btn" name="signup_btn"
								class="submit">아이디 찾기</button>
						</form>
					</section>
				</div>
			</section>
		</div> -->


</body>
</html>