<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>
<div class="container">
	
	<nav class="notice">
		<ul>
			<h2>더 보기</h2><br>
			<li><a href="${contextPath}/board/list"><h5>공지사항</h5></a></li>
			<li><a href="#"><h5>문의사항</h5></a></li>
			<li><a href="${contextPath}/event/list"><h5>이벤트</h5></a></li>
		</ul>
	</nav>
	
    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
        <a href="${contextPath}/board/write" class="btn btn-info write" style="float: right;">글쓰기</a>
    </sec:authorize>
	
	
	<style>
		table.table {
		  margin-left: 200px; /* nav와 table 사이 간격 조절 */
		  margin-top: -100px; /* table을 위로 이동 */
		  vertical-align: top;
		  width: 800px;
		}
	</style>
	
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
								<input type="hidden" name="bno" value="${b.bno}">
								${b.title}
							</a>
							<div class="content-preview" style="display: none; white-space: pre-line;">
	                            ${b.content}
	                        </div>
	                        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
						        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="token">
						        <a class="btn btn-danger remove" style="float: right;">삭제</a>
						    </sec:authorize>
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

<script>
$(function(){
 
    
    $('.remove').click(function(){
        let bno = $(this).closest('tr').find('input[name="bno"]').val();
		let form = $('<form/>')
		form.attr('method','post')
			.attr('action', '${contextPath}/board/remove?bno=' + bno)
			.append($('.token'))
			.appendTo('body')
			.submit();
	})	
});
	
</script> 

