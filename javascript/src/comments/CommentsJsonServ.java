package comments;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/ajax/CommentsJsonServ")
public class CommentsJsonServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		if (cmd.equals("selectAll")) {
			// 목록
			try {
				List<HashMap<String, Object>> list = CommentsDAO.getInstance().selectAll();
				out.print(JSONArray.fromObject(list));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (cmd.equals("insert")) {
			try {
				Comments bean = new Comments();
				bean.setContent(request.getParameter("content"));
				bean.setName(request.getParameter("name"));

				HashMap<String, Object> map = CommentsDAO.getInstance().insert(bean);
				out.print(JSONObject.fromObject(map));
			} catch (Exception e) {
				e.printStackTrace();
				// out.print(toXML("error", e.getMessage()));
			}
		}
		else if (cmd.equals("delete")) {
			try {
				Comments bean = new Comments();
				bean.setId(request.getParameter("id"));

				HashMap<String, Object> map = CommentsDAO.getInstance().delete(bean);
				out.print(JSONObject.fromObject(map));
			} catch (Exception e) {
				e.printStackTrace();
				// out.print(toXML("error", e.getMessage()));
			}
		}
		else if (cmd.equals("update")) {
			try {
				Comments bean = new Comments();
				bean.setId(request.getParameter("id"));
				bean.setName(request.getParameter("name"));
				bean.setContent(request.getParameter("content"));
				HashMap<String, Object> map = CommentsDAO.getInstance().update(bean);
				out.print(JSONObject.fromObject(map));
			} catch (Exception e) {
				e.printStackTrace();
				// out.print(toXML("error", e.getMessage()));
			}
		}
	}
}
