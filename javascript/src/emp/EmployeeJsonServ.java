package emp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;


@WebServlet("/ajax/EmployeeJsonServ")
public class EmployeeJsonServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		EmpDTO emp = new EmpDTO();
		emp.setEmployee_id(request.getParameter("mid"));
			try {
				EmpDTO list = EmpDAO.getInstance().selectOne(emp);
				out.print(JSONObject.fromObject(list));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
