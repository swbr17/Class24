package kr.or.ksmart.dao;

import java.sql.*;
import java.util.*;
import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;

public class Mdao {
	//09 로그인 세션(한명회원의 아이디,이름,권한 조회) 메서드 선언
	public Member mGetSession(String id) throws SQLException, ClassNotFoundException{
		System.out.println("09 mGetSession Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select m_id, m_name, m_level from tb_member where m_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		Member session = new Member();
		while(rs.next()){
			session.setM_id(rs.getString("m_id"));
			session.setM_level(rs.getString("m_level"));
			session.setM_name(rs.getString("m_name"));
		}
		return session;
	}
	
	//08 로그인체크 메서드 선언
	public String mLoginCheck(String id, String pw) throws ClassNotFoundException, SQLException{
		System.out.println("08 mLoginCheck Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String login = null;

		String sql = "select m_id, m_pw, m_level, m_name from tb_member where m_id=? and m_pw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		if(rs.next()){
			if(id.equals(rs.getString("m_id"))){
				System.out.println("01아이디일치");
				login = "아이디일치";
				if(pw.equals(rs.getString("m_pw"))){
					System.out.println("03로그인성공");
					login = "로그인성공";
				}else{
					System.out.println("04비번불일치");
					login = "비번불일치";
				}
			}else{
				System.out.println("02아이디불일치");
				login = "아이디불일치";
			}
		}
		return login;
	}
	
	//07 권한별 리스트보기 메서드 선언
	public ArrayList<Member> mAllSelectLevel(String id) throws ClassNotFoundException, SQLException{
		System.out.println("07 mAllSelectLevel Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from tb_member where m_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		ArrayList<Member> returnlist = new ArrayList<Member>();
		while(rs.next()){
			Member m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_email"));
			m.setM_email(rs.getString("m_email"));
			returnlist.add(m);
		}
		return returnlist;
	}
	
	//06 회원검색 메서드 선언
	public ArrayList<Member> mSearchSelect(String search) throws ClassNotFoundException, SQLException{
		System.out.println("06 mSearch Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> returnlist = new ArrayList<Member>();
		
		String sql = "select * from tb_member where m_id=? or m_name=? or m_level=? or m_email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search);
		pstmt.setString(2, search);
		pstmt.setString(3, search);
		pstmt.setString(4, search);
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			Member m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_email"));
			m.setM_email(rs.getString("m_email"));
			returnlist.add(m);
		}
		
		return returnlist;
	}
	
	//05 리스트 메서드 선언(관리자)
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("05 mList Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from tb_member";
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		
		ArrayList<Member> get_alm = new ArrayList<Member>();
		
		while(rs.next()){
			Member m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			get_alm.add(m);
		}
		return get_alm;
	}
	
	//04 수정화면 메서드 선언
	public Member mSelectforUpdate(String id) throws ClassNotFoundException, SQLException{
		System.out.println("04 mSelectforUpdate Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement("select * from tb_member where m_id=?");
		System.out.println(pstmt+" <-- pstmt1");
		
		pstmt.setString(1, id);
		System.out.println(pstmt+" <-- pstmt2");
		
		rs = pstmt.executeQuery();
		Member m = new Member();
		if(rs.next()){
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			}
		return m;
	}
	
	//03 삭제처리 메서드 선언
	public void mDelete(String m_id) throws ClassNotFoundException, SQLException{
		System.out.println("01 mDelete Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		
		try{
			pstmt = conn.prepareStatement("DELETE FROM tb_member WHERE m_id=?");
			System.out.println(pstmt +"<-- pstmt1");
			
			pstmt.setString(1, m_id);
			System.out.println(pstmt +"<-- pstmt2");
			
			int result = pstmt.executeUpdate();
			System.out.println(result +"<-- result");
			
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

	}
	//02 수정처리 메서드 선언
	public void mUpdate(Member m) throws ClassNotFoundException, SQLException{
		System.out.println("01 mUpdate Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;

		try{
		pstmt = conn.prepareStatement("UPDATE tb_member SET m_id=?, m_pw=?, m_level=?, m_name=?, m_email=? WHERE m_id=?");
		System.out.println(pstmt +"<-- pstmt1");
		
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		pstmt.setString(6, m.getM_id());
		System.out.println(pstmt +"<-- pstmt2");
		
		int result = pstmt.executeUpdate();
		System.out.println(result +"<-- result");
		
		}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	//01 입력처리 메서드 선언
	public void mInsert(Member m) throws ClassNotFoundException, SQLException{
		System.out.println("01 mInsert Mdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		
		try{
		pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		System.out.println(pstmt +"<-- pstmt1");
		
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		System.out.println(pstmt +"<-- pstmt2");
		
		int result = pstmt.executeUpdate();
		System.out.println(result +"<-- result");
		
		
		}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
