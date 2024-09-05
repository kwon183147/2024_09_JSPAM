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
	<div><a href="../home/main">메인</a></div>
	
	<div>게시물 리스트</div>
	<ul>
		<% for (Map<String, Object> articleMap : articleListMap) { %>
			<li><%= articleMap.get("id") %> | <%= articleMap.get("regDate") %> | <a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></li>
		<% } %>
	</ul>

</body>
</html>