package emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
@WebServlet("/SalcntavgsalServ")
public class SalcntavgsalServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DAO 메서드 결과를 json형태로 넘긴다.
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		List<Map<String,Object>> list1 = EmpDAO.getInstance().selectDeptSal();
		out.print(JSONArray.fromObject(list1));
	}
}
