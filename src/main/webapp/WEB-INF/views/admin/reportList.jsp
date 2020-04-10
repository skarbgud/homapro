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
   ul { padding:0; margin:0; list-style:none;  }
   
   div#root { width:90%; margin:0 auto; }
   
   
   header#header { font-size:20px; padding:20px 0; }
   header#header a { color:#000; font-weight:bold;  }
   header#header img {width: 70px; height: 80px; margin-left: 20px;}
   
   
   section#container::after { content:""; display:block; clear:both; }
   aside { float:left; width:200px; }
   div#container_box { float:right; width:calc(100% - 200px - 20px); }
    
   aside ul li { text-align:center; margin-bottom:10px; }
   aside ul li a { display:block; width:100%; padding:10px 0;}
   aside ul li a:hover { background:#eee; }
      
   footer#footer { background:#f9f9f9; padding:20px; }
   footer#footer ul li { display:inline-block; margin-right:10px; }
</style>
</head>
<body>
   <header id="header">
      <div id="header_box">
         <%@include file="include/header.jsp" %>
      </div>
   </header>
   
   <nav id="nav">
      <div id="nav_box">
         <%@include file="include/nav.jsp" %>
      </div>
   </nav>
   
   <section class="container">
      
       
       <ul class="list-unstyled">
          <li>
             <div class="allCheck">
                <input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두선택</label>
                
                <script>
                   $("#allCheck").click(function(){
                      var chk = $("#allCheck").prop("checked");
                      
                      if(chk){
                         $(".chBox").prop("checked",true);
                      }
                      else{
                         $(".chBox").prop("checked",false);
                      }
                   });
                </script>   
                
             </div>
             <div class="delBtn">
                <button type="button" class="selectDelete_btn">선택 삭제</button>
                
                <script>
                   $(".selectDelete_btn").click(function(){
                      var confirm_val = confirm("정말 삭제하시겠습니까?");
                      
                      if(confirm_val){
                         var checkArr = new Array();
                         
                         $("input[class='chBox']:checked").each(function() {
                           checkArr.push($(this).attr("data-rp_num"));
                        });
                         
                         
                         $.ajax({
                            url : "/admin/reportDelete",
                            type : "POST",
                            data : { chbox : checkArr },
                            success : function(){
                               location.href = "/admin/reportList";
                            }
                         });
                      }
                   });
                </script>
             </div>
             
          </li>
          
          
          <c:forEach items="${report}" var="report">
             <li>
               <div class="checkBox">
                  <input type="checkbox" name="chBox" class="chBox" data-rp_num="${report.rp_num}" />
                  
                  <script>
                     $(".chBox").click(function(){
                        $("#allCheck").prop("checked",false);
                     });
                  </script>
               </div>             
               
               <div class="userInfo">                  
                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <td>신고글번호</td>
                           <td>신고대상</td>
                           <td>신고날짜</td>
                           <td>글 번호</td>
                           <td>신고자</td>
                           <td colspan = "2">신고내용</td>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>${report.rp_num}</td>
                           <td>
                              <input type = "hidden" id = "rp_userId" name = "userId" value = "${report.userId}"/>${report.userId}
                              <input type = "hidden"  id ="rp_userName" name = "userName" value ="${report.userName}"/>
                           </td>
                           <td>
                              <fmt:formatDate value="${report.rp_date}" pattern="yyyy-MM-dd"/>
                           </td>
                           <td>
                              <a href="/freeBoard/read?fb_num=${report.fb_num}">${report.fb_num}</a></td>
                           <td>${report.rp_reportId}</td>
                           <td colspan = "2">${report.rp_content}</td>
                           <td><a href="/admin/blackRegist?userId=${report.userId}&userName=${report.userName}"><button type="button">블랙리스트</button></a></td>
                        </tr>
                     </tbody>
                  </table>  
                  
                  <div class="delete">
                     <button type="button" class="delete${report.rp_num}_btn" data-rp_num="${report.rp_num}">삭제</button>
                      <script>
                         $(".delete${report.rp_num}_btn").click(function(){
                               var confirm_val = confirm("정말 삭제하시겠습니까?");
                               
                               if(confirm_val){
                                  var checkArr = new Array();
                                  
                                  $("input[class='chBox']:checked").each(function() {
                                    checkArr.push($(this).attr("data-rp_num"));
                                 });
                                  
                                  
                                  $.ajax({
                                     url : "/admin/reportDelete",
                                     type : "POST",
                                     data : { chbox : checkArr },
                                     success : function(){
                                        location.href = "/admin/reportList";
                                     }
                                  });
                               }
                            });  
                     
                      </script>
                  </div>   
               </div>
               
             </li>   
          </c:forEach>
       </ul>
    </section>
   
   <footer id="footer"  class="container-fluid navbar-fixed-bottom">
         <div id="footer_box">
            <%@include file="../include/footer.jsp" %>
         </div>
   </footer>
   
</body>
</html>