package com.koreaIT.jsp.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/member/logout")
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8;");
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginedMemberId");
		
		response.getWriter().append("<script>alert('정상적으로 로그아웃 되었습니다'); location.replace('../home/main');</script>");
	}
}