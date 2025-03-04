<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta content="Codescandy" name="author">
	<title>게시글 수정하기</title>
	
	<!-- Favicon icon-->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">

	<!-- Libs CSS -->
	<link href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">

	<!-- Theme CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.min.css">

	<!-- Font CSS -->
	<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/variable/woff2/SUIT-Variable.css" rel="stylesheet">

	<style>
		body {font-family: 'SUIT Variable', sans-serif;}

		#deleteFile:hover {
			color: #ff0000 !important;
			transition: all 0.3s ease;
		}
	</style>

</head>

<body>
    <jsp:include page="/WEB-INF/views/components/header.jsp" />
    <jsp:include page="/WEB-INF/views/components/navbar.jsp" />

    <main>
        <section class="mt-8">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1 class="fw-bold">게시글 수정하기</h1>
                    </div>
                </div>
            </div>
        </section>

        <section style="margin-bottom: 96px;">
            <div class="container">
                <form id="editForm" enctype="multipart/form-data" onsubmit="editPost(event)" data-post-id="${post.post_id}">
                    <div class="d-flex mt-6 mx-4 align-items-center">
                        <h4 class="mb-0 me-8" style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">게시글 제목</h4>
                        <input type="text" name="title" class="form-control" style="height: 48px;" placeholder="예) 직접 끓인 미역국 자랑합니다." required value="${post.title}">
                    </div>

                    <div class="d-flex mt-6 mx-4 align-items-top">
                        <h4 class="mb-0 me-8" style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">내용</h4>
                        <textarea name="content" class="form-control" rows="20" placeholder="예) 레시픽에서 본 레시피 참고하여 만들어봤습니다." required>${post.post_content}</textarea>
                    </div>

                    <div>
                        <hr class="mt-8"/>
                    </div>

                    <div class="mx-4 mt-4">
                        <h4 class="mb-4 me-8" style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">첨부 파일</h4>
                        <div style="border: 0.8px solid #dfe2e1; border-radius: 8px; padding: 36px 16px;" class="form-control">
                            
                            <div id="attachedFileList" class="d-flex mb-3 mx-6" style="gap: 12px">
							    <c:forEach items="${images}" var="image">
							        <div class="position-relative" style="width: 10%; aspect-ratio: 1 / 1; ">
							            <img src="${image.img_url}" alt="${image.img_url}" style="width: 100%; height: 100%; object-fit: cover;">
							            <i class="feather-icon icon-x position-absolute" id="deleteFile" data-image-id="${image.post_image_id}" style="top: 5px; right: 5px; cursor: pointer; font-size: 18px; color: #dfe2e1;"></i>
							        </div>
							    </c:forEach>
							</div>
							
                            <p class="text-muted my-0 ms-6"><small>가장 첫 번째 사진이 대표 사진으로 나타납니다.</small></p>
                            <div class="d-flex justify-content-center">
                                <button id="addFileBtn" class="btn btn-primary px-5 mt-6" type="button" style="height: 42px;">
                                    <i class="feather-icon icon-plus me-2"></i> 파일 추가
                                </button>
                                <input type="file" id="fileInput" name="files" accept="image/*" multiple style="display: none;">
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center mt-12" style="gap: 32px;">
                        <button type="submit" class="btn btn-outline-gray-400 px-9 py-2 fs-5" id="submitBtn">수정</button>
                        <button type="button" class="btn btn-outline-gray-400 px-9 py-2 fs-5" onclick="cancelEdit()">취소</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/components/footer.jsp" />

    <!-- JavaScript -->
    <script src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>
    
    <!-- Theme JS -->
    <script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

    <script>
 	// 삭제된 이미지 ID를 추적하기 위한 배열
    let deletedImageIds = []; 
 	
   	// 파일들을 저장할 배열
    let selectedFiles = [];

    // DOM이 완전히 로드된 후 초기화 작업 수행
    document.addEventListener('DOMContentLoaded', function() {
        // 초기 보더 적용
        mainFileBorder();
        
        // 기존 이미지 삭제 버튼 이벤트 설정
        const deleteButtons = document.querySelectorAll('#deleteFile');
        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const imageId = this.getAttribute('data-image-id');
                const parentDiv = this.closest('.position-relative');
                
                // 삭제된 이미지 ID 배열에 추가
                if (imageId) {
                    deletedImageIds.push(imageId);
                }
                
                // div 제거 및 보더 재적용
                if (parentDiv) {
                    parentDiv.remove();
                    mainFileBorder();
                }
            });
        });

        const attachedFileList = document.querySelector('#attachedFileList');
        const addFileBtn = document.querySelector('#addFileBtn');
        const fileInput = document.querySelector('#fileInput');
        const submitBtn = document.getElementById('#submitBtn');

     	// 파일 추가 버튼 클릭 시 파일 input 클릭
        addFileBtn.addEventListener("click", function() {
            fileInput.click();
        });

        // 파일 선택 시 이미지 미리보기 
        fileInput.addEventListener('change', (event) => {
           const files = Array.from(event.target.files);
           
           // selectedFiles = selectedFiles.concat(files);
           
/*            console.log('선택된 파일들:', files.map(file => ({
               name: file.name,
               type: file.type,
               size: file.size
           }))); */
           
           files.forEach(file => {
               const reader = new FileReader();
               
               if (!file.type.startsWith('image/')) {
                   console.error(file.name + ": 이미지 파일만 업로드 가능합니다.");
                   alert(file.name + ": 이미지 파일만 업로드 가능합니다.");
                   return;
               }
               
               reader.onload = (e) => {
            	   // #ex 있으면 제거 
                   const ex = document.querySelector('#ex');
                   if (ex) {
                       ex.remove();
                   }
                   
                   // Base64 문자열이 e.target.result에 저장됨
                   const base64String = e.target.result;

                   const newFileDiv = document.createElement('div');
                   newFileDiv.style.width = '10%';
                   newFileDiv.style.aspectRatio = '1 / 1';
                   newFileDiv.classList.add('position-relative');
                   newFileDiv.innerHTML = `
                       <img src="\${base64String}" alt="" style="width: 100%; height: 100%; object-fit: cover;">
                       <i class="feather-icon icon-x position-absolute" id="deleteFile" 
                          style="top: 5px; right: 5px; cursor: pointer; font-size: 18px; color: #dfe2e1;"></i>
                   `;

                   attachedFileList.appendChild(newFileDiv);
                   
                   mainFileBorder();

                   // 삭제 버튼에 인덱스 정보 추가
                   const deleteBtn = newFileDiv.querySelector('#deleteFile');
                   const fileIndex = selectedFiles.length - 1;
                   deleteBtn.addEventListener('click', function() {
                       attachedFileList.removeChild(newFileDiv);
                       // 파일 배열에서도 제거
                       const fileIndex = Array.from(attachedFileList.children).indexOf(newFileDiv);
                       if (fileIndex !== -1) {
                           selectedFiles.splice(fileIndex, 1);
                       }                       
                       mainFileBorder();
                   });
                   
                 // 파일을 selectedFiles 배열에 추가
                 selectedFiles.push(file);
               };
               reader.readAsDataURL(file);
           });
       });
    });
    
    // 대표 이미지 보더 적용 함수
    function mainFileBorder() {
        const fileDivs = attachedFileList.querySelectorAll('.position-relative');
        
        if (fileDivs.length === 0) {
            // 이미지가 없을 경우 예시 이미지 표시
            const newEx = document.createElement('div');
            newEx.id = 'ex';
            newEx.classList.add('d-flex', 'align-items-center', 'justify-content-center');
            newEx.style.width = '10%';
            newEx.style.aspectRatio = '1/1';
            newEx.style.backgroundColor = '#dfe2e1';
            newEx.innerHTML = `
                <i class="feather-icon icon-image" style="font-size: 24px; color: #ffffff;"></i>
            `;
            attachedFileList.appendChild(newEx);
        } 
        
       	fileDivs.forEach((div, i) => {
       		div.style.border = (i === 0) ? '2px solid #FF8A3D' : '2px solid #dfe2e1';
       	});
       	
     	// 등록 버튼의 스타일 변경
        if (fileDivs.length > 0) {
            submitBtn.classList.remove('btn-outline-gray-400');
            submitBtn.classList.add('btn-primary');
        } else {
        	submitBtn.classList.remove('btn-primary');
        	submitBtn.classList.add('btn-outline-gray-400');
        }
    }

    // 폼 제출 처리 함수
    function editPost(event) {
	    event.preventDefault();
	    
	    // 현재 표시된 모든 이미지 수 확인 (기존 이미지 + 새로 추가된 이미지)
	    const totalImages = attachedFileList.querySelectorAll('.position-relative').length;
	    
	    if (totalImages === 0) {
	        alert('최소 1개 이상의 이미지를 첨부해야 합니다.');
	        return;  // 폼 제출 중단
	    }
	    
	    const formData = new FormData();
	    formData.append('title', document.querySelector('input[name="title"]').value);
	    formData.append('content', document.querySelector('textarea[name="content"]').value);
	    
	    // 삭제된 이미지 ID 처리
	    if (deletedImageIds.length > 0) {
	        formData.append('deletedImageIds', JSON.stringify(deletedImageIds));
	    }
	    
	 	// selectedFiles 배열 사용
	    selectedFiles.forEach((file, index) => {
	        formData.append('files', file);
	    });
	    
	    // 서버로 데이터 전송
	    // post_id를 가져오는 여러 방법을 시도
	    const postId = document.querySelector('form').getAttribute('data-post-id') || window.location.pathname.split('/').pop();
	    
	    fetch('/recipick/post-edit/' + postId, {
	        method: 'POST',
	        body: formData
	    })
	    .then(response => {
	        // 응답 상태 확인
	        if (!response.ok) {
	            throw new Error(`HTTP error! status: \${response.status}`);
	        }
	        // 응답 타입 확인
	        const contentType = response.headers.get('content-type');
	        if (contentType && contentType.includes('application/json')) {
	            return response.json();
	        }
	        throw new TypeError("응답이 JSON 형식이 아닙니다!");
	    })
	    .then(data => {
	        if (data.success) {
	            window.location.href = `/recipick/post-detail/\${postId}`;
	        } else {
	            alert(data.message || '게시글 수정에 실패했습니다.');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('게시글 수정 중 오류가 발생했습니다: ' + error.message);
	    });
	    
	}
    
    // 취소 버튼
    function cancelEdit() {
        if (confirm('수정을 취소하시겠습니까? 작성 중인 내용은 저장되지 않습니다.')) {
            location.href='/recipick/post-detail/${post.post_id}';
        }
    }
    </script>
</body>
</html>