package com.koreaIT.jsp.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.koreaIT.jsp.am.config.Config;
import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;

		try {
			Class.forName(Config.getDBDriverName());
			connection = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUsr(), Config.getDBUsrPw());
			
			int cPage = 1;
			if (request.getParameter("cPage") != null && request.getParameter("cPage").length() != 0) {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			}

			int itemsInAPage = 10;

			int limitFrom = (cPage - 1) * itemsInAPage;

			int buttonsInAPage = 10;

			int from = ((cPage - 1) / buttonsInAPage) * buttonsInAPage + 1;
			int end = (((cPage - 1) / buttonsInAPage) + 1) * buttonsInAPage;

			SecSql sql = new SecSql();
			sql.append("SELECT COUNT(id) FROM article");

			int totalCnt = DBUtil.selectRowIntValue(connection, sql);

			int totalPageCnt = (int) Math.ceil(((double) totalCnt / itemsInAPage));

			sql = new SecSql();
			sql.append("SELECT A.*, M.loginId `writerName`");
			sql.append("FROM article A");
			sql.append("INNER JOIN `member` M");
			sql.append("ON A.memberId = M.id");
			sql.append("ORDER BY A.id DESC");
			sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);

			List<Map<String, Object>> articleListMap = DBUtil.selectRows(connection, sql);
			
			HttpSession se = request.getSession();
			
			int loginedMemberId = -1;
			
			if (se.getAttribute("loginedMemberId") != null) {
				loginedMemberId = (int) se.getAttribute("loginedMemberId");
			}
			
			request.setAttribute("loginedMemberId", loginedMemberId);

			request.setAttribute("articleListMap", articleListMap);
			request.setAttribute("totalPageCnt", totalPageCnt);
			request.setAttribute("cPage", cPage);
			request.setAttribute("from", from);
			request.setAttribute("end", end);

			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}