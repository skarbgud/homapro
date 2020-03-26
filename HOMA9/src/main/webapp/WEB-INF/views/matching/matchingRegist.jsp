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
		<h2>매칭정보등록</h2>
		<form role="form" class="form-horizontal" method="post" autocomplete="off">
		
		<!-- 활동시간 -->
			<div class="form-group">
				<label for="userId" class="col-lg-2 control-label">활동시간</label>
				<div class="col-lg-8">
					<div class="col-md-3">	
		        		<select class="form-control">
						  <option>01</option>
						  <option>02</option>
						  <option>03</option>
						  <option>04</option>
						  <option>05</option>
						  <option>06</option>
						  <option>07</option>
						  <option>08</option>
						  <option>09</option>
						  <option>10</option>
						  <option>11</option>
						  <option>12</option>
						  <option>13</option>
						  <option>14</option>
						  <option>15</option>
						  <option>16</option>
						  <option>17</option>
						  <option>18</option>
						  <option>19</option>
						  <option>20</option>
						  <option>21</option>
						  <option>22</option>
						  <option>23</option>
						  <option>24</option>
						</select>
					</div>
				
					<div class="col-md-2 text-center">
						<h5>
						시~
						</h5>
					</div>
				
					<div class="col-md-3">
						<select class="form-control">
						  <option>01</option>
						  <option>02</option>
						  <option>03</option>
						  <option>04</option>
						  <option>05</option>
						  <option>06</option>
						  <option>07</option>
						  <option>08</option>
						  <option>09</option>
						  <option>10</option>
						  <option>11</option>
						  <option>12</option>
						  <option>13</option>
						  <option>14</option>
						  <option>15</option>
						  <option>16</option>
						  <option>17</option>
						  <option>18</option>
						  <option>19</option>
						  <option>20</option>
						  <option>21</option>
						  <option>22</option>
						  <option>23</option>
						  <option>24</option>
						</select>
						
					</div>
					
					<label>시</label>
					
				</div>
				
				</div>				
			
			
			<div class="form-group" id="divPassword">
            		<label for="userPass" class="col-lg-2 control-label">직업</label>
                	<div class="col-lg-10">
		        		<div class="col-md-3">
			        		<select class="form-control">
								  <option>학생</option>
								  <option>회사원</option>
								  <option>자영업</option>
								  <option>군인</option>
								  <option>공무원</option>
								  <option>무직</option>
								  <option>기타</option>
							 </select>
						</div>
					</div>
			</div>
			
			<div class="form-group">
				<label for="wakeUp" class="col-lg-2 control-label">기상시간</label>
				<div class="col-lg-10">
					<div class="col-md-3">
						<select class="form-control"> 
							  <option>01</option>
							  <option>02</option>
							  <option>03</option>
							  <option>04</option>
							  <option>05</option>
							  <option>06</option>
							  <option>07</option>
							  <option>08</option>
							  <option>09</option>
							  <option>10</option>
							  <option>11</option>
							  <option>12</option>
							  <option>13</option>
							  <option>14</option>
							  <option>15</option>
							  <option>16</option>
							  <option>17</option>
							  <option>18</option>
							  <option>19</option>
							  <option>20</option>
							  <option>21</option>
							  <option>22</option>
							  <option>23</option>
							  <option>24</option>
						</select>
					</div>
					<label>시</label>
				</div>
			</div>
			
        	<div class="form-group">
				<label class="col-lg-2 control-label">음식취향</label>
				<div class="col-lg-10">
					<div class="col-md-5">
					<label class="checkbox-inline">
						 <input type= "checkbox"  name = "mat_food"  id="food1" value="option1"/>한식
					</label>
					<label class="checkbox-inline">
						 <input type= "checkbox"  name = "mat_food"  id="food2" value="option2" />중식
					</label>
					<label class="checkbox-inline">
                  		 <input type= "checkbox"  name = "mat_food"  id="food3" value="option3" />양식
                  	</label>
                  	<label class="checkbox-inline">
                   		 <input type= "checkbox"  name = "mat_food"  id="food4" value="option4" />일식
                   	</label>
					</div>
				</div>    
            </div>
           
            
            <div class="form-group">
				<label class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<div class="col-md-3">
						<label class="radio-inline">
						<input type= "radio"  name = "mat_gender"  id="gender1" value = "M"/>남자
						</label>
						<label class="radio-inline">
             			<input type= "radio"  name = "mat_gender"  id="gender2" value = "F"  />여자
             			</label>
					</div>
				</div>    
            </div>
            
            
            <div class="form-group">
					<label class="col-lg-2 control-label">청소(주 청소횟수)</label>
					<div class="col-lg-10">
						<div class="col-md-4 inline">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
							</select>
						</div>
					</div>
			</div>
			
            <div class="form-group">
				<label class="col-lg-2 control-label">성격</label>
				<div class="col-lg-10">
					<div class="col-md-5">
						<label class="radio-inline">
							<input type= "radio"  name = "mat_person"  id="person1"  value="inner"/>내성적
						</label>
						
						<label class="radio-inline">
                   			<input type= "radio"  name = "mat_person"  id="person2"  value="mind" />감정적
                   		</label>
                   		
                   		<label class="radio-inline">
                     		<input type= "radio"  name = "mat_person"  id="person3"  value="outter" />외성적
                     	</label>
                     	
                     	<label class="radio-inline">
	                     	<input type= "radio"  name = "mat_person"  id="person4"   value="feace"/>안정적
                     	</label>
					</div>
				</div>    
            </div>
        	
        	
                
			</form>
		</div>
  		 
   <footer>
   		<div id="footer" class=" navbar-fixed-bottom">
   			<%@include file="../include/footer.jsp" %>
   		</div>
   </footer>
   
</body>
</html>