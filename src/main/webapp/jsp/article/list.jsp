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
	
	<table border="1">
		<colgroup>
			<col />
			<col width="200" />
			<col width="100" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성일</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<% for (Map<String, Object> articleMap : articleListMap) { %>
				<tr>
					<td><%= articleMap.get("id") %></td>
					<td><%= articleMap.get("regDate") %></td>
					<td><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></td>
				</tr>
			<% } %>
		</tbody>
	</table>



</body>
</html>