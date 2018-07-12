package com.simple.files.dto;

public class FilesDto {
	private int num;							//���� ��ȣ
	private String writer;					//�ۼ���
	private String title;					//����
	private String orgFileName;		//���� ���ϸ�
	private String saveFileName;	//����� ���ϸ�
	private long fileSize;				//������ ũ��
	private int downCount;			//�ٿ�ε� Ƚ��
	private String regdate;				//�����
	
	public FilesDto() {}

	public FilesDto(int num, String writer, String title, String orgFileName, String saveFileName, long fileSize,
			int downCount, String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.downCount = downCount;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
