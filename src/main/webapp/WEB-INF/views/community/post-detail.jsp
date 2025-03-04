<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta content="Codescandy" name="author">
	<title>게시글 상세</title>
	
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
	</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/components/header.jsp" />
    <jsp:include page="/WEB-INF/views/components/navbar.jsp" />

    <main data-post-id="${post.post_id}" data-poster-id="${post.poster_id}">
        <section class="mt-8">
            <div class="container">
                <div class="row">
                    <div class="d-flex justify-content-start">
                        <h1 class="fw-bold" onclick="goList()" style="cursor: pointer;">나만의 레시피</h1>
                    </div>
                </div>
            </div>
        </section>

        <section style="margin-bottom: 96px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <!-- 게시글 헤더 -->
                        <div class="mb-5" style="margin-top: 50px;">
                        
                        	<!-- 내가 작성한 게시글이라면 수정 삭제 버튼 -->
                        	<c:if test="${not empty sessionScope.login}">
		                        <c:if test="${sessionScope.login.member_id eq post.poster_id}">
		                        	<div class="d-flex mb-4 justify-content-end">
										<a href="/recipick/post-edit/${post.post_id}" class="text-muted me-4" style="cursor: pointer;">
											<small>수정</small>
										</a>
										<a onclick="deletePost(${post.post_id}); return false;" class="text-muted me-4" style="cursor: pointer;">
											<small>삭제</small>
										</a>
									</div>
								</c:if>
							</c:if>
							
                            <div class="mb-3 text-center">
                                <a class="text-primary">${post.posterNickname}</a>
                            </div>
                            <h1 class="fw-bold text-center">${post.title}</h1>
                            <div class="d-flex justify-content-center text-muted mt-4">
                                <span class="me-2">
                                    <small><fmt:formatDate value="${post.post_datetime}" pattern="yyyy-MM-dd HH:mm"/></small>
                                </span>
                            </div>
                        </div>

                        <!-- 이미지 목록 -->
                        <div class="d-flex flex-column align-items-center mb-6 gap-3">
                        	<c:forEach items="${images}" var="image">
	                            <div>
									<img src="${image.img_url}" alt="${image.img_url}" class="img-fluid rounded" />
	                            </div>
                        	</c:forEach>
                        </div>

                        <!-- 조회수, 댓글수 -->
                        <div class="d-flex text-muted" style="margin-bottom: 60px;">
                            <span style="margin-left: auto;">
                                <span class="me-1">
                                    <small>조회수 <span class="text-dark fw-bold">${post.view}</span></small>
                                </span>
                                <span>
									<small>댓글 <span class="text-dark fw-bold" id="mainReply">${post.countReply}</span></small>
                                </span>
                            </span>
                        </div>

                        <!-- 게시글 내용 -->
                        <div>
                            <div style="margin-bottom: 60px;">
                                <p>${post.post_content}</p>
                            </div>
                            <hr/>
                        </div>

                        <!-- 댓글 -->
                        <div class="d-flex mt-10 ms-8">
                            <h3 class="mb-0">댓글</h3>
                            <h3 class="text-primary ms-2 mb-0">${post.countReply}</h3>
                        </div>

                        <!-- 댓글 목록 -->
						<div id="commentList">
						    <c:forEach items="${replies}" var="reply">
						        <div id="reply-${reply.reply_id}">
						            <hr class="mx-4 mt-8 mb-8"/>
						            <div class="d-flex mx-8">
						                <h5 class="text-primary">${reply.commenterNickname}</h5>
						                <span class="text-muted ms-3">
						                    <small><fmt:formatDate value="${reply.reply_datetime}" pattern="yyyy-MM-dd HH:mm"/></small>
						                </span>
						                
										<!-- 내가 작성한 댓글이라면 수정 삭제 버튼 -->
										<c:if test="${not empty sessionScope.login}">
							                <c:if test="${sessionScope.login.member_id eq reply.commenter_id}">
							                    <div class="d-flex ms-auto">
							                        <a class="text-muted me-4" onclick="editReply(${reply.reply_id}); return false;" style="cursor: pointer;">
							                            <small>수정</small>
							                        </a>
							                        <a class="text-muted me-4" onclick="deleteReply(${reply.reply_id}); return false;" style="cursor: pointer;">
							                            <small>삭제</small>
							                        </a>
							                    </div>
							                </c:if>
						                </c:if>
						                
						            </div>
						            <div class="mx-8 mt-2">
						                <p><c:out value="${reply.reply_content}" escapeXml="false"/></p>
						            </div>
						        </div>
						    </c:forEach>
						</div>

                        <!-- 댓글 작성 -->
                        <c:if test="${not empty sessionScope.login.member_id}">
                            <div>
                                <hr class="mx-4 my-8"/>
                                <div class="d-flex mx-8">
                                    <h5 id="newCommentNick" class="text-primary">${sessionScope.nickname}</h5>
                                </div>
                                <div class="mx-8 mt-2">
                                    <textarea id="newComment" class="form-control" rows="4" placeholder="댓글을 남겨주세요."></textarea>
                                    <div class="d-flex justify-content-end">
                                        <button id="addCommentBtn" class="btn btn-primary px-6 py-2 mt-4" type="button">등록하기</button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
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
	    <!-- 나만의 레시피 클릭 -->
		function goList() {
			window.location.href = "/recipick/community-list";
		}
	
	    const mainElement = document.querySelector('main');
	    const post = {
	        post_id: mainElement.getAttribute('data-post-id'),
	        poster_id: mainElement.getAttribute('data-poster-id')
	    };
	    
    	// DOM 요소 참조
        const addCommentBtn = document.querySelector('#addCommentBtn');
        const newComment = document.querySelector('#newComment');
        const commentList = document.querySelector('#commentList');
        
	    // 댓글 등록
		addCommentBtn.addEventListener("click", function() {
		    const content = newComment.value;
		    
		    // 내용 입력 비어있을 때 
		    if (!content.trim()) {
		        alert("댓글 내용을 입력해주세요.");
		        return;
		    }
		
		    fetch('/recipick/reply', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json',
		        },
		        body: JSON.stringify({
		            post_id: post.post_id,
		            poster_id: post.poster_id,
		            reply_content: content
		        })
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            // 새로운 댓글 DOM 요소 생성
		            const newCommentDiv = document.createElement("div");
		            newCommentDiv.id = `reply-\${data.reply_id}`; // 서버에서 반환된 reply_id 사용
		            
		            newCommentDiv.innerHTML = `
		                <hr class="mx-4 mt-8 mb-8"/>
		                <div class="d-flex mx-8">
		                    <h5 class="text-primary">${sessionScope.nickname}</h5>
		                    <span class="text-muted ms-3">
		                        <small>\${data.formattedDateTime}</small>
		                    </span>
		                    <div class="d-flex ms-auto">
			                    <a class="text-muted me-4" onclick="editReply(\${data.reply_id}); return false;" style="cursor: pointer;">
			                        <small>수정</small>
			                    </a>
			                    <a class="text-muted me-4" onclick="deleteReply(\${data.reply_id}); return false;" style="cursor: pointer;">
			                        <small>삭제</small>
			                    </a>
			                </div>
		                </div>
		                <div class="mx-8 mt-2">
		                	<p>\${content.replace(/\n/g, "<br>")}</p>
		                </div>
		            `;
		
		            // 댓글 목록에 추가
		            commentList.appendChild(newCommentDiv);
		            
		            // 입력 필드 초기화
		            newComment.value = "";
		            
		            // 댓글 수 업데이트
		            updateCommentCount(1);
		            
		        } else {
		            alert(data.message || '댓글 등록에 실패했습니다.');
		        }
		    })
		    .catch(error => {
		        console.error('Error:', error);
		        alert('댓글 등록 중 오류가 발생했습니다.');
		    });
		});
	
	    // 댓글 수 업데이트
	    function updateCommentCount(change) {
	        const countElement = document.querySelector('.text-primary.ms-2');
	        if (countElement) {
                const currentCount = parseInt(countElement.textContent || '0');
                countElement.textContent = currentCount + change;
            }
	        
	        const mainReplyElement = document.querySelector('#mainReply');
	        if (mainReplyElement) {
                const currentCount = parseInt(mainReplyElement.textContent || '0');
                mainReplyElement.textContent = currentCount + change;
            }
	    }
	    
	 	// 게시글 삭제
	    function deletePost(postId) {
	        if (!confirm('게시글을 삭제하시겠습니까?')) return;

	        fetch('/recipick/post/' + postId, {
	            method: 'DELETE'
	        })
	        .then(response => response.json())
	        .then(data => {
	            if (data.success) {
	                // alert('게시글이 삭제되었습니다.');
	                location.href = '/recipick/community-list';
	            } else {
	                alert(data.message || '게시글 삭제에 실패했습니다.');
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('게시글 삭제 중 오류가 발생했습니다.');
	        });
	    }
    	
	 	// 댓글 삭제
		function deleteReply(replyId) {
		    if (!confirm('댓글을 삭제하시겠습니까?')) return;
		
		    fetch('/recipick/reply/' + replyId, {
		        method: 'DELETE'
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		        	// 해당 댓글 요소만 DOM에서 제거
		            const replyElement = document.querySelector(`#reply-\${replyId}`);
		            if (replyElement) {
		                replyElement.remove();
		                
		                // 댓글 수 업데이트
		                updateCommentCount(-1);  // 댓글 수를 1 감소
		            }
		        } else {
		            alert(data.message || '댓글 삭제에 실패했습니다.');
		        }
		    })
		    .catch(error => {
		        console.error('Error:', error);
		        alert('댓글 삭제 중 오류가 발생했습니다.');
		    });
		}

	 	// 댓글 수정 
	 	function editReply(replyId) {
		    const replyElement = document.querySelector(`#reply-\${replyId}`);
		    const contentElement = replyElement.querySelector('p');
		 	// HTML 내용에서 줄바꿈(<br>) 태그를 일반 줄바꿈 문자로 변환
		    const content = contentElement.innerHTML
		        .replace(/<br\s*\/?>/gi, '\n')
		        .replace(/<[^>]*>/g, ''); // 추가 HTML 태그 제거
		    const editButtons = replyElement.querySelector('.d-flex.ms-auto');
		    editButtons.classList.add('d-none');
		    
		    contentElement.style.display = 'none';
		    
		    const editForm = document.createElement('div');
		    editForm.id = `edit-form-\${replyId}`;
		    
		    editForm.innerHTML = `
		    	<div class="mx-8">
			        <textarea class="form-control" rows="4">\${content}</textarea>
			        <div class="d-flex justify-content-end mt-4">
			        	<button class="btn btn-primary me-4 px-6 py-2" onclick="updateReply(\${replyId}, this)">저장</button>
			        	<button class="btn btn-outline-gray-400 px-6 py-2" onclick="cancelEdit(this)">취소</button>
			        </div>
		        </div>
		    `;
		    
		    replyElement.appendChild(editForm);
		}
		  
	 	// 댓글 수정 취소
		function cancelEdit(button) {
		    // 부모 댓글 컨테이너를 직접 찾음
		    const replyElement = button.closest('[id^="reply-"]');
		    
		    if (replyElement) {
		        const contentElement = replyElement.querySelector('p');
		        const editForm = replyElement.querySelector('[id^="edit-form-"]');
		        const editButtons = replyElement.querySelector('.d-flex.ms-auto');
		
		        if (contentElement) contentElement.style.display = 'block';
		        if (editForm) editForm.remove(); // 편집 폼을 완전히 제거
		        if (editButtons) editButtons.classList.remove('d-none');
		    } else {
		        console.error('댓글 요소를 찾을 수 없습니다');
		    }
		}

	 	// 댓글 수정 처리
		function updateReply(replyId, button) {
		    const replyElement = button.closest('[id^="reply-"]');
		    
		    if (!replyElement) {
		        console.error('댓글 요소를 찾을 수 없습니다');
		        return;
		    }
		
		    const editForm = replyElement.querySelector(`[id^="edit-form-"]`);
		    
		    if (!editForm) {
		        console.error('편집 폼을 찾을 수 없습니다');
		        return;
		    }
		
		    const textarea = editForm.querySelector('textarea');
		    const content = textarea.value.trim().replace(/\n/g, '<br>');
		
		    console.log('디버깅 정보:', {
		        replyId: replyId,
		        content: content,
		        contentLength: content.length
		    });
		
		    if (content === '') {
		        alert('댓글 내용을 입력해주세요.');
		        textarea.focus();
		        return;
		    }
		
		    fetch(`/recipick/reply/\${replyId}/update`, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({ 
		            reply_content: content
		        }),
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            const contentElement = replyElement.querySelector('p');
		            contentElement.innerHTML = content.replace(/\n/g, '<br>');
		            
		            contentElement.style.display = 'block';
		            editForm.remove();
		
		            const editButtons = replyElement.querySelector('.d-flex.ms-auto');
		        	if (editButtons) editButtons.classList.remove('d-none');
		            
		            // alert(data.message || '댓글이 수정되었습니다.');
		        } else {
		            alert(data.message || '댓글 수정에 실패했습니다.');
		        }
		    })
		    .catch(error => {
		    	console.error('댓글 수정 중 오류:', error);
		        alert('댓글 수정 중 오류가 발생했습니다: ' + error.message);
		    });
		}
    </script>
</body>
</html>