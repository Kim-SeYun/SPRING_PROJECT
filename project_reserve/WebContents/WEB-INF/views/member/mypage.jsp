<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>마이페이지</h1>
	</div>
	<form id="viewForm" class="container" action="${contextPath}/member/modMember" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	  
	  <div class="form-group">
	    <label for="memberId">아이디:</label>
	    <input type="hidden" name="memberId" value="${memberInfo.memberId}">
	    <input type="text" class="form-control" id="memberId"  value="${memberInfo.memberId}" disabled>
	  </div>
	  <div class="form-group">
	    <label for="name">이름:</label>
	    <input type="text" class="form-control" id="name" value="${memberInfo.name}" disabled>
	  </div>
		<div class="form-group">
		  <label for="email">이메일:</label>
		  <input type="email" class="form-control" id="email" name="email" value="${memberInfo.email}" disabled>
		</div>
		<div class="form-group">
		  <label for="phoneNumber">전화번호:</label>
		  <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${memberInfo.phoneNumber}" disabled>
		</div>
		<div class="form-group">
		  <label for="address">주소:</label>
		  <input type="text" class="form-control" id="address" name="address" value="${memberInfo.address}" disabled>
		</div>

 		
		<div>
			<button type="button" class="btn btn-info float-right toModForm">수정하기</button>
		</div>
		<div class="viewMode">
			<input type="submit" class="btn btn-primary float-right" value="수정"> 
			<button type="button" class="btn btn-secondary float-right backViewMode">취소</button>			
		</div>	  
	  
  </form>

</div>
	
	

<%@ include file="../layout/footer.jsp" %>

<script>
$(function() {
	$('.viewMode').hide();
	$('.modAddr').hide();
	$('input[name="email"],input[name="phoneNumber"],input[name="address"]').prop("disabled", true);
	
	let viewForm = $('#viewForm');
	
	let emailObj = $('input[name="email"]');
	let phoneObj = $('input[name="phoneNumber"]');
	let addressObj = $('input[name="address"]');
	
	let emailVal = emailObj.val();
	let phoneVal = phoneObj.val();
	let addressVal = addressObj.val(); 
	
	// 수정모드
	$('.toModForm').on('click', function(){
		$('input[name="email"],input[name="phoneNumber"],input[name="address"]').prop("disabled", false);
		$('.originAddr').hide();
		$('.modAddr').show();
		$('.toModForm').hide();
		$('.viewMode').show();
	});
	
	
	// 뷰모드
	$('.backViewMode').on('click', function(){
		$('input[name="email"],input[name="phoneNumber"],input[name="address"]').prop("disabled", true);
		$('.viewMode').hide();
		$('.toModForm').show();
		$('.modAddr').hide();
		$('.originAddr').show();
		emailObj.val(emailVal);
		addressObj.val(addressVal);
		phoneObj.val(phoneVal);
	});
	
});
</script>