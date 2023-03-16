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
	  <div class="card-footer text-center">
	  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="token">
	    <button class="btn btn-primary modInquiry">수정</button>
	    <button class="btn btn-danger delInquiry">삭제</button>
	    <a href="${contextPath}/inquiry/list" type="submit" class="btn btn-info">목록</a>
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
})
</script>
