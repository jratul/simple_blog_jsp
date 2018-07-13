package com.simple.files.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.files.dto.FilesDto;
import com.simple.util.DbcpBean;


public class FilesDao {
	private static FilesDao dao;
	private FilesDao() {}
	public static FilesDao getInstance() {
		if(dao==null) {
			dao = new FilesDao();
		}
		return dao;
	}
	
	//파일 정보를 저장하는 메소드
		public boolean insert(FilesDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문 작성하기
				String sql = "INSERT INTO board_file "
						+ "(num, writer, title, orgFileName, saveFileName, fileSize, regdate) "
						+ "VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩할 내용 결정하기 
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getOrgFileName());
				pstmt.setString(4, dto.getSaveFileName());
				pstmt.setLong(5, dto.getFileSize());
				flag = pstmt.executeUpdate();
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		//파일 목록을 리턴받는 메소드
		public List<FilesDto> getList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<FilesDto> list = new ArrayList<>();

			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT num, writer, title, orgFileName, saveFileName, fileSize, downCount, regdate "
						+ "FROM board_file "
						+ "ORDER BY num DESC";
				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();
				while (rs.next()) {
					//파일 하나 하나의 정보를 FilesDto 객체에 담아서
					FilesDto dto = new FilesDto();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setTitle(rs.getString("title"));
					dto.setOrgFileName(rs.getString("orgFileName"));
					dto.setSaveFileName(rs.getString("saveFileName"));
					dto.setFileSize(rs.getLong("fileSize"));
					dto.setDownCount(rs.getInt("downCount"));
					dto.setRegdate(rs.getString("regdate"));
					list.add(dto);
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}

			return list;
		}
		
		//파일 다운로드 횟수를 증가시키는 메소드
		public boolean addDownCount(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문 작성하기
				String sql = "UPDATE board_file "
						+ "SET downCount = downCount+1 "
						+ "WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩할 내용 결정하기
				pstmt.setInt(1, num);

				flag = pstmt.executeUpdate();
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			
			if(flag > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public FilesDto getData(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			FilesDto dto = null;

			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, downCount, regdate "
						+ "FROM board_file "
						+ "WHERE num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto = new FilesDto();
					dto.setNum(num);
					dto.setWriter(rs.getString("writer"));
					dto.setTitle(rs.getString("title"));
					dto.setOrgFileName(rs.getString("orgFileName"));
					dto.setSaveFileName(rs.getString("saveFileName"));
					dto.setFileSize(rs.getLong("fileSize"));
					dto.setDownCount(rs.getInt("downCount"));
					dto.setRegdate(rs.getString("regdate"));
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}

			return dto;
		}
		
		public boolean delete(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문 작성하기
				String sql = "DELETE FROM board_file "
						+ "WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩할 내용 결정하기
				pstmt.setInt(1, num);

				flag = pstmt.executeUpdate();
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}
}
