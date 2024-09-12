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
	<script>
		const modifyFormSubmit = function(form) {
			form.title.value = form.title.value.trim();
			form.body.value = form.body.value.trim();
			
			if (form.title.value.length == 0) {
				alert('제목을 입력해주세요');
				form.title.focus();
				return;
			}
			
			if (form.body.value.length == 0) {
				alert('내용을 입력해주세요');
				form.body.focus();
				return;
			}
			
			form.submit();
		}
	</script>

	<form action="doModify" method="post" onsubmit="modifyFormSubmit(this); return false;">
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