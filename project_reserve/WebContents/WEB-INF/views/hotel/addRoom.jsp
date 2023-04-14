<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>


<div class="container">
	<form action="${contextPath}/hotel/addRoom?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

		<input type="hidden" value="${param.bno}" name="bno">
		<select class="form-control" id="room_type" name="room_type">
		    <option value="">방유형을 선택하세요</option>
		    <option value="single">싱글</option>
		    <option value="double">더블</option>
		    <option value="twin">트윈</option>
		</select>
		<input type="text" name="room_name" placeholder="방이름" class="form-control">
		<textarea rows="10" name="room_info" class="form-control"></textarea>
		<input type="number" name="capacity" placeholder="인원수" class="form-control">
		<input type="number" name="price" placeholder="가격" class="form-control">
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
		if(formCount>=4){
			alert('최대 4개까지 추가할 수 있습니다.')
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