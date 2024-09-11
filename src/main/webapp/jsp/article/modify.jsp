<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Map<String, Object> articleMap = (Map<String, Object>) request.getAttribute("articleMap");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
	<form action="doModify" method="post">
		<div>	
			<input type="hidden" name="id" value="<%= articleMap.get("id") %>"/>
			<div><%= articleMap.get("id") %>번 게시물 수정</div>
			<div>작성일 : <%= articleMap.get("regDate") %></div>
			<div>수정일 : <%= articleMap.get("updateDate") %></div>
			<div>제목 : <input type="text" name="title" value="<%= articleMap.get("title") %>" placeholder="제목을 입력해주세요" /></div>
			<div>내용 : <textarea name="body" placeholder="내용을 입력해주세요"><%= articleMap.get("body") %></textarea></div>
		</div>

		<div>
			<div><button>수정</button></div>
			<div><a href="list">목록</a></div>
			<div><a href="delete?id=<%= articleMap.get("id") %>">삭제</a></div>
		</div>
	</form>
</body>
</html>