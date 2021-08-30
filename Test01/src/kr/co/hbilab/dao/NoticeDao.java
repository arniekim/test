package kr.co.hbilab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acornlab.util.ConnLocator;
import kr.co.hbilab.dto.NoticeDto;

public class NoticeDao {
	
	private static NoticeDao dao;

	private NoticeDao() {
	}

	public static NoticeDao getInstance() {
		if (dao == null) {
			dao = new NoticeDao();
		}
		return dao;
	}
	
	public boolean insert(NoticeDto dto) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("INSERT INTO notice(n_seq, n_title, n_content, n_flag, n_hit, n_regdate) ");
			sql.append("VALUES(?, ?, ?, ?, ?, NOW())");
			pstmt = con.prepareStatement(sql.toString());
			
			int index = 1;
			pstmt.setInt(index++, dto.getSeq());
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());
			pstmt.setString(index++, dto.getFlag());
			pstmt.setInt(index++, dto.getHit());
			
			pstmt.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			try {
				if (pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean update(NoticeDto dto) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("UPDATE notice ");
			sql.append("SET n_title = ?, n_content=?, n_flag=? ");
			sql.append("WHERE n_seq=?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;			
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());
			pstmt.setString(index++, dto.getFlag());
			pstmt.setInt(index++, dto.getSeq());		

			pstmt.executeUpdate();
			isSuccess = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)	pstmt.close();
				if (con != null)	con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return isSuccess;
	}
	
	public boolean delete(int seq) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("DELETE FROM notice WHERE n_seq=?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, seq);

			pstmt.executeUpdate();
			isSuccess = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return isSuccess;
	}
	
	public ArrayList<NoticeDto> select(int start, int len) {
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("SELECT n_seq, n_title, n_content, n_flag, n_hit, DATE_FORMAT(n_regdate, '%Y/%m/%d') ");
			sql.append("FROM notice ");
			sql.append("ORDER BY n_regdate DESC ");
			sql.append("LIMIT ?, ?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, len);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				int seq = rs.getInt(index++);
				String title = rs.getString(index++);
				String content = rs.getString(index++);
				String flag = rs.getString(index++);
				int hit = rs.getInt(index++);
				String regdate = rs.getString(index++);
				list.add(new NoticeDto(seq, title, content, flag, hit, regdate));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return list;
	}
	
	public ArrayList<NoticeDto> select(int start, int len, String searchType, String searchText) {
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("SELECT n_seq, n_title, n_content, n_flag, n_hit, DATE_FORMAT(n_regdate, '%Y/%m/%d') ");
			sql.append("FROM notice ");
			sql.append("WHERE "+searchType+" LIKE ? ");
			sql.append("ORDER BY n_regdate DESC ");
			sql.append("LIMIT ?, ?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setString(index++, "%"+searchText+"%");
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, len);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				int seq = rs.getInt(index++);
				String title = rs.getString(index++);
				String content = rs.getString(index++);
				String flag = rs.getString(index++);
				int hit = rs.getInt(index++);
				String regdate = rs.getString(index++);
				list.add(new NoticeDto(seq, title, content, flag, hit, regdate));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return list;
	}
	
	public NoticeDto select(int seq) {
		NoticeDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("SELECT n_seq, n_title, n_content, n_flag, n_hit, DATE_FORMAT(n_regdate, '%Y/%m/%d') ");
			sql.append("FROM notice ");
			sql.append("WHERE n_seq = ?");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, seq);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				seq = rs.getInt(index++);
				String title = rs.getString(index++);
				String content = rs.getString(index++);
				String flag = rs.getString(index++);
				int hit = rs.getInt(index++);
				String regdate = rs.getString(index++);
				dto = new NoticeDto(seq, title, content, flag, hit, regdate);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	
	
	public int getRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("SELECT COUNT(*) FROM notice");
			
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				count = rs.getInt(index++);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return count;
	}
	
	public int getRows(String searchType, String searchText) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("SELECT COUNT(*) FROM notice ");
			sql.append("WHERE "+searchType+" LIKE ? ");
			
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index, "%"+searchText+"%"); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				count = rs.getInt(index++);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return count;
	}
	
	public int getSeq() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		try {
			con = ConnLocator.getConnection();
			sql.append("SELECT ifnull(MAX(n_seq)+1, 1) FROM notice");
			sql.append("");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				count = rs.getInt(index++);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	
	public boolean updateHit(int seq) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();

		try { // connection 객체 생성
			con = ConnLocator.getConnection();
			sql.append("UPDATE notice ");
			sql.append("SET n_hit = n_hit+1 ");
			sql.append("WHERE n_seq = ? ");
			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, seq);
			pstmt.executeUpdate();
			isSuccess = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return isSuccess;
	}
}
