<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <title>권한 동의 - 레시픽</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>솔픽 애플리케이션에 접근 권한 부여</h2>
        
        <p>솔픽(${client})이 다음 정보에 접근하기를 원합니다:</p>
        <ul>
        <c:forEach items="${scopes}" var="scope">
            <c:choose>
                <c:when test="${scope eq 'read'}">
                    <li>기본 프로필 정보 읽기</li>
                </c:when>
                <c:when test="${scope eq 'profile'}">
                    <li>사용자 프로필 정보</li>
                </c:when>
                <c:when test="${scope eq 'purchase_history'}">
                    <li>주문 및 구매 내역</li>
                </c:when>
                <c:otherwise>
                    <li>${scope}</li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        </ul>
        
        <form id="confirmationForm" name="confirmationForm" action="${pageContext.request.contextPath}/oauth/authorize" method="post">
            <input name="user_oauth_approval" value="true" type="hidden" />
            
            <c:forEach items="${scopes}" var="scope">
                <input type="hidden" name="scope.${scope}" value="true" />
            </c:forEach>
            
            <button class="btn btn-primary" type="submit">허용</button>
        </form>
        
        <form id="denyForm" name="denyForm" action="${pageContext.request.contextPath}/oauth/authorize" method="post">
            <input name="user_oauth_approval" value="false" type="hidden" />
            <button class="btn btn-secondary" type="submit">거부</button>
        </form>
    </div>
</body>
</html>