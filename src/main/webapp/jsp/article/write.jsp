<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>게시물 작성</h1>

	<form action="doWrite" method="post">
		<div>
			<div>제목 : <input type="text" name="title" placeholder="제목을 입력해주세요"/></div>
			<div>내용 : <textarea name="body" placeholder="내용을 입력해주세요"></textarea></div>
		</div>
		<div>
			<!-- <div><input type="submit" value="작성" /></div> -->
			<div><button>작성</button></div>
			<div><a href="list">취소</a></div>
		</div>
	</form>
</body>
</html>