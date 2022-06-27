package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//Data Access Object = 데이터에 접근하는 역할을 맡은 객체
//ctrl shift o : 자동 import   alt shift s : source
public class UserDAO {
	private Connection conn; // 자바랑 db랑 연결하는 객체. 연결
	private PreparedStatement pstmt; // 준비된 문장 = 쿼리 준비. 실행
	private ResultSet rs; // 쿼리 실행 후 결과를 담은 객체. 결과값
	
	//생성자
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP_TEST?serverTimzone=UTC";
			//jdbc : Java DateBase Connectivity
			String dbId = "root";
			String dbPasword = "system123";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbId, dbPasword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인 기능 수행 함수. 로그인 화면에서 유저가 아이디 비번을 치고 밑의 로그인 번튼을 눌렀을때 실행
	public int login(String userID, String userPassword) {
		
		String SQL = "SELECT userPassword FROM TABLE_USER WHERE userID=?";
		// 실행할 쿼리. 유저가 친 아이디에 해당하는 비밀번호를 가져온다.
		
		try {
			pstmt = conn.prepareStatement(SQL); //문자열 쿼리를 pstmt에 대입
			pstmt.setString(1, userID); //첫번째 물음표에 userID값 대입
			// 프로그래밍 언어에서는 인덱스 0부터시작이지만 쿼리에서는 1부터 시작이다.
			rs = pstmt.executeQuery(); //쿼리실행후 결과 받기
			if(rs.next()) { //결과의 리스트를 받았는데 다음행의 데이터가 있으면
				if(rs.getString(1).equals(userPassword)) {
					//남은 것의 첫번째의 값이 login함수를 호출할떄 전달받은 비밀번호와 같은지 검사
					return 1; //로그인 성공
				} else {
					return 0; //로그인 실패
				}
			}
			return -1; //아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
}
