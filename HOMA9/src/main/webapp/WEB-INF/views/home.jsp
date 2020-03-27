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
   	
   	#container{
   	text-align: center;
   	
   }
   	.flex-form input[type="submit"] {
  background: #2f528f;
  border: 1px solid #2f528f;
  color: #fff;
  padding: 0 30px;
  cursor: pointer;
  -webkit-transition: all 0.2s;
  -moz-transition: all 0.2s;
  transition: all 0.2s;
  	
}

.flex-form input[type="submit"]:hover {
  background: #FFD966;
  border: 1px solid #FFD966;																																																													
}

.flex-form {
  display: -webkit-box;
  display: flex;
  z-index: 10;
  position: absolute;
  width: 500px;
  box-shadow: 4px 8px 16px rgba(0, 0, 0, 0.3);
 	left: 50%;
 	margin-left: -250px;	
 	
  	
}

.flex-form > * {
  border: 0;
  padding: 0 0 0 10px;
  background: #fff;
  line-height: 50px;
  font-size: 1rem;
  border-radius: 0;
  outline: 0;
  -webkit-appearance: none;
  
}

input[type="search"] {
  flex-basis: 500px;
}
   	
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
      <h1 style = "text-align:center;font-size:2em; padding-top: 10px">하우스메이트를 매칭 받아 보세요."</h1><br><br><br>
      <div class="container">
      	<div>
		   <form  class="flex-form" >
     		 <label for="from">
     		   <i class="ion-location"></i>
     		 </label>
     		 <input type="search" placeholder="00구,00동으로 검색해주세요.">
    		 <input type="submit" value="방찾기">
    </form>
		</div>	      
      </div>
   </div> 
   
   <footer>
   		<div id="footer" class=" navbar-fixed-bottom">
   			<%@include file="include/footer.jsp" %>
   		</div>
   </footer>
   
</body>
</html>