package com.simple.files.dao;

public class FilesDao {
	private static FilesDao dao;
	private FilesDao() {}
	public static FilesDao getInstance() {
		if(dao==null) {
			dao = new FilesDao();
		}
		return dao;
	}
}
