<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	
	<div class="card shadow-lg">
	  <div class="card-header">
	    <div class="row">
	      <div class="col-md-4">
	        <span class="badge badge-primary">${i.bno}</span>
	        <span class="badge badge-info">${i.type}</span>
	        <span class="ml-2">${i.title}</span>
	      </div>
	      <div class="col-md-8 text-right">
	        <span class="badge badge-light">${i.writer}</span>
	        <span class="badge badge-light">${i.writeDate}</span>
	      </div>
	    </div>
	  </div>
	  <div class="card-body" style="min-height:350px">
	    ${i.content}
	  </div>
	  <sec:authorize access="isAuthenticated()">
		  <div class="card-footer text-center">
		  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="token">
		  	<c:if test="${i.writer == pageContext.request.userPrincipal.name}">
			    <button class="btn btn-primary modInquiry">수정</button>
			    <button class="btn btn-danger delInquiry">삭제</button>
		    </c:if>
		    <a href="${contextPath}/inquiry/list" type="submit" class="btn btn-info">목록 </a>
		  </div>
	  </sec:authorize>     
	  
	  <sec:authorize access="isAnonymous()"><!-- 권한이 없는 경우  -->
      	 <div class="card-footer text-center">
		    <a href="${contextPath}/inquiry/list" type="submit" class="btn btn-info">목록</a>
		  </div>
	  </sec:authorize>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<form name="replyForm" id="replyForm" method="post" class="mt-3">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="token">
				<div class="form-group">
					<ul class="d-flex justify-content-between" style="list-style: none; padding: 0;">
						<li><h6><b>댓글작성</b></h6></li>
						<li class="form-inline">작성자 : <input type="text" name="writer" class="form-control" value="<sec:authentication property="principal.username"/>" readonly="readonly"></li>
					</ul>
					<textarea class="form-control" rows="3" name="reply"></textarea>
				</div>
				<button type="submit" class="btn btn-primary writeReply">작성</button>
			</form>
		</sec:authorize>
		
		
	<div>
		<div class="card">
		  <div class="card-header">댓글목록</div>
		  <div class="card-body">
		  	<ul class="list-group list-group-flush" style="list-style: none;">
		  		<c:forEach items="${replyList}" var="reply">
		         	<li class="list-group-item d-flex justify-content-between">
		         		<div>
			         		<p style="white-space: pre-line;">${reply.reply}</p>
			         		<span class="badge badge-info">${reply.writer}</span>
							<span class="badge badge-warning">${reply.replyDate}</span>
		         		</div>
		         		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="token">
		         		<button class="btn btn-danger deleteReply" style="height: 40px;" data-rno="${reply.rno}">삭제</button>
		         	</li>
		        </c:forEach>
			</ul>
		  </div>
		</div>
	</div>
</div>
	
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function(){
	$('.delInquiry').on('click', function(){
		$('<form/>').attr('method', 'post')
			.attr('action', '${contextPath}/inquiry/remove?bno=${i.bno}')
			.append($('.token'))
			.appendTo('body')
			.submit();
	})
	
	$('.modInquiry').on('click', function(){
		$('<form/>').attr('method', 'get')
			.attr('action', '${contextPath}/inquiry/modify')
			.append('<input type="hidden" value="${i.bno}" name="bno">')
			.appendTo('body')
			.submit();
	})
	
	$('.writeReply').on('click', function(){
		let ReForm = $("form[name = replyForm]");
		ReForm.attr('action', '${contextPath}/inquiry/writeReply')
			.append('<input type="hidden" value="${i.bno}" name="bno">')
			.submit();
	})
	
	$('.deleteReply').on('click', function(){
		$('<form/>').attr('method', 'post')
			.attr('action', '${contextPath}/inquiry/removeReply?bno=${i.bno}'+ "&rno="+$(this).attr("data-rno"))
			.append($('.token'))
			.appendTo('body')
			.submit();
	})
})
</script>
