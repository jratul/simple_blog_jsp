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
	
	//���� ������ �����ϴ� �޼ҵ�
		public boolean insert(FilesDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//������ sql �� �ۼ��ϱ�
				String sql = "INSERT INTO board_file "
						+ "(num, writer, title, orgFileName, saveFileName, fileSize, regdate) "
						+ "VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
				pstmt = conn.prepareStatement(sql);
				//? �� ���ε��� ���� �����ϱ� 
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
		
		//���� ����� ���Ϲ޴� �޼ҵ�
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
					//���� �ϳ� �ϳ��� ������ FilesDto ��ü�� ��Ƽ�
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
		
		//���� �ٿ�ε� Ƚ���� ������Ű�� �޼ҵ�
		public boolean addDownCount(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//������ sql �� �ۼ��ϱ�
				String sql = "UPDATE board_file "
						+ "SET downCount = downCount+1 "
						+ "WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//? �� ���ε��� ���� �����ϱ�
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
				//������ sql �� �ۼ��ϱ�
				String sql = "DELETE FROM board_file "
						+ "WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				//? �� ���ε��� ���� �����ϱ�
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
