package com.smhrd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex02_GetPost")
public class Ex02_GetPost extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		// post 방식을 사용할 때는 요청값을 가져올 때 부터 인코딩이 진행되어야 한다
		request.setCharacterEncoding("UTF-8");

		// html 파일에서 전달하는 data 내용 가져와서 콘솔에 띄우기
		String getResult = request.getParameter("gdata");
		String postResult = request.getParameter("pdata");
		
		PrintWriter out = response.getWriter();
		out.format("<span style='font-size:15pt;'> getResult : %s </span><br>", getResult);
		out.format("<span style='font-size:15pt;'> postResult : %s </span><br>", postResult);
		out.format("<span style='font-size:15pt;'> 입력한 이름 : %s </span><br>", getResult);
		out.format("<span style='font-size:15pt;'> 입력한 이름 : %s </span><br>", postResult);
	}

}
