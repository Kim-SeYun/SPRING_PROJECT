<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	<h1>상세</h1>
	
	<c:if test="${not empty attachList}">
		<c:forEach items="${attachList}" var="attach">
			<c:if test="${attach.fileType eq 'IMAGE'}">
				<div>
					<img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width:1000px;">
				</div>
			</c:if>
		</c:forEach>
	</c:if>	
	
	<c:if test="${empty attachList}">
		<b>등록된 첨부파일이 없습니다.</b>
	</c:if>
	
	<div>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="token">
			<button class="btn btn-warning modEvent">수정</button>
			<button class="btn btn-danger delEvent">삭제</button>
			<a href="${contextPath}/event/list" type="submit" class="btn btn-info">목록</a>
		</sec:authorize>
	</div>
	
</div>

<%@ include file="../layout/footer.jsp" %>
