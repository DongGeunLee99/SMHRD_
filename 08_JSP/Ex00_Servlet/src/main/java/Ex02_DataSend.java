

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex02_DataSend")
public class Ex02_DataSend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("Servlet 페이지 이동 성공 !");

		/* 요청 값을 받아서 응답을 처리할 수 있는 공간 ! */
		/* 1. 요청 값 가져오기 */
		String result = request.getParameter("data");
		
		
		/* 2. 요청에 대한 과정 처리 => 알고리즘 처리 ! */
		System.out.format("result : %s%n", result);		
		
		/* 3. 결과에 대한 응답 => 화면으로 처리 ! */
		PrintWriter out = response.getWriter();
		
		out.format("입력한 데이터는 %s 입니다.</br>", result);
		out.print("입력한 데이터는 " + result + " 입니다.");

	}
	

}
