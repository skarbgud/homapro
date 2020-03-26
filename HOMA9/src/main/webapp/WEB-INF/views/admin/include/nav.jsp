<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/admin/index">관리자페이지</a>
		</div>
		<ul class="nav navbar-nav navbar-right ">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown">공지사항관리 <span
					class="caret"></span></a>
				<ul class="dropdown-menu ">
					<li><a href="/admin/notice/write">공지작성</a></li>
					<li><a href="/admin/notice/listSearch">공지목록</a></li>
				</ul></li>
			<li><a href="#">신고관리</a></li>
			<li><a href="#">블랙리스트관리</a></li>
			<li><a href="/admin/userList">회원관리</a></li>
		</ul>
		<div class="navbar-collapse collapse">

    
  </div>
	</div>
</nav>
