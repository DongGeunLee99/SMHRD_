package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class mini_DAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String sql ;

	public void getCon() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String Url = "jdbc:oracle:thin:@project-db-cgi.smhrd.com:1524:xe";
			String UserId = "cgi_24K_bigdata30_p1_2";
			String UserPw = "smhrd2";

//            String Url = "jdbc:oracle:thin:@localhost:1521:xe";
//		    String UserId = "hr";
//		    String UserPw = "12345";
		   
			conn = DriverManager.getConnection(Url, UserId, UserPw);

			if (conn == null) {
				System.out.println("DB 접근 권한이 없습니다!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getCon() 오류!");
		}

	}

	public int regist(mini_DTO dto) {

		int cnt = 0;
		try {
			getCon();
			sql = "INSERT INTO TB_USER VALUES(?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getID());
			psmt.setString(2, dto.getPW());
			psmt.setString(3, dto.getNAME());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}

	public mini_DTO login(mini_DTO dto) {

		mini_DTO user = null;
		try {

			getCon();
			sql = "SELECT * FROM TB_USER WHERE ID = ? AND PW = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getID());
			psmt.setString(2, dto.getPW());

			rs = psmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("ID");
				String pw = rs.getString("PW");
				String name = rs.getString("NAME");

				user = new mini_DTO(id, pw, name);
			}
		}
		catch (SQLException e) {
			System.out.println("login error");
			e.printStackTrace();
		} finally {
			close();
		}
		return user;

	}

	public List<List<Object>> list(String level) {
		// 데이터를 2차원 배열에 넣어줘야 하기 때문에 반복문에 1차원 2차원을 구분하기 쉽게 list<list<>>사용
		List<List<Object>> list = new ArrayList<>();
		try {
			getCon();
			if (level.equals("Hard")) { // 하드 난이도 선택 경우
				sql = "SELECT ROW_NUMBER() OVER (ORDER BY HARD_TM) AS HARD, NAME, HARD_TM, HARD_DT FROM TB_LAB WHERE HARD_TM IS NOT NULL";// ORDER BY HARD_TM";
			} else { // 노멀 난이도 선택 경우
				sql = "SELECT ROW_NUMBER() OVER (ORDER BY HARD_TM) AS NORMAL, NAME, NORMAL_TM, NORMAL_DT FROM TB_LAB WHERE NORMAL_TM IS NOT NULL";
			}
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				String INDEX = rs.getString(1);
				String NAME = rs.getString(2);
				float HARD_TM = rs.getFloat(3);
				String HARD_DT = rs.getString(4);
				
				// 2차원 리스트에 1차원 리스트를 한번에 저장
				list.add(Arrays.asList(INDEX, NAME, HARD_TM, HARD_DT));
			}
		} catch (Exception e) {
			System.out.println("list error");
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int delete(mini_DTO dto, Account user) {
		int cnt = 0;
		try {
			getCon();
			sql = "DELETE FROM TB_USER WHERE ID = ? AND PW = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getID());
			psmt.setString(2, dto.getPW());
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public void Save(String name, double labTime, String level) { // 이름, 기록, 난이도 불러옴
	      try {
	      getCon();
	      // 현재 년도-월-일 및 시간 표시
	      // java에서 제공하는 타입 SimpleDateFormat -->java.date()
	      // data타입을 사용하면 날짜밖에 나오지 않으므로 SimpleDateFormat사용해서 원하는 형식 호출
	      SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	      String dateTime = sDate.format(new Date());

	      // TO_DATE oracle에서 제공하는 함수? --> String형식을 Date로 사용 가능
	      if(level.equals("Hard")) { // 하드 난이도 선택 경우
	         sql = "INSERT INTO TB_LAB(NAME, HARD_TM, HARD_DT) VALUES(?, ?, TO_DATE(?,'yyyy/mm/dd hh24:mi:ss'))";
	      }else { // 노멀 난이도 선택 경우
	         sql = "INSERT INTO TB_LAB(NAME, NORMAL_TM, NORMAL_DT) VALUES(?, ?, TO_DATE(?,'yyyy/mm/dd hh24:mi:ss'))";
	      }

	      psmt = conn.prepareStatement(sql);
	      
	      psmt.setString(1, name);
	      psmt.setDouble(2, labTime); // 시간 소숫점까지 들어가야 하기 때문에 double
	      psmt.setString(3, dateTime);

	      psmt.executeUpdate();
	      
	   } catch (Exception e) {
	      e.printStackTrace();

	   }       finally {
	   close();

	   }
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
