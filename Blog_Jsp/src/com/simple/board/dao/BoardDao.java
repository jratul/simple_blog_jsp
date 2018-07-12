package com.simple.board.dao;

public class BoardDao {
	private static BoardDao dao;
	private BoardDao() {}
	
	public static BoardDao getInstance() {
		if(dao==null) {
			dao = new BoardDao();
		}
		return dao;
	}
}
