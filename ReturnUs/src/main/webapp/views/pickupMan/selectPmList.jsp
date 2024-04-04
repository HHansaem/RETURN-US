<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Return:Us</title>
<style>
   
#big {
	background-color: #F5F9F1; 
	height: 100%; 
	padding: 0px 50px 0px 50px;
}   

#sm {
	background-color: white; 
	height: 100%; 
	padding: 45px 50px 0px 50px;
}
#tableDiv {
	width: 100%;
	text-align: center;
}
#tableDiv table{
	width: 100%;
}
#tableDiv table th{
    padding: 8px;
    border-bottom: 1px solid rgba(62, 109, 16, 0.5);
    background-color: rgba(129, 182, 34, 0.2);
}
#tableDiv table td{
	padding: 9px;
    border-bottom: 1px solid #ddd;
}
</style>
   
</head>
    
<body class="noto-sans">

<!-- 헤더 파일 include -->
<%@include file="/views/common/header.jsp" %>


	<div class="container-fluid fruite py-5"
		style="margin: 38px 100px; width: 90%;">
		<div class="col-lg-12">
			<div class="row g-4">
				<div class="col-6"></div>
			</div>
			<div class="row g-4">
				<div class="col-lg-2 shadow-sm">
					<%@include file="/views/common/pickSideBar.jsp"%>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">사원 조회</h3>
							</div>
							<div id="sm" class="card">
								<div class="col-12 d-flex justify-content-center" style="padding:10px 40px 50px;flex-direction:column; ">
								<div style="display:flex; justify-content:flex-end; padding-bottom:20px ">
									<select class="rounded-input" id="pmRegion" name="pmRegion" style="width:247px;">
										<option value="none"> 관할 지역 선택 </option>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
										<option value="부산">부산</option>
										<option value="제주">제주</option>
									</select>
								</div>
										<div id="tableDiv">
											<table>
												<thead>
													<tr>
														<th>NO</th>
														<th>이름</th>
														<th>전화번호</th>
														<th>작업 상태</th>
														<th>담당 작업</th>
														<th>관할구역</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${pmList }" var="pml" varStatus="i">
													<tr>
														<td>${i.index + 1 }</td>
														<td>${pml.pmName }</td>
														<td>${pml.pmTel }</td>
														<td>${pml.pmStatus }</td>
														<td>${pml.pmStatus }</td>
														<td>${pml.pmRegion }</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										
									</div>
									<div id="pageDiv" class="col-12">
                                     <div class="pagination d-flex justify-content-center" style="margin-bottom:50px;">
	                                     <a class="rounded" style="border:1px solid lightgray;">&lt;</a>
											<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
												<c:choose>
													<c:when test="${i==pageInfo.curPage }">
														<a href="pmList?page=${i}" class="rounded" style="border:1px solid lightgray;">${i }</a>
													</c:when>
													<c:otherwise>
														<a href="pmList?page=${i}" class="rounded" style="border:1px solid lightgray;">${i }</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										<a class="rounded" style="border:1px solid lightgray;">&gt;</a>
                                     </div>
                                 </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/views/common/footer.jsp" %>
	
<script>
document.getElementById('pmRegion').addEventListener('change', function() {
    const region = this.value;
    
    $.ajax({
        type: 'GET',
        url: 'pmList', // 서버의 엔드포인트 URL을 여기에 입력하세요.
        data: { pmRegion: region }, // 선택된 상태 값을 서버에 전달합니다.
        success: function(response) {
            // 서버로부터의 응답을 처리합니다.
            // 응답 데이터를 사용하여 HTML을 업데이트하거나 다른 작업을 수행합니다.
            console.log(response); // 예시: 콘솔에 응답 데이터를 출력합니다.
        },
        error: function(xhr, status, error) {
            // AJAX 요청이 실패한 경우 에러를 처리합니다.
            console.error(error); // 예시: 에러 메시지를 콘솔에 출력합니다.
        }
    });
});
</script>



</body>
</html>