<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>


<div class="container">
	<input type="hidden" value="${category}" class="category">
	<table class="table">
	
		<tr>
			<td>이름</td>
			<td>주소</td>
			<td>카테고리</td>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="5">
					게시물이 존재하지 않습니다.
				</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="h">
					<tr>
						<td>${h.name}</td>
						<td>${h.address}</td>
						<td>${h.category}<td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
		
		
		

	
	<%-- <ul class="pagination">
		<c:if test="${p.prev}">
			<li class="page-item">
				<a class="page-link" href="?page=${p.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach begin="${p.startPage}" end="${p.endPage}" var="pageNum">
			<li class="page-item ${cri.page == pageNum ? 'active' :''}">
				<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
			</li>
		</c:forEach>
		<c:if test="${p.next}">
		<li class="page-item">
			<a class="page-link" href="?page=${p.endPage+1}">Next</a>
		</li>
		</c:if>
	</ul> --%>
	
	
</div>

<%@ include file="../layout/footer.jsp" %>

