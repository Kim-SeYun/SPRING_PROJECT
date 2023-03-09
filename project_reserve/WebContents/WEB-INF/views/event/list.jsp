<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	<h1>이벤트</h1>
	
	<table class="table">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>첨부파일개수</td>
		</tr>
		<c:forEach items="${list}" var="b">
		<tr>
			<td>${b.bno}</td>
			<td>
				<a href="${contextPath}/event/detail?bno=${b.bno}">${b.title}</a>
			</td>
			<td>${b.content}</td>
			<td>${b.attachFileCnt}</td>
		</tr>		
		</c:forEach>
	</table>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
        <a href="${contextPath}/event/write" class="btn btn-info">글쓰기</a>
    </sec:authorize>
	
	
</div>

<%@ include file="../layout/footer.jsp" %>