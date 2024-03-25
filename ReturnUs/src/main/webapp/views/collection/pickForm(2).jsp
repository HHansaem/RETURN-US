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
/* 	height: 100%;  */
	min-height:auto;
	padding: 45px 50px 0px 50px;
}
.rounded-input {
        border-radius: 5px; /* 원하는 반지름 값을 설정합니다. */
        border: 1px solid #ccc; /* 테두리 스타일을 지정합니다. */
        padding: 10px 15px; /* 내부 여백을 지정합니다. */
        height: 40px;
/*         width: 200px;  */
        box-sizing: border-box; /* 테두리와 내부 여백을 포함한 요소의 전체 크기를 지정합니다. */
        margin:10px;
    }
.btn-green {
	background-color:#D1E7DD;
	color:#146C43;
	font-weight: 600;
    border-color: #81c408;
    line-height: 1.5;
	text-align: center;
    vertical-align: middle;
    border: 1px solid rgba(0, 0, 0, 0);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    border-radius: 10px;
}
    #nextBtn {
        display: flex; /* 수평 정렬을 위해 flex로 설정 */
        justify-content: flex-end; /* 오른쪽 정렬 */
        padding: 10px;
        margin: 10px;
    }
</style>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
				<div class="col-lg-2">
					<div class="row g-4 shadow-sm">
						<div class="col-lg-12">
							<%@include file="/views/common/sideBar.jsp"%>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div style="height: 100%; padding: 0px 70px 0px 70px">
						<!--큰 card ** 여기서부터 코딩하시면 됩니다!!! ** -->
						<div id="big" class="card">
							<div style="padding: 50px 0px 30px; color: #3E6D10;">
								<h3 class="noto-sans" style="color: #3E6D10;">방문 수거 신청</h3>
								<span style="color: #3E6D10;">리터너스가 집 앞까지 찾아가 손쉽게 분리수거 해드립니다!</span>
							</div>
							<!--body ** 여기서부터 코딩하시면 됩니다!!! ** -->
							<div id="sm" class="card">
								<div class="col-12">
									<h3 class="noto-sans" style="color:#3E6D10;">STEP 01 정보 작성</h3>
									<span style="color: #3E6D10;">신청 시 입력된 정보는 추후 수정이 불가하오니, 신중하게 작성 부탁드립니다.</span>
								</div>
								
								<form method="post" action="collect2" enctype="multipart/form-data">
									<div class="col-12 d-flex justify-content-center" style="padding:35px 40px 50px">
										<div style="width:700px; padding:50px;">
											<!-- 이름 div -->
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:5px;">
													<h5 class="noto-sans" style="margin:10px;">이름</h5>
												</div>
												<div class="col-7 d-flex justify-content-center">
													<input type="text" class="rounded-input" placeholder="이름" name="accName">
												</div>
											</div>
											
											<!-- 전화번호 div -->
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:5px;">
													<h5 class="noto-sans" style="margin:10px;">전화번호</h5>
												</div>
												<div class="col-7 d-flex justify-content-center">
													<input type="text" class="rounded-input" placeholder="전화번호" name="accTel">
												</div>
											</div>
											
											<!-- 주소지 div -->
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:5px;">
													<h5 class="noto-sans" style="margin:10px;">주소지 이름</h5>
												</div>
												<div class="col-7 d-flex justify-content-center">
							                        <div class="d-flex align-items-center">
							                            <input type="text" id="AddrNm" placeholder="주소명" class="rounded-input" style="width:108px;">
<!-- 														<input type="button" class="btn-green" onclick="selectAddr()" style="width:134px; height:40px;" value="배송지 목록 조회"> -->
														<a href="javascript:;" class="status-button btn-green" data-bs-toggle="modal" 
																						data-bs-target="#verticalycentered">배송지 목록 조회</a>
							                        </div>
							                    </div>
											</div>
											
											<!-- 우편번호 div -->
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:5px;">
													<h5 class="noto-sans" style="margin:10px;">우편번호</h5>
												</div>
												<div class="col-7 d-flex justify-content-center">
							                        <div class="d-flex align-items-center">
							                            <input type="text" id="accPostCode" name="accPostCode" placeholder="우편번호" class="rounded-input" style="width:108px;">
														<input type="button" class="btn btn-primary" onclick="findPostCd()" style="width:134px; height:40px;" value="우편번호 찾기">
							                        </div>
							                    </div>
											</div>
											
											<!-- 주소 div -->
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:5px;">
													<h5 class="noto-sans" style="margin:10px;">주소</h5>
												</div>
												<div class="col-7 d-flex justify-content-center">
													<input type="text" id="accAddr" name="accAddr" class="rounded-input" placeholder="주소">
												</div>
											</div>
											<!-- 상세주소 div -->
											<div class="col-12 d-flex" style="">
												<div class="col-5 d-flex justify-content-center" style="padding:0px;">
<!-- 													<h5 class="noto-sans" style="margin:10px;">주소</h5> -->
												</div>
												<div class="col-7 d-flex justify-content-center" style="">
													<input type="text" class="rounded-input" name="accDetailAddr" id="accDetailAddr" style="margin:0px;" placeholder="상세주소">
												</div>
											</div>
											
											<div class="col-12 d-flex" style="padding:10px;">
												<div class="col-5 d-flex justify-content-center" style="align-items:center;">
													<input type="radio" style="accent-color: #198754;"> &nbsp;&nbsp; 위 주소를 기본 주소지로 저장
												</div>
												<div id="nextBtn" class="col-7 d-flex" style="padding:10px; margin:10px;">
													<input type="submit" value="다음" class="btn-green" style="color: #3E6D10; text-decoration:underline;">
							                    </div>
											</div>
											
										</div>
									</div>
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/views/common/footer.jsp" %>


<!-- 모달  -->
<div class="modal fade" id="verticalycentered" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">주소지 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="statusChangeForm" method="post" action="#">
					<input id="accId" type="hidden" name="accId" /> 
					<span>상태</span>
					<select class="form-select" name="ctrStatus" id="ctrStatusSelect" style="display: inline; width: 70%; margin-left: 40px;">
						<option value="" label="상태변경" />
						<option value="V00" label="신규" />
						<option value="V01" label="계약 진행" />
						<option value="V02" label="계약 완료" />
						<option value="V03" label="연장 계약" />
						<option value="V99" label="만료(퇴점)" />
						<option value="V88" label="유찰" />
					</select>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">선택</button>
				<button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>




</body>

<script>

<!-- 우편번호 api  -->
function findPostCd() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('accPostCode').value = data.zonecode;
            document.getElementById("accAddr").value = roadAddr;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("accDetailAddr").value = extraRoadAddr;
            } else {
                document.getElementById("accDetailAddr").value = '';
            }

        }
    }).open();
}
</script>
</html>