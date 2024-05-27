<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ツイート一覧</title>
<link rel="stylesheet" type="text/css" href="css/styles.css" >
</head>
<body>
	<div class="container">
		<h1>ツイート一覧</h1>
		<%-- メッセージがあれば表示 --%>
        <c:if test="${not empty Tweet_SuccessOrError}">
			<c:choose>
				<c:when test="${Tweet_SuccessOrError == 'success'}">
					<p class="success-message">ツイートの投稿に成功しました。</p>
				</c:when>
				<c:when test="${Tweet_SuccessOrError == 'error'}">
					<p class="error-message">ツイートの投稿に失敗しました。</p>
				</c:when>
			</c:choose>
		</c:if>
		<%-- 新規投稿 --%>
		<p>
			<a href="new_tweet.jsp">新規投稿</a>
		</p>
		<%-- ツイート一覧の表示 --%>
		<ul class="tweet-list">
			<c:forEach var="tweet" items="${tweets}">
			<li>
				<div class="tweet-content">
					<p>${tweet.content}</p>
					<p class="tweet-info">投稿者: ${tweet.author} - 投稿日時: ${tweet.postedAt}</p>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>