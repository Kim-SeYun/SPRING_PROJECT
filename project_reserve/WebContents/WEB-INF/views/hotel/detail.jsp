<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<style>
	.hotel-info {
	    margin-left: 60px;
	  }
	  
	.container {
		margin-left: 300px;
	}
	
	
	.room_box {
	    width: 800px;
	    height: 240px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    padding: 20px;
	    margin-top: 100px;
	}

	.room_list {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	}
	
	.room_list img {
	    width: 300px;
	    height: 200px;
	}
	
	.room_list div {
	    flex-grow: 1;
	}
	
	.room_list h1 {
	    font-size: 20px;
	    margin-bottom: 10px;
	    position: relative;
	    top: -35px; /* 원하는 만큼의 픽셀값을 입력하여 위로 이동 */
	}
	
	.room_list p {
	    font-size: 14px;
	    color: #666;
	    margin-bottom: 10px;
	}
	
	.room_list button {
	    padding: 5px 10px;
	    background-color: #007bff;
	    color: #fff;
	    border: none;
	    cursor: pointer;
	}

</style>



<div class="container">
	
	
	<div style="display:flex">
    <c:if test="${not empty attachList}">
        <div>
            <img id="mainImage" src="${contextPath}/hotel/imgDisplay?filePath=${attachList[0].filePath}&fileName=${attachList[0].fileName}" style="width:500px;">
            <div>
                <c:forEach items="${attachList}" var="attach" varStatus="status">
                    <c:if test="${attach.fileType eq 'IMAGE'}">
                        <img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width:100px; margin:10px;" onclick="changeImage('${contextPath}/hotel/imgDisplay?filePath=${attachList[status.index].filePath}&fileName=${attachList[status.index].fileName}')">
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:if>


	<c:if test="${empty attachList}">
		<b>등록된 첨부파일이 없습니다.</b>
	</c:if>


    <div class="hotel-info">
        <div><h2>${h.name}</h2></div>
        <p>${h.address}</p>
    </div>

</div>

		${attachList}
        ${roomAttach}
        ${r.room_id }
<input type="hidden" value="${r.room_id}" name="room_id">
<div class="room_box">
    <div class="room_list">
        <img src="" alt="객실 사진">
        <div>
            <h1>${r.room_type}</h1>
            <p>${r.room_info}</p>
            <p>${r.available}</p>
            <button>예약</button>
        </div>
    </div>
</div>


	
	

	
</div>

<%@ include file="../layout/footer.jsp" %>


<script>
    function changeImage(imageUrl) {
        var mainImage = document.getElementById("mainImage");
        mainImage.src = imageUrl;
    }
</script>
