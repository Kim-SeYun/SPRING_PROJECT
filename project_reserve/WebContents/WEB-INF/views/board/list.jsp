<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>
<div class="container">
	
	<nav class="notice">
		<ul>
			<li><a href="${contextPath}/board/list">공지사항</a></li>
			<li>문의사항</li>
			<li>이벤트</li>
		</ul>
	</nav>
	
	<table class="table">
		<tr>
			<th>공지사항</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="b">
					<tr>
						<td>
							<a href="#" class="title-link">
								${b.title}
							</a>
							<div class="content-preview" style="display: none;">
	                            ${b.content}
	                        </div>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<ul class="pagination">
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
	</ul>
	
	
</div>

<%@ include file="../layout/footer.jsp" %>