<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$("#login").click(function() {
        alert("로그인이 필요합니다.");
        
});		 
</script>
<div class="title container-fluid">
   		<a href="/" ><img class="pull-left" src="../../resources/images/homa.png" id="logo"/></a>

      	<ul class="nav navbar-nav pull-right " >
      		 <c:if test="${msg==null }">        	 
        	 	<li><a id="login">룸메이트(비회원)</a></li>
        	 </c:if>
        	 <c:if test="${msg!=null }">        	 
        	 	<li><a href="/member/matchingRead">룸메이트(회원)</a></li>
        	 </c:if>
        	 
        	 <li><a href="/matching/matchingRead">룸메이트</a></li>
         	 <li><a href="#">방찾기</a></li>
	         <li><a href="#">방내놓기</a></li>
	         <li><a href="#">관심목록</a></li>
	         <li><a href="/freeBoard/listSearch">게시판</a></li>
	         <c:if test="${member == null }">
		         <li><a href="/member/login">login</a></li>
		         <li><a href="/member/join">join</a></li>
	         </c:if>
	         <c:if test="${member != null }">
	         	<li><a href="/member/myPage">마이페이지</a></li>
	         	<li><a href="/member/logout">logout</a></li>
	         </c:if>
	         <c:if test="${member.verify ==9 }">
	         	<li><a href="/admin/index">관리자 페이지</a></li>
	         </c:if>
      	</ul>
</div>