<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<!-- 절대경로 -->
	<a href="<%= request.getContextPath() %>/home/printDan">테스트버튼</a>

	<!-- 상대경로 -->
	<a href="detail">테스트버튼2</a>

	<div>게시물 리스트</div>
	<ul>
		<% for (Map<String, Object> articleMap : articleListMap) { %>
			<li><%= articleMap.get("id") %> | <%= articleMap.get("regDate") %> | <%= articleMap.get("title") %></li>
		<% } %>
	</ul>

</body>
</html>