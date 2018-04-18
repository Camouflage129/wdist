package com.wdist.biz.board.vo;

public class FileGroupVO {
	private int FileGroupNum;
	private int BoardNum;
	
	public FileGroupVO() {
	}

	public FileGroupVO(int fileGroupNum, int boardNum) {
		FileGroupNum = fileGroupNum;
		BoardNum = boardNum;
	}

	public int getFileGroupNum() {
		return FileGroupNum;
	}

	public void setFileGroupNum(int fileGroupNum) {
		FileGroupNum = fileGroupNum;
	}

	public int getBoardNum() {
		return BoardNum;
	}

	public void setBoardNum(int boardNum) {
		BoardNum = boardNum;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + BoardNum;
		result = prime * result + FileGroupNum;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FileGroupVO other = (FileGroupVO) obj;
		if (BoardNum != other.BoardNum)
			return false;
		if (FileGroupNum != other.FileGroupNum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FileGroupVO [FileGroupNum=" + FileGroupNum + ", BoardNum=" + BoardNum + "]";
	}
}
