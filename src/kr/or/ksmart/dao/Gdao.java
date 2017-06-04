package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Goods;

public class Gdao {
	
	//06 상품 검색 메서드 선언
	public ArrayList<Goods> gSearchSelect(String search) throws ClassNotFoundException, SQLException{
		System.out.println("06 gSearchSelect Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement("select * from tb_goods where g_code=? or m_id=? or g_name=? or g_cate=?");
		System.out.println(pstmt+"<-- pstmt1");
		
		pstmt.setString(1, search);
		pstmt.setString(2, search);
		pstmt.setString(3, search);
		pstmt.setString(4, search);
		System.out.println(pstmt+"<-- pstmt2");
		
		rs = pstmt.executeQuery();
		ArrayList<Goods> searcharr = new ArrayList<Goods>();
		while(rs.next()){
			Goods g = new Goods();
			g.setG_code(rs.getString("g_code"));
			g.setM_id(rs.getString("m_id"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_date(rs.getString("g_date"));
			g.setG_detail(rs.getString("g_detail"));
			searcharr.add(g);
		}
		return searcharr;
	}
		public ArrayList<Goods> gDateSearch(String searchprostartdate, String searchproenddate) throws ClassNotFoundException, SQLException{
			System.out.println("06 gDateSearch Gdao.java");
			DriverDB driverdb = new DriverDB();
			Connection conn = driverdb.driverDBcon();
			System.out.println(conn+" <-- conn");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	
		pstmt = conn.prepareStatement("SELECT * FROM tb_goods WHERE g_date BETWEEN ? and ? ORDER BY g_date ASC");
		System.out.println(pstmt+" <-- pstmt1");
		
		pstmt.setString(1, searchprostartdate);
		pstmt.setString(2, searchproenddate);
		System.out.println(pstmt+"<-- pstmt2");
		
		rs = pstmt.executeQuery();
		ArrayList<Goods> searchdatearr = new ArrayList<Goods>();
		while(rs.next()){
			Goods g = new Goods();
			g.setG_code(rs.getString("g_code"));
			g.setM_id(rs.getString("m_id"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_date(rs.getString("g_date"));
			g.setG_detail(rs.getString("g_detail"));
			searchdatearr.add(g);
		}
		return searchdatearr;
	}
		
		public ArrayList<Goods> gPriceSearch(int searchprostartprice, int searchproendprice) throws ClassNotFoundException, SQLException{
			System.out.println("06 gPriceSearch Gdao.java");
			DriverDB driverdb = new DriverDB();
			Connection conn = driverdb.driverDBcon();
			System.out.println(conn+" <-- conn");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
		pstmt = conn.prepareStatement("SELECT * FROM tb_goods WHERE g_price BETWEEN ? and ? ORDER BY g_price ASC");
		System.out.println(pstmt+" <-- pstmt1");
		
		pstmt.setInt(1, searchprostartprice);
		pstmt.setInt(2, searchproendprice);
		System.out.println(pstmt+"<-- pstmt2");
		
		rs = pstmt.executeQuery();
		ArrayList<Goods> searchpricearr = new ArrayList<Goods>();
		while(rs.next()){
			Goods g = new Goods();
			g.setG_code(rs.getString("g_code"));
			g.setM_id(rs.getString("m_id"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_date(rs.getString("g_date"));
			g.setG_detail(rs.getString("g_detail"));
			searchpricearr.add(g);
		}
		return searchpricearr;
	}

	//05 상품 리스트 메서드 선언
	public ArrayList<Goods> gAllSelectadm() throws ClassNotFoundException, SQLException{
		System.out.println("05 gAllSelectadm Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		Statement stmt = null;
		ResultSet rs = null;

		stmt = conn.createStatement();
		String query = "select * from tb_goods";
		rs = stmt.executeQuery(query);
		
		ArrayList<Goods> get_alg1 = new ArrayList<Goods>();
		
		while(rs.next()){
			Goods g = new Goods();
			g.setG_code(rs.getString("g_code"));
			g.setM_id(rs.getString("m_id"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_date(rs.getString("g_date"));
			g.setG_detail(rs.getString("g_detail"));
			
			get_alg1.add(g);
		}
		
		return get_alg1;
	}
	
	public ArrayList<Goods> gAllSelectSell(String SID) throws ClassNotFoundException, SQLException{
		System.out.println("05 gAllSelectSell Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		pstmt = conn.prepareStatement("select * from tb_goods where m_id=?");
		System.out.println(pstmt+" <-- pstmt1");
		
		pstmt.setString(1, SID);
		System.out.println(pstmt+" <-- pstmt2");
		
		rs = pstmt.executeQuery();
		ArrayList<Goods> get_alg2 = new ArrayList<Goods>();
		
		while(rs.next()){
			Goods g = new Goods();
			g.setG_code(rs.getString("g_code"));
			g.setM_id(rs.getString("m_id"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_date(rs.getString("g_date"));
			g.setG_detail(rs.getString("g_detail"));
			get_alg2.add(g);
		}
			
		return get_alg2;
		}
	
	//04 수정처리전 화면 메서드 선언
	public Goods gSelectforUpdate(String g_code) throws ClassNotFoundException, SQLException{
		System.out.println("04 gSelectforUpdate Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Goods g = new Goods();
		
		pstmt = conn.prepareStatement("select * from tb_goods where g_code=?");
		System.out.println(pstmt +"<-- pstmt1");
		
		pstmt.setString(1, g_code);
		System.out.println(pstmt +"<-- pstmt2");
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			g.setG_code(rs.getString("g_code"));
			g.setM_id(rs.getString("m_id"));
			g.setG_name(rs.getString("g_name"));
			g.setG_cate(rs.getString("g_cate"));
			g.setG_price(rs.getString("g_price"));
			g.setG_color(rs.getString("g_color"));
			g.setG_size(rs.getString("g_size"));
			g.setG_date(rs.getString("g_date"));
			g.setG_detail(rs.getString("g_detail"));
		}
		return g;
	}
	
	//03 삭제처리 메서드 선언
	public void gDelete(String g_code) throws ClassNotFoundException, SQLException{
		System.out.println("03 gDelete Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		
		pstmt = conn.prepareStatement("DELETE FROM tb_goods WHERE g_code=?");
		System.out.println(pstmt +"<-- pstmt1");
		
		pstmt.setString(1, g_code);
		System.out.println(pstmt +"<-- pstmt2");
		
		int result = pstmt.executeUpdate();
		System.out.println(result +"<-- result");
	}
	
	//02 수정처리 메서드 선언
	public void gUpdate(Goods g) throws ClassNotFoundException, SQLException{
		System.out.println("02 gUpdate Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		
		pstmt = conn.prepareStatement("UPDATE tb_goods SET m_id=?, g_name=?, g_cate=?, g_price=?, g_color=?, g_size=?, g_date = now(), g_detail=? WHERE g_code = ?");
		System.out.println(pstmt +"<-- pstmt1");
		
		pstmt.setString(1, g.getM_id());
		pstmt.setString(2, g.getG_name());
		pstmt.setString(3, g.getG_cate());
		pstmt.setString(4, g.getG_price());
		pstmt.setString(5, g.getG_color());
		pstmt.setString(6, g.getG_size());
		pstmt.setString(7, g.getG_detail());
		pstmt.setString(8, g.getG_code());
		System.out.println(pstmt +"<-- pstmt2");

		int result = pstmt.executeUpdate();
		System.out.println(result +"<-- result");
		
		pstmt.close();
		conn.close();
	}
	
	//01 입력처리 메서드 선언
	public void gInsert(Goods g) throws SQLException, ClassNotFoundException{
		System.out.println("01 gInsert Gdao.java");
		DriverDB driverdb = new DriverDB();
		Connection conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String maxquery = "select max(CAST(substring(g_code,7) AS DECIMAL)) from tb_goods";
		pstmt = conn.prepareStatement(maxquery);
		System.out.println(pstmt + "<-- pstmt 1");
		rs = pstmt.executeQuery();
		int nextcodenum = 0;
		
		if(rs.next()){
			nextcodenum = rs.getInt(1) + 1;
			System.out.println(nextcodenum +" <-- nextcodenum");
		}

		String thequery = "INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?)";
		pstmt = conn.prepareStatement(thequery);
		System.out.println(pstmt + "<-- pstmt 2");
		
		pstmt.setString(1, "goods_"+nextcodenum);
		pstmt.setString(2, g.getM_id());
		pstmt.setString(3, g.getG_name());
		pstmt.setString(4, g.getG_cate());
		pstmt.setString(5, g.getG_price());
		pstmt.setString(6, g.getG_color());
		pstmt.setString(7, g.getG_size());
		pstmt.setString(8, g.getG_detail());
		System.out.println(pstmt + "<-- pstmt 3");
		
		int result = pstmt.executeUpdate();
		System.out.println(result+" <-- result gUpdate Gdao.java");
		
		rs.close();
		pstmt.close();
		conn.close();
	}
}

