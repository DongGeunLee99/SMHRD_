

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex05_MakeTable")
public class Ex05_MakeTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	argument : 전달인자 => 메서드를 호출할 때 사용
	parameter : 매개변수 => 메서드를 정의할 때 사용
	*/
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		PrintWriter out = response.getWriter();

		out.print("<table border=1>");
			out.print("<tr>");
				for (int i = 1; i <= num; i++) {
					out.print("<td>"+ i +"</td>");
				}
			out.print("</tr>");
		out.print("</table>");
		
	}

}
