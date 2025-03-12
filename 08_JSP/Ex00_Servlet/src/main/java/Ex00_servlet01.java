import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// url mpaaing : 보안상 또는 단어 길이 문제로 인해 url주소를 변경하고 싶을 때 사용
// 어노테이션 : 컴파일(프로그래밍언어 -> 기계어)을 할 때, 한 번 확인해줌
@WebServlet("/test")
public class Ex00_servlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex00_servlet01() {
        super();
        System.out.println("생성자 호출");
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
		/* init : 객체가 서블릿 역할을 할 수 있도록 초기화 시켜주는 역할
		DB연결, 중대한 연산 작업을 하는 경우 -> 비용이 많이 드는 작업
		서버로 요청이 들어올때 마다 작업 -> 비용 관련하여 비효율적
		최초로 요청이 들어오는 경우 -> init 호출(서블릿 객체를 초기화)
		이후, 그 다음 요청이 들어오면 -> 이미 생성되어있는 객체를 그대로 사용 */
	}

	public void destroy() {
		System.out.println("destroy 메서드 호출");
		/*destroy : 서블릿 객체 소멸(server-tomcat을 stop하는 경우)
		destroy 실행 -> 이후, 요청이 들어오는 경우 -> 다시 객체 생성 -> init호출*/
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service 메서드 호출");
		/*가장 많이 사용할 메서드, 사용자의 요청 처리/응답해주는 메서드
		http 요청 : Get, Post, Delete, Patch, Put
		1. 모든 요청은 Service에서 받는다
		2. GET/POST(요청 메서드)에 따라서 다르게 처리하고 싶은 경우에는
			service가 doGet, doPost를 호출하게 한다.*/
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet 메서드 호출");
		/* http요청 메서드가 doGet인 경우 호출 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("doPost 메서드 호출");
		/* http요청 메서드가 doPost인 경우 호출 */
	}

}
