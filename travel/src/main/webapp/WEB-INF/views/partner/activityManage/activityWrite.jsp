<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {width: 800px; margin: 50px auto 10px }

.body-title {
    padding-top: 25px; padding-bottom: 5px;
    color: #424951;
    border-bottom: 1px solid #ddd;
}

.body-title h3 {
    min-width: 300px;
    padding-bottom: 5px;
    font-size: 23px;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    display: inline-block;
    border-bottom: 3px solid #424951;
}

form {
	background: white;
}

table:first-child tbody tr:last-child {
	border-bottom: 1px solid #dee2e6;
}
.ck.ck-editor {
	max-width: 99.7%;
}
.ck-editor__editable {
    min-height: 250px;
}
.ck-content .image>figcaption {
	min-height: 25px;
}

td.table-light {
    text-align: center;
    vertical-align: middle;
    font-weight: bold;
}

.table {
    margin-bottom: 0;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<div class="right_col" role="main" style="min-height: 1765px;">
	<div class="container">
		<div class="body-container">	
			<div class="body-title">
				<h3><i class="bi bi-book-half"></i> 액티비티 등록 </h3>
			</div>
			
			<div class="body-main">
			    <div class="alert alert-info" role="alert">
			        <i class="bi bi-question-square"></i> 판매할 액티비티에 대한 정보를 입력해주세요.
			    </div>
			    
				<form name="activityWriteForm" method="post">
					<table class="table write-form">
						<tr>
							<td style="width:110px;" class="table-light" scope="row">지역</td>
							<td>
								<div class="pe-1">
									<select name="cityNum" class="form-select form-control">
										<option value="">선택</option>
											<option>서울</option>
											<option>부산</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
									</select>
								</div>
							</td>
							<td class="table-light" scope="row">종류</td>
							<td>
								<div class="pe-1">
									<select name="activityType" class="form-select form-control">
										<option value="">선택</option>
											<option>티켓/패스</option>
											<option>레저</option>
											<option>수상 액티비티</option>
											<option>요트/유람선</option>
									</select>
								</div>
							</td>
						</tr>
						
						
						<tr>
							<td class="table-light" scope="row" style="width: 100px;">액티비티 이름</td>
							<td colspan="3">
								<input type="text" name="activityName" class="form-control" value="">
							</td>
						</tr>
						
						<tr>
							<td class="table-light" scope="row">가격</td>
							<td>
								<input type="text" name="price" class="form-control" value="">
							</td>
							
							<td class="table-light" scope="row">소요시간</td>
							<td>
								<input type="text" name="totalTime" class="form-control" value="">
							</td>
						</tr>
						
						
						<tr>
							<td class="table-light" scope="row" rowspan="2">주소</td>
							<td>
								<input type="text" name="zip" id="zip" class="form-control" style="" placeholder="우편번호" value="" readonly="readonly">
							</td>
							<td colspan="2">	
								<button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
								<input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="" readonly="readonly">
								<input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="">
							</td>
						</tr>
	
						<tr>
							<td class="table-light" scope="row">내 용</td>
							<td colspan="3">
								<div class="editor">호잇</div>
								<input type="hidden" name="activityDetail">
							</td>
						</tr>
						
						<tr>
							<td class="table-light" scope="row" style="width: 100px;">대표 이미지</td>
							<td colspan="3">
								<input type="text" name="activityName" class="form-control" value="">
							</td>
						</tr>
						
					</table>
					
					<table class="table table-borderless">
	 					<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="num" value="${dto.num}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</table>
				</form>
			
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
ClassicEditor
	.create( document.querySelector( '.editor' ), {
		fontFamily: {
            options: [
                'default',
                '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
                '나눔고딕, NanumGothic, Arial'
            ]
        },
        fontSize: {
            options: [
                9, 11, 13, 'default', 17, 19, 21
            ]
        },
		toolbar: {
			items: [
				'heading','|',
				'fontFamily','fontSize','bold','italic','fontColor','|',
				'alignment','bulletedList','numberedList','|',
				'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
				'undo','redo','|',
				'link','outdent','indent','|',
			]
		},
		image: {
            toolbar: [
                'imageStyle:full',
                'imageStyle:side',
                '|',
                'imageTextAlternative'
            ],

            // The default value.
            styles: [
                'full',
                'side'
            ]
        },
		language: 'ko',
		ckfinder: {
	        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
	    }
	})
	.then( editor => {
		window.editor = editor;
	})
	.catch( err => {
		console.error( err.stack );
	});
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}
</script>
