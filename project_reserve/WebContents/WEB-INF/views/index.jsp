<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="layout/header.jsp" %>

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
        <a class="dropdown-item" href="#">공지사항</a>
        <a class="dropdown-item" href="#">문의사항</a>
        <a class="dropdown-item" href="#">이벤트</a>
      </div>
    </li>
    
    <li class="nav-item">
	     <sec:authorize access="isAnonymous()"><!-- 권한이 없는 경우  -->
	      	<a class="nav-link" href="${contextPath}/member/login">로그인</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우  -->
			<p class="nav-link"><sec:authentication property="principal.username"/></p> <!-- 로그인 id-->
			<form action="${contextPath}/member/logout" method="post"> <!-- 기본값 : /logout -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<button class="btn btn-primary">로그아웃</button>
			</form> 
		</sec:authorize>
    </li>
    <!-- <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li> -->
  </ul>
</nav>

<div class="container">
	<h1>메인</h1>
	
  <div class="row">
    <div class="col">
      <a href="${contextPath}/">모텔</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">호텔·리조트</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">펜션</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">게스트하우스</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">캠핑·글램핑</a>
    </div>
  </div>
</div>

<%@ include file="layout/footer.jsp" %>