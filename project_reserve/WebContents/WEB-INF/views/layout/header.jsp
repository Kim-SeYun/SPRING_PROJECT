<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="${contextPath}/resources/js/main.js"></script>

</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark justify-content-between" style="background-color: #4682B4">

  <a class="navbar-brand" href="${contextPath}">Logo</a>
  

  <ul class="navbar-nav">
  
  <form class="form-inline" action="/action_page.php">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Search</button>
  </form>

    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        더 보기
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="${contextPath}/board/list">공지사항</a>
        <a class="dropdown-item" href="#">문의사항</a>
        <a class="dropdown-item" href="${contextPath}/board/event">이벤트</a>
      </div>
    </li>
   
    <li class="nav-item">
      <a class="nav-link" href="#">예약내역</a>
    </li>
    
    <li class="nav-item">
	     <sec:authorize access="isAnonymous()"><!-- 권한이 없는 경우  -->
	      	<a class="nav-link" href="${contextPath}/member/login">로그인</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
		    <div class="dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" data-toggle="dropdown">
		            <sec:authentication property="principal.username"/>
		        </a>
		        <div class="dropdown-menu dropdown-menu-right">
		            <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
		                <a class="dropdown-item" href="${contextPath}/member/admin">관리자페이지</a>
		            </sec:authorize>
		            <sec:authorize access="hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')">
		                <a class="dropdown-item" href="${contextPath}/member/mypage">나의정보보기</a>
		            </sec:authorize>
		            <div class="dropdown-divider"></div>
		            <form action="${contextPath}/member/logout" method="post">
		                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                <button class="dropdown-item" type="submit">로그아웃</button>
		            </form>
		        </div>
		    </div>
		</sec:authorize>
    </li>
  </ul>
</nav>
