<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>


<div class="container">
	<form action="${contextPath}/hotel/write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input type="text" name="name" placeholder="호텔이름" class="form-control">
		<select class="form-control" id="category" name="category">
		    <option value="">문의유형을 선택하세요</option>
		    <option value="motel">모텔</option>
		    <option value="hotel">호텔·리조트</option>
		    <option value="pension">펜션</option>
		    <option value="guesthouse">게스트하우스</option>
		    <option value="camping">캠핑·글램핑</option>
		</select>
		<input type="text" name="address" placeholder="주소" class="form-control">
		<div class="fileForm">
			<div>
				<button type="button" class="btn btn-primary add">사진추가</button>
				<button type="button" class="btn btn-danger del">사진삭제</button>
			</div>
			<input type="file" name="attachFile" class="form-control attachFile">
		</div>
		<button class="btn btn-info">등록</button>
	</form>
	
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function(){
	
	let formCount = 1; 
	$('.fileForm .add').click(function(){
		if(formCount>=7){
			alert('최대 7개까지 추가할 수 있습니다.')
			return;
		}
		let fileFormTag = $('.fileForm .attachFile').eq(0).clone().val('');
		$('.fileForm').append(fileFormTag);
		formCount++;
	})
	
	$('.fileForm .del').click(function(){
		if(formCount <=1){
			alert('마지막폼은 삭제할 수 없습니다.');
			return;
		}
		$('.fileForm .attachFile').eq(formCount-1).remove();
		formCount--;
	})
})
</script>