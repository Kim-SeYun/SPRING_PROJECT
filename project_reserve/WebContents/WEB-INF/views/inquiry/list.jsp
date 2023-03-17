<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	
	<nav class="notice">
		<ul>
			<h2>더 보기</h2><br>
			<li><a href="${contextPath}/board/list"><h5>공지사항</h5></a></li>
			<li><a href="${contextPath}/inquiry/list"><h5>문의사항</h5></a></li>
			<li><a href="${contextPath}/event/list"><h5>이벤트</h5></a></li>
		</ul>
	</nav>
	
	<style>
		table.table {
		  margin-left: 200px; 
		  margin-top: -150px; 
		  vertical-align: top;
		  width: 800px;
		}
	</style>
	
	<table class="table">
		<tr>
			<th>번호</th>
			<th>문의유형</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
		</tr>
		<c:forEach items="${list}" var="i">
			<tr>
				<td>${i.bno}</td>
				<td>${i.type}</td>
				<td><a href="${contextPath}/inquiry/detail?bno=${i.bno}">${i.title}</a></td>
				<td>${i.writer}</td>
				<td>${i.writeDate}</td>
				
			</tr>
		</c:forEach>
	</table>
	
	<sec:authorize access="isAuthenticated()">
		<a href="${contextPath}/inquiry/write" class="btn btn-info">문의하기</a>
	</sec:authorize>
	
	
</div>

<%@ include file="../layout/footer.jsp" %>
